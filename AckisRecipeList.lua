--[[

************************************************************************

AckisRecipeList
$Date$
$Rev$

Author: Ackis on Illidan US Horde
GUI done by Zhinjio

************************************************************************

Please see Wowace.com for more information.

Documentation:
	Please see Documentation.txt for comprehensive documentation.

************************************************************************

--]]


AckisRecipeList = LibStub("AceAddon-3.0"):NewAddon("Ackis Recipe List", "AceConsole-3.0", "AceEvent-3.0")

local MODNAME	= "Ackis Recipe List"

local addon		= LibStub("AceAddon-3.0"):GetAddon(MODNAME)

-- Lets check to see if we have the needed libraries loaded (these are manditory to run)
if (not LibStub:GetLibrary("LibBabble-Faction-3.0", true)) then

	self:Print("LibBabble-Faction-3.0 not loaded.  Addon cannot run.")
	return

end

if (not LibStub:GetLibrary("LibBabble-Zone-3.0", true)) then

	self:Print("LibBabble-Zone-3.0 not loaded.  Addon cannot run.")
	return

end

if (not LibStub:GetLibrary("LibBabble-Boss-3.0", true)) then

	self:Print("LibBabble-Boss-3.0 not loaded.  Addon cannot run.")
	return

end

if (not LibStub:GetLibrary("AceLocale-3.0", true)) then

	self:Print("AceLocale-3.0 not loaded.  Addon cannot run.")
	return

end

local BFAC		= LibStub("LibBabble-Faction-3.0"):GetLookupTable()
local L			= LibStub("AceLocale-3.0"):GetLocale(MODNAME)

local DEBUG = false

local MaxFilterIndex = 129


-- Global Frame Variables
addon.optionsFrame = {}
addon.ScanButton = nil
addon.Frame = nil
-- tooltip needs to be global so I can access individual lines in it and 
-- modify then
_G["arlTooltip"]= nil


-- Make global API calls local to speed things up
local GetNumTradeSkills = GetNumTradeSkills
local GetSpellInfo = GetSpellInfo
local GetSpellName = GetSpellName
local GetTradeSkillLine = GetTradeSkillLine
local GetTradeSkillInfo = GetTradeSkillInfo
local GetTradeSkillRecipeLink = GetTradeSkillRecipeLink

local select = select
local format = format
local string = string
local tostring = tostring
local tonumber = tonumber
local pairs = pairs
local table = table
local next = next
local tremove = table.remove
local tsort = table.sort
local tinsert = table.insert
local sfind = string.find
local BOOKTYPE_SPELL = BOOKTYPE_SPELL

local guildname = GetGuildInfo("player")

if (guildname == "Team Ice") then

	addon:Print("Not allowed to use this addon.")
	return

end

--[[

	Initialization functions

]]--

-- Description: Function run when the addon is initialized.  Registers the slash commands, options, and database
-- Expected result: The addon parameters are initialized, slash commands are enabled, database is enabled, and
--	interface options are registered
-- Input: None
-- Output: None

function addon:OnInitialize()

	self.db = LibStub("AceDB-3.0"):New("ARLDB2")

	self:SetupOptions()

	-- Register slash commands
	self:RegisterChatCommand("arl", "ChatCommand")
	self:RegisterChatCommand("ackisrecipelist", "ChatCommand")

	-- Set default options, which are to include everything in the scan
	self.db:RegisterDefaults(
	{
		profile = {
			-- Sorting Options
			sorting = L["Skill"],

			-- Display Options
			includefiltered = false,
			closeguionskillclose = false,
			ignoreexclusionlist = false,
			uiscale = 1,
			tooltipscale = .9,

			-- Recipe Exclusion
			exclusionlist = {},

			-- Filter Options
			filters = {
				general = {			-- General Filters
				    faction = true,
					class = false,
					specialty = false,
					skill = true,
					known = false,
					unknown = true,
				},
				obtain = {			-- Obtain Options
					trainer = true,
					vendor = true,
					instance = true,
					raid = true,
					seasonal = true,
					quest = true,
					pvp = true,
					discovery = true,
					worlddrop = true,
					mobdrop = true,
				},
				item = {			-- Item Filters (Armor/Weapon)
					armor = {
						cloth = true,
						leather = true,
						mail = true,
						plate = true,
						trinket = true,
						cloak = true,
						ring = true,
						necklace = true,
						shield = true,
					},
					weapon = {
						onehand = true,
						twohand = true,
						axe = true,
						sword = true,
						mace = true,
						polearm = true,
						dagger = true,
						fist = true,
						staff = true,
						wand = true,
						thrown = true,
						bow = true,
						crossbow = true,
						ammo = true,
					},
				},
				binding = {
					itemboe = true,
					itembop = true,
					recipebop = true,
					recipeboe = true,
				},
				player = {
					melee = true,
					tank = true,
					healer = true,
					caster = true,
				},
				rep = {			-- Reputation Options
					aldor = true,
					scryer = true,
					argentdawn = true,
					ashtonguedeathsworn = true,
					cenarioncircle = true,
					cenarionexpedition = true,
					consortium = true,
					hellfire = true,
					keepersoftime = true,
					nagrand = true,
					lowercity = true,
					scaleofthesands = true,
					shatar = true,
					shatteredsun = true,
					sporeggar = true,
					thoriumbrotherhood = true,
					timbermaw = true,
					violeteye = true,
					zandalar = true,
-- Below this is WotLK stuff. May need to be changed post beta.
					argentcrusade = true,
					frenzyheart = true,
					ebonblade = true,
					kirintor = true,
					sonsofhodir = true,
					kaluak = true,
					oracles = true,
					wyrmrest = true,
					silvercovenant = true,
					sunreavers = true,
					explorersleague = true,
					valiance = true,
					handofvengeance = true,
					taunka = true,
					warsongoffensive = true,
				}
			}
		}
	})

end

-- Description: Function run when the addon is enabled.  Registers events and pre-loads certain variables.
-- Expected result: Events are registered, scan button and faction levels are identified
-- Input: None
-- Output: None

