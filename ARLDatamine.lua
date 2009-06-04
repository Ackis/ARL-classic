--[[

************************************************************************

ARLDatamine.lua

In-game datamining functions for ARL

File date: @file-date-iso@
File revision: @file-revision@
Project revision: @project-revision@
Project version: @project-version@

************************************************************************

Please see http://www.wowace.com/projects/arl/for more information.

License:
	Please see LICENSE.txt

This source code is released under All Rights Reserved.

************************************************************************

]]--


local MODNAME			= "Ackis Recipe List"
local addon				= LibStub("AceAddon-3.0"):GetAddon(MODNAME)

local L					= LibStub("AceLocale-3.0"):GetLocale(MODNAME)


-------------------------------------------------------------------------------
-- Upvalues globals
-------------------------------------------------------------------------------
local table, string = table, string

local ipairs, pairs = ipairs, pairs
local tconcat = table.concat
local tsort = table.sort
local tinsert = table.insert
local strmatch = string.match
local strlower = string.lower
local gsub = string.gsub
local tonumber = tonumber

-------------------------------------------------------------------------------
-- Upvalued Blizzard API
-------------------------------------------------------------------------------
local UnitName = UnitName
local UnitGUID = UnitGUID
local UnitExists = UnitExists
local UnitIsPlayer = UnitIsPlayer
local UnitIsEnemy = UnitIsEnemy
local GetNumTrainerServices = GetNumTrainerServices
local GetTrainerServiceInfo = GetTrainerServiceInfo
local IsTradeskillTrainer = IsTradeskillTrainer
local SetTrainerServiceTypeFilter = SetTrainerServiceTypeFilter
local GetTrainerServiceTypeFilter = GetTrainerServiceTypeFilter
local GetTrainerServiceSkillReq = GetTrainerServiceSkillReq
local GetMerchantNumItems = GetMerchantNumItems
local GetMerchantItemLink = GetMerchantItemLink
local GetMerchantItemInfo = GetMerchantItemInfo
local GetSpellInfo = GetSpellInfo

local function LoadRecipe()

	local recipelist = addon:GetRecipeTable()
	local dbloaded

	if (not recipelist) then
		if (addon.db.profile.autoloaddb) then
			dbloaded, recipelist = addon:InitRecipeData()
			if (not dbloaded) then
				return
			else
				addon:AddRecipeData(GetSpellInfo(51304))
				addon:AddRecipeData(GetSpellInfo(51300))
				addon:AddRecipeData(GetSpellInfo(51296))
				addon:AddRecipeData(GetSpellInfo(51313))
				addon:AddRecipeData(GetSpellInfo(51306))
				addon:AddRecipeData(GetSpellInfo(45542))
				addon:AddRecipeData(GetSpellInfo(51302))
				addon:AddRecipeData(GetSpellInfo(32606))
				addon:AddRecipeData(GetSpellInfo(51309))
				addon:AddRecipeData(GetSpellInfo(51311))
				addon:AddRecipeData(GetSpellInfo(45363))
				addon:AddRecipeData(GetSpellInfo(53428))
			end
		else
			addon:Print(L["DATAMINER_NODB_ERROR"])
			return
		end
	else
		-- Recipe DB exists, we just need to populate it now
		if (addon.db.profile.autoloaddb) then
			addon:AddRecipeData(GetSpellInfo(51304))
			addon:AddRecipeData(GetSpellInfo(51300))
			addon:AddRecipeData(GetSpellInfo(51296))
			addon:AddRecipeData(GetSpellInfo(51313))
			addon:AddRecipeData(GetSpellInfo(51306))
			addon:AddRecipeData(GetSpellInfo(45542))
			addon:AddRecipeData(GetSpellInfo(51302))
			addon:AddRecipeData(GetSpellInfo(32606))
			addon:AddRecipeData(GetSpellInfo(51309))
			addon:AddRecipeData(GetSpellInfo(51311))
			addon:AddRecipeData(GetSpellInfo(45363))
			addon:AddRecipeData(GetSpellInfo(53428))
		end
	end

	return recipelist

end

local function CreateReverseLookup()

	-- Get internal database
	local recipelist = LoadRecipe()

	if (not recipelist) then
		addon:Print(L["DATAMINER_NODB_ERROR"])
		return
	end

	local t = {}

	for i in pairs(recipelist) do
		if t[recipelist[i]["Name"]] then addon:Print("Dupe: " .. i) end
		t[recipelist[i]["Name"]] = i
	end

	return t

