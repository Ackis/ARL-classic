--[[

****************************************************************************************

ARLDatamine.lua

In-game datamining functions for ARL

File date: @file-date-iso@
File revision: @file-revision@
Project revision: @project-revision@
Project version: @project-version@

****************************************************************************************

]]--


local MODNAME			= "Ackis Recipe List"
local addon				= LibStub("AceAddon-3.0"):GetAddon(MODNAME)

local L					= LibStub("AceLocale-3.0"):GetLocale(MODNAME)

local UnitName = UnitName
local UnitGUID = UnitGUID
local UnitExists = UnitExists
local UnitIsPlayer = UnitIsPlayer
local UnitIsEnemy = UnitIsEnemy
local GetNumTrainerServices = GetNumTrainerServices
local GetTrainerServiceInfo = GetTrainerServiceInfo
local IsTradeskillTrainer = IsTradeskillTrainer
local SetTrainerServiceTypeFilter = SetTrainerServiceTypeFilter
local GetTrainerServiceSkillReq = GetTrainerServiceSkillReq
local GetMerchantNumItems = GetMerchantNumItems
local GetMerchantItemLink = GetMerchantItemLink
local GetMerchantItemInfo = GetMerchantItemInfo
local pairs = pairs
local tconcat = table.concat
local tsort = table.sort
local tinsert = table.insert

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

local ARLDatamineTT = CreateFrame("GameTooltip","ARLDatamineTT",UIParent,"GameTooltipTemplate")

-- Description: Parses a trainer, comparing skill levels internal to those on the trainer.

--- Function to compare the skill levels of a trainers recipes with those in the ARL database.
-- @name AckisRecipeList:ScanSkillLevelData
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

-- Description: Parses a trainer, comparing all recipes you can learn with where you can learn them in the database

--- Function to compare which recipes are available from a trainer and compare with the internal ARL database.
-- @name AckisRecipeList:ScanTrainerData
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

-- Description: Generates tradeskill links with all recipes.  Used for testing to see if a recipe is missing from the database or not.

--- Generates tradeskill links for all professions so you can scan them for completeness.
-- @name AckisRecipeList:GenerateLinks
-- @return Generates tradeskill links with all recipes.  Used for testing to see if a recipe is missing from the database or not.
function addon:GenerateLinks()

	-- This code adopted from Gnomish Yellow Pages with permission

	local guid = UnitGUID("player")
	local playerGUID = string.gsub(guid,"0x0+", "")

	-- Listing of all tradeskill professions
	local tradelist = {51304, 51300, 51313, 51306, 45363, 51311, 51302, 51309, 51296, 45542}

	local bitmap = {}
	bitmap[45542] = "8bffAA" -- First Aid
	bitmap[51296] = "2/7///7///9////7//////////g+/B" -- Cooking
	bitmap[51306] = "4/////////////3nFA+///9+/P7//f//n//9dgdJgHA87/3f/TolD" -- Engineering
	bitmap[51302] = "e+//////////////v//P+f///3///7/9f9//////////f///////HQ5+////B4//+///////5///////PA/Eg//" -- LW
	bitmap[51304] = "2//v//////f////3//v///////6//////////9////X" -- Alchemy
	--bitmap[51300] = "" -- Blacksmithing
	--bitmap[51309] = "" -- Tailoring
	--bitmap[51311] = "" -- JC 489
	--bitmap[45363] = "" -- Inscription
	--bitmap[51313] = "4//////////7///////////w//++/9vn7///////3P/t/n//BAB" -- Enchanting
	bitmap[51313] = "4//////////7///////////w//++/9vn7///////3P/t/n//BAD" -- Enchanting

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

-- Description: Scans the items on a vendor, determining which recipes are available if any and compares it with the database entries.

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
			self:ScanToolTip(name)
		end

		ARLDatamineTT:Hide()

	else
		self:Print(L["DATAMINER_VENDOR_NOTTARGETTED"])
	end

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
function addon:ScanToolTip(name)

--[[
	-- Get internal database
	local recipelist = LoadRecipe()

	if (not recipelist) then
		self:Print(L["DATAMINER_NODB_ERROR"])
		return
	end
]]--

self:Print("DEBUG: Number of tooltip lines: " .. ARLDatamineTT:NumLines())
	-- Parse all the lines of the tooltip
	for i=1,ARLDatamineTT:NumLines(),1 do

		local linetext = _G["ARLDatamineTTTextLeft" .. i]
		local text = linetext:GetText()
--self:Print("DEBUG: Tooltip text: " .. text)
		local enchanting = false
		local boprecipe = false
		local bopitem = false
		local healer = false
		local tank = false
		local dps = false
		local caster = false

		local specialty = false
		local repid = false
		local repidlevel = false

		-- Check to see if it's a recipe otherwise break out of the for loop
		if (i == 1) then
			-- Get the header of the tooltip aka Pattern:
			local matchtext = string.match(text, "%a+: ")

			-- If the header is not a recipe
			if (not recipenames[matchtext]) then
				break
			-- If we're dealing with an enchanting recipe, flag it
			elseif (matchtext == "Formula: ") then
				enchanting = true
			end
		-- We're on the second line or beyond in the tooltip now
		-- Check for recipe/item binding
		elseif (strmatch(text,"Binds when picked up")) then
			-- The recipe binding is within the first few lines of the tooltip always
			if (i < 3) then
				boprecipe = true
			-- Item binding comes later on in the tooltip
			else
				bopitem = true
			end
		-- Recipe Specialities
		elseif (specialtytext[text]) then
			specialty = specialtytext[text]
		-- Recipe Reputatons
		elseif (strmatch(text, "Requires (.+) - (.+)")) then
			local rep,replevel = string.match(strmatch(text, "Requires (.+) - (.+)"))
			if (factiontext[rep]) then
				repid = factiontext[rep]
				repidlevel = factionlevels[replevel]
			end
		-- Item Stats
		-- Caster stats
		elseif (strmatch(text,"Increases spell power by ")) then

		-- DPS Caster Stats
		elseif (strmatch(text,"spell hit")) then
			caster = true
			tank = false
			dps = false
			healer = false
		elseif (strmatch(text,"spell penetration")) then
			caster = true
			tank = false
			dps = false
			healer = false
		-- Healer Stats
		-- Melee DPS Stats
		-- Tanking Stats
		elseif (strmatch(text,"Defense")) then
			tank = true
			dps = false
			caster = false
			healer = false
		elseif (strmatch(text,"Block")) then
			tank = true
			dps = false
			caster = false
			healer = false
		end

		-- Nuke this shit once this is done
		self:Print(name)
		if boprecipe then
			self:Print("BoP Recipe")
		end
		if specialty then
			self:Print(GetSpellInfo(specialty))
		end
		if repid then
			self:Print("Rep Flag: " .. repid)
			self:Print("Rep Level: " .. repidlevel)
		end
		if healer then
			self:Print("Healer item")
		end
		if caster then
			self:Print("Caster item")
		end
		if tank then
			self:Print("Tank item")
		end
		if dps then
			self:Print("DPS item")
		end
		if bopitem then
			self:Print("BoP Item")
		end

	end

end