function addon:OnEnable()

	-- Make addon respond to the tradeskill windows being shown
	self:RegisterEvent("TRADE_SKILL_SHOW")

	-- Addon responds to tradeskill windows being closed.
	self:RegisterEvent("TRADE_SKILL_CLOSE")

	-- Addon responds when a players faction level changes
	self:RegisterEvent("UPDATE_FACTION")

	-- Add an option so that ARL will work with Manufac
	if (Manufac) then

		self:Print("Enabling Manufac integration.")
		Manufac.options.args.ARLScan = {
			type = 'execute',
			name = L["Scan"],
			desc = L["Scan Skills Long"],
			func = function() addon:AckisRecipeList_Command() end,
			order = 550,
		}

	end

	-- If we're using Skillet, use Skillet's API to work with getting tradeskills
	if (Skillet) and (Skillet.GetNumTradeSkills) and
	(Skillet.GetTradeSkillLine) and (Skillet.GetTradeSkillInfo) and
	(Skillet.GetTradeSkillRecipeLink) then

		self:Print("Enabling Skillet advanced features.")
		GetNumTradeSkills = function(...) return Skillet:GetNumTradeSkills(...) end
		GetTradeSkillLine = function(...) return Skillet:GetTradeSkillLine(...) end
		GetTradeSkillInfo = function(...) return Skillet:GetTradeSkillInfo(...) end
		GetTradeSkillRecipeLink = function(...) return Skillet:GetTradeSkillRecipeLink(...) end

	end

	-- Populate the repuatation level
	self:GetFactionLevels()

	--Create the button now for later use
	self:CreateScanButton()

end

-- Description: Run when the addon is disabled. Ace3 takes care of unregistering events, etc.
-- Expected result: Events are unregistered, frame is hidden if it exists and plug-ins into other mods are removed
-- Input: None
-- Output: None

function addon:OnDisable()

	-- If we disable the addon when the GUI is up, hide it.
	if (addon.Frame) then

		addon.Frame:Hide()
		
	end

	-- Remove the option from Manufac
	if Manufac then

		Manufac.options.args.ARLScan = nil

	end

end

-- Description: Shows the scan button when the trade skill window is open.
-- Expected result: Scan button is shown.
-- Input: None
-- Output: None

--[[

	Event handling functions

]]--

function addon:TRADE_SKILL_SHOW()

	addon:OpenTradeWindow()

	if (addon.ScanButton and not Skillet) then

		self:ShowScanButton()

	end

end

-- Description: Hides the scan button when the trade skill window is closed.
-- Expected result: Scan button is hidden and the GUI is closed if the person has that option selected.
-- Input: None
-- Output: None

function addon:TRADE_SKILL_CLOSE()

	addon:CloseTradeWindow()

	if (addon.db.profile.closeguionskillclose and addon.Frame) then

		self:CloseWindow()

	end

	if (addon.ScanButton and not Skillet) then

		addon.ScanButton:Hide()

	end

end

-- Description: Will update the internal list of faction tables when a players faction changes
-- Expected result: Faction table is updated with new reputation levels
-- Input: None
-- Output: None

function addon:UPDATE_FACTION()

	-- Reputation has changed so lets update the table
	self:SetRepDB()

end

--[[

	Player Data Acquisition Functions

]]--

-- Description: Scans all reputations to get reputation levels to determine if the player can learn a reputation recipe
-- Expected result: Updates a table with players current faction level
-- Input: Faction table
-- Output: None, array is referenced

function addon:GetFactionLevels(RepTable)

-- Bug here when I reload UI
	if (not RepTable) then

		return

	end

	for i=1,GetNumFactions(),1 do

		local name,_,replevel = GetFactionInfo(i)

		-- If the rep is greater than neutral
		if (replevel > 4) then
		
			-- We use levels of 0, 1, 2, 3, 4 internally for reputation levels, make it corrospond here
			RepTable[name] = replevel - 4

		end

	end

end

-- Description: Scans first 25 spellbook slots to identify all applicable professions
-- Expected result: Updates a table with players current professions
-- Input: Profession table
-- Output: None, array is referenced

function addon:GetKnownProfessions(ProfTable)

	-- Reset the table, they may have unlearnt a profession
	for i in pairs(ProfTable) do

		ProfTable[i] = false

	end

	-- Scan through the spell book getting the spell names
	for index=1,25,1 do

		local spellName = GetSpellName(index, BOOKTYPE_SPELL)

		if (not spellName) or (index == 25) then

			-- Nothing found
			break

		end

		if (ProfTable[spellName] == false) then

			ProfTable[spellName] = true

		end
	end

end

-- Description: Scans first 25 spellbook slots to identify which trade skill Specialty we have
-- Expected result: Returns the name of the trade skill Specialty
-- Input: Specialty Table and Current Profession
-- Output: String of current Specialty

function addon:GetTradeSpecialty(SpecialtyTable, playerData)

	--Scan the first 25 entries
	for index=1,25,1 do

		local spellName = GetSpellName(index, BOOKTYPE_SPELL)

		-- Nothing found, return nothing
		if (not spellName) or (index == 25) then

			return ""

		-- We have a match, return that spell name
		elseif (SpecialtyTable[playerData.playerProfession]) and (SpecialtyTable[playerData.playerProfession][spellName]) then

			local _, _, ID =  sfind(GetSpellLink(spellName), "spell:(%d+)")
			return ID

		end

	end

end

--[[
	Tradeskill functions
--]]

-- Description: Adds a specific recipe, along with it's info to an array
-- Expected result: The RecipeDB will have a recipe entry created for it.
-- Input: Recipe array reference, SpellID of recipe, Skill level of recipe, Item ID of item created, Rarity of recipe, and Specialty of the recipe
-- Output: None, array is passed as a reference