end

local ARLDatamineTT = CreateFrame("GameTooltip","ARLDatamineTT",UIParent,"GameTooltipTemplate")

--- Function to compare the skill levels of a trainers recipes with those in the ARL database.
-- @name AckisRecipeList:ScanSkillLevelData
-- @param autoscan True when autoscan is enabled in preferences, it will surpress output letting you know when a scan has occured.
-- @return Does a comparison of the information in your internal ARL database, and those items which are available on the trainer.  Compares the skill levels between the two.
function addon:ScanSkillLevelData(autoscan)

	-- Are we at a trade skill trainer?
	if (IsTradeskillTrainer()) then

		-- Get internal database
		local recipelist = LoadRecipe()

		if (not recipelist) then
			self:Print(L["DATAMINER_NODB_ERROR"])
			return
		end

		-- Get the initial trainer filters
		local avail = GetTrainerServiceTypeFilter("available")
		local unavail = GetTrainerServiceTypeFilter("unavailable")
		local used = GetTrainerServiceTypeFilter("used")

		-- Clear the trainer filters
		SetTrainerServiceTypeFilter("available", 1)
		SetTrainerServiceTypeFilter("unavailable", 1)
		SetTrainerServiceTypeFilter("used", 1)

		local t = {}

		-- Get the skill levels from the trainer
		for i=1,GetNumTrainerServices(),1 do
			local name = GetTrainerServiceInfo(i)
			local _,skilllevel = GetTrainerServiceSkillReq(i)
			if not skilllevel then
				skilllevel = 0
			end
			t[name] = skilllevel
		end

		local outputtable = {}
		local entryfound = false

		for i in pairs(recipelist) do
			local i_name = recipelist[i]["Name"]
			if (t[i_name]) and (t[i_name] ~= recipelist[i]["Level"]) then
				entryfound = true
				tinsert(outputtable,L["DATAMINER_SKILLELVEL"]:format(i_name,recipelist[i]["Level"],t[i_name]))
			end
		end

		tinsert(outputtable,"Trainer Skill Level Scan Complete.")

		if (entryfound) then
			self:DisplayTextDump(nil, nil, tconcat(outputtable,"\n"))
		end

		-- Reset the filters to what they were before
		SetTrainerServiceTypeFilter("available", avail or 0)
		SetTrainerServiceTypeFilter("unavailable", unavail or 0)
		SetTrainerServiceTypeFilter("used", used or 0)

	elseif (not autoscan) then
		self:Print(L["DATAMINER_SKILLLEVEL_ERROR"])
	end

end