function addon:addTradeSkill(RecipeDB, SpellID, SkillLevel, ItemID, Rarity, Profession, Specialty)

	--[[ 
		Recipe DB Structures are defined in Documentation.lua
	--]]
	
	-- Creates a table in the RecipeListing table storing all information about a recipe
	RecipeDB[SpellID] = {}
	-- Set the information passed
	RecipeDB[SpellID]["Level"] = SkillLevel
	RecipeDB[SpellID]["ItemID"] = ItemID or nil
	RecipeDB[SpellID]["Rarity"] = Rarity
	RecipeDB[SpellID]["Profession"] = GetSpellInfo(Profession)

	-- Get the recipe link from the spell ID
	local spellLink = GetSpellLink(SpellID)

	if (spellLink ~= nil) then

		RecipeDB[SpellID]["RecipeLink"] = string.gsub(spellLink, "spell", "enchant")

	else

		RecipeDB[SpellID]["RecipeLink"] = nil

	end

	-- Get the recipe name now
	RecipeDB[SpellID]["Name"] = GetSpellInfo(SpellID) or nil

	if (RecipeDB[SpellID]["Name"] == nil) then

		self:Print(format(L["SpellIDCache"],SpellID))

	end

	-- All recipes are unknown until scan occurs
	RecipeDB[SpellID]["Known"] = false

	-- All recipes are set to be displayed until the filtering occurs
	RecipeDB[SpellID]["Display"] = true

	-- All recipes are set to be showing in the search results
	RecipeDB[SpellID]["Search"] = true

	-- Create the flag space in the RecipeDB
	RecipeDB[SpellID]["Flags"] = {}

	-- Set all the flags to be false, will also set the padding spaces to false as well.
	for i=1,MaxFilterIndex,1 do

		RecipeDB[SpellID]["Flags"][tonumber(i)] = false

	end

	-- Create the Acquire space in the RecipeDB
	RecipeDB[SpellID]["Acquire"] = {}

	-- Assumption that there will only be 1 speciality for a trade skill
	RecipeDB[SpellID]["Specialty"] = Specialty or nil

end

-- Description: Adds all flag related information to the RecipeDB associated with the spell ID
-- Expected result: The RecipeDB will have flag information added for a specific recipe
-- Input: Recipe array reference, SpellID of recipe, all flags
-- Output: None, array is passed as a reference

function addon:addTradeFlags(RecipeDB, SpellID, ...)

	-- flags are defined in Documentation.lua

	local numvars = select('#',...)

	-- Find out how many flags we're adding
	for i=1,numvars,1 do

		-- Get the value of the current flag
		local flag = select(i, ...)

		RecipeDB[SpellID]["Flags"][flag] = true

	end
	

end

-- Description: Adds all Acquire related information to the RecipeDB associated with the spell ID
-- Expected result: The RecipeDB will have acqusition information added for a specific recipe
-- Input: Recipe array reference, SpellID of recipe, all Acquire info
-- Output: None, array is passed as a reference

function addon:addTradeAcquire(RecipeDB, SpellID, ...)

	-- Find out how many flags we're adding
	local numvars = select('#',...)

	-- Index for the number of Acquire entries we have
	local index = 1

	-- Index for which variables we're parsing through
	local i = 1

	while (i < numvars) do

		-- Create the space for the current Acquire method
		RecipeDB[SpellID]["Acquire"][index] = {}

		-- Get the Type and ID of the values
		local AcquireType, AcquireID = select(i, ...)

		RecipeDB[SpellID]["Acquire"][index]["Type"] = AcquireType
		RecipeDB[SpellID]["Acquire"][index]["ID"] = AcquireID

		i = i + 2

		if (AcquireType == 6) then

			local RepLevel, RepVendor = select(i, ...)
			RecipeDB[SpellID]["Acquire"][index]["RepLevel"] = RepLevel
			RecipeDB[SpellID]["Acquire"][index]["RepVendor"] = RepVendor
			i = i + 2

		end

		index = index + 1

	end

end

-- Description: Adds a specific entry (ie: vendor, mob, etc) to the lookup list
-- Expected result: Look up list will have an entry added to it
-- Input: List to add to, ID of entry, Name, Faction Location and Coordinates (X and Y)
-- Output: None, array is passed as a reference

function addon:addLookupList(DB, ID, Name, Loc, Coordx, Coordy, Faction)

	--[[
		For individual database structures, see Documentation.lua
	]]--

	DB[ID] = {}
	DB[ID]["Name"] = Name

	if (Loc) then

		DB[ID]["Location"] = Loc

	end

	if (Coordx) and (Coordy) then

		DB[ID]["Coordx"] = Coordx
		DB[ID]["Coordy"] = Coordy

	end

	if (Faction) then

		if (Faction == 0) then

			DB[ID]["Faction"] = BFAC["Neutral"]

		elseif (Faction == 1) then

			DB[ID]["Faction"] = BFAC["Alliance"]

		elseif (Faction == 2) then

			DB[ID]["Faction"] = BFAC["Horde"]

		end

	end

end

--[[

	Recipe Scanning Functions

]]--

-- Description: Scans the recipe listing and marks known recipes as true in the database
-- Expected result: The array of Recipes will have all known recipes toggles to true
-- Input: Recipe Array
-- Output: The total number of recipes known

function addon:ScanForKnownRecipes(RecipeDB, playerData)

	-- Clear the "Have Materials" check box
	if (not Skillet) and TradeSkillFrameAvailableFilterCheckButton:GetChecked() then

		TradeSkillFrameAvailableFilterCheckButton:SetChecked(false)
		TradeSkillOnlyShowMakeable(false)

	end

	-- Clear the sub-classes filters
	SetTradeSkillSubClassFilter(0, 1, 1)
	UIDropDownMenu_SetSelectedID(TradeSkillSubClassDropDown, 1)

	-- Clear the inventory slot filter
	SetTradeSkillInvSlotFilter(0, 1, 1);
	UIDropDownMenu_SetSelectedID(TradeSkillInvSlotDropDown, 1)

	-- Expand all headers so we can see all the recipes there are
	for i = GetNumTradeSkills(), 1, -1 do

		local _, tradeType = GetTradeSkillInfo(i)

		if tradeType == "header" then

			ExpandTradeSkillSubClass(i)

		end

	end

	playerData.foundRecipes = 0

	-- Scan through all recipes
	for i = 1, GetNumTradeSkills() do

		local tradeName, tradeType = GetTradeSkillInfo(i)

		-- Ignore all trade skill headers
		if (tradeType ~= "header") then

			-- Get the trade skill link for the specified recipe
			local SpellLink = GetTradeSkillRecipeLink(i)
			-- Get the SpellID from the spell link
			local _,_,SpellString = sfind(SpellLink, "enchant:(%d+)")
			local SpellID = tonumber(SpellString)

			-- Spell ID is in RecipeDB so lets flag it as known
			if (RecipeDB[SpellID]) then

				-- Update array that recipe was found
				RecipeDB[SpellID]["Known"] = true
				playerData.foundRecipes = playerData.foundRecipes + 1

			-- We didn't find it in our database, lets notify people that we don't have it
			else

				self:Print(self:Red(tradeName .. " " .. SpellString) .. self:White(L["MissingFromDB"]))	

			end

		end

	end

end

do

	local classmap = {

		["DEATHKNIGHT"] = 21,
		["DRUID"] = 22,
		["HUNTER"] = 23,
		["MAGE"] = 24,
		["PALADIN"] = 25,
		["PRIEST"] = 26,
		["SHAMAN"] = 27,
		["ROGUE"] = 28,
		["WARLOCK"] = 29,
		["WARRIOR"] = 30

	}

	local reptable = nil

	local function CreateRepTable()

		local repdb = addon.db.profile.filters.rep

		reptable = {
			[96] = repdb.argentdawn,
			[97] = repdb.cenarioncircle,
			[98] = repdb.thoriumbrotherhood,
			[99] = repdb.timbermaw,
			[100] = repdb.zandalar,
			[101] = repdb.aldor,
			[102] = repdb.ashtonguedeathsworn,
			[103] = repdb.cenarionexpedition,
			[104] = repdb.hellfire,
			[105] = repdb.consortium,
			[106] = repdb.keepersoftime,
			[107] = repdb.lowercity,
			[108] = repdb.nagrand,
			[109] = repdb.scaleofthesands,
			[110] = repdb.scryer,
			[111] = repdb.shatar,
			[112] = repdb.shatteredsun,
			[113] = repdb.sporeggar,
			[114] = repdb.violeteye,
			[115] = repdb.argentcrusade,
			[116] = repdb.frenzyheart,
			[117] = repdb.ebonblade,
			[118] = repdb.kirintor,
			[119] = repdb.sonsofhodir,
			[120] = repdb.kaluak,
			[121] = repdb.oracles,
			[122] = repdb.wyrmrest,
			[123] = repdb.silvercovenant,
			[124] = repdb.sunreavers,
			[125] = repdb.explorersleague,
			[126] = repdb.valiance,
			[127] = repdb.handofvengeance,
			[128] = repdb.taunka,
			[129] = repdb.warsongoffensive,
		}

	end

	function addon:ClearRepTable()

		reptable = nil

	end

	local function CheckReputationDisplay(Recipe, flags)

		if (not reptable) then

			CreateRepTable()

		end

		local display = true

		for i in pairs(reptable) do

			if (flags[i]) then

				if (reptable[i]) then

					display = true

				else

					display = false

				end

			end

		end

		return display

	end

	-- Description: Scans a specific recpie to determine if it is to be displayed or not.
	-- Expected result: Returns true or false depending on if the recipe should be displayed
	-- Input: 
	-- Output: Boolean on whether or not to display the recipe

	function addon:CheckDisplayRecipe(Recipe, AllSpecialtiesTable, playerProfessionLevel, playerProfession, playerSpecialty, playerFaction, playerClass)

		-- For flag info see comments at start of file in comments
		local filterdb = addon.db.profile.filters
		local flags = Recipe["Flags"]

		-- See Documentation file for logic explanation
		-- Stage 1
		-- Loop through exclusive flags (hard filters)
		-- If one of these does not pass we do not display the recipe
		-- So to be more effecient we'll just leave this function if there's a false

		local generaldb = filterdb.general

		-- Is this recipe in my currently selected profession?
		if (Recipe["Profession"] ~= playerProfession) then
			return false
		end

		-- Include known
		if (generaldb.known == false) and (Recipe["Known"] == true) then
			return false
		end

		-- Include unknown
		if (generaldb.unknown == false) and (Recipe["Known"] == false) then
			return false
		end

		-- Display both horde and alliance factions?
		if (generaldb.faction == false) then
			-- We want to filter out all the Horde only recipes
			if (playerFaction == BFAC["Alliance"]) then
				-- Filter out Horde only
				if (flags[1] == false) and (flags[2] == true) then
					return false
				end
			-- We want to filter out all the Alliance only recipes
			else
				-- Filter out Alliance only
				if (flags[2] == false) and (flags[1] == true) then
					return false
				end
			end
		end

		-- Display all skill levels?
		if (generaldb.skill == false) and (Recipe["Level"] > playerProfessionLevel) then
			return false
		end

		-- Display all classes?
		if (generaldb.class == false) and (flags[classmap[playerClass]] == false) then
			return false
		end

		-- Display all specialities?
		if (generaldb.specialty == false) then
			if (Recipe["Specialty"]) and (Recipe["Specialty"] ~= playerSpecialty) then
				return false
			end
		end

		local bindingdb = filterdb.binding

		-- Include BoE Items in the scan? (if I want to see BoE items, only filter those that are not BoE)
		if (bindingdb.itemboe == false) and (flags[36] == true) then
			return false
		end

		-- Include BoP Items in the scan? (if I want to see BoP items, only filter those that are not BoP)
		if (bindingdb.itembop == false) and (flags[37] == true) then
			return false
		end

		-- Include BoA Items in the scan? (if I want to see BoA items, only filter those that are not BoA)
		if (bindingdb.itemboa == false) and (flags[38] == true) then
			return false
		end

		-- Include BoE Recipes in the scan? (if I want to see BoE recipes, only filter those that are not BoE)
		if (bindingdb.recipeboe == false) and (flags[40] == true) then
			return false
		end

		-- Include BoP Recipes in the scan? (if I want to see BoP recipes, only filter those that are not BoP)
		if (bindingdb.recipebop == false) and (flags[41] == true) then
			return false
		end

		-- Include BoA Recipes in the scan? (if I want to see BoA recipes, only filter those that are not BoA)
		if (bindingdb.recipeboa == false) and (flags[42] == true) then
			return false
		end

		local playerdb = filterdb.player

		-- Include melee type recipes?
		if (playerdb.melee == false) and (flags[51] == true) then
			return false
		end

		-- Include tanking type recipes?
		if (playerdb.tank == false) and (flags[52] == true) then
			return false
		end

		-- Include healing type recipes?
		if (playerdb.healer == false) and (flags[53] == true) then
			return false
		end

		-- Include caster type recipes?
		if (playerdb.caster == false) and (flags[54] == true) then
			return false
		end

		local armordb = filterdb.item.armor

		if (armordb.cloth == false) and (flags[56] == true) then
			return false
		end

		if (armordb.leather == false) and (flags[57] == true) then
			return false
		end

		if (armordb.mail == false) and (flags[58] == true) then
			return false
		end

		if (armordb.plate == false) and (flags[59] == true) then
			return false
		end

		if (armordb.trinket == false) and (flags[61] == true) then
			return false
		end

		if (armordb.cloak == false) and (flags[60] == true) then
			return false
		end

		if (armordb.ring == false) and (flags[62] == true) then
			return false
		end

		if (armordb.necklace == false) and (flags[63] == true) then
			return false
		end

		if (armordb.shield == false) and (flags[64] == true) then
			return false
		end

		local weapondb = filterdb.item.weapon

		if (weapondb.onehand == false) and (flags[66] == true) then
			return false
		end

		if (weapondb.twohand == false) and (flags[67] == true) then
			return false
		end

		if (weapondb.axe == false) and (flags[68] == true) then
			return false
		end

		if (weapondb.sword == false) and (flags[69] == true) then
			return false
		end

		if (weapondb.mace == false) and (flags[70] == true) then
			return false
		end

		if (weapondb.polearm == false) and (flags[71] == true) then
			return false
		end

		if (weapondb.dagger == false) and (flags[72] == true) then
			return false
		end

		if (weapondb.fist == false) and (flags[79] == true) then
			return false
		end

		if (weapondb.staff == false) and (flags[73] == true) then
			return false
		end

		if (weapondb.wand == false) and (flags[74] == true) then
			return false
		end

		if (weapondb.thrown == false) and (flags[75] == true) then
			return false
		end

		if (weapondb.bow == false) and (flags[76] == true) then
			return false
		end

		if (weapondb.crossbow == false) and (flags[77] == true) then
			return false
		end

		if (weapondb.ammo == false) and (flags[78] == true) then
			return false
		end

		if (not CheckReputationDisplay(Recipe, flags)) then
			return false
		end

		-- Stage 2
		-- loop through nonexclusive (soft filters) flags until one is true
		-- If one of these is true (ie: we want to see trainers and there is a trainer flag) we display the recipe

		local obtaindb = filterdb.obtain

		-- Display trainer recipes
		if (obtaindb.trainer == true) and (flags[3] == true) then
			return true
		end

		-- Display vendor recipes
		if (obtaindb.vendor == true) and (flags[4] == true) then
			return true
		end

		-- Display instance recipes
		if (obtaindb.instance == true) and (flags[5] == true) then
			return true
		end

		-- Display raid recipes
		if (obtaindb.raid == true) and (flags[6] == true) then
			return true
		end

		-- Display seasonal recipes
		if (obtaindb.seasonal == true) and (flags[7] == true) then
			return true
		end

		-- Display quest recipes
		if (obtaindb.quest == true) and (flags[8] == true) then
			return true
		end

		-- Display PVP recipes
		if (obtaindb.PVP == true) and (flags[9] == true) then
			return true
		end

		-- Display world drop recipes
		if (obtaindb.worlddrop == true) and (flags[10] == true) then
			return true
		end

		-- Display mob drop recipes
		if (obtaindb.mobdrop == true) and (flags[11] == true) then
			return true
		end

		-- Display discovery recipes
		if (obtaindb.discovery == true) and (flags[12] == true) then
			return true
		end

		-- If we get here it means that no flags matched our values
		return false

	end