--- Function to compare which recipes are available from a trainer and compare with the internal ARL database.
-- @name AckisRecipeList:ScanTrainerData
-- @param autoscan True when autoscan is enabled in preferences, it will surpress output letting you know when a scan has occured.
-- @return Does a comparison of the information in your internal ARL database, and those items which are available on the trainer.  Compares the acquire information of the ARL database with what is available on the trainer.
function addon:ScanTrainerData(autoscan)

	-- Make sure the target exists and is a NPC
	if (UnitExists("target") and (not UnitIsPlayer("target")) and (not UnitIsEnemy("player", "target"))) then

		-- Get its name
		local targetname = UnitName("target")
		-- Get the NPC ID
		local targetID = tonumber(string.sub(UnitGUID("target"),-12,-7),16)

		-- Are we at a trade skill trainer?
		if (IsTradeskillTrainer()) then

			-- Get internal database
			local recipelist = LoadRecipe()

			if (not recipelist) then
				self:Print(L["DATAMINER_NODB_ERROR"])
				return
			end

			-- Get the initial trainer filters
			local avail = GetTrainerServiceTypeFilter("available")
			local unavail = GetTrainerServiceTypeFilter("unavailable")
			local used = GetTrainerServiceTypeFilter("used")

			-- Clear the trainer filters
			SetTrainerServiceTypeFilter("available", 1)
			SetTrainerServiceTypeFilter("unavailable", 1)
			SetTrainerServiceTypeFilter("used", 1)

			local t = {}

			if (GetNumTrainerServices() == 0) then
			 self:Print("Warning: Trainer is bugged, reporting 0 trainer items.")
			end

			-- Get all the names of recipes from the trainer
			for i=1,GetNumTrainerServices(),1 do
				local name = GetTrainerServiceInfo(i)
				t[name] = true
			end

			local outputtext = {}

			-- Dump out trainer info
			tinsert(outputtext, L["DATAMINER_TRAINER_INFO"]:format(targetname, targetID))

			local teach = {}
			local noteach = {}
			local teachflag = false
			local noteachflag = false

			for i in pairs(recipelist) do

				local i_name = recipelist[i]["Name"]
				local acquire = recipelist[i]["Acquire"]
				local flags = recipelist[i]["Flags"]

				-- If the trainer teaches this recipe
				if (t[i_name]) then
					local found = false
					-- Parse acquire info
					for i in pairs(acquire) do
						if (acquire[i]["Type"] == 1) then
							if (acquire[i]["ID"] == targetID) then
								found = true
							end
						end
					end
					if (not found) then
						tinsert(teach,i)
						teachflag = true
						if (not flags[3]) then
							tinsert(outputtext, ": Trainer flag needs to be set.")
						end
					end
				-- Trainer does not teach this recipe
				else
					local found = false
					-- Parse acquire info
					for i in pairs(acquire) do
						if (acquire[i]["Type"] == 1) then
							if (acquire[i]["ID"] == targetID) then
								found = true
							end
						end
					end
					if (found) then
						noteachflag = true
						tinsert(noteach,i)
					end
				end

			end

			if (teachflag) then
				tinsert(outputtext, "Missing entries (need to be added):")
				tsort(teach)
				for i in ipairs(teach) do
					tinsert(outputtext, L["DATAMINER_TRAINER_TEACH"]:format(teach[i], recipelist[teach[i]]["Name"]))
				end
			end

			if (noteachflag) then
				tinsert(outputtext, "Extra entries (need to be removed):")
				tsort(noteach)
				for i in ipairs(noteach) do
					tinsert(outputtext, L["DATAMINER_TRAINER_NOTTEACH"]:format(noteach[i], recipelist[noteach[i]]["Name"]))
				end
			end

			tinsert(outputtext, "Trainer Acquire Scan Complete.")

			if ((teachflag) or (noteachflag)) then
				self:DisplayTextDump(nil, nil, tconcat(outputtext,"\n"))
			end

			-- Reset the filters to what they were before
			SetTrainerServiceTypeFilter("available", avail or 0)
			SetTrainerServiceTypeFilter("unavailable", unavail or 0)
			SetTrainerServiceTypeFilter("used", used or 0)

		elseif (not autoscan) then
			self:Print(L["DATAMINER_SKILLLEVEL_ERROR"])
		end
	else
		if (not autoscan) then
			self:Print(L["DATAMINER_TRAINER_NOTTARGETTED"])
		end
	end

end

--- Generates tradeskill links for all professions so you can scan them for completeness.
-- @name AckisRecipeList:GenerateLinks
-- @return Generates tradeskill links with all recipes.  Used for testing to see if a recipe is missing from the database or not.
function addon:GenerateLinks()

	-- This code adopted from Gnomish Yellow Pages with permission

	local guid = UnitGUID("player")
	local playerGUID = string.gsub(guid,"0x0+", "")

	-- Listing of all tradeskill professions
	local tradelist = {51304, 51300, 51313, 51306, 45363, 51311, 51302, 51309, 51296, 45542}