end

-- Description: Creates an array of which factions we want to include in our display and which ones to ignore
-- Expected result: Array of all factions created with those which we want to display having a true flag
-- Input: Rep Table Array
-- Output: None, array is passed as a reference

function addon:PopulateRepFilters(RepTable)

	local repfilters = addon.db.profile.filters.rep

	RepTable[BFAC["The Scryers"]] = repfilters.scryer
	RepTable[BFAC["The Aldor"]] = repfilters.aldor
	RepTable[BFAC["Argent Dawn"]] = repfilters.argentdawn
	RepTable[BFAC["Ashtongue Deathsworn"]] = repfilters.ashtonguedeathsworn
	RepTable[BFAC["Cenarion Circle"]] = repfilters.cenarioncircle
	RepTable[BFAC["Cenarion Expedition"]] = repfilters.cenarionexpedition
	RepTable[BFAC["The Consortium"]] = repfilters.consortium
	RepTable[BFAC["Honor Hold"]] = repfilters.hellfire
	RepTable[BFAC["Thrallmar"]] = repfilters.hellfire
	RepTable[BFAC["Keepers of Time"]] = repfilters.keepersoftime
	RepTable[BFAC["Kurenai"]] = repfilters.nagrand
	RepTable[BFAC["The Mag'har"]] = repfilters.nagrand
	RepTable[BFAC["Lower City"]] = repfilters.lowercity
	RepTable[BFAC["The Scale of the Sands"]] = repfilters.scaleofthesands
	RepTable[BFAC["The Sha'tar"]] = repfilters.shatar
	RepTable[BFAC["Shattered Sun Offensive"]] = repfilters.shatteredsun
	RepTable[BFAC["Sporeggar"]] = repfilters.sporeggar
	RepTable[BFAC["Thorium Brotherhood"]] = repfilters.thoriumbrotherhood
	RepTable[BFAC["Timbermaw Hold"]] = repfilters.timbermaw
	RepTable[BFAC["The Violet Eye"]] = repfilters.violeteye
	RepTable[BFAC["Zandalar Tribe"]] = repfilters.zandalar
-- Below this is WotLK data. May need to be changed post beta.
	RepTable[BFAC["Argent Crusade"]] = repfilters.argentcrusade
	RepTable[BFAC["Frenzyheart Tribe"]] = repfilters.frenzyheart
	RepTable[BFAC["Knights of the Ebon Blade"]] = repfilters.ebonblade
	RepTable[BFAC["Kirin Tor"]] = repfilters.kirintor
	RepTable[BFAC["The Sons of Hodir"]] = repfilters.sonsofhodir
	RepTable[BFAC["The Kalu'ak"]] = repfilters.kaluak
	RepTable[BFAC["The Oracles"]] = repfilters.oracles
	RepTable[BFAC["The Wyrmrest Accord"]] = repfilters.wyrmrest
	RepTable[BFAC["The Silver Convenant"]] = repfilters.silvercovenant
	RepTable[BFAC["The Sunreavers"]] = repfilters.sunreavers
	RepTable[BFAC["Explorer's League"]] = repfilters.explorersleague
	RepTable[BFAC["Valiance Expedition"]] = repfilters.valiance
	RepTable[BFAC["The Hand of Vengeance"]] = repfilters.handofvengeance
	RepTable[BFAC["The Taunka"]] = repfilters.taunka
	RepTable[BFAC["Warsong Offensive"]] = repfilters.warsongoffensive

end

-- Description: Scans the recipe listing and updates the filters according to user preferences
-- Expected result: The array of Recipes will have all Display flags toggles according to display preferences and the number of filtered recipes
-- Input: Recipe Array, Skill level for current profession, name of current profession, and current profession Specialty
-- Output: Number of recipes that are filtered

function addon:UpdateFilters(RecipeDB, AllSpecialtiesTable, playerData)

	local playerProfessionLevel = playerData.playerProfessionLevel
	local playerProfession = playerData.playerProfession
	local playerSpecialty = playerData.playerSpecialty
	local playerFaction = playerData.playerFaction
	local playerClass = playerData.playerClass

	playerData.filteredRecipes = 0
	playerData.otherRecipes = 0

	-- Parse through all the entries in the Recipe array
	for RecipeID in pairs(RecipeDB) do

		-- Determine if we are to display this recipe or not
		local displayflag = self:CheckDisplayRecipe(RecipeDB[RecipeID], AllSpecialtiesTable, playerProfessionLevel, playerProfession, playerSpecialty, playerFaction, playerClass)

		if (displayflag == false) then

			playerData.filteredRecipes = playerData.filteredRecipes + 1

		end

		-- If the recipes aren't for the current profession, lets add it to the list
		if (RecipeDB[RecipeID]["Profession"] ~= playerProfession) then

			playerData.otherRecipes = playerData.otherRecipes + 1

		end

		-- Set the display flag
		RecipeDB[RecipeID]["Display"] = displayflag

	end

	self:ClearRepTable()

end

--[[

	ARL Logic Functions

]]--

-- Description: Determines which profession we are dealing with and loads up the recipe information for it.
-- Expected result: The RecipeDBis populated with recipe information
-- Input: RecipeDB, Current Profession we're examining
-- Output: Total number of recipes in the database

local function InitializeRecipes(RecipeDB, playerData)

	-- Table of all possible professions with init functions
	local professiontable =
	{
		[GetSpellInfo(2259)] = addon.InitAlchemy,
		[GetSpellInfo(2018)] = addon.InitBlacksmithing,
		[GetSpellInfo(2550)] = addon.InitCooking,
		[GetSpellInfo(7411)] = addon.InitEnchanting,
		[GetSpellInfo(4036)] = addon.InitEngineering,
		-- Use first aid spell of applying bandages to fix issues with other localizations
		[GetSpellInfo(746)] = addon.InitFirstAid,
		-- Hack to get first aid working on frFR since I can't seem to get a proper spell ID :P
		["Premiers soins"] = addon.InitFirstAid,
		--[GetSpellInfo(3273)] = addon.InitFirstAid,
		[GetSpellInfo(2108)] = addon.InitLeatherworking,
		[GetSpellInfo(2575)] = addon.InitSmelting,
		[GetSpellInfo(3908)] = addon.InitTailoring,
		[GetSpellInfo(25229)] = addon.InitJewelcrafting,
		[GetSpellInfo(45357)] = addon.InitInscription,
		[GetSpellInfo(28481)] = addon.InitRuneforging,
	}

	-- Thanks to sylvanaar/xinhuan for the code snippet
	local a = professiontable[playerData.playerProfession]

	if a then
		playerData.totalRecipes = a(addon, RecipeDB)
	else
		addon:Print(L["UnknownTradeSkill"]:format(playerData.playerProfession))
	end

end

-- Description: Determines what to do when the slash command is called.
-- Expected result: The appropiate window is opened based on the slash command.
-- Input: None
-- Output: None

function addon:ChatCommand(input)

	-- Open About panel if there's no parameters or if we do /arl about
	if (not input) or (input and input:trim() == "") or (input == string.lower(L["About"]))then

		if (self.optionsFrame["About"]) then

			InterfaceOptionsFrame_OpenToCategory(self.optionsFrame["About"])

		else

			InterfaceOptionsFrame_OpenToCategory(self.optionsFrame)

		end

	elseif (input == string.lower(L["Sorting"])) or (input == string.lower(L["Sort"]))  or (input == string.lower(L["Display"])) then

		InterfaceOptionsFrame_OpenToCategory(self.optionsFrame)

	elseif (input == string.lower(L["Profile"])) then

		InterfaceOptionsFrame_OpenToCategory(self.optionsFrame["Profiles"])

	elseif (input == string.lower(L["Filter"])) then

		InterfaceOptionsFrame_OpenToCategory(self.optionsFrame["Filters"])

	else
		-- What happens when we get here?
		LibStub("AceConfigCmd-3.0"):HandleCommand("arl", "Ackis Recipe List", input)

	end

end