--[[
	local encodingLength = floor((#recipeList+5) / 6)

	local encodedString = string.rep("/",encodingLength)
]]--
	local bitmap = {}
	bitmap[45542] = "8bffAA" -- First Aid (6)
	bitmap[51296] = "2/7///7///9////7//////////g+/B" -- Cooking (30)
	bitmap[51306] = "4/////////////3nFA+///9+/P7//f//n//9dgdJgHA87/3f/TolD" -- Engineering (53)
	--bitmap[51302] = "e+//////////////v//P+f///3///7/9f9//////////f///////HQ5+////B4//+///////5///////PA/Eg//" -- LW (87)
	bitmap[51302] = string.rep("/",87)
	bitmap[51304] = "2//v//////f////3//v///////6//////////9////X" -- Alchemy (43)
	bitmap[51300] = string.rep("/",85) -- Blacksmithing (85)
	bitmap[51309] = string.rep("/",71) -- Tailoring (71)
	bitmap[51311] = string.rep("/",83) -- JC 83
	bitmap[45363] = string.rep("/",74) -- Inscription (74)
	--bitmap[51313] = "4//////////7///////////w//++/9vn7///////3P/t/n//BAB" -- Enchanting
	--bitmap[51313] = "4//////////7///////////w//++/9vn7///////3P/t/n//BAD" -- Enchanting (51)
	bitmap[51313] = string.rep("/",51) -- Enchanting (51)

	for i in pairs(tradelist) do

		local tradeName = GetSpellInfo(tradelist[i])
		local tradelink = {}
		tradelink[1] = "|cffffd000|Htrade:"
		tradelink[2] = tradelist[i]
		tradelink[3] = ":450:450:"
		tradelink[4] = playerGUID
		tradelink[5] = ":"
		tradelink[6] = bitmap[tradelist[i]]
		tradelink[7] = "|h["
		tradelink[8] = tradeName
		tradelink[9] = "]|h|r"

		if (bitmap[tradelist[i]]) then
			self:Print(tconcat(tradelink,""))
		else
			self:Print("I don't have the bitmap for " .. tradeName .. " yet.")
		end
		-- /script DEFAULT_CHAT_FRAME:AddMessage(gsub(GetTradeSkillListLink(), "\124", "\124\124"))
	end

end

--- Scans the items on a vendor, determining which recipes are available if any and compares it with the database entries.
-- @name AckisRecipeList:ScanVendor
-- @return Obtains all the vendor information on tradeskill recipes and attempts to compare the current vendor with the internal database.
function addon:ScanVendor()

	-- Make sure the target exists and is a NPC
	if (UnitExists("target") and (not UnitIsPlayer("target")) and (not UnitIsEnemy("player", "target"))) then

		-- Get internal database
		local recipelist = LoadRecipe()

		if (not recipelist) then
			self:Print(L["DATAMINER_NODB_ERROR"])
			return
		end

		local reverselookup = CreateReverseLookup()

		-- Get its name
		local targetname = UnitName("target")
		-- Get the NPC ID
		local targetID = tonumber(string.sub(UnitGUID("target"),-12,-7),16)

		ARLDatamineTT:SetOwner(WorldFrame, "ANCHOR_NONE")
		GameTooltip_SetDefaultAnchor(ARLDatamineTT, UIParent)

		-- Parse all the items on the merchant
		for i=1,GetMerchantNumItems(),1 do
			local name, _, _, _, numAvailable = GetMerchantItemInfo(i)
			ARLDatamineTT:SetMerchantItem(i)
			self:ScanToolTip(name,recipelist,reverselookup,true)
		end

		ARLDatamineTT:Hide()

	else
		self:Print(L["DATAMINER_VENDOR_NOTTARGETTED"])
	end

end

--- Parses all the recipes in the database, and scanning their tooltips.
-- @name AckisRecipeList:TooltipScanDatabase
-- @return Entire recipe database has its tooltips scanned.
function addon:TooltipScanDatabase()

	-- Get internal database
	local recipelist = LoadRecipe()

	if (not recipelist) then
		self:Print(L["DATAMINER_NODB_ERROR"])
		return
	end

	local reverselookup = CreateReverseLookup()

	ARLDatamineTT:SetOwner(WorldFrame, "ANCHOR_NONE")
	GameTooltip_SetDefaultAnchor(ARLDatamineTT, UIParent)

	-- Parse the entire recipe database
	for i in pairs(recipelist) do

		local name = recipelist[i]["Name"]
		local link = recipelist[i]["RecipeLink"]

		if link then
			ARLDatamineTT:SetHyperlink(link)
			self:ScanToolTip(name,recipelist,reverselookup,false)
		else
			addon:Print("Missing RecipeLink for ID " .. i .. " - " .. name .. " (If these are DK abilities, don't worry, that's normal.")
		end

	end

	ARLDatamineTT:Hide()

end

local recipenames = {
	-- JC
	["Design: "] = true,
	-- LW or Tailoring
	["Pattern: "] = true,
	-- Alchemy or Cooking
	["Recipe: "] = true,
	-- BS
	["Plans: "] = true,
	-- Enchanting
	["Formula: "] = true,
	-- Engineering
	["Schematic: "] = true,
	-- First Aid
	["Manual: "] = true,

	["Alchemy: "] = true,
	["Blacksmithing: "] = true,
	["Cooking: "] = true,
	["Enchanting: "] = true,
	["Engineering: "] = true,
	["First Aid: "] = true,
	["Inscription: "] = true,
	["Jewelcrafting: "] = true,
	["Leatherworking: "] = true,
	["Tailoring: "] = true,
}


local specialtytext = {
	["Requires Spellfire Tailoring"] = 26797,
	["Requires Mooncloth Tailoring"] = 26798,
	["Requires Shadowweave Tailoring"] = 26801,
	["Dragonscale Leatherworking"] = 10657,
	["Elemental Leatherworking"] = 10659,
	["Tribal Leatherworking"] = 10661,
	["Gnomish Engineering"] = 20219,
	["Goblin Engineering"] = 20222,
	["Armorsmith"] = 9788,
	["Master Axesmith"] = 17041,
	["Master Hammersmith"] = 17040,
	["Master Swordsmith"] = 17039,
	["Weaponsmith"] = 9787,
}

local factiontext = {
	["Lower City"] = 107,
	["Kirin Tor"] = 118,
}

local factionlevels = {
	["Neutral"] = 0,
	["Friendly"] = 1,
	["Honored"] = 2,
	["Revered"] = 3,
	["Exalted"] = 4,
}

--- Parses the mining tooltip for certain keywords, comparing them with the database flags.
-- @name AckisRecipeList:ScanToolTip
-- @return Scans a tooltip, and outputs the missing or extra filter flags.
function addon:ScanToolTip(name,recipelist,reverselookup,isvendor)

	local recipefound = false
	local boprecipe = false
	local bopitem = false
	local healer = false
	local tank = false
	local dps = false
	local caster = false

	local Deathknight = false
	local Druid = false
	local Hunter = false
	local Mage = false
	local Paladin = false
	local Priest = false
	local Shaman = false
	local Rogue = false
	local Warlock = false
	local Warrior = false

	local Cloth = false
	local Leather = false
	local Mail = false
	local Plate = false
	local Cloak = false
	local Trinket = false
	local Ring = false
	local Necklace = false
	local Shield  = false
	local OneHanded = false
	local TwoHanded = false
	local Axe = false
	local Sword = false
	local Mace = false
	local Polearm = false
	local Dagger = false
	local Staff = false
	local Wand = false
	local Thrown = false
	local Bow = false
	local Crossbow = false
	local Ammo = false
	local Fist = false
	local Gun = false

	local specialty = false
	local repid = false
	local repidlevel = false
	local confirmedtype = false
	local matchtext

	-- Parse all the lines of the tooltip
	for i=1,ARLDatamineTT:NumLines(),1 do

		local linetext = _G["ARLDatamineTTTextLeft" .. i]
		local text = linetext:GetText()

		-- Check to see if it's a recipe otherwise break out of the for loop
		if (i == 1) then
			-- Get the header of the tooltip aka Pattern:
			matchtext = strmatch(text, "%a+: ")

			-- If the header is not a recipe
			if (not recipenames[matchtext]) then
				break
			else
				recipefound = true
			end
		-- We're on the second line or beyond in the tooltip now
		-- Check for recipe/item binding
		-- The recipe binding is within the first few lines of the tooltip always
		elseif ((strmatch(strlower(text),"binds when picked up")) and (i < 4)) then
			boprecipe = true
		elseif ((strmatch(strlower(text),"binds when picked up")) and (i > 3)) then
			bopitem = true
		-- Recipe Specialities
		elseif (specialtytext[text]) then
			specialty = specialtytext[text]
		-- Recipe Reputatons
		elseif (strmatch(text, "Requires (.+) %- (.+)")) then
			local rep,replevel = strmatch(text, "Requires (.+) %- (.+)")
			if (factiontext[rep]) then
				repid = factiontext[rep]
				repidlevel = factionlevels[replevel]
			end
		-- Certain stats can be considered for a specific role (aka spell hit == caster dps).
		-- confirmedtype will be toggled to true when we get to a stat that is specific to that class
		elseif (not confirmedtype) then
			-- Caster stats
			if (strmatch(strlower(text),"spell power")) then
				caster = true
				tank = false
				dps = false
				healer = true
			elseif (strmatch(strlower(text),"spell crit")) then
				caster = true
				tank = false
				dps = false
				healer = true
			-- DPS Caster Stats
			elseif (strmatch(strlower(text),"spell hit")) then
				caster = true
				tank = false
				dps = false
				healer = false
				confirmedtype = true
			elseif (strmatch(strlower(text),"spell penetration")) then
				caster = true
				tank = false
				dps = false
				healer = false
				confirmedtype = true
			-- Healer Stats
			elseif (strmatch(strlower(text),"mana every 5 seconds")) then
				caster = false
				tank = false
				dps = false
				healer = true
				confirmedtype = true
			-- Melee DPS Stats
			elseif (strmatch(strlower(text),"attack power")) then
				caster = false
				tank = false
				dps = true
				healer = false
				confirmedtype = true
			elseif (strmatch(strlower(text),"expertise")) then
				caster = false
				tank = false
				dps = true
				healer = false
				confirmedtype = true
			elseif (strmatch(strlower(text),"melee crit")) then
				caster = false
				tank = false
				dps = true
				healer = false
				confirmedtype = true
			elseif (strmatch(strlower(text),"ranged crit")) then
				caster = false
				tank = false
				dps = true
				healer = false
				confirmedtype = true
			elseif (strmatch(strlower(text),"melee haste")) then
				caster = false
				tank = false
				dps = true
				healer = false
				confirmedtype = true
			elseif (strmatch(strlower(text),"ranged haste")) then
				caster = false
				tank = false
				dps = true
				healer = false
				confirmedtype = true
			elseif (strmatch(strlower(text),"melee hit")) then
				caster = false
				tank = false
				dps = true
				healer = false
				confirmedtype = true
			elseif (strmatch(strlower(text),"ranged hit")) then
				caster = false
				tank = false
				dps = true
				healer = false
				confirmedtype = true
			elseif (strmatch(strlower(text),"armor pen")) then
				caster = false
				tank = false
				dps = true
				healer = false
				confirmedtype = true
			elseif (strmatch(strlower(text),"feral attack")) then
				caster = false
				tank = true
				dps = true
				healer = false
			-- Tanking Stats
			elseif (strmatch(strlower(text),"defense")) then
				tank = true
				dps = false
				caster = false
				healer = false
				confirmedtype = true
			elseif (strmatch(strlower(text),"block")) then
				tank = true
				dps = false
				caster = false
				healer = false
				confirmedtype = true
			elseif (strmatch(strlower(text),"parry")) then
				tank = true
				dps = false
				caster = false
				healer = false
				confirmedtype = true
			elseif (strmatch(strlower(text),"dodge")) then
				tank = true
				dps = false
				caster = false
				healer = false
				confirmedtype = true
			end
		elseif (strmatch(strlower(text),"deathknight")) then
			Deathknight = true
		elseif (strmatch(strlower(text),"druid")) then
			Druid = true
		elseif (strmatch(strlower(text),"hunter")) then
			Hunter = true
		elseif (strmatch(strlower(text),"mage")) then
			Mage = true
		elseif (strmatch(strlower(text),"paladin")) then
			Paladin = true
		elseif (strmatch(strlower(text),"priest")) then
			Priest = true
		elseif (strmatch(strlower(text),"rogue")) then
			Rogue = true
		elseif (strmatch(strlower(text),"shaman")) then
			Shaman = true
		elseif (strmatch(strlower(text),"warlock")) then
			Warlock = true
		elseif (strmatch(strlower(text),"warrior")) then
			Warrior = true
		elseif (strmatch(strlower(text),"cloth")) then
			Cloth = true
		elseif (strmatch(strlower(text),"leather")) then
			Leather = true
		elseif (strmatch(strlower(text),"mail")) then
			Mail = true
		elseif (strmatch(strlower(text),"plate")) then
			Plate = true
		elseif (strmatch(strlower(text),"cloak")) then
			Cloak = true
		elseif (strmatch(strlower(text),"ring")) then
			Ring = true
		elseif (strmatch(strlower(text),"necklace")) then
			Necklace = true
		elseif (strmatch(strlower(text),"shield")) then
			Shield = true
		elseif (strmatch(strlower(text),"1 hand")) or (strmatch(strlower(text),"off hand")) then
			OneHanded = true
		elseif (strmatch(strlower(text),"2 hand")) then
			TwoHanded = true
		elseif (strmatch(strlower(text),"axe")) then
			Axe = true
		elseif (strmatch(strlower(text),"sword")) then
			Sword = true
		elseif (strmatch(strlower(text),"mace")) then
			Mace = true
		elseif (strmatch(strlower(text),"polearm")) then
			Polearm = true
		elseif (strmatch(strlower(text),"dagger")) then
			Dagger = true
		elseif (strmatch(strlower(text),"staff")) then
			Staff = true
		elseif (strmatch(strlower(text),"wand")) then
			Wand = true
		elseif (strmatch(strlower(text),"thrown")) then
			Thrown = true
		elseif (strmatch(strlower(text),"bow")) then
			Bow = true
		elseif (strmatch(strlower(text),"crossbow")) then
			Crossbow = true
		elseif (strmatch(strlower(text),"gun")) then
			Gun = true
		elseif (strmatch(strlower(text),"ammo")) then
			Ammo = true
		elseif (strmatch(strlower(text),"fist")) then
			Fist = true
		end
	end

	if (recipefound) then
		-- Parse the recipe database until we get a match on the name
		local spellid
		local recipename = gsub(name, "%a+%?: ", "")

		spellid = reverselookup[recipename]

		if not spellid then
			print("Recipe "..recipename.." has no reverse lookup")
		end

		local flags = recipelist[spellid]["Flags"]
		local missingflags = {}
		local extraflags = {}

		if specialty then
			self:Print(GetSpellInfo(specialty))
		end
		-- Vendor Flag
		if (not flags[4]) and (isvendor) then
			tinsert(missingflags,"4")
		end
		-- PVP Flag
		if (((GetSubZoneText() == "Wintergrasp Fortress") or (GetSubZoneText() == "Wintergrasp Fortress")) and (not flags[9])) then
			tinsert(missingflags,"9")
		elseif (flags[9]) then
			tinsert(extraflags,"9")
		end

		-- Classes
		-- If we've picked up at least one class flag
		if (Deathknight) or (Druid) or (Hunter) or (Mage) or (Paladin) or (Priest) or (Shaman) or (Warlock) or (Warrior) then
			if (Deathknight) and (not flags[21]) then
				tinsert(missingflags,"21")
			elseif (not Deathknight) and (flags[21]) then
				tinsert(extraflags,"21")
			end
			if (Druid) and (not flags[22]) then
				tinsert(missingflags,"22")
			elseif (not Druid) and (flags[22]) then
				tinsert(extraflags,"22")
			end
			if (Hunter) and (not flags[23]) then
				tinsert(missingflags,"23")
			elseif (not Hunter) and (flags[23]) then
				tinsert(extraflags,"23")
			end
			if (Mage) and (not flags[24]) then
				tinsert(missingflags,"24")
			elseif (not Mage) and (flags[24]) then
				tinsert(extraflags,"24")
			end
			if (Paladin) and (not flags[25]) then
				tinsert(missingflags,"25")
			elseif (not Paladin) and (flags[25]) then
				tinsert(extraflags,"25")
			end
			if (Priest) and (not flags[26]) then
				tinsert(missingflags,"26")
			elseif (not Priest) and (flags[26]) then
				tinsert(extraflags,"26")
			end
			if (Shaman) and (not flags[27]) then
				tinsert(missingflags,"27")
			elseif (not Shaman) and (flags[27]) then
				tinsert(extraflags,"27")
			end
			if (Rogue) and (not flags[28]) then
				tinsert(missingflags,"28")
			elseif (not Rogue) and (flags[28]) then
				tinsert(extraflags,"28")
			end
			if (Warlock) and (not flags[29]) then
				tinsert(missingflags,"29")
			elseif (not Warlock) and (flags[29]) then
				tinsert(extraflags,"29")
			end
			if (Warrior) and (not flags[30]) then
				tinsert(missingflags,"30")
			elseif (not Warrior) and (flags[30]) then
				tinsert(extraflags,"30")
			end
		-- Recipe is not class specific
		else
			if (not flags[21]) then
				tinsert(missingflags,"21")
			end
			if (not flags[22]) then
				tinsert(missingflags,"22")
			end
			if (not flags[23]) then
				tinsert(missingflags,"23")
			end
			if (not flags[24]) then
				tinsert(missingflags,"24")
			end
			if (not flags[25]) then
				tinsert(missingflags,"25")
			end
			if (not flags[26]) then
				tinsert(missingflags,"26")
			end
			if (not flags[27]) then
				tinsert(missingflags,"27")
			end
			if (not flags[28]) then
				tinsert(missingflags,"28")
			end
			if (not flags[29]) then
				tinsert(missingflags,"29")
			end
			if (not flags[30]) then
				tinsert(missingflags,"30")
			end
		end
		-- BoP Item
		if (bopitem) and (not flags[37]) then
			tinsert(missingflags,"37")
			-- If it's a BoP item and flags BoE is set, mark it as extra
			if (flags[36]) then
				tinsert(extraflags,"36")
			end
			-- If it's a BoP item and flags BoA is set, mark it as extra
			if (flags[38]) then
				tinsert(extraflags,"38")
			end
		-- BoE Item, assuming it's not BoA
		elseif (not flags[36]) and (not bopitem) then
			tinsert(missingflags,"36")
			-- If it's a BoE item and flags BoP is set, mark it as extra
			if (flags[37]) then
				tinsert(extraflags,"37")
			end
			-- If it's a BoE item and flags BoA is set, mark it as extra
			if (flags[38]) then
				tinsert(extraflags,"38")
			end
		end

		-- BoP Recipe
		if (boprecipe) and (not flags[41]) then
			tinsert(missingflags,"41")
			-- If it's a BoP recipe and flags BoE is set, mark it as extra
			if (flags[40]) then
				tinsert(extraflags,"40")
			end
			-- If it's a BoP recipe and flags BoA is set, mark it as extra
			if (flags[42]) then
				tinsert(extraflags,"42")
			end
		-- Not BoP recipe, assuming it's not BoA
		elseif (not flags[40]) and (not boprecipe) then
			tinsert(missingflags,"40")
			-- If it's a BoE recipe and flags BoP is set, mark it as extra
			if (flags[41]) then
				tinsert(extraflags,"41")
			end
			-- If it's a BoE recipe and flags BoA is set, mark it as extra
			if (flags[42]) then
				tinsert(extraflags,"42")
			end
		end

		-- Player type
		if (dps) and (not flags[51]) then
			tinsert(missingflags,"51")
		elseif (flags[51]) and (not dps) then
			tinsert(extraflags,"51")
		end
		if (tank) and (not flags[52]) then
			tinsert(missingflags,"52")
		elseif (flags[52]) and (not tank) then
			tinsert(extraflags,"52")
		end
		if (healer) and (not flags[53]) then
			tinsert(missingflags,"53")
		elseif (flags[53]) and (not healer) then
			tinsert(extraflags,"53")
		end
		if (caster) and (not flags[54]) then
			tinsert(missingflags,"54")
		elseif (flags[54]) and (not caster) then
			tinsert(extraflags,"54")
		end

		-- Item Type
		if (Cloth) and (not flags[56]) then
			tinsert(missingflags,"56")
		elseif (not Cloth) and (flags[56]) then
			tinsert(extraflags,"56")
		end
		if (Leather) and (not flags[57]) then
			tinsert(missingflags,"57")
		elseif (not Leather) and (flags[57]) then
			tinsert(extraflags,"57")
		end
		if (Mail) and (not flags[58]) then
			tinsert(missingflags,"58")
		elseif (not Mail) and (flags[58]) then
			tinsert(extraflags,"58")
		end
		if (Plate) and (not flags[59]) then
			tinsert(missingflags,"59")
		elseif (not Plate) and (flags[59]) then
			tinsert(extraflags,"59")
		end

		-- Reputations
		if (repid) and (not flags[repid]) then
			tinsert(missingflags,repid)
		end

		self:Print(recipename .. " " .. spellid)
		self:Print("Missing flags: " .. tconcat(missingflags,","))
		self:Print("Extra flags: " .. tconcat(extraflags,","))
		if (not tank) and (not healer) and (not caster) and (not dps) then
			self:Print("No player type flag.")
		end

	end
end