do

	local RecipeList = nil

	local MobList = nil
	local QuestList = nil
	local ReputationList = nil
	local TrainerList = nil
	local SeasonalList = nil
	local VendorList = nil
	local RepFilters = nil
	local AllSpecialtiesTable = nil
	local SpecialtyTable = nil

	local playerData = nil

	local tradewindowopened = false

	-- Description: Toggles the flag that a trade window is opened
	-- Expected result: Flag is toggled on
	-- Input: None
	-- Output: None

	function addon:OpenTradeWindow()

		tradewindowopened = true

	end

	-- Description: Toggles the flag that a trade window is opened
	-- Expected result: Flag is toggled on
	-- Input: None
	-- Output: None

	function addon:CloseTradeWindow()

		tradewindowopened = false

	end

	-- Description: Updates the reputation table.  This only happens seldomly so I'm not worried about effeciency
	-- Expected result: Reputation table is updated with appropiate levels
	-- Input: None
	-- Output: None

	function addon:SetRepDB()

		if (playerData and playerData["Reputation"]) then

			self:GetFactionLevels(playerData["Reputation"])

		end

	end

	-- Description: Function called when the scan button is clicked.   Parses recipes and displays output
	-- Expected result: A gui window of all recipes accoring to filter is printed out
	-- Input: None
	-- Output: None

	function addon:AckisRecipeList_Command(textdump)

		-- If we don't have a trade skill window open, lets return out of here
		if (not tradewindowopened) then

			self:Print(L["OpenTradeSkillWindow"])
			return

		-- Trade type skills
		else

			-- First time a scan has been run, we need to get the player specifc data, specifically faction information, profession information and other pertinant data.
			if (playerData == nil) then

				playerData = {}

				playerData.playerFaction = UnitFactionGroup("player")
				local _
				_, playerData.playerClass = UnitClass("player")

				playerData["Reputation"] = {}
				self:GetFactionLevels(playerData["Reputation"])

				playerData["Professions"] = {
					[GetSpellInfo(2259)] = false, -- Alchemy
					[GetSpellInfo(2018)] = false, -- Blacksmithing
					[GetSpellInfo(2550)] = false, -- Cooking
					[GetSpellInfo(7411)] = false, -- Enchanting
					[GetSpellInfo(4036)] = false, -- Engineering
					[GetSpellInfo(746)] = false, -- First Aid
					--["Premiers soins"] = false, -- First Aid (Hack for frFR local)
					[GetSpellInfo(2108)] = false, -- Leatherworking
					[GetSpellInfo(2575)] = false, -- Smelting
					[GetSpellInfo(3908)] = false, -- Tailoring
					[GetSpellInfo(25229)] = false, -- Jewelcrafting
					[GetSpellInfo(45357)] = false, -- Inscription
					[GetSpellInfo(28481)] = false, -- Runeforging
				}

				self:GetKnownProfessions(playerData["Professions"])

				-- All Alchemy Specialties
				local AlchemySpec = {
					[GetSpellInfo(28674)] = true,
					[GetSpellInfo(28678)] = true,
					[GetSpellInfo(28676)] = true,
				}

				-- All Blacksmithing Specialties
				local BlacksmithSpec = {
					[GetSpellInfo(9788)] = true, -- Armorsmith
					[GetSpellInfo(17041)] = true, -- Master Axesmith
					[GetSpellInfo(17040)] = true, -- Master Hammersmith
					[GetSpellInfo(17039)] = true, -- Master Swordsmith
					[GetSpellInfo(9787)] = true, -- Weaponsmith
				}

				-- All Engineering Specialties
				local EngineeringSpec = {
					[GetSpellInfo(20219)] = true, -- Gnomish
					[GetSpellInfo(20222)] = true, -- Goblin
				}

				-- All Leatherworking Specialties
				local LeatherworkSpec = {
					[GetSpellInfo(10657)] = true, -- Dragonscale
					[GetSpellInfo(10659)] = true, -- Elemental
					[GetSpellInfo(10661)] = true, -- Tribal
				}

				-- All Tailoring Specialties
				local TailorSpec = {
					[GetSpellInfo(26797)] = true, -- Spellfire
					[GetSpellInfo(26801)] = true, -- Shadoweave
					[GetSpellInfo(26798)] = true, -- Primal Mooncloth
				}

				-- List of classes which have Specialties
				SpecialtyTable = {
					[GetSpellInfo(2259)] = AlchemySpec,
					[GetSpellInfo(2018)] = BlacksmithSpec,
					[GetSpellInfo(4036)] = EngineeringSpec,
					[GetSpellInfo(2108)] = LeatherworkSpec,
					[GetSpellInfo(3908)] = TailorSpec,
				}

				-- List containing all possible Specialties
				AllSpecialtiesTable = {}

				-- Populate the Specialty table with all Specialties, not adding alchemy because no recipes have alchemy filters
				for i in pairs(BlacksmithSpec) do AllSpecialtiesTable[i] = true end
				for i in pairs(EngineeringSpec) do AllSpecialtiesTable[i] = true end
				for i in pairs(LeatherworkSpec) do AllSpecialtiesTable[i] = true end
				for i in pairs(TailorSpec) do AllSpecialtiesTable[i] = true end

			end

			-- Initializes the mob list
			if (MobList == nil) then

				MobList = {}
				self:InitMob(MobList)

			end

			-- Initializes the quest list
			if (QuestList == nil) then

				QuestList = {}
				self:InitQuest(QuestList)

			end

			-- Initializes the reputation list
			if (ReputationList == nil) then

				ReputationList = {}
				self:InitReputation(ReputationList)

			end

			-- Initializes the trainer list
			if (TrainerList == nil) then

				TrainerList = {}
				self:InitTrainer(TrainerList)

			end

			-- Initializes the season list
			if (SeasonalList == nil) then

				SeasonalList = {}
				self:InitSeasons(SeasonalList)

			end

			-- Initializes the vendor list
			if (VendorList == nil) then

				VendorList = {}
				self:InitVendor(VendorList)

			end

			-- Initializes the reputation filters
			-- Don't assign values no because we do a scan later on
			if (RepFilters == nil) then

				RepFilters = {}

			end

			-- Initializes the recipe list
			-- Note there is no reset function implemented yet
			if (RecipeList == nil) then

				RecipeList = {}

			end

			-- Get the name of the current trade skill opened, along with the current level of the skill.
			playerData.playerProfession, playerData.playerProfessionLevel = GetTradeSkillLine()

			-- Get the current profession Specialty
			playerData.playerSpecialty = self:GetTradeSpecialty(SpecialtyTable, playerData)

			-- Add the recipes to the database
			InitializeRecipes(RecipeList, playerData)

			-- Scan all recipes and mark the ones which ones we know
			self:ScanForKnownRecipes(RecipeList, playerData)

			-- Update the table containing which reps to display
			self:PopulateRepFilters(RepFilters)

			-- Add filtering flags to the recipes
			self:UpdateFilters(RecipeList, AllSpecialtiesTable, playerData)

			-- Mark excluded recipes
			if (not addon.db.profile.ignoreexclusionlist) then

				self:GetExclusions(RecipeList)

			end

		end

		-- Sort the recipe list now
		local sortedindex = self:SortMissingRecipes(RecipeList)

		if (textdump == true) then

			local temptext = self:GetTextDump(RecipeList)

			self:DisplayTextDump(temptext)

		else

			if (DEBUG) then
				self:Print("Debug: Found (known) Recipes: " .. playerData.foundRecipes)
				self:Print("Debug: Total Recipes in Database: " .. playerData.totalRecipes)
				self:Print("Debug: Filtered Recipes: " .. playerData.filteredRecipes)
				self:Print("Debug: Other Recipes: " .. playerData.otherRecipes)
			end
			self:CreateFrame(RecipeList, sortedindex, playerData, AllSpecialtiesTable,
								TrainerList, VendorList, QuestList, ReputationList,
								SeasonalList, MobList)

		end

	end


	-- Description: API for external addons to get recipe information from ARL
	-- Expected result: The recipe information is returned if it exists
	-- Input: The spellID of the recipe.
	-- Output: A table containing all its information

	function addon:GetRecipeData(spellID)

		if (RecipeList) then

			if (RecipeList[spellID]) then

				return RecipeList[spellID]

			else

				return nil

			end

		else

			return nil

		end

	end

	-- Description: API for external addons to get recipe information from ARL
	-- Expected result: The recipe information is returned if it exists
	-- Input: None
	-- Output: All the tables containing reference data

	function addon:GetRecipeSets()

		if (RecipeList) then

			return MobList, QuestList, ReputationList, TrainerList, SeasonalList, VendorList

		else

			return nil, nil, nil, nil, nil, nil

		end

	end

end

--[[

	Sorting Functions

]]--

do

	-- Sorting functions

	local sortFuncs = {}

	sortfunc[L['Skill']] = function(a, b) 

		return RecipeDB[a]["Level"] < RecipeDB[b]["Level"]

	end

	sortfunc[L['Name']] = function(a, b)

		return RecipeDB[a]["Name"] < RecipeDB[b]["Name"]

	end

	sortfunc[L['Acquisition']] = function (a, b)

		local reca = RecipeDB[a]["Acquire"][1]
		local recb = RecipeDB[b]["Acquire"][1]

		if (reca) and (recb) then

			return reca["Type"] < recb["Type"]

		else

			return not not reca

		end

	end

	sortfunc[L["Location"]] = function (a, b)

	end


	-- Description: Sorts the recipe Database depending on the settings defined in the database.
	-- Expected result: A sorted array indexing values in the RecipeDB is returned.
	-- Input: The Recipe Database
	-- Output: A pointer to an array containing sorted values

	function addon:SortMissingRecipes(RecipeDB)

		-- Create a new array for the sorted index
		local SortedRecipeIndex = {}

		-- Get all the indexes of the RecipeListing
		for n, v in pairs(RecipeDB) do

			tinsert(SortedRecipeIndex, n)

		end

		tsort(SortedRecipeIndex, sortFuncs[addon.db.profile.sorting])

		return SortedRecipeIndex

	end

end

--[[

	Recipe Exclusion Functions

--]]

-- Description: Marks all exclusions in the recipe database to not be displayed
-- Expected result: Parses the recipe database marking all exlusions to not be displays
-- Input: Recipe Database
-- Output: None, Recipe Database is passed as a reference

function addon:GetExclusions(RecipeDB)

	local exclusionlist = addon.db.profile.exclusionlist

	for i in pairs(exclusionlist) do
		-- We may have a recipe in the exclusion list that has not been scanned yet
		-- check if the entry exists in RecipeDB first
		if (RecipeDB[i]) then
			RecipeDB[i]["Display"] = false
		end
	end

end

-- Description: Removes or adds a recipe to the exclusion list.
-- Expected result: The exclusion database is updated.
-- Input: The spell IDsof the recipe
-- Output: Exclusion database is updated

function addon:ToggleExcludeRecipe(SpellID)

	local exclusionlist = addon.db.profile.exclusionlist

	-- Remove the Spell from the exclusion list
	if (exclusionlist[SpellID]) then

		exclusionlist[SpellID] = nil

	else

		exclusionlist[SpellID] = true

	end

end

--[[

	Searching Functions

]]--

-- Description: Scans through the recipe database and toggles the flag on if the item is in the search criteria
-- Expected result: The Search flag is toggle off for anything that does not meet search criteria
-- Input: Recipe database
-- Output: None, array is a reference

function addon:SearchRecipeDB(RecipeDB, searchstring)

	-- Go through the entire database
	for SpellID in pairs(RecipeDB) do

		-- Allow us to search by spell ID
		if sfind(SpellID,searchstring) or

		-- Allow us to search byitem ID
		sfind(RecipeDB[SpellID]["ItemID"],searchstring) or

		-- Allow us to search by name
		sfind(RecipeDB[SpellID]["Name"],searchstring) then

		-- Allow us to search in the Acquire information
		--sfind(RecipeDB[SpellID]["Name"],searchstring) then

			RecipeDB[SpellID]["Search"] = true

		else

			RecipeDB[SpellID]["Search"] = false

		end

	end

end

-- Description: Goes through the recipe database and resets all the search flags
-- Expected result: All search flags are reset to true
-- Input: Recipe database
-- Output: None, array is a reference

function addon:ResetSearch(RecipeDB)

	for SpellID in pairs(RecipeDB) do

		RecipeDB[SpellID]["Search"] = true

	end

end

--[[

	Text dumping functions

]]--

-- Description: Scans through the recipe database providing a string of comma seperated values for all recipe information
-- Expected result: Single string of all recipes provided.
-- Input: Recipe database
-- Output: Array is a reference, string of text dump

function addon:GetTextDump(RecipeDB)

	local texttable = {}

	for SpellID in pairs(RecipeDB) do

		if (RecipeDB[SpellID]["Known"]) then

			tinsert(texttable,SpellID .. "," .. RecipeDB[SpellID]["Name"] .. "," .. RecipeDB[SpellID]["Level"] .. "," .. ",true")

		else

			tinsert(texttable,SpellID .. "," .. RecipeDB[SpellID]["Name"] .. "," .. RecipeDB[SpellID]["Level"] .. "," .. ",false")

		end

	end

	return table.concat(texttable,"\n")

end
