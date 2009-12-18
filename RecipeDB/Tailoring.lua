--[[
************************************************************************
Tailoring.lua
Tailoring data for all of Ackis Recipe List
************************************************************************
File date: @file-date-iso@ 
File revision: @file-revision@ 
Project revision: @project-revision@
Project version: @project-version@
************************************************************************
Format:
	self:addLookupList(SeasonDB, Season ID, Season Name)
************************************************************************
Please see http://www.wowace.com/projects/arl/for more information.
************************************************************************
License:
	Please see LICENSE.txt
This source code is released under All Rights Reserved.
************************************************************************
]]--

local MODNAME = "Ackis Recipe List"
local addon	= LibStub("AceAddon-3.0"):GetAddon(MODNAME)
local L	= LibStub("AceLocale-3.0"):GetLocale(MODNAME)

--------------------------------------------------------------------------------------------------------------------
-- Item "rarity"
--------------------------------------------------------------------------------------------------------------------
local R_COMMON, R_UNCOMMON, R_RARE, R_EPIC, R_LEGENDARY, R_ARTIFACT = 1, 2, 3, 4, 5, 6

--------------------------------------------------------------------------------------------------------------------
-- Origin
--------------------------------------------------------------------------------------------------------------------
local GAME_ORIG, GAME_TBC, GAME_WOTLK = 0, 1, 2

--------------------------------------------------------------------------------------------------------------------
-- Filter flags
--------------------------------------------------------------------------------------------------------------------
local F_ALLIANCE, F_HORDE, F_TRAINER, F_VENDOR, F_INSTANCE, F_RAID = 1, 2, 3, 4, 5, 6
local F_SEASONAL, F_QUEST, F_PVP, F_WORLD_DROP, F_MOB_DROP, F_DISC = 7, 8, 9, 10, 11, 12
local F_DK, F_DRUID, F_HUNTER, F_MAGE, F_PALADIN, F_PRIEST, F_SHAMAN, F_ROGUE, F_WARLOCK, F_WARRIOR = 21, 22, 23, 24, 25, 26, 27, 28, 29, 30
local F_IBOE, F_IBOP, F_IBOA, F_RBOE, F_RBOP, F_RBOA = 36, 37, 38, 40, 41, 42
local F_DPS, F_TANK, F_HEALER, F_CASTER = 51, 52, 53, 54
local F_CLOTH, F_LEATHER, F_MAIL, F_PLATE, F_CLOAK, F_TRINKET, F_RING, F_NECK, F_SHIELD = 56, 57, 58, 59, 60, 61, 62, 63, 64
local F_1H, F_2H, F_AXE, F_SWORD, F_MACE, F_POLEARM, F_DAGGER = 66, 67, 68, 69, 70, 71, 72
local F_STAFF, F_WAND, F_THROWN, F_BOW, F_XBOW, F_AMMO, F_FIST, F_GUN = 73, 74, 75, 76, 77, 78, 79, 80

-------------------------------------------------------------------------------
-- Reputation Filter flags
-------------------------------------------------------------------------------
local F_ARGENTDAWN, F_CENARION_CIRCLE, F_THORIUM_BROTHERHOOD, F_TIMBERMAW_HOLD, F_ZANDALAR = 96, 97, 98, 99, 100
local F_ALDOR, F_ASHTONGUE, F_CENARION_EXPEDITION, F_HELLFIRE, F_CONSORTIUM = 101, 102, 103, 104, 105
local F_KOT, F_LOWERCITY, F_NAGRAND, F_SCALE_SANDS, F_SCRYER, F_SHATAR = 106, 107, 108, 109, 110
local F_SHATTEREDSUN, F_SPOREGGAR, F_VIOLETEYE = 111, 112, 113, 114
local F_ARGENTCRUSADE, F_FRENZYHEART, F_EBONBLADE, F_KIRINTOR, F_HODIR = 115, 116, 117, 118, 119
local F_KALUAK, F_ORACLES, F_WYRMREST, F_WRATHCOMMON1, F_WRATHCOMMON2 = 120, 121, 122, 123, 124
local F_WRATHCOMMON3, F_WRATHCOMMON4, F_WRATHCOMMON5, F_ASHEN_VERDICT = 125, 126, 127, 128

--------------------------------------------------------------------------------------------------------------------
-- Acquire types
--------------------------------------------------------------------------------------------------------------------
local A_TRAINER, A_VENDOR, A_MOB, A_QUEST, A_SEASONAL, A_REPUTATION, A_WORLD_DROP, A_CUSTOM = 1, 2, 3, 4, 5, 6, 7, 8

--------------------------------------------------------------------------------------------------------------------
-- Reputation Levels
--------------------------------------------------------------------------------------------------------------------
local FRIENDLY = 1
local HONORED = 2
local REVERED = 3
local EXALTED = 4


local initialized = false
local num_recipes = 0

function addon:InitTailoring(RecipeDB)

	if initialized then
		return num_recipes
	end

	initialized = true

	--------------------------------------------------------------------------------------------------------------------
	-- Counter and wrapper function
	--------------------------------------------------------------------------------------------------------------------
	local function AddRecipe(SpellID, Skill, ItemID, Rarity, Game, Orange, Yellow, Green, Gray, Speciality)
		num_recipes = num_recipes + 1
		self:addTradeSkill(RecipeDB, SpellID, Skill, ItemID, Rarity, 3908, Speciality, Game, Orange, Yellow, Green, Gray)
	end

	-- Brown Linen Vest -- 2385
	AddRecipe(2385,10,2568,1,GAME_ORIG,10,45,57,70)
	self:addTradeFlags(RecipeDB,2385,1,2,3,36,41,56)
	self:addTradeAcquire(RecipeDB,2385,1,1103,1,1346,1,2399,1,2627,1,3004
	,1,3363,1,3484,1,3523,1,3704,1,4159,1,4193,1,4576,1,5153,1,
	11052,1,11557,1,16366,1,16640,1,16729,1,17487,1,18749,1,18772,1,28699,
	1,33580,1,27001,1,33613,1,33636,1,26914,1,26969,1,26964,1,33684)

	-- Linen Boots -- 2386
	AddRecipe(2386,65,2569,1,GAME_ORIG,65,90,107,125)
	self:addTradeFlags(RecipeDB,2386,1,2,3,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,2386,1,1103,1,1346,1,2399,1,2627,1,
	3004,1,3363,1,3484,1,3523,1,3704,1,4159,1,4193,1,4576,1,5153,1
	,11052,1,11557,1,16366,1,16640,1,16729,1,17487,1,18749,1,18772,1,
	28699,1,33580,1,27001,1,33613,1,33636,1,26914,1,26969,1,26964,1,33684)

	-- Linen Cloak -- 2387
	AddRecipe(2387,1,2570,1,GAME_ORIG,1,35,47,60)
	self:addTradeFlags(RecipeDB,2387,1,2,3,36,41,60)
	self:addTradeAcquire(RecipeDB,2387,8,8)

	-- Red Linen Robe -- 2389
	AddRecipe(2389,40,2572,2,GAME_ORIG,40,65,82,100)
	self:addTradeFlags(RecipeDB,2389,1,2,10,36,40,56)
	self:addTradeAcquire(RecipeDB,2389,7,2)

	-- Red Linen Shirt -- 2392
	AddRecipe(2392,40,2575,1,GAME_ORIG,40,65,82,100)
	self:addTradeFlags(RecipeDB,2392,1,2,3,36,41)
	self:addTradeAcquire(RecipeDB,2392,1,1103,1,1346,1,2399,1,2627,1,
	3004,1,3363,1,3484,1,3523,1,3704,1,4159,1,4193,1,4576,1,5153,1
	,11052,1,11557,1,16366,1,16640,1,16729,1,17487,1,18749,1,18772,1,
	28699,1,33580,1,27001,1,33613,1,33636,1,26914,1,26969,1,26964,1,33684)

	-- White Linen Shirt -- 2393
	AddRecipe(2393,1,2576,1,GAME_ORIG,1,35,47,60)
	self:addTradeFlags(RecipeDB,2393,1,2,3,36,41)
	self:addTradeAcquire(RecipeDB,2393,1,1103,1,1346,1,2399,1,2627,1,
	3004,1,3363,1,3484,1,3523,1,3704,1,4159,1,4193,1,4576,1,5153,1
	,11052,1,11557,1,16366,1,16640,1,16729,1,17487,1,18749,1,18772,1,
	28699,1,33580,1,27001,1,33613,1,33636,1,26914,1,26969,1,26964,1,33684)

	-- Blue Linen Shirt -- 2394
	AddRecipe(2394,40,2577,1,GAME_ORIG,40,65,82,100)
	self:addTradeFlags(RecipeDB,2394,1,2,3,36,41)
	self:addTradeAcquire(RecipeDB,2394,1,1103,1,1346,1,2399,1,2627,1,
	3004,1,3363,1,3484,1,3523,1,3704,1,4159,1,4193,1,4576,1,5153,1
	,11052,1,11557,1,16366,1,16640,1,16729,1,17487,1,18749,1,18772,1,
	28699,1,33580,1,27001,1,33613,1,33636,1,26914,1,26969,1,26964,1,33684)

	-- Barbaric Linen Vest -- 2395
	AddRecipe(2395,70,2578,1,GAME_ORIG,70,95,112,130)
	self:addTradeFlags(RecipeDB,2395,1,2,3,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,2395,1,1103,1,1346,1,2399,1,2627,1,
	3004,1,3363,1,3484,1,3523,1,3704,1,4159,1,4193,1,4576,1,5153,1
	,11052,1,11557,1,16366,1,16640,1,16729,1,17487,1,18749,1,18772,1,
	28699,1,33580,1,27001,1,33613,1,33636,1,26914,1,26969,1,26964,1,33684)

	-- Green Linen Shirt -- 2396
	AddRecipe(2396,70,2579,1,GAME_ORIG,70,95,112,130)
	self:addTradeFlags(RecipeDB,2396,1,2,3,36,41)
	self:addTradeAcquire(RecipeDB,2396,1,1103,1,1346,1,2399,1,2627,1,
	3004,1,3363,1,3484,1,3523,1,3704,1,4159,1,4193,1,4576,1,5153,1
	,11052,1,11557,1,16366,1,16640,1,16729,1,17487,1,18749,1,18772,1,
	28699,1,33580,1,27001,1,33613,1,33636,1,26914,1,26969,1,26964,1,33684)

	-- Reinforced Linen Cape -- 2397
	AddRecipe(2397,60,2580,1,GAME_ORIG,60,85,102,120)
	self:addTradeFlags(RecipeDB,2397,1,2,3,36,41,60)
	self:addTradeAcquire(RecipeDB,2397,1,1103,1,1346,1,2399,1,2627,1,
	3004,1,3363,1,3484,1,3523,1,3704,1,4159,1,4193,1,4576,1,5153,1
	,11052,1,11557,1,16366,1,16640,1,16729,1,17487,1,18749,1,18772,1,
	28699,1,33580,1,27001,1,33613,1,33636,1,26914,1,26969,1,26964,1,33684)

	-- Green Woolen Vest -- 2399
	AddRecipe(2399,85,2582,1,GAME_ORIG,85,110,127,145)
	self:addTradeFlags(RecipeDB,2399,1,2,3,36,41,56)
	self:addTradeAcquire(RecipeDB,2399,1,1346,1,2399,1,2627,1,3004,1,3363,1,3704,1,4159,1,
	4576,1,5153,1,11052,1,11557,1,16640,1,16729,1,17487,1,18749,1,18772,1,28699,1,
	3484,1,33580,1,1103,1,27001,1,33613,1,33636,1,26914,1,16366,1,26969,1,4193,1,26964,1,3523,1,33684)

	-- Woolen Boots -- 2401
	AddRecipe(2401,95,2583,1,GAME_ORIG,95,120,137,155)
	self:addTradeFlags(RecipeDB,2401,1,2,3,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,2401,1,1346,1,2399,1,2627,1,3004,1,3363,1,3704,1,4159,1,
	4576,1,5153,1,11052,1,11557,1,16640,1,16729,1,17487,1,18749,1,18772,1,28699,1,
	3484,1,33580,1,1103,1,27001,1,33613,1,33636,1,26914,1,16366,1,26969,1,4193,1,26964,1,3523,1,33684)

	-- Woolen Cape -- 2402
	AddRecipe(2402,75,2584,1,GAME_ORIG,75,100,117,135)
	self:addTradeFlags(RecipeDB,2402,1,2,3,36,41,60)
	self:addTradeAcquire(RecipeDB,2402,1,1103,1,1346,1,2399,1,2627,1,
	3004,1,3363,1,3484,1,3523,1,3704,1,4159,1,4193,1,4576,1,5153,1
	,11052,1,11557,1,16366,1,16640,1,16729,1,17487,1,18749,1,18772,1,
	28699,1,33580,1,27001,1,33613,1,33636,1,26914,1,26969,1,26964,1,33684)

	-- Gray Woolen Robe -- 2403
	AddRecipe(2403,105,2585,2,GAME_ORIG,105,130,147,165)
	self:addTradeFlags(RecipeDB,2403,1,2,10,36,40,56)
	self:addTradeAcquire(RecipeDB,2403,7,2)

	-- Gray Woolen Shirt -- 2406
	AddRecipe(2406,100,2587,1,GAME_ORIG,100,110,120,130)
	self:addTradeFlags(RecipeDB,2406,1,2,3,36,41)
	self:addTradeAcquire(RecipeDB,2406,1,1346,1,2399,1,2627,1,3004,1,3363,1,3704,1,4159,1,
	4576,1,5153,1,11052,1,11557,1,16640,1,16729,1,17487,1,18749,1,18772,1,28699,1,
	3484,1,33580,1,1103,1,27001,1,33613,1,33636,1,26914,1,16366,1,26969,1,4193,1,26964,1,3523,1,33684)

	-- Bolt of Linen Cloth -- 2963
	AddRecipe(2963,1,2996,1,GAME_ORIG,1,25,37,50)
	self:addTradeFlags(RecipeDB,2963,1,2,3,36,41,56)
	self:addTradeAcquire(RecipeDB,2963,8,8)

	-- Bolt of Woolen Cloth -- 2964
	AddRecipe(2964,75,2997,1,GAME_ORIG,75,90,97,105)
	self:addTradeFlags(RecipeDB,2964,1,2,3,36,41,56)
	self:addTradeAcquire(RecipeDB,2964,1,1103,1,1346,1,2399,1,2627,1,
	3004,1,3363,1,3484,1,3523,1,3704,1,4159,1,4193,1,4576,1,5153,1
	,11052,1,11557,1,16366,1,16640,1,16729,1,17487,1,18749,1,18772,1,
	28699,1,33580,1,27001,1,33613,1,33636,1,26914,1,26969,1,26964,1,33684)

	-- Linen Bag -- 3755
	AddRecipe(3755,45,4238,1,GAME_ORIG,45,70,87,105)
	self:addTradeFlags(RecipeDB,3755,1,2,3,36,41)
	self:addTradeAcquire(RecipeDB,3755,1,1103,1,1346,1,2399,1,2627,1,
	3004,1,3363,1,3484,1,3523,1,4159,1,4193,1,4576,1,5153,
	1,11052,1,11557,1,16366,1,16640,1,16729,1,17487,1,18749,1,18772,1,28699,1,
	3704,1,33580,1,27001,1,33613,1,33636,1,26914,1,26969,1,26964,1,33684)

	-- Woolen Bag -- 3757
	AddRecipe(3757,80,4240,1,GAME_ORIG,80,105,122,140)
	self:addTradeFlags(RecipeDB,3757,1,2,3,36,41)
	self:addTradeAcquire(RecipeDB,3757,1,1346,1,2399,1,2627,1,3004,1,3363,1,3704,1,4159,1,
	4576,1,5153,1,11052,1,11557,1,16640,1,16729,1,17487,1,18749,1,18772,1,28699,1,
	3484,1,33580,1,1103,1,27001,1,33613,1,33636,1,26914,1,16366,1,26969,1,4193,1,26964,1,3523,1,33684)

	-- Green Woolen Bag -- 3758
	AddRecipe(3758,95,4241,2,GAME_ORIG,95,120,137,155)
	self:addTradeFlags(RecipeDB,3758,1,2,10,36,40)
	self:addTradeAcquire(RecipeDB,3758,7,2)

	-- Small Silk Pack -- 3813
	AddRecipe(3813,150,4245,1,GAME_ORIG,150,170,185,200)
	self:addTradeFlags(RecipeDB,3813,1,2,3,36,41)
	self:addTradeAcquire(RecipeDB,3813,1,1346,1,2399,1,2627,1,3004,1,3363,1,3704,1,4159,1,
	4576,1,5153,1,11052,1,11557,1,16640,1,16729,1,17487,1,18749,1,18772,1,28699,1,
	3484,1,33580,1,1103,1,27001,1,33613,1,33636,1,26914,1,16366,1,26969,1,4193,1,26964,1,3523,1,33684)

	-- Bolt of Silk Cloth -- 3839
	AddRecipe(3839,125,4305,1,GAME_ORIG,125,135,140,145)
	self:addTradeFlags(RecipeDB,3839,1,2,3,36,41,56)
	self:addTradeAcquire(RecipeDB,3839,1,1346,1,3004,1,3363,1,4576,1,5153,1,
	11557,1,16640,1,16729,1,17487,1,18749,1,18772,1,28699,1,4159,1,3484,1,3704,1,2627,1,33580,1,
	1103,1,27001,1,33613,1,33636,1,11052,1,2399,1,26914,1,16366,1,26969,1,4193,1,26964,1,3523,1,33684)

	-- Heavy Linen Gloves -- 3840
	AddRecipe(3840,35,4307,1,GAME_ORIG,35,60,77,95)
	self:addTradeFlags(RecipeDB,3840,1,2,3,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,3840,1,1103,1,1346,1,2399,1,2627,1,
	3004,1,3363,1,3484,1,3523,1,3704,1,4159,1,4193,1,4576,1,5153,1
	,11052,1,11557,1,16366,1,16640,1,16729,1,17487,1,18749,1,18772,1,
	28699,1,33580,1,27001,1,33613,1,33636,1,26914,1,26969,1,26964,1,33684)

	-- Green Linen Bracers -- 3841
	AddRecipe(3841,60,4308,1,GAME_ORIG,60,85,102,120)
	self:addTradeFlags(RecipeDB,3841,1,2,3,36,41,56)
	self:addTradeAcquire(RecipeDB,3841,1,1103,1,1346,1,2399,1,2627,1,
	3004,1,3363,1,3484,1,3523,1,3704,1,4159,1,4193,1,4576,1,5153,1
	,11052,1,11557,1,16366,1,16640,1,16729,1,17487,1,18749,1,18772,1,
	28699,1,33580,1,27001,1,33613,1,33636,1,26914,1,26969,1,26964,1,33684)

	-- Handstitched Linen Britches -- 3842
	AddRecipe(3842,70,4309,1,GAME_ORIG,70,95,112,130)
	self:addTradeFlags(RecipeDB,3842,1,2,3,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,3842,1,1103,1,1346,1,2399,1,2627,1,
	3004,1,3363,1,3484,1,3523,1,3704,1,4159,1,4193,1,4576,1,5153,1
	,11052,1,11557,1,16366,1,16640,1,16729,1,17487,1,18749,1,18772,1,
	28699,1,33580,1,27001,1,33613,1,33636,1,26914,1,26969,1,26964,1,33684)

	-- Heavy Woolen Gloves -- 3843
	AddRecipe(3843,85,4310,1,GAME_ORIG,85,110,127,145)
	self:addTradeFlags(RecipeDB,3843,1,2,3,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,3843,1,1346,1,2399,1,2627,1,3004,1,3363,1,3704,1,4159,1,
	4576,1,5153,1,11052,1,11557,1,16640,1,16729,1,17487,1,18749,1,18772,1,28699,1,
	3484,1,33580,1,1103,1,27001,1,33613,1,33636,1,26914,1,16366,1,26969,1,4193,1,26964,1,3523,1,33684)

	-- Heavy Woolen Cloak -- 3844
	AddRecipe(3844,100,4311,2,GAME_ORIG,100,125,142,160)
	self:addTradeFlags(RecipeDB,3844,1,2,10,36,40,53,54,60)
	self:addTradeAcquire(RecipeDB,3844,7,2)

	-- Soft-soled Linen Boots -- 3845
	AddRecipe(3845,80,4312,1,GAME_ORIG,80,105,122,140)
	self:addTradeFlags(RecipeDB,3845,1,2,3,36,41,56)
	self:addTradeAcquire(RecipeDB,3845,1,1346,1,2399,1,2627,1,3004,1,3363,1,3704,1,4159,1,
	4576,1,5153,1,11052,1,11557,1,16640,1,16729,1,17487,1,18749,1,18772,1,28699,1,
	3484,1,33580,1,1103,1,27001,1,33613,1,33636,1,26914,1,16366,1,26969,1,4193,1,26964,1,3523,1,33684)

	-- Red Woolen Boots -- 3847
	AddRecipe(3847,95,4313,2,GAME_ORIG,95,120,137,155)
	self:addTradeFlags(RecipeDB,3847,1,2,10,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,3847,7,2)

	-- Double-stitched Woolen Shoulders -- 3848
	AddRecipe(3848,110,4314,1,GAME_ORIG,110,135,152,170)
	self:addTradeFlags(RecipeDB,3848,1,2,3,36,41,56)
	self:addTradeAcquire(RecipeDB,3848,1,1346,1,2399,1,2627,1,3004,1,3363,1,3704,1,4159,1,
	4576,1,5153,1,11052,1,11557,1,16640,1,16729,1,17487,1,18749,1,18772,1,28699,1,
	3484,1,33580,1,1103,1,27001,1,33613,1,33636,1,26914,1,16366,1,26969,1,4193,1,26964,1,3523,1,33684)

	-- Reinforced Woolen Shoulders -- 3849
	AddRecipe(3849,120,4315,2,GAME_ORIG,120,145,162,180)
	self:addTradeFlags(RecipeDB,3849,1,2,10,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,3849,7,2)

	-- Heavy Woolen Pants -- 3850
	AddRecipe(3850,110,4316,1,GAME_ORIG,110,135,152,170)
	self:addTradeFlags(RecipeDB,3850,1,2,3,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,3850,1,1346,1,2399,1,2627,1,3004,1,3363,1,3704,1,4159,1,
	4576,1,5153,1,11052,1,11557,1,16640,1,16729,1,17487,1,18749,1,18772,1,28699,1,
	3484,1,33580,1,1103,1,27001,1,33613,1,33636,1,26914,1,16366,1,26969,1,4193,1,26964,1,3523,1,33684)

	-- Phoenix Pants -- 3851
	AddRecipe(3851,125,4317,2,GAME_ORIG,125,150,167,185)
	self:addTradeFlags(RecipeDB,3851,1,2,10,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,3851,7,2)

	-- Gloves of Meditation -- 3852
	AddRecipe(3852,130,4318,1,GAME_ORIG,130,150,165,180)
	self:addTradeFlags(RecipeDB,3852,1,2,3,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,3852,1,1346,1,2399,1,2627,1,3004,1,3363,1,3704,1,4159,1,
	4576,1,5153,1,11052,1,11557,1,16640,1,16729,1,17487,1,18749,1,18772,1,28699,1,
	3484,1,33580,1,1103,1,27001,1,33613,1,33636,1,26914,1,16366,1,26969,1,4193,1,26964,1,3523,1,33684)

	-- Azure Silk Gloves -- 3854
	AddRecipe(3854,145,4319,1,GAME_ORIG,145,165,180,195)
	self:addTradeFlags(RecipeDB,3854,1,2,4,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,3854,2,2679,2,9636)

	-- Spidersilk Boots -- 3855
	AddRecipe(3855,125,4320,1,GAME_ORIG,125,150,167,185)
	self:addTradeFlags(RecipeDB,3855,1,2,3,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,3855,1,1346,1,2399,1,2627,1,3004,1,3363,1,3704,1,4159,1,
	4576,1,5153,1,11052,1,11557,1,16640,1,16729,1,17487,1,18749,1,18772,1,28699,1,
	3484,1,33580,1,1103,1,27001,1,33613,1,33636,1,26914,1,16366,1,26969,1,4193,1,26964,1,3523,1,33684)

	-- Spider Silk Slippers -- 3856
	AddRecipe(3856,140,4321,2,GAME_ORIG,140,160,175,190)
	self:addTradeFlags(RecipeDB,3856,1,2,10,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,3856,7,2)

	-- Enchanter's Cowl -- 3857
	AddRecipe(3857,165,4322,1,GAME_ORIG,165,185,200,215)
	self:addTradeFlags(RecipeDB,3857,1,2,4,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,3857,2,2670)

	-- Shadow Hood -- 3858
	AddRecipe(3858,170,4323,2,GAME_ORIG,170,190,205,220)
	self:addTradeFlags(RecipeDB,3858,1,2,10,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,3858,7,2)

	-- Azure Silk Vest -- 3859
	AddRecipe(3859,150,4324,1,GAME_ORIG,150,170,185,200)
	self:addTradeFlags(RecipeDB,3859,1,2,3,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,3859,1,1346,1,2399,1,2627,1,3004,1,3363,1,3704,1,4159,1,
	4576,1,5153,1,11052,1,11557,1,16640,1,16729,1,17487,1,18749,1,18772,1,28699,1,
	3484,1,33580,1,1103,1,27001,1,33613,1,33636,1,26914,1,16366,1,26969,1,4193,1,26964,1,3523,1,33684)

	-- Boots of the Enchanter -- 3860
	AddRecipe(3860,175,4325,2,GAME_ORIG,175,195,210,225)
	self:addTradeFlags(RecipeDB,3860,1,2,10,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,3860,7,2)

	-- Long Silken Cloak -- 3861
	AddRecipe(3861,185,4326,1,GAME_ORIG,185,205,220,235)
	self:addTradeFlags(RecipeDB,3861,1,2,3,36,41,53,54,60)
	self:addTradeAcquire(RecipeDB,3861,1,1346,1,2399,1,4576,1,11052,1,11557,1,18749,1,18772,1
	,28699,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,
	33636,1,26914,1,17487,1,16640,1,16366,1,26969,1,5153,1,4193,1,26964,1,3523,1,33684)

	-- Icy Cloak -- 3862
	AddRecipe(3862,200,4327,1,GAME_ORIG,200,220,235,250)
	self:addTradeFlags(RecipeDB,3862,1,4,36,40,53,54,60)
	self:addTradeAcquire(RecipeDB,3862,2,2381)

	-- Spider Belt -- 3863
	AddRecipe(3863,180,4328,2,GAME_ORIG,180,200,215,230)
	self:addTradeFlags(RecipeDB,3863,1,2,10,36,40,56)
	self:addTradeAcquire(RecipeDB,3863,7,2)

	-- Star Belt -- 3864
	AddRecipe(3864,200,4329,2,GAME_ORIG,200,220,235,250)
	self:addTradeFlags(RecipeDB,3864,1,2,10,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,3864,7,2)

	-- Bolt of Mageweave -- 3865
	AddRecipe(3865,175,4339,1,GAME_ORIG,175,180,182,185)
	self:addTradeFlags(RecipeDB,3865,1,2,3,36,41)
	self:addTradeAcquire(RecipeDB,3865,1,1346,1,2399,1,4576,1,11052,1,11557,1,18749,1,18772,1
	,28699,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,
	33636,1,26914,1,17487,1,16640,1,16366,1,26969,1,5153,1,4193,1,26964,1,3523,1,33684)

	-- Stylish Red Shirt -- 3866
	AddRecipe(3866,110,4330,1,GAME_ORIG,110,135,152,170)
	self:addTradeFlags(RecipeDB,3866,1,2,3,36,41)
	self:addTradeAcquire(RecipeDB,3866,1,1346,1,2399,1,2627,1,3004,1,3363,1,3704,1,4159,1,
	4576,1,5153,1,11052,1,11557,1,16640,1,16729,1,17487,1,18749,1,18772,1,28699,1,
	3484,1,33580,1,1103,1,27001,1,33613,1,33636,1,26914,1,16366,1,26969,1,4193,1,26964,1,3523,1,33684)

	-- Phoenix Gloves -- 3868
	AddRecipe(3868,125,4331,2,GAME_ORIG,125,150,167,185)
	self:addTradeFlags(RecipeDB,3868,1,2,10,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,3868,7,2)

	-- Bright Yellow Shirt -- 3869
	AddRecipe(3869,135,4332,1,GAME_ORIG,135,145,150,155)
	self:addTradeFlags(RecipeDB,3869,1,4,36,40)
	self:addTradeAcquire(RecipeDB,3869,2,2668)

	-- Dark Silk Shirt -- 3870
	AddRecipe(3870,155,4333,1,GAME_ORIG,155,165,170,175)
	self:addTradeFlags(RecipeDB,3870,1,2,4,36,40)
	self:addTradeAcquire(RecipeDB,3870,2,2394,2,2669)

	-- Formal White Shirt -- 3871
	AddRecipe(3871,170,4334,1,GAME_ORIG,170,180,185,190)
	self:addTradeFlags(RecipeDB,3871,1,2,3,36,41)
	self:addTradeAcquire(RecipeDB,3871,1,1346,1,2399,1,4576,1,11052,1,11557,1,18749,1,18772,1
	,28699,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,
	33636,1,26914,1,17487,1,16640,1,16366,1,26969,1,5153,1,4193,1,26964,1,3523,1,33684)

    -- Rich Purple Silk Shirt -- 3872
	AddRecipe(3872,185,4335,3,GAME_ORIG,185,195,200,205)
	self:addTradeFlags(RecipeDB,3872,1,2,10,36,40)
	self:addTradeAcquire(RecipeDB,3872,7,2)

	-- Black Swashbuckler's Shirt -- 3873
	AddRecipe(3873,200,4336,1,GAME_ORIG,200,210,215,220)
	self:addTradeFlags(RecipeDB,3873,1,2,4,36,41)
	self:addTradeAcquire(RecipeDB,3873,2,2663)

	-- Brown Linen Pants -- 3914
	AddRecipe(3914,30,4343,1,GAME_ORIG,30,55,72,90)
	self:addTradeFlags(RecipeDB,3914,1,2,3,36,41,56)
	self:addTradeAcquire(RecipeDB,3914,1,1103,1,1346,1,2399,1,2627,1,
	3004,1,3363,1,3484,1,3523,1,3704,1,4159,1,4193,1,4576,1,5153,1
	,11052,1,11557,1,16366,1,16640,1,16729,1,17487,1,18749,1,18772,1,
	28699,1,33580,1,27001,1,33613,1,33636,1,26914,1,26969,1,26964,1,33684)

	-- Brown Linen Shirt -- 3915
	AddRecipe(3915,1,4344,1,GAME_ORIG,1,35,47,60)
	self:addTradeFlags(RecipeDB,3915,1,2,3,36,41)
	self:addTradeAcquire(RecipeDB,3915,8,8)

	-- Pearl-clasped Cloak -- 6521
	AddRecipe(6521,90,5542,1,GAME_ORIG,90,115,132,150)
	self:addTradeFlags(RecipeDB,6521,1,2,3,36,41,60)
	self:addTradeAcquire(RecipeDB,6521,1,1346,1,2399,1,2627,1,3004,1,3363,1,3704,1,4159,1,
	4576,1,5153,1,11052,1,11557,1,16640,1,16729,1,17487,1,18749,1,18772,1,28699,1,
	3484,1,33580,1,1103,1,27001,1,33613,1,33636,1,26914,1,16366,1,26969,1,4193,1,26964,1,3523,1,33684)

	-- Red Linen Bag -- 6686
	AddRecipe(6686,70,5762,1,GAME_ORIG,70,95,112,130)
	self:addTradeFlags(RecipeDB,6686,1,2,4,5,11,36,40)
	self:addTradeAcquire(RecipeDB,6686,3,590,3,3530,3,3531,2,843,2,3005,2,4189,2,16224,2,3556)

	-- Red Woolen Bag -- 6688
	AddRecipe(6688,115,5763,1,GAME_ORIG,115,140,157,175)
	self:addTradeFlags(RecipeDB,6688,1,2,4,5,11,36,40)
	self:addTradeAcquire(RecipeDB,6688,3,450,3,2264,2,777,2,1454,2,1474,2,3005,2,3364,2,3485,
	2,3537,2,3683,2,4189,2,4577,2,5944)

	-- Lesser Wizard's Robe -- 6690
	AddRecipe(6690,135,5766,1,GAME_ORIG,135,155,170,185)
	self:addTradeFlags(RecipeDB,6690,1,2,3,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,6690,1,1346,1,2399,1,2627,1,3004,1,3363,1,3704,1,4159,1,
	4576,1,5153,1,11052,1,11557,1,16640,1,16729,1,17487,1,18749,1,18772,1,28699,1,
	3484,1,33580,1,1103,1,27001,1,33613,1,33636,1,26914,1,16366,1,26969,1,4193,1,26964,1,3523,1,33684)

	-- Robes of Arcana -- 6692
	AddRecipe(6692,150,5770,2,GAME_ORIG,150,170,185,200)
	self:addTradeFlags(RecipeDB,6692,1,2,11,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,6692,3,910,3,2337,3,10760)

	-- Green Silk Pack -- 6693
	AddRecipe(6693,175,5764,2,GAME_ORIG,175,195,210,225)
	self:addTradeFlags(RecipeDB,6693,1,2,10,36,40)
	self:addTradeAcquire(RecipeDB,6693,7,2)

	-- Black Silk Pack -- 6695
	AddRecipe(6695,185,5765,2,GAME_ORIG,185,205,220,235)
	self:addTradeFlags(RecipeDB,6695,1,2,11,36,40)
	self:addTradeAcquire(RecipeDB,6695,3,2242,3,2434,3,4834)

	-- Brown Linen Robe -- 7623
	AddRecipe(7623,30,6238,1,GAME_ORIG,30,55,72,90)
	self:addTradeFlags(RecipeDB,7623,1,2,3,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,7623,1,1103,1,1346,1,2399,1,2627,1,
	3004,1,3363,1,3484,1,3523,1,3704,1,4159,1,4193,1,4576,1,5153,1
	,11052,1,11557,1,16366,1,16640,1,16729,1,17487,1,18749,1,18772,1,
	28699,1,33580,1,27001,1,33613,1,33636,1,26914,1,26969,1,26964,1,33684)

	-- White Linen Robe -- 7624
	AddRecipe(7624,30,6241,1,GAME_ORIG,30,55,72,90)
	self:addTradeFlags(RecipeDB,7624,1,2,3,36,41,56)
	self:addTradeAcquire(RecipeDB,7624,1,1103,1,1346,1,2399,1,2627,1,
	3004,1,3363,1,3484,1,3523,1,3704,1,4159,1,4193,1,4576,1,5153,1
	,11052,1,11557,1,16366,1,16640,1,16729,1,17487,1,18749,1,18772,1,
	28699,1,33580,1,27001,1,33613,1,33636,1,26914,1,26969,1,26964,1,33684)

	-- Red Linen Vest -- 7629
	AddRecipe(7629,55,6239,2,GAME_ORIG,55,80,97,115)
	self:addTradeFlags(RecipeDB,7629,1,2,10,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,7629,7,2)

	-- Blue Linen Vest -- 7630
	AddRecipe(7630,55,6240,1,GAME_ORIG,55,80,97,115)
	self:addTradeFlags(RecipeDB,7630,1,2,4,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,7630,2,66,2,3364,2,3485,2,3522,2,4189)

	-- Blue Linen Robe -- 7633
	AddRecipe(7633,70,6242,1,GAME_ORIG,70,95,112,130)
	self:addTradeFlags(RecipeDB,7633,1,2,4,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,7633,2,1250,2,3485,2,4168,2,3499,2,3556)

	-- Blue Overalls -- 7639
	AddRecipe(7639,100,6263,1,GAME_ORIG,100,125,142,160)
	self:addTradeFlags(RecipeDB,7639,1,2,4,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,7639,2,843,2,1347,2,2394,2,3364,2,5944)

	-- Greater Adept's Robe -- 7643
	AddRecipe(7643,115,6264,1,GAME_ORIG,115,140,157,175)
	self:addTradeFlags(RecipeDB,7643,1,4,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,7643,2,1454,2,1474,2,4168,2,2669,2,3499,2,4577)

	-- Stylish Blue Shirt -- 7892
	AddRecipe(7892,120,6384,2,GAME_ORIG,120,145,162,180)
	self:addTradeFlags(RecipeDB,7892,1,2,10,36,40)
	self:addTradeAcquire(RecipeDB,7892,7,2)

	-- Stylish Green Shirt -- 7893
	AddRecipe(7893,120,6385,2,GAME_ORIG,120,145,162,180)
	self:addTradeFlags(RecipeDB,7893,1,2,10,36,40)
	self:addTradeAcquire(RecipeDB,7893,7,2)

	-- Simple Dress -- 8465
	AddRecipe(8465,40,6786,1,GAME_ORIG,40,65,82,100)
	self:addTradeFlags(RecipeDB,8465,1,2,3,36,41)
	self:addTradeAcquire(RecipeDB,8465,1,1103,1,1346,1,2399,1,2627,1,
	3004,1,3363,1,3484,1,3523,1,3704,1,4159,1,4193,1,4576,1,5153,1
	,11052,1,11557,1,16366,1,16640,1,16729,1,17487,1,18749,1,18772,1,
	28699,1,33580,1,27001,1,33613,1,33636,1,26914,1,26969,1,26964,1,33684)

	-- White Woolen Dress -- 8467
	AddRecipe(8467,110,6787,1,GAME_ORIG,110,135,152,170)
	self:addTradeFlags(RecipeDB,8467,1,2,3,36,41)
	self:addTradeAcquire(RecipeDB,8467,1,1346,1,2399,1,2627,1,3004,1,3363,1,3704,1,4159,1,
	4576,1,5153,1,11052,1,11557,1,16640,1,16729,1,17487,1,18749,1,18772,1,28699,1,
	3484,1,33580,1,1103,1,27001,1,33613,1,33636,1,26914,1,16366,1,26969,1,4193,1,26964,1,3523,1,33684)

	-- White Swashbuckler's Shirt -- 8483
	AddRecipe(8483,160,6795,1,GAME_ORIG,160,170,175,180)
	self:addTradeFlags(RecipeDB,8483,1,2,3,36,41)
	self:addTradeAcquire(RecipeDB,8483,1,1346,1,2399,1,4576,1,11052,1,11557,1,18749,1,18772,1
	,28699,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,
	33636,1,26914,1,17487,1,16640,1,16366,1,26969,1,5153,1,4193,1,26964,1,3523,1,33684)

	-- Red Swashbuckler's Shirt -- 8489
	AddRecipe(8489,175,6796,1,GAME_ORIG,175,185,190,195)
	self:addTradeFlags(RecipeDB,8489,1,2,3,36,41)
	self:addTradeAcquire(RecipeDB,8489,1,1346,1,2399,1,4576,1,11052,1,11557,1,18749,1,18772,1
	,28699,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,
	33636,1,26914,1,17487,1,16640,1,16366,1,26969,1,5153,1,4193,1,26964,1,3523,1,33684)

	-- Azure Silk Pants -- 8758
	AddRecipe(8758,140,7046,1,GAME_ORIG,140,160,175,190)
	self:addTradeFlags(RecipeDB,8758,1,2,3,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,8758,1,1346,1,2399,1,2627,1,3004,1,3363,1,3704,1,4159,1,
	4576,1,5153,1,11052,1,11557,1,16640,1,16729,1,17487,1,18749,1,18772,1,28699,1,
	3484,1,33580,1,1103,1,27001,1,33613,1,33636,1,26914,1,16366,1,26969,1,4193,1,26964,1,3523,1,33684)

	-- Azure Silk Hood -- 8760
	AddRecipe(8760,145,7048,1,GAME_ORIG,145,155,160,165)
	self:addTradeFlags(RecipeDB,8760,1,2,3,36,41,56)
	self:addTradeAcquire(RecipeDB,8760,1,1346,1,2399,1,2627,1,3004,1,3363,1,3704,1,4159,1,
	4576,1,5153,1,11052,1,11557,1,16640,1,16729,1,17487,1,18749,1,18772,1,28699,1,
	3484,1,33580,1,1103,1,27001,1,33613,1,33636,1,26914,1,16366,1,26969,1,4193,1,26964,1,3523,1,33684)

	-- Silk Headband -- 8762
	AddRecipe(8762,160,7050,1,GAME_ORIG,160,170,175,180)
	self:addTradeFlags(RecipeDB,8762,1,2,3,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,8762,1,1346,1,2399,1,4576,1,11052,1,11557,1,18749,1,18772,1
	,28699,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,
	33636,1,26914,1,17487,1,16640,1,16366,1,26969,1,5153,1,4193,1,26964,1,3523,1,33684)

	-- Earthen Vest -- 8764
	AddRecipe(8764,170,7051,1,GAME_ORIG,170,190,205,220)
	self:addTradeFlags(RecipeDB,8764,1,2,3,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,8764,1,1346,1,2399,1,4576,1,11052,1,11557,1,18749,1,18772,1
	,28699,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,
	33636,1,26914,1,17487,1,16640,1,16366,1,26969,1,5153,1,4193,1,26964,1,3523,1,33684)

	-- Azure Silk Belt -- 8766
	AddRecipe(8766,175,7052,1,GAME_ORIG,175,195,210,225)
	self:addTradeFlags(RecipeDB,8766,1,2,3,36,41,56)
	self:addTradeAcquire(RecipeDB,8766,1,1346,1,2399,1,4576,1,11052,1,11557,1,18749,1,18772,1
	,28699,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636,1,
	4159,1,26914,1,17487,1,16640,1,16366,1,26969,1,5153,1,4193,1,26964,1,3523,1,33684)

	-- Robe of Power -- 8770
	AddRecipe(8770,190,7054,1,GAME_ORIG,190,210,225,240)
	self:addTradeFlags(RecipeDB,8770,1,2,3,37,41,53,54,56)
	self:addTradeAcquire(RecipeDB,8770,1,1346,1,2399,1,4576,1,11052,1,11557,1,18749,1,18772,1
	,28699,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636,1,
	4159,1,26914,1,17487,1,16640,1,16366,1,26969,1,5153,1,4193,1,26964,1,3523,1,33684)

	-- Crimson Silk Belt -- 8772
	AddRecipe(8772,175,7055,1,GAME_ORIG,175,195,210,225)
	self:addTradeFlags(RecipeDB,8772,1,2,3,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,8772,1,1346,1,2399,1,4576,1,11052,1,11557,1,18749,1,18772,1
	,28699,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,
	33636,1,26914,1,17487,1,16640,1,16366,1,26969,1,5153,1,4193,1,26964,1,33684)

	-- Green Silken Shoulders -- 8774
	AddRecipe(8774,180,7057,1,GAME_ORIG,180,200,215,230)
	self:addTradeFlags(RecipeDB,8774,1,2,3,36,41,56)
	self:addTradeAcquire(RecipeDB,8774,1,1346,1,2399,1,4576,1,11052,1,11557,1,18749,1,18772,1
	,28699,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636,1,
	4159,1,26914,1,17487,1,16640,1,16366,1,26969,1,5153,1,4193,1,26964,1,3523,1,33684)

	-- Linen Belt -- 8776
	AddRecipe(8776,15,7026,1,GAME_ORIG,15,50,67,85)
	self:addTradeFlags(RecipeDB,8776,1,2,3,36,40,56)
	self:addTradeAcquire(RecipeDB,8776,1,1103,1,1346,1,2399,1,2627,1,
	3004,1,3363,1,3484,1,3523,1,3704,1,4159,1,4193,1,4576,1,5153,1
	,11052,1,11557,1,16366,1,16640,1,16729,1,17487,1,18749,1,18772,1,
	28699,1,33580,1,27001,1,33613,1,33636,1,26914,1,26969,1,26964,1,33684)

	-- Hands of Darkness -- 8780
	AddRecipe(8780,145,7047,2,GAME_ORIG,145,165,180,195)
	self:addTradeFlags(RecipeDB,8780,1,2,10,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,8780,7,2)

	-- Truefaith Gloves -- 8782
	AddRecipe(8782,150,7049,2,GAME_ORIG,150,170,185,200)
	self:addTradeFlags(RecipeDB,8782,1,2,10,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,8782,7,2)

	-- Green Silk Armor -- 8784
	AddRecipe(8784,165,7065,2,GAME_ORIG,165,185,200,215)
	self:addTradeFlags(RecipeDB,8784,1,2,10,36,40,56)
	self:addTradeAcquire(RecipeDB,8784,7,2)

	-- Azure Silk Cloak -- 8786
	AddRecipe(8786,175,7053,1,GAME_ORIG,175,195,210,225)
	self:addTradeFlags(RecipeDB,8786,1,2,4,36,41,53,54,60)
	self:addTradeAcquire(RecipeDB,8786,2,6574,2,6576)

	-- Crimson Silk Cloak -- 8789
	AddRecipe(8789,180,7056,1,GAME_ORIG,180,200,215,230)
	self:addTradeFlags(RecipeDB,8789,1,2,4,36,41,60)
	self:addTradeAcquire(RecipeDB,8789,2,2670)

	-- Crimson Silk Vest -- 8791
	AddRecipe(8791,185,7058,1,GAME_ORIG,185,205,215,225)
	self:addTradeFlags(RecipeDB,8791,1,2,3,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,8791,1,1346,1,2399,1,4576,1,11052,1,11557,1,18749,1,18772,1
	,28699,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636,1,
	4159,1,26914,1,17487,1,16640,1,16366,1,26969,1,5153,1,4193,1,26964,1,3523,1,33684)

	-- Crimson Silk Shoulders -- 8793
	AddRecipe(8793,190,7059,2,GAME_ORIG,190,210,225,240)
	self:addTradeFlags(RecipeDB,8793,1,2,10,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,8793,7,2)

	-- Azure Shoulders -- 8795
	AddRecipe(8795,190,7060,2,GAME_ORIG,190,210,225,240)
	self:addTradeFlags(RecipeDB,8795,1,2,10,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,8795,7,2)

	-- Earthen Silk Belt -- 8797
	AddRecipe(8797,195,7061,2,GAME_ORIG,195,215,230,245)
	self:addTradeFlags(RecipeDB,8797,1,2,10,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,8797,7,2)

	-- Crimson Silk Pantaloons -- 8799
	AddRecipe(8799,195,7062,1,GAME_ORIG,195,215,225,235)
	self:addTradeFlags(RecipeDB,8799,1,2,3,36,40,56)
	self:addTradeAcquire(RecipeDB,8799,1,1346,1,2399,1,4576,1,11052,1,11557,1,18749,1,18772,1
	,28699,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,
	33636,1,26914,1,17487,1,16640,1,16366,1,26969,1,5153,1,4193,1,26964,1,3523,1,33684)

	-- Crimson Silk Robe -- 8802
	AddRecipe(8802,205,7063,1,GAME_ORIG,205,220,235,250)
	self:addTradeFlags(RecipeDB,8802,1,2,4,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,8802,2,6568)

	-- Crimson Silk Gloves -- 8804
	AddRecipe(8804,210,7064,1,GAME_ORIG,210,225,240,255)
	self:addTradeFlags(RecipeDB,8804,1,2,3,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,8804,1,1346,1,2399,1,4576,1,11052,1,11557,1,18749,1,18772,1
	,28699,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,33613,1,33636,1,
	27001,1,26914,1,17487,1,16640,1,16366,1,26969,1,5153,1,4193,1,26964,1,3523,1,33684)

	-- Simple Linen Pants -- 12044
	AddRecipe(12044,1,10045,1,GAME_ORIG,1,35,47,60)
	self:addTradeFlags(RecipeDB,12044,1,2,3,36,41,56)
	self:addTradeAcquire(RecipeDB,12044,8,8)

	-- Simple Linen Boots -- 12045
	AddRecipe(12045,20,10046,1,GAME_ORIG,20,50,67,85)
	self:addTradeFlags(RecipeDB,12045,1,2,3,36,41,56)
	self:addTradeAcquire(RecipeDB,12045,1,1103,1,1346,1,2399,1,2627,1,
	3004,1,3363,1,3484,1,3523,1,3704,1,4159,1,4193,1,4576,1,5153,1
	,11052,1,11557,1,16366,1,16640,1,16729,1,17487,1,18749,1,18772,1,
	28699,1,33580,1,27001,1,33613,1,33636,1,26914,1,26969,1,26964,1,33684)

	-- Simple Kilt -- 12046
	AddRecipe(12046,75,10047,1,GAME_ORIG,75,100,117,135)
	self:addTradeFlags(RecipeDB,12046,1,2,3,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,12046,1,1103,1,1346,1,2399,1,2627,1,
	3004,1,3363,1,3484,1,3523,1,3704,1,4159,1,4193,1,4576,1,5153,1
	,11052,1,11557,1,16366,1,16640,1,16729,1,17487,1,18749,1,18772,1,
	28699,1,33580,1,27001,1,33613,1,33636,1,26914,1,26969,1,26964,1,33684)

	-- Colorful Kilt -- 12047
	AddRecipe(12047,120,10048,2,GAME_ORIG,120,145,162,180)
	self:addTradeFlags(RecipeDB,12047,1,2,10,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,12047,7,2)

	-- Black Mageweave Vest -- 12048
	AddRecipe(12048,205,9998,1,GAME_ORIG,205,220,235,250)
	self:addTradeFlags(RecipeDB,12048,1,2,3,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,12048,1,1346,1,2399,1,4576,1,11052,1,11557,1,18749,1,18772,
	1,28699,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,
	33636,1,26914,1,17487,1,16640,1,16366,1,26969,1,5153,1,4193,1,26964,1,3523,1,33684)

	-- Black Mageweave Leggings -- 12049
	AddRecipe(12049,205,9999,1,GAME_ORIG,205,220,235,250)
	self:addTradeFlags(RecipeDB,12049,1,2,3,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,12049,1,1346,1,2399,1,4576,1,11052,1,11557,1,18749,1,18772,
	1,28699,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,
	33636,1,26914,1,17487,1,16640,1,16366,1,26969,1,5153,1,4193,1,26964,1,3523,1,33684)

	-- Black Mageweave Robe -- 12050
	AddRecipe(12050,210,10001,1,GAME_ORIG,210,225,240,255)
	self:addTradeFlags(RecipeDB,12050,1,2,3,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,12050,1,1346,1,2399,1,4576,1,11052,1,11557,1,18749,1,18772,
	1,28699,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,
	33636,1,26914,1,17487,1,16640,1,16366,1,26969,1,5153,1,4193,1,26964,1,3523,1,33684)

	-- Shadoweave Pants -- 12052
	AddRecipe(12052,210,10002,1,GAME_ORIG,210,225,240,255)
	self:addTradeFlags(RecipeDB,12052,1,2,3,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,12052,1,4578,1,9584)

	-- Black Mageweave Gloves -- 12053
	AddRecipe(12053,215,10003,1,GAME_ORIG,215,230,245,260)
	self:addTradeFlags(RecipeDB,12053,1,2,3,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,12053,1,1346,1,2399,1,4576,1,11052,1,11557,1,18749,1,18772,
	1,28699,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,
	33636,1,26914,1,17487,1,16640,1,16366,1,26969,1,5153,1,4193,1,26964,1,3523,1,33684)

	-- Shadoweave Robe -- 12055
	AddRecipe(12055,215,10004,1,GAME_ORIG,215,230,245,260)
	self:addTradeFlags(RecipeDB,12055,1,2,3,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,12055,1,4578,1,9584)

	-- Red Mageweave Vest -- 12056
	AddRecipe(12056,215,10007,2,GAME_ORIG,215,230,245,260)
	self:addTradeFlags(RecipeDB,12056,1,2,10,36,40,56)
	self:addTradeAcquire(RecipeDB,12056,7,2)

	-- White Bandit Mask -- 12059
	AddRecipe(12059,215,10008,2,GAME_ORIG,215,220,225,230)
	self:addTradeFlags(RecipeDB,12059,1,2,10,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,12059,7,2)

	-- Red Mageweave Pants -- 12060
	AddRecipe(12060,215,10009,2,GAME_ORIG,215,230,245,260)
	self:addTradeFlags(RecipeDB,12060,1,2,10,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,12060,7,2)

	-- Orange Mageweave Shirt -- 12061
	AddRecipe(12061,215,10056,1,GAME_ORIG,215,220,225,230)
	self:addTradeFlags(RecipeDB,12061,1,2,3,36,41)
	self:addTradeAcquire(RecipeDB,12061,1,1346,1,2399,1,4576,1,11052,1,11557,1,18749,1,18772,
	1,28699,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,
	33636,1,26914,1,17487,1,16640,1,16366,1,26969,1,5153,1,4193,1,26964,1,3523,1,33684)

	-- Orange Martial Shirt -- 12064
	AddRecipe(12064,220,10052,1,GAME_ORIG,220,225,230,235)
	self:addTradeFlags(RecipeDB,12064,1,2,4,36,40)
	self:addTradeAcquire(RecipeDB,12064,2,3005,2,4168)

	-- Mageweave Bag -- 12065
	AddRecipe(12065,225,10050,1,GAME_ORIG,225,240,255,270)
	self:addTradeFlags(RecipeDB,12065,1,2,3,36,41)
	self:addTradeAcquire(RecipeDB,12065,1,1346,1,2399,1,4576,1,11052,1,11557,1,18749,1,18772,
	1,28699,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,
	33636,1,26914,1,17487,1,16640,1,16366,1,26969,1,5153,1,4193,1,26964,1,3523,1,33684)

	-- Red Mageweave Gloves -- 12066
	AddRecipe(12066,225,10018,2,GAME_ORIG,225,240,255,270)
	self:addTradeFlags(RecipeDB,12066,1,2,10,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,12066,7,2)

	-- Dreamweave Gloves -- 12067
	AddRecipe(12067,225,10019,1,GAME_ORIG,225,240,255,270)
	self:addTradeFlags(RecipeDB,12067,1,2,3,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,12067,1,1346,1,2399,1,4576,1,11052,1,11557,1,18749,1,18772,
	1,28699,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,
	33636,1,26914,1,17487,1,16640,1,16366,1,26969,1,5153,1,4193,1,26964,1,3523,1,33684)

	-- Cindercloth Robe -- 12069
	AddRecipe(12069,225,10042,1,GAME_ORIG,225,240,255,270)
	self:addTradeFlags(RecipeDB,12069,1,2,3,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,12069,1,1346,1,2399,1,4576,1,11052,1,11557,1,18749,1,18772,
	1,28699,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,
	33636,1,26914,1,17487,1,16640,1,16366,1,26969,1,5153,1,4193,1,26964,1,3523,1,33684)

	-- Dreamweave Vest -- 12070
	AddRecipe(12070,225,10021,1,GAME_ORIG,225,240,255,270)
	self:addTradeFlags(RecipeDB,12070,1,2,3,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,12070,1,1346,1,2399,1,4576,1,11052,1,11557,1,18749,1,18772,
	1,28699,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,
	33636,1,26914,1,17487,1,16640,1,16366,1,26969,1,5153,1,4193,1,26964,1,3523,1,33684)

	-- Shadoweave Gloves -- 12071
	AddRecipe(12071,225,10023,1,GAME_ORIG,225,240,255,270)
	self:addTradeFlags(RecipeDB,12071,1,2,3,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,12071,1,4578,1,9584)

	-- Black Mageweave Headband -- 12072
	AddRecipe(12072,230,10024,1,GAME_ORIG,230,245,260,275)
	self:addTradeFlags(RecipeDB,12072,1,2,3,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,12072,1,2399,1,11052,1,11557,1,18749,1,18772,1,28699,1,1346
	,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636
	,1,26914,1,4576,1,17487,1,16640,1,16366,1,26969,1,5153,1,4193,1,26964,1,3523,1,33684)

	-- Black Mageweave Boots -- 12073
	AddRecipe(12073,230,10026,1,GAME_ORIG,230,245,260,275)
	self:addTradeFlags(RecipeDB,12073,1,2,3,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,12073,1,2399,1,11052,1,11557,1,18749,1,18772,1,28699,1,1346
	,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636
	,1,26914,1,4576,1,17487,1,16640,1,16366,1,26969,1,5153,1,4193,1,26964,1,3523,1,33684)

	-- Black Mageweave Shoulders -- 12074
	AddRecipe(12074,230,10027,1,GAME_ORIG,230,245,260,275)
	self:addTradeFlags(RecipeDB,12074,1,2,3,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,12074,1,2399,1,11052,1,11557,1,18749,1,18772,1,28699,1,1346
	,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636
	,1,26914,1,4576,1,17487,1,16640,1,16366,1,26969,1,5153,1,4193,1,26964,1,3523,1,33684)

	-- Lavender Mageweave Shirt -- 12075
	AddRecipe(12075,230,10054,1,GAME_ORIG,230,235,240,245)
	self:addTradeFlags(RecipeDB,12075,1,2,4,36,40)
	self:addTradeAcquire(RecipeDB,12075,2,3364,2,8681)

	-- Shadoweave Shoulders -- 12076
	AddRecipe(12076,235,10028,1,GAME_ORIG,235,250,265,280)
	self:addTradeFlags(RecipeDB,12076,1,2,3,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,12076,1,4578,1,9584)

	-- Simple Black Dress -- 12077
	AddRecipe(12077,235,10053,1,GAME_ORIG,235,240,245,250)
	self:addTradeFlags(RecipeDB,12077,1,2,3,36,41)
	self:addTradeAcquire(RecipeDB,12077,1,2399,1,11052,1,11557,1,18749,1,18772,1,28699,1,1346
	,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636
	,1,26914,1,4576,1,17487,1,16640,1,16366,1,26969,1,5153,1,4193,1,26964,1,3523,1,33684)

	-- Red Mageweave Shoulders -- 12078
	AddRecipe(12078,235,10029,2,GAME_ORIG,235,250,265,280)
	self:addTradeFlags(RecipeDB,12078,1,2,10,36,40,56)
	self:addTradeAcquire(RecipeDB,12078,7,2)

	-- Red Mageweave Bag -- 12079
	AddRecipe(12079,235,10051,1,GAME_ORIG,235,250,265,280)
	self:addTradeFlags(RecipeDB,12079,1,2,3,36,41)
	self:addTradeAcquire(RecipeDB,12079,1,2399,1,11052,1,11557,1,18749,1,18772,1,28699,1,1346
	,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636
	,1,26914,1,4576,1,17487,1,16640,1,16366,1,26969,1,5153,1,4193,1,26964,1,3523)

	-- Pink Mageweave Shirt -- 12080
	AddRecipe(12080,235,10055,1,GAME_ORIG,235,240,245,250)
	self:addTradeFlags(RecipeDB,12080,1,2,4,36,40)
	self:addTradeAcquire(RecipeDB,12080,2,3364,2,8681)

	-- Admiral's Hat -- 12081
	AddRecipe(12081,240,10030,1,GAME_ORIG,240,255,270,285)
	self:addTradeFlags(RecipeDB,12081,1,2,4,36,41,56)
	self:addTradeAcquire(RecipeDB,12081,2,2672)

	-- Shadoweave Boots -- 12082
	AddRecipe(12082,240,10031,1,GAME_ORIG,240,255,270,285)
	self:addTradeFlags(RecipeDB,12082,1,2,3,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,12082,1,4578,1,9584)

	-- Red Mageweave Headband -- 12084
	AddRecipe(12084,240,10033,2,GAME_ORIG,240,255,270,285)
	self:addTradeFlags(RecipeDB,12084,1,2,10,36,40,56)
	self:addTradeAcquire(RecipeDB,12084,7,2)

	-- Tuxedo Shirt -- 12085
	AddRecipe(12085,240,10034,1,GAME_ORIG,240,245,250,255)
	self:addTradeFlags(RecipeDB,12085,1,2,4,36,40)
	self:addTradeAcquire(RecipeDB,12085,2,4577,2,8681)

	-- Shadoweave Mask -- 12086
	AddRecipe(12086,245,10025,2,GAME_ORIG,245,260,275,290)
	self:addTradeFlags(RecipeDB,12086,1,2,8,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,12086,4,3402)

	-- Cindercloth Boots -- 12088
	AddRecipe(12088,245,10044,1,GAME_ORIG,245,260,275,290)
	self:addTradeFlags(RecipeDB,12088,1,2,3,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,12088,1,2399,1,11052,1,11557,1,18749,1,18772,1,28699,1,1346
	,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636
	,1,26914,1,4576,1,17487,1,16640,1,16366,1,26969,1,5153,1,4193,1,26964,1,3523,1,33684)

	-- Tuxedo Pants -- 12089
	AddRecipe(12089,245,10035,1,GAME_ORIG,245,250,255,260)
	self:addTradeFlags(RecipeDB,12089,1,2,4,36,40,56)
	self:addTradeAcquire(RecipeDB,12089,2,4577,2,8681)

	-- White Wedding Dress -- 12091
	AddRecipe(12091,250,10040,1,GAME_ORIG,250,255,260,265)
	self:addTradeFlags(RecipeDB,12091,1,2,4,36,40,56)
	self:addTradeAcquire(RecipeDB,12091,2,1347,2,3005)

	-- Dreamweave Circlet -- 12092
	AddRecipe(12092,250,10041,1,GAME_ORIG,250,265,280,295)
	self:addTradeFlags(RecipeDB,12092,1,2,3,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,12092,1,2399,1,11052,1,11557,1,18749,1,18772,1,28699,1,1346
	,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636
	,1,26914,1,4576,1,16640,1,16366,1,26969,1,5153,1,4193,1,26964,1,3523,1,33684)

	-- Tuxedo Jacket -- 12093
	AddRecipe(12093,250,10036,1,GAME_ORIG,250,265,280,295)
	self:addTradeFlags(RecipeDB,12093,1,2,4,36,40,56)
	self:addTradeAcquire(RecipeDB,12093,2,4577,2,8681)

	-- Bolt of Runecloth -- 18401
	AddRecipe(18401,250,14048,1,GAME_ORIG,250,255,257,260)
	self:addTradeFlags(RecipeDB,18401,1,2,3,36,41,56)
	self:addTradeAcquire(RecipeDB,18401,1,2399,1,11052,1,11557,1,18749,1,18772,1,28699,1,1346
	,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636
	,1,26914,1,4576,1,17487,1,16640,1,16366,1,26969,1,5153,1,4193,1,26964,1,3523,1,33684)

	-- Runecloth Belt -- 18402
	AddRecipe(18402,255,13856,1,GAME_ORIG,255,270,285,300)
	self:addTradeFlags(RecipeDB,18402,1,2,3,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,18402,1,2399,1,11052,1,11557,1,18749,1,18772,1,28699,1,1346
	,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636
	,1,26914,1,4576,1,17487,1,16640,1,16366,1,26969,1,5153,1,4193,1,26964,1,3523,1,33684)

	-- Frostweave Tunic -- 18403
	AddRecipe(18403,255,13869,2,GAME_ORIG,255,270,285,300)
	self:addTradeFlags(RecipeDB,18403,1,2,3,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,18403,1,2399,1,11052,1,18749,1,18772,1,28699,1,1346,1,4159,
	1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636
	,1,26914,1,4576,1,17487,1,16640,1,16366,1,26969,1,5153,1,4193,1,26964,1,3523,1,33684,1,11557)

	-- Frostweave Robe -- 18404
	AddRecipe(18404,255,13868,2,GAME_ORIG,255,270,285,300)
	self:addTradeFlags(RecipeDB,18404,1,2,10,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,18404,7,2)

	-- Runecloth Bag -- 18405
	AddRecipe(18405,260,14046,1,GAME_ORIG,260,275,290,305)
	self:addTradeFlags(RecipeDB,18405,1,2,4,36,41)
	self:addTradeAcquire(RecipeDB,18405,2,11189)

	-- Runecloth Robe -- 18406
	AddRecipe(18406,260,13858,1,GAME_ORIG,260,275,290,305)
	self:addTradeFlags(RecipeDB,18406,1,2,3,4,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,18406,1,2399,1,11052,1,18749,1,18772,2,7940,1,28699,1,1346,
	1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636
	,1,26914,1,4576,1,17487,1,16640,1,16366,1,26969,1,5153,1,4193,1,26964,1,3523,1,33684,1,11557)

	-- Runecloth Tunic -- 18407
	AddRecipe(18407,260,13857,2,GAME_ORIG,260,275,290,305)
	self:addTradeFlags(RecipeDB,18407,1,2,3,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,18407,1,2399,1,11052,1,18749,1,18772,1,28699,1,1346,1,4159,
	1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636,1,26914
	,1,4576,1,17487,1,16640,1,16366,1,26969,1,5153,1,4193,1,26964,1,3523,1,33684,1,11557)

	-- Cindercloth Vest -- 18408
	AddRecipe(18408,260,14042,2,GAME_ORIG,260,275,290,305)
	self:addTradeFlags(RecipeDB,18408,1,2,11,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,18408,3,5861)

	-- Runecloth Cloak -- 18409
	AddRecipe(18409,265,13860,1,GAME_ORIG,265,280,295,310)
	self:addTradeFlags(RecipeDB,18409,1,2,3,4,36,41,53,54,60)
	self:addTradeAcquire(RecipeDB,18409,1,2399,1,11052,1,18749,1,18772,2,7940,1,28699,1,1346,
	1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636
	,1,26914,1,4576,1,17487,1,16640,1,16366,1,26969,1,5153,1,4193,1,26964,1,3523,1,33684,1,11557)

	-- Ghostweave Belt -- 18410
	AddRecipe(18410,265,14143,2,GAME_ORIG,265,280,295,310)
	self:addTradeFlags(RecipeDB,18410,1,2,3,36,40,56)
	self:addTradeAcquire(RecipeDB,18410,1,2399,1,11052,1,18749,1,18772,1,28699,1,1346,1,4159,
	1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636,1,26914
	,1,4576,1,17487,1,16640,1,16366,1,26969,1,5153,1,4193,1,26964,1,3523,1,33684,1,11557)

	-- Frostweave Gloves -- 18411
	AddRecipe(18411,265,13870,2,GAME_ORIG,265,280,295,310)
	self:addTradeFlags(RecipeDB,18411,1,2,3,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,18411,1,2399,1,11052,1,18749,1,18772,1,28699,1,1346,1,4159,
	1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636,1,26914
	,1,4576,1,17487,1,16640,1,16366,1,26969,1,5153,1,4193,1,26964,1,3523,1,33684,1,11557)

	-- Cindercloth Gloves -- 18412
	AddRecipe(18412,270,14043,2,GAME_ORIG,270,285,300,315)
	self:addTradeFlags(RecipeDB,18412,1,2,11,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,18412,3,5861)

	-- Ghostweave Gloves -- 18413
	AddRecipe(18413,270,14142,2,GAME_ORIG,270,285,300,315)
	self:addTradeFlags(RecipeDB,18413,1,2,3,36,40,56)
	self:addTradeAcquire(RecipeDB,18413,1,2399,1,11052,1,18749,1,18772,1,28699,1,1346,1,4159,
	1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636,1,26914
	,1,4576,1,17487,1,16640,1,16366,1,26969,1,5153,1,4193,1,26964,1,3523,1,33684,1,11557)

	-- Brightcloth Robe -- 18414
	AddRecipe(18414,270,14100,2,GAME_ORIG,270,285,300,315)
	self:addTradeFlags(RecipeDB,18414,1,2,3,36,40,56)
	self:addTradeAcquire(RecipeDB,18414,1,2399,1,11052,1,18749,1,18772,1,28699,1,1346,1,4159,
	1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636,1,26914
	,1,4576,1,17487,1,16640,1,16366,1,26969,1,5153,1,4193,1,26964,1,3523,1,33684,1,11557)

	-- Brightcloth Gloves -- 18415
	AddRecipe(18415,270,14101,2,GAME_ORIG,270,285,300,315)
	self:addTradeFlags(RecipeDB,18415,1,2,3,36,40,56)
	self:addTradeAcquire(RecipeDB,18415,1,2399,1,11052,1,18749,1,18772,1,28699,1,1346,1,4159,
	1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636,1,26914
	,1,4576,1,17487,1,16640,1,16366,1,26969,1,5153,1,4193,1,26964,1,3523,1,33684,1,11557)

	-- Ghostweave Vest -- 18416
	AddRecipe(18416,275,14141,2,GAME_ORIG,275,290,305,320)
	self:addTradeFlags(RecipeDB,18416,1,2,3,36,40,56)
	self:addTradeAcquire(RecipeDB,18416,1,2399,1,11052,1,18749,1,18772,1,28699,1,1346,1,4159,
	1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636,1,26914
	,1,4576,1,17487,1,16640,1,16366,1,26969,1,5153,1,4193,1,26964,1,3523,1,33684,1,11557)

	-- Runecloth Gloves -- 18417
	AddRecipe(18417,275,13863,1,GAME_ORIG,275,290,305,320)
	self:addTradeFlags(RecipeDB,18417,1,2,3,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,18417,1,2399,1,11052,1,18749,1,18772,1,28699,1,1346,1,4159,
	1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636,1,26914
	,1,4576,1,17487,1,16640,1,16366,1,26969,1,5153,1,4193,1,26964,1,3523,1,33684,1,11557)

	-- Cindercloth Cloak -- 18418
	AddRecipe(18418,275,14044,2,GAME_ORIG,275,290,305,320)
	self:addTradeFlags(RecipeDB,18418,1,2,11,36,40,53,54,60)
	self:addTradeAcquire(RecipeDB,18418,3,7037)

	-- Felcloth Pants -- 18419
	AddRecipe(18419,275,14107,1,GAME_ORIG,275,290,305,320)
	self:addTradeFlags(RecipeDB,18419,1,2,4,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,18419,2,12022)

	-- Brightcloth Cloak -- 18420
	AddRecipe(18420,275,14103,2,GAME_ORIG,275,290,305,320)
	self:addTradeFlags(RecipeDB,18420,1,2,3,36,40,53,54,60)
	self:addTradeAcquire(RecipeDB,18420,1,2399,1,11052,1,18749,1,18772,1,28699,1,1346,1,4159,
	1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636,1,26914
	,1,4576,1,17487,1,16640,1,16366,1,26969,1,5153,1,4193,1,26964,1,3523,1,33684,1,11557)

	-- Wizardweave Leggings -- 18421
	AddRecipe(18421,275,14132,2,GAME_ORIG,275,290,305,320)
	self:addTradeFlags(RecipeDB,18421,1,2,3,36,40,56)
	self:addTradeAcquire(RecipeDB,18421,1,2399,1,11052,1,18749,1,18772,1,28699,1,1346,1,4159,
	1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636,1,26914
	,1,4576,1,17487,1,16640,1,16366,1,26969,1,5153,1,4193,1,26964,1,3523,1,33684,1,11557)

	-- Cloak of Fire -- 18422
	AddRecipe(18422,275,14134,3,GAME_ORIG,275,290,305,320)
	self:addTradeFlags(RecipeDB,18422,1,2,5,11,36,41,60)
	self:addTradeAcquire(RecipeDB,18422,3,9026)

	-- Runecloth Boots -- 18423
	AddRecipe(18423,280,13864,1,GAME_ORIG,280,295,310,325)
	self:addTradeFlags(RecipeDB,18423,1,2,3,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,18423,1,2399,1,11052,1,18749,1,18772,1,28699,1,1346,1,4159,
	1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636,1,26914
	,1,4576,1,17487,1,16640,1,16366,1,26969,1,5153,1,4193,1,26964,1,3523,1,33684,1,11557)

	-- Frostweave Pants -- 18424
	AddRecipe(18424,280,13871,2,GAME_ORIG,280,295,310,325)
	self:addTradeFlags(RecipeDB,18424,1,2,3,11,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,18424,1,2399,1,11052,1,18749,1,18772,1,28699,1,1346,1,4159,
	1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636,1,26914
	,1,4576,1,17487,1,16640,1,16366,1,26969,1,5153,1,4193,1,26964,1,3523,1,33684,1,11557)

	-- Cindercloth Pants -- 18434
	AddRecipe(18434,280,14045,2,GAME_ORIG,280,295,310,325)
	self:addTradeFlags(RecipeDB,18434,1,2,11,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,18434,3,7037)

	-- Robe of Winter Night -- 18436
	AddRecipe(18436,285,14136,3,GAME_ORIG,285,300,315,330)
	self:addTradeFlags(RecipeDB,18436,1,2,11,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,18436,3,7437)

	-- Felcloth Boots -- 18437
	AddRecipe(18437,285,14108,2,GAME_ORIG,285,300,315,330)
	self:addTradeFlags(RecipeDB,18437,1,2,3,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,18437,1,2399,1,11052,1,18749,1,18772,1,28699,1,1346,1,4159,
	1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636,1,26914
	,1,4576,1,17487,1,16640,1,16366,1,26969,1,5153,1,4193,1,26964,1,3523,1,33684,1,11557)

	-- Runecloth Pants -- 18438
	AddRecipe(18438,285,13865,2,GAME_ORIG,285,300,315,330)
	self:addTradeFlags(RecipeDB,18438,1,2,3,11,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,18438,1,2399,1,11052,1,18749,1,18772,1,28699,1,1346,1,4159,
	1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636,1,26914
	,1,4576,1,17487,1,16640,1,16366,1,26969,1,5153,1,4193,1,26964,1,3523,1,33684,1,11557)

	-- Brightcloth Pants -- 18439
	AddRecipe(18439,290,14104,2,GAME_ORIG,290,305,320,335)
	self:addTradeFlags(RecipeDB,18439,1,2,10,36,40,56)
	self:addTradeAcquire(RecipeDB,18439,7,2)

	-- Mooncloth Leggings -- 18440
	AddRecipe(18440,290,14137,3,GAME_ORIG,290,305,320,335)
	self:addTradeFlags(RecipeDB,18440,1,2,10,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,18440,7,2)

	-- Ghostweave Pants -- 18441
	AddRecipe(18441,290,14144,2,GAME_ORIG,290,305,320,335)
	self:addTradeFlags(RecipeDB,18441,1,2,3,36,40,56)
	self:addTradeAcquire(RecipeDB,18441,1,2399,1,11052,1,18749,1,18772,1,28699,1,1346,1,4159,
	1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636,1,26914
	,1,4576,1,17487,1,16640,1,16366,1,26969,1,5153,1,4193,1,26964,1,3523,1,33684,1,11557)

	-- Felcloth Hood -- 18442
	AddRecipe(18442,290,14111,2,GAME_ORIG,290,305,320,335)
	self:addTradeFlags(RecipeDB,18442,1,2,3,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,18442,1,2399,1,11052,1,18749,1,18772,1,28699,1,1346,1,4159,
	1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636,1,26914
	,1,4576,1,17487,1,16640,1,16366,1,26969,1,5153,1,4193,1,26964,1,3523,1,33684,1,11557)

	-- Runecloth Headband -- 18444
	AddRecipe(18444,295,13866,2,GAME_ORIG,295,310,325,340)
	self:addTradeFlags(RecipeDB,18444,1,2,3,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,18444,1,2399,1,11052,1,18749,1,18772,1,28699,1,1346,1,4159,
	1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636,1,26914
	,1,4576,1,17487,1,16640,1,16366,1,26969,1,5153,1,4193,1,26964,1,3523,1,33684,1,11557)

	-- Mooncloth Bag -- 18445
	AddRecipe(18445,300,14155,2,GAME_ORIG,300,315,330,345)
	self:addTradeFlags(RecipeDB,18445,1,2,10,36,40)
	self:addTradeAcquire(RecipeDB,18445,7,2)

	-- Wizardweave Robe -- 18446
	AddRecipe(18446,300,14128,2,GAME_ORIG,300,315,330,345)
	self:addTradeFlags(RecipeDB,18446,1,2,3,36,40,56)
	self:addTradeAcquire(RecipeDB,18446,1,2399,1,11052,1,18749,1,18772,1,28699,1,1346,1,4159,
	1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636,1,26914
	,1,4576,1,17487,1,16640,1,16366,1,26969,1,5153,1,4193,1,26964,1,3523,1,33684,1,11557)

	-- Mooncloth Vest -- 18447
	AddRecipe(18447,300,14138,3,GAME_ORIG,300,315,330,345)
	self:addTradeFlags(RecipeDB,18447,1,2,10,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,18447,7,2)

	-- Mooncloth Shoulders -- 18448
	AddRecipe(18448,300,14139,3,GAME_ORIG,300,315,330,345)
	self:addTradeFlags(RecipeDB,18448,1,2,10,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,18448,7,2)

	-- Runecloth Shoulders -- 18449
	AddRecipe(18449,300,13867,2,GAME_ORIG,300,315,330,345)
	self:addTradeFlags(RecipeDB,18449,1,2,3,11,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,18449,1,2399,1,11052,1,18749,1,18772,1,28699,1,1346,1,4159,
	1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636,1,26914
	,1,4576,1,17487,1,16640,1,16366,1,26969,1,5153,1,4193,1,26964,1,3523,1,33684,1,11557)

	-- Wizardweave Turban -- 18450
	AddRecipe(18450,300,14130,2,GAME_ORIG,300,315,330,345)
	self:addTradeFlags(RecipeDB,18450,1,2,3,36,40,56)
	self:addTradeAcquire(RecipeDB,18450,1,2399,1,11052,1,18749,1,18772,1,28699,1,1346,1,4159,
	1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636,1,26914
	,1,4576,1,17487,1,16640,1,16366,1,26969,1,5153,1,4193,1,26964,1,3523,1,33684,1,11557)

	-- Felcloth Robe -- 18451
	AddRecipe(18451,300,14106,2,GAME_ORIG,300,315,330,345)
	self:addTradeFlags(RecipeDB,18451,1,2,3,11,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,18451,1,2399,1,11052,1,18749,1,18772,1,28699,1,1346,1,4159,
	1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636,1,26914
	,1,4576,1,17487,1,16640,1,16366,1,26969,1,5153,1,4193,1,26964,1,3523,1,33684,1,11557)

	-- Mooncloth Circlet -- 18452
	AddRecipe(18452,300,14140,3,GAME_ORIG,300,315,330,345)
	self:addTradeFlags(RecipeDB,18452,1,2,10,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,18452,7,2)

	-- Felcloth Shoulders -- 18453
	AddRecipe(18453,300,14112,2,GAME_ORIG,300,315,330,345)
	self:addTradeFlags(RecipeDB,18453,1,2,3,11,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,18453,1,2399,1,11052,1,18749,1,18772,1,28699,1,1346,1,4159,
	1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636,1,26914
	,1,4576,1,17487,1,16640,1,16366,1,26969,1,5153,1,4193,1,26964,1,3523,1,33684,1,11557)

	-- Gloves of Spell Mastery -- 18454
	AddRecipe(18454,300,14146,4,GAME_ORIG,300,315,330,345)
	self:addTradeFlags(RecipeDB,18454,1,2,10,F_MAGE,F_PRIEST,F_WARLOCK,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,18454,7,2)

	-- Bottomless Bag -- 18455
	AddRecipe(18455,300,14156,3,GAME_ORIG,300,315,330,345)
	self:addTradeFlags(RecipeDB,18455,1,2,10,36,40)
	self:addTradeAcquire(RecipeDB,18455,7,2)

	-- Truefaith Vestments -- 18456
	AddRecipe(18456,300,14154,4,GAME_ORIG,300,315,330,345)
	self:addTradeFlags(RecipeDB,18456,1,2,5,F_PRIEST,37,41,53,54,56)
	self:addTradeAcquire(RecipeDB,18456,3,10813)

	-- Robe of the Archmage -- 18457
	AddRecipe(18457,300,14152,4,GAME_ORIG,300,315,330,345)
	self:addTradeFlags(RecipeDB,18457,1,2,5,37,41,53,54,56)
	self:addTradeAcquire(RecipeDB,18457,3,9264)

	-- Robe of the Void -- 18458
	AddRecipe(18458,300,14153,4,GAME_ORIG,300,315,330,345)
	self:addTradeFlags(RecipeDB,18458,1,2,5,37,40,53,54,56)
	self:addTradeAcquire(RecipeDB,18458,3,1853)

	-- Mooncloth -- 18560
	AddRecipe(18560,250,14342,1,GAME_ORIG,250,290,305,320)
	self:addTradeFlags(RecipeDB,18560,1,2,4,36,40,56)
	self:addTradeAcquire(RecipeDB,18560,2,11189)

	-- Mooncloth Boots -- 19435
	AddRecipe(19435,290,15802,3,GAME_ORIG,290,295,310,325)
	self:addTradeFlags(RecipeDB,19435,1,2,8,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,19435,4,6032)

	-- Flarecore Mantle -- 20848
	AddRecipe(20848,300,16980,1,GAME_ORIG,300,315,330,345)
	self:addTradeFlags(RecipeDB,20848,1,2,4,36,41,53,54,56,98)
	self:addTradeAcquire(RecipeDB,20848,6,59,2,12944)

	-- Flarecore Gloves -- 20849
	AddRecipe(20849,300,16979,1,GAME_ORIG,300,315,330,345)
	self:addTradeFlags(RecipeDB,20849,1,2,4,F_MAGE,F_PRIEST,F_WARLOCK,36,41,56,98)
	self:addTradeAcquire(RecipeDB,20849,6,59,1,12944)

	-- Green Holiday Shirt -- 21945
	AddRecipe(21945,190,17723,1,GAME_ORIG,190,200,205,210)
	self:addTradeFlags(RecipeDB,21945,1,2,11,36,40)
	self:addTradeAcquire(RecipeDB,21945,5,1)

	-- Flarecore Wraps -- 22759
	AddRecipe(22759,300,18263,3,GAME_ORIG,300,320,335,350)
	self:addTradeFlags(RecipeDB,22759,1,2,6,36,40,56)
	self:addTradeAcquire(RecipeDB,22759,8,26)

	-- Gordok Ogre Suit -- 22813
	AddRecipe(22813,275,18258,2,GAME_ORIG,275,285,290,295)
	self:addTradeFlags(RecipeDB,22813,1,2,5,8,36,41)
	self:addTradeAcquire(RecipeDB,22813,4,5518)

	-- Belt of the Archmage -- 22866
	AddRecipe(22866,300,18405,4,GAME_ORIG,300,315,330,345)
	self:addTradeFlags(RecipeDB,22866,1,2,5,36,40,56)
	self:addTradeAcquire(RecipeDB,22866,8,23)

	-- Felcloth Gloves -- 22867
	AddRecipe(22867,300,18407,3,GAME_ORIG,300,315,330,345)
	self:addTradeFlags(RecipeDB,22867,1,2,5,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,22867,8,23)

	-- Inferno Gloves -- 22868
	AddRecipe(22868,300,18408,3,GAME_ORIG,300,315,330,345)
	self:addTradeFlags(RecipeDB,22868,1,2,5,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,22868,8,23)

	-- Mooncloth Gloves -- 22869
	AddRecipe(22869,300,18409,3,GAME_ORIG,300,315,330,345)
	self:addTradeFlags(RecipeDB,22869,1,2,5,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,22869,8,23)

	-- Cloak of Warding -- 22870
	AddRecipe(22870,300,18413,3,GAME_ORIG,300,315,330,345)
	self:addTradeFlags(RecipeDB,22870,1,2,5,36,41,52,60)
	self:addTradeAcquire(RecipeDB,22870,8,23)

	-- Mooncloth Robe -- 22902
	AddRecipe(22902,300,18486,1,GAME_ORIG,300,315,330,345)
	self:addTradeFlags(RecipeDB,22902,1,2,4,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,22902,2,14371)

	-- Wisdom of the Timbermaw -- 23662
	AddRecipe(23662,290,19047,1,GAME_ORIG,290,305,320,335)
	self:addTradeFlags(RecipeDB,23662,1,2,4,36,41,56,99)
	self:addTradeAcquire(RecipeDB,23662,6,576,2,11557)

	-- Mantle of the Timbermaw -- 23663
	AddRecipe(23663,300,19050,1,GAME_ORIG,300,315,330,345)
	self:addTradeFlags(RecipeDB,23663,1,2,4,36,41,56,99)
	self:addTradeAcquire(RecipeDB,23663,6,576,3,11557)

	-- Argent Boots -- 23664
	AddRecipe(23664,290,19056,1,GAME_ORIG,290,305,320,335)
	self:addTradeFlags(RecipeDB,23664,1,2,4,36,41,56,53,54,96)
	self:addTradeAcquire(RecipeDB,23664,6,529,2,10856,6,529,2,10857,6,529,2,11536)

	-- Argent Shoulders -- 23665
	AddRecipe(23665,300,19059,1,GAME_ORIG,300,315,330,345)
	self:addTradeFlags(RecipeDB,23665,1,2,4,36,41,56,53,54,96)
	self:addTradeAcquire(RecipeDB,23665,6,529,3,10856,6,529,3,10857,6,529,3,11536)

	-- Flarecore Robe -- 23666
	AddRecipe(23666,300,19156,1,GAME_ORIG,300,315,330,345)
	self:addTradeFlags(RecipeDB,23666,1,2,4,36,41,53,54,56,98)
	self:addTradeAcquire(RecipeDB,23666,6,59,2,12944)

	-- Flarecore Leggings -- 23667
	AddRecipe(23667,300,19165,1,GAME_ORIG,300,315,330,345)
	self:addTradeFlags(RecipeDB,23667,1,2,4,36,41,53,54,56,98)
	self:addTradeAcquire(RecipeDB,23667,6,59,3,12944)

	-- Bloodvine Vest -- 24091
	AddRecipe(24091,300,19682,1,GAME_ORIG,300,315,330,345)
	self:addTradeFlags(RecipeDB,24091,1,2,4,36,41,53,54,56,100)
	self:addTradeAcquire(RecipeDB,24091,6,270,3,14921)

	-- Bloodvine Leggings -- 24092
	AddRecipe(24092,300,19683,1,GAME_ORIG,300,315,330,345)
	self:addTradeFlags(RecipeDB,24092,1,2,4,36,41,53,54,56,100)
	self:addTradeAcquire(RecipeDB,24092,6,270,2,14921)

	-- Bloodvine Boots -- 24093
	AddRecipe(24093,300,19684,1,GAME_ORIG,300,315,330,345)
	self:addTradeFlags(RecipeDB,24093,1,2,4,36,41,53,54,56,100)
	self:addTradeAcquire(RecipeDB,24093,6,270,1,14921)

	-- Runed Stygian Leggings -- 24901
	AddRecipe(24901,300,20538,3,GAME_ORIG,300,315,330,345)
	self:addTradeFlags(RecipeDB,24901,1,2,8,36,40,56)
	self:addTradeAcquire(RecipeDB,24901,4,8323)

	-- Runed Stygian Belt -- 24902
	AddRecipe(24902,300,20539,3,GAME_ORIG,300,315,330,345)
	self:addTradeFlags(RecipeDB,24902,1,2,8,36,40,56)
	self:addTradeAcquire(RecipeDB,24902,4,8323)

	-- Runed Stygian Boots -- 24903
	AddRecipe(24903,300,20537,3,GAME_ORIG,300,315,330,345)
	self:addTradeFlags(RecipeDB,24903,1,2,8,36,40,56)
	self:addTradeAcquire(RecipeDB,24903,4,8323)

	-- Soul Pouch -- 26085
	AddRecipe(26085,260,21340,1,GAME_ORIG,260,275,290,305)
	self:addTradeFlags(RecipeDB,26085,1,2,4,F_WARLOCK,36,40)
	self:addTradeAcquire(RecipeDB,26085,2,6568)

	-- Felcloth Bag -- 26086
	AddRecipe(26086,280,21341,3,GAME_ORIG,280,300,315,330)
	self:addTradeFlags(RecipeDB,26086,1,2,5,F_WARLOCK,36,41)
	self:addTradeAcquire(RecipeDB,26086,3,10503,8,30)

	-- Core Felcloth Bag -- 26087
	AddRecipe(26087,300,21342,3,GAME_ORIG,300,315,330,345)
	self:addTradeFlags(RecipeDB,26087,1,2,6,11,F_WARLOCK,36,40)
	self:addTradeAcquire(RecipeDB,26087,8,26)

	-- Festival Dress -- 26403
	AddRecipe(26403,250,21154,2,GAME_ORIG,250,265,280,295)
	self:addTradeFlags(RecipeDB,26403,1,2,4,7,36,41,56)
	self:addTradeAcquire(RecipeDB,26403,A_SEASONAL,2,2,15909)

	-- Festive Red Pant Suit -- 26407
	AddRecipe(26407,250,21542,2,GAME_ORIG,250,265,280,295)
	self:addTradeFlags(RecipeDB,26407,1,2,4,7,36,41)
	self:addTradeAcquire(RecipeDB,26407,A_SEASONAL,2,2,15909)

	-- Bolt of Netherweave -- 26745
	AddRecipe(26745,300,21840,1,1,300,305,315,325)
	self:addTradeFlags(RecipeDB,26745,1,2,3,36,41)
	self:addTradeAcquire(RecipeDB,26745,1,18749,1,18772,1,28699,1,33580,1,27001,1,33613,1,
	33636,1,26914,1,26969,1,26964,1,33684)

	-- Netherweave Bag -- 26746
	AddRecipe(26746,315,21841,1,1,315,320,330,340)
	self:addTradeFlags(RecipeDB,26746,1,2,3,36,41)
	self:addTradeAcquire(RecipeDB,26746,1,18749,1,18772,1,28699,1,33580,1,27001,1,33613,1,
	33636,1,26914,1,26969,1,26964,1,33684)

	-- Bolt of Imbued Netherweave -- 26747
	AddRecipe(26747,325,21842,1,1,325,330,335,340)
	self:addTradeFlags(RecipeDB,26747,1,2,4,36,40)
	self:addTradeAcquire(RecipeDB,26747,2,16638,2,16767,2,19213)

	-- Imbued Netherweave Bag -- 26749
	AddRecipe(26749,340,21843,1,1,340,340,345,350)
	self:addTradeFlags(RecipeDB,26749,1,2,4,36,40)
	self:addTradeAcquire(RecipeDB,26749,2,19015,2,19213)

	-- Bolt of Soulcloth -- 26750
	AddRecipe(26750,345,21844,1,1,345,345,350,355)
	self:addTradeFlags(RecipeDB,26750,1,2,4,36,40,56)
	self:addTradeAcquire(RecipeDB,26750,2,16638,2,16767,2,19015,2,19017)

	-- Primal Mooncloth -- 26751
	AddRecipe(26751,350,21845,1,1,350,350,355,360)
	self:addTradeFlags(RecipeDB,26751,1,2,4,36,40,56)
	self:addTradeAcquire(RecipeDB,26751,2,22208,2,29512)

	-- Spellfire Belt -- 26752
	AddRecipe(26752,355,21846,1,1,355,365,370,375,26797)
	self:addTradeFlags(RecipeDB,26752,1,2,4,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,26752,2,22213,2,29511)

	-- Spellfire Gloves -- 26753
	AddRecipe(26753,365,21847,1,1,365,375,380,385,26797)
	self:addTradeFlags(RecipeDB,26753,1,2,4,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,26753,2,22213,2,29511)

	-- Spellfire Robe -- 26754
	AddRecipe(26754,375,21848,1,1,375,385,390,395,26797)
	self:addTradeFlags(RecipeDB,26754,1,2,4,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,26754,2,22213,2,29511)

	-- Spellfire Bag -- 26755
	AddRecipe(26755,375,21858,3,1,375,385,390,395)
	self:addTradeFlags(RecipeDB,26755,1,2,4,11,36,41)
	self:addTradeAcquire(RecipeDB,26755,3,20134,3,20135,2,22213,2,29511)

	-- Frozen Shadoweave Shoulders -- 26756
	AddRecipe(26756,355,21869,1,1,355,365,370,375,26801)
	self:addTradeFlags(RecipeDB,26756,1,2,4,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,26756,2,22212,2,29510)

	-- Frozen Shadoweave Boots -- 26757
	AddRecipe(26757,365,21870,1,1,365,375,380,385,26801)
	self:addTradeFlags(RecipeDB,26757,1,2,4,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,26757,2,22212,2,29510)

	-- Frozen Shadoweave Robe -- 26758
	AddRecipe(26758,375,21871,1,1,375,385,390,395,26801)
	self:addTradeFlags(RecipeDB,26758,1,2,4,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,26758,2,22212,2,29510)

	-- Ebon Shadowbag -- 26759
	AddRecipe(26759,375,21872,3,1,375,385,390,395)
	self:addTradeFlags(RecipeDB,26759,1,2,4,F_WARLOCK,36,41)
	self:addTradeAcquire(RecipeDB,26759,2,22212,2,29510)

	-- Primal Mooncloth Belt -- 26760
	AddRecipe(26760,355,21873,1,1,355,365,370,375,26798)
	self:addTradeFlags(RecipeDB,26760,1,2,4,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,26760,2,22208,2,29512)

	-- Primal Mooncloth Shoulders -- 26761
	AddRecipe(26761,365,21874,1,1,365,375,380,385,26798)
	self:addTradeFlags(RecipeDB,26761,1,2,4,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,26761,2,22208,2,29512)

	-- Primal Mooncloth Robe -- 26762
	AddRecipe(26762,375,21875,1,1,375,385,390,395,26798)
	self:addTradeFlags(RecipeDB,26762,1,2,4,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,26762,2,22208,2,29512)

	-- Primal Mooncloth Bag -- 26763
	AddRecipe(26763,375,21876,3,1,375,385,390,395)
	self:addTradeFlags(RecipeDB,26763,1,2,4,11,36,41)
	self:addTradeAcquire(RecipeDB,26763,3,18872,2,22208,2,29512)

	-- Netherweave Bracers -- 26764
	AddRecipe(26764,310,21849,1,1,310,320,325,330)
	self:addTradeFlags(RecipeDB,26764,1,2,3,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,26764,1,18749,1,18772,1,28699,1,33580,1,27001,1,33613,1,
	33636,1,26914,1,26969,1,26964,1,33684)

	-- Netherweave Belt -- 26765
	AddRecipe(26765,310,21850,1,1,310,320,325,330)
	self:addTradeFlags(RecipeDB,26765,1,2,3,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,26765,1,18749,1,18772,1,28699,1,33580,1,27001,1,33613,1,
	33636,1,26914,1,26969,1,26964,1,33684)

	-- Netherweave Gloves -- 26770
	AddRecipe(26770,320,21851,1,1,320,330,335,340)
	self:addTradeFlags(RecipeDB,26770,1,2,3,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,26770,1,18749,1,18772,1,28699,1,33580,1,27001,1,33613,1,
	33636,1,26914,1,26969,1,26964,1,33684)

	-- Netherweave Pants -- 26771
	AddRecipe(26771,325,21852,1,1,325,335,340,345)
	self:addTradeFlags(RecipeDB,26771,1,2,3,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,26771,1,18749,1,18772,1,28699,1,33580,1,27001,1,33613,1,
	33636,1,26914,1,26969,1,26964,1,33684)

	-- Netherweave Boots -- 26772
	AddRecipe(26772,335,21853,1,1,335,345,350,355)
	self:addTradeFlags(RecipeDB,26772,1,2,3,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,26772,1,18749,1,18772,1,28699,1,33580,1,27001,1,33613,1,
	33636,1,26914,1,26969,1,26964,1,33684)

	-- Netherweave Robe -- 26773
	AddRecipe(26773,340,21854,1,1,340,350,355,360)
	self:addTradeFlags(RecipeDB,26773,1,2,4,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,26773,2,16638,2,16767,2,19213)

	-- Netherweave Tunic -- 26774
	AddRecipe(26774,345,21855,1,1,345,355,360,365)
	self:addTradeFlags(RecipeDB,26774,1,2,4,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,26774,2,16638,2,16767,2,19213)

	-- Imbued Netherweave Pants -- 26775
	AddRecipe(26775,340,21859,1,1,340,350,355,360)
	self:addTradeFlags(RecipeDB,26775,1,2,4,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,26775,2,18011,2,19722)

	-- Imbued Netherweave Boots -- 26776
	AddRecipe(26776,350,21860,1,1,350,360,365,370)
	self:addTradeFlags(RecipeDB,26776,1,2,4,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,26776,2,18011,2,19722)

	-- Imbued Netherweave Robe -- 26777
	AddRecipe(26777,360,21861,1,1,360,370,375,380)
	self:addTradeFlags(RecipeDB,26777,1,2,4,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,26777,2,19521)

	-- Imbued Netherweave Tunic -- 26778
	AddRecipe(26778,360,21862,1,1,360,370,375,380)
	self:addTradeFlags(RecipeDB,26778,1,2,4,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,26778,2,19521)

	-- Soulcloth Gloves -- 26779
	AddRecipe(26779,355,21863,1,1,355,365,370,375)
	self:addTradeFlags(RecipeDB,26779,1,2,4,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,26779,2,19015,2,19017)

	-- Soulcloth Shoulders -- 26780
	AddRecipe(26780,365,21864,4,1,365,375,380,385)
	self:addTradeFlags(RecipeDB,26780,1,2,6,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,26780,3,16406)

	-- Soulcloth Vest -- 26781
	AddRecipe(26781,375,21865,4,1,375,380,382,385)
	self:addTradeFlags(RecipeDB,26781,1,2,6,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,26781,3,16408)

	-- Arcanoweave Bracers -- 26782
	AddRecipe(26782,350,21866,2,1,350,360,365,370)
	self:addTradeFlags(RecipeDB,26782,1,2,5,36,41,56)
	self:addTradeAcquire(RecipeDB,26782,3,20869)

	-- Arcanoweave Boots -- 26783
	AddRecipe(26783,360,21867,2,1,360,370,375,380)
	self:addTradeFlags(RecipeDB,26783,1,2,5,36,41,56)
	self:addTradeAcquire(RecipeDB,26783,3,19168)

	-- Arcanoweave Robe -- 26784
	AddRecipe(26784,370,21868,2,1,370,380,385,390)
	self:addTradeFlags(RecipeDB,26784,1,2,5,36,41,56)
	self:addTradeAcquire(RecipeDB,26784,3,19220)

	-- Enchanted Mageweave Pouch -- 27658
	AddRecipe(27658,225,22246,1,1,225,240,255,270)
	self:addTradeFlags(RecipeDB,27658,1,2,4,36,40)
	self:addTradeAcquire(RecipeDB,27658,2,1318,2,3012,2,3346,2,4228,2,4617,2,5158,2,5757,2,
	5758,2,15419,2,16635,2,16722,2,18753,2,18773,2,18951,2,19234,2,19537,2,19540,2,19663,2,26569,
	2,27030,2,27054,2,27147,2,28714)

	-- Enchanted Runecloth Bag -- 27659
	AddRecipe(27659,275,22248,1,GAME_ORIG,275,290,305,320)
	self:addTradeFlags(RecipeDB,27659,1,2,4,36,40)
	self:addTradeAcquire(RecipeDB,27659,2,15419)

	-- Big Bag of Enchantment -- 27660
	AddRecipe(27660,300,22249,2,GAME_ORIG,300,315,330,345)
	self:addTradeFlags(RecipeDB,27660,1,2,5,36,40)
	self:addTradeAcquire(RecipeDB,27660,3,11487)

	-- Cenarion Herb Bag -- 27724
	AddRecipe(27724,275,22251,1,GAME_ORIG,275,290,305,320)
	self:addTradeFlags(RecipeDB,27724,1,2,4,36,41,97)
	self:addTradeAcquire(RecipeDB,27724,6,609,1,15179)

	-- Satchel of Cenarius -- 27725
	AddRecipe(27725,300,22252,1,GAME_ORIG,300,315,330,345)
	self:addTradeFlags(RecipeDB,27725,1,2,4,36,41,97)
	self:addTradeAcquire(RecipeDB,27725,6,609,3,15179)

	-- Glacial Gloves -- 28205
	AddRecipe(28205,300,22654,4,GAME_ORIG,300,315,330,345)
	self:addTradeFlags(RecipeDB,28205,1,2,4,6,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,28205,6,529,3,16365,8,41)

	-- Glacial Vest -- 28207
	AddRecipe(28207,300,22652,4,GAME_ORIG,300,315,330,345)
	self:addTradeFlags(RecipeDB,28207,1,2,4,6,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,28207,6,529,4,16365,8,41)

	-- Glacial Cloak -- 28208
	AddRecipe(28208,300,22658,4,GAME_ORIG,300,315,330,345)
	self:addTradeFlags(RecipeDB,28208,1,2,4,6,36,41,60)
	self:addTradeAcquire(RecipeDB,28208,6,529,2,16365,8,41)

	-- Glacial Wrists -- 28209
	AddRecipe(28209,300,22655,4,GAME_ORIG,300,315,330,345)
	self:addTradeFlags(RecipeDB,28209,1,2,4,6,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,28209,6,529,3,16365,8,41)

	-- Gaea's Embrace -- 28210
	AddRecipe(28210,300,22660,1,GAME_ORIG,300,315,330,345)
	self:addTradeFlags(RecipeDB,28210,1,2,4,36,41,60,97)
	self:addTradeAcquire(RecipeDB,28210,6,609,3,15179)

	-- Sylvan Vest -- 28480
	AddRecipe(28480,300,22756,1,GAME_ORIG,300,315,330,345)
	self:addTradeFlags(RecipeDB,28480,1,2,4,36,41,53,54,56,97)
	self:addTradeAcquire(RecipeDB,28480,6,609,3,15179)

	-- Sylvan Crown -- 28481
	AddRecipe(28481,300,22757,1,GAME_ORIG,300,315,330,345)
	self:addTradeFlags(RecipeDB,28481,1,2,4,36,41,56,53,54,97)
	self:addTradeAcquire(RecipeDB,28481,6,609,2,15179)

	-- Sylvan Shoulders -- 28482
	AddRecipe(28482,300,22758,1,GAME_ORIG,300,315,330,345)
	self:addTradeFlags(RecipeDB,28482,1,2,4,36,41,53,54,56,97)
	self:addTradeAcquire(RecipeDB,28482,6,609,1,15179)

	-- Spellcloth -- 31373
	AddRecipe(31373,350,24271,1,1,350,350,355,360)
	self:addTradeFlags(RecipeDB,31373,1,2,4,36,40,56)
	self:addTradeAcquire(RecipeDB,31373,2,22213,2,29511)

	-- Mystic Spellthread -- 31430
	AddRecipe(31430,335,24273,1,1,335,345,350,355)
	self:addTradeFlags(RecipeDB,31430,1,2,4,36,41,53,54,110)
	self:addTradeAcquire(RecipeDB,31430,6,934,2,19331)

	-- Silver Spellthread -- 31431
	AddRecipe(31431,335,24275,1,1,335,345,350,355)
	self:addTradeFlags(RecipeDB,31431,1,4,36,41,53,54,101)
	self:addTradeAcquire(RecipeDB,31431,6,932,2,19321)

	-- Runic Spellthread -- 31432
	AddRecipe(31432,375,24274,1,1,375,385,390,395)
	self:addTradeFlags(RecipeDB,31432,1,2,4,36,41,53,54,110)
	self:addTradeAcquire(RecipeDB,31432,6,934,4,19331)

	-- Golden Spellthread -- 31433
	AddRecipe(31433,375,24276,1,1,375,385,390,395)
	self:addTradeFlags(RecipeDB,31433,1,4,36,41,53,54,101)
	self:addTradeAcquire(RecipeDB,31433,6,932,4,19321)

	-- Unyielding Bracers -- 31434
	AddRecipe(31434,350,24249,3,1,350,360,365,370)
	self:addTradeFlags(RecipeDB,31434,1,2,11,36,41,56)
	self:addTradeAcquire(RecipeDB,31434,3,24664)

	-- Bracers of Havok -- 31435
	AddRecipe(31435,350,24250,3,1,350,360,365,370)
	self:addTradeFlags(RecipeDB,31435,1,2,10,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,31435,7,3)

	-- Blackstrike Bracers -- 31437
	AddRecipe(31437,350,24251,3,1,350,360,365,370)
	self:addTradeFlags(RecipeDB,31437,1,2,10,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,31437,7,3)

	-- Cloak of the Black Void -- 31438
	AddRecipe(31438,350,24252,3,1,350,360,365,370)
	self:addTradeFlags(RecipeDB,31438,1,2,10,36,40,53,54,60)
	self:addTradeAcquire(RecipeDB,31438,7,3)

	-- Cloak of Eternity -- 31440
	AddRecipe(31440,350,24253,3,1,350,360,365,370)
	self:addTradeFlags(RecipeDB,31440,1,2,10,36,40,52,60)
	self:addTradeAcquire(RecipeDB,31440,7,3)

	-- White Remedy Cape -- 31441
	AddRecipe(31441,350,24254,3,1,350,360,365,370)
	self:addTradeFlags(RecipeDB,31441,1,2,10,36,40,53,54,60)
	self:addTradeAcquire(RecipeDB,31441,7,3)

	-- Unyielding Girdle -- 31442
	AddRecipe(31442,365,24255,4,1,365,375,380,385)
	self:addTradeFlags(RecipeDB,31442,1,2,11,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,31442,3,24664)

	-- Girdle of Ruination -- 31443
	AddRecipe(31443,365,24256,4,1,365,375,380,385)
	self:addTradeFlags(RecipeDB,31443,1,2,10,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,31443,7,4)

	-- Black Belt of Knowledge -- 31444
	AddRecipe(31444,365,24257,4,1,365,375,380,385)
	self:addTradeFlags(RecipeDB,31444,1,2,10,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,31444,7,4)

	-- Resolute Cape -- 31448
	AddRecipe(31448,365,24258,4,1,365,375,380,385)
	self:addTradeFlags(RecipeDB,31448,1,2,10,36,40,60)
	self:addTradeAcquire(RecipeDB,31448,7,4)

	-- Vengeance Wrap -- 31449
	AddRecipe(31449,365,24259,4,1,365,375,380,385)
	self:addTradeFlags(RecipeDB,31449,1,2,10,36,40,51,60)
	self:addTradeAcquire(RecipeDB,31449,7,4)

	-- Manaweave Cloak -- 31450
	AddRecipe(31450,365,24260,4,1,365,375,380,385)
	self:addTradeFlags(RecipeDB,31450,1,2,10,36,40,53,54,60)
	self:addTradeAcquire(RecipeDB,31450,7,4)

	-- Whitemend Pants -- 31451
	AddRecipe(31451,375,24261,4,1,375,385,390,395)
	self:addTradeFlags(RecipeDB,31451,1,2,5,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,31451,3,20885)

	-- Spellstrike Pants -- 31452
	AddRecipe(31452,375,24262,4,1,375,385,390,395)
	self:addTradeFlags(RecipeDB,31452,1,2,5,11,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,31452,3,18708)

	-- Battlecast Pants -- 31453
	AddRecipe(31453,375,24263,4,1,375,385,390,395)
	self:addTradeFlags(RecipeDB,31453,1,2,5,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,31453,3,17978)

	-- Whitemend Hood -- 31454
	AddRecipe(31454,375,24264,4,1,375,385,390,395)
	self:addTradeFlags(RecipeDB,31454,1,2,5,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,31454,3,17977)

	-- Spellstrike Hood -- 31455
	AddRecipe(31455,375,24266,4,1,375,385,390,395)
	self:addTradeFlags(RecipeDB,31455,1,2,5,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,31455,3,16807)

	-- Battlecast Hood -- 31456
	AddRecipe(31456,375,24267,4,1,375,385,390,395)
	self:addTradeFlags(RecipeDB,31456,1,2,5,11,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,31456,3,17798)

	-- Bag of Jewels -- 31459
	AddRecipe(31459,340,24270,1,1,340,350,355,360)
	self:addTradeFlags(RecipeDB,31459,1,2,4,36,41,105)
	self:addTradeAcquire(RecipeDB,31459,6,933,2,20242,6,933,2,23007)

	-- Netherweave Net -- 31460
	AddRecipe(31460,300,24268,1,1,300,300,310,320)
	self:addTradeFlags(RecipeDB,31460,1,2,3,36,41)
	self:addTradeAcquire(RecipeDB,31460,1,18749,1,18772,1,28699,1,33580,1,27001,1,
	33613,1,33636,1,26914,1,26969,1,26964,1,33684)

	-- Belt of Blasting -- 36315
	AddRecipe(36315,375,30038,4,1,375,385,390,395)
	self:addTradeFlags(RecipeDB,36315,1,2,6,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,36315,8,37,8,43)

	-- Belt of the Long Road -- 36316
	AddRecipe(36316,375,30036,4,1,375,385,390,395)
	self:addTradeFlags(RecipeDB,36316,1,2,6,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,36316,8,37,8,43)

	-- Boots of Blasting -- 36317
	AddRecipe(36317,375,30037,4,1,375,385,390,395)
	self:addTradeFlags(RecipeDB,36317,1,2,6,37,41,53,54,56)
	self:addTradeAcquire(RecipeDB,36317,8,37,8,43)

	-- Boots of the Long Road -- 36318
	AddRecipe(36318,375,30035,4,1,375,385,390,395)
	self:addTradeFlags(RecipeDB,36318,1,2,6,37,41,53,54,56)
	self:addTradeAcquire(RecipeDB,36318,8,37,8,43)

	-- Shadowcloth -- 36686
	AddRecipe(36686,350,24272,1,1,350,350,355,360)
	self:addTradeFlags(RecipeDB,36686,1,2,4,36,40,56)
	self:addTradeAcquire(RecipeDB,36686,2,22212,2,29510)

	-- Cloak of Arcane Evasion -- 37873
	AddRecipe(37873,350,30831,1,1,350,360,365,370)
	self:addTradeFlags(RecipeDB,37873,1,2,4,36,41,60,107)
	self:addTradeAcquire(RecipeDB,37873,6,1011,2,21655)

	-- Flameheart Bracers -- 37882
	AddRecipe(37882,350,30837,1,1,350,360,365,370)
	self:addTradeFlags(RecipeDB,37882,1,4,36,41,56,101)
	self:addTradeAcquire(RecipeDB,37882,6,932,1,19321)

	-- Flameheart Gloves -- 37883
	AddRecipe(37883,360,30838,1,1,360,370,375,380)
	self:addTradeFlags(RecipeDB,37883,1,4,36,41,56,101)
	self:addTradeAcquire(RecipeDB,37883,6,932,2,19321)

	-- Flameheart Vest -- 37884
	AddRecipe(37884,370,30839,1,1,370,380,385,390)
	self:addTradeFlags(RecipeDB,37884,1,4,36,41,56,101)
	self:addTradeAcquire(RecipeDB,37884,6,932,4,19321)

	-- Soulguard Slippers -- 40020
	AddRecipe(40020,375,32391,1,1,375,385,390,395)
	self:addTradeFlags(RecipeDB,40020,1,2,4,36,41,56,102)
	self:addTradeAcquire(RecipeDB,40020,6,1012,2,23159)

	-- Soulguard Bracers -- 40021
	AddRecipe(40021,375,32392,1,1,375,385,390,395)
	self:addTradeFlags(RecipeDB,40021,1,2,4,36,41,56,102)
	self:addTradeAcquire(RecipeDB,40021,6,1012,1,23159)

	-- Soulguard Leggings -- 40023
	AddRecipe(40023,375,32389,1,1,375,385,390,395)
	self:addTradeFlags(RecipeDB,40023,1,2,4,36,41,56,102)
	self:addTradeAcquire(RecipeDB,40023,6,1012,2,23159)

	-- Soulguard Girdle -- 40024
	AddRecipe(40024,375,32390,1,1,375,385,390,395)
	self:addTradeFlags(RecipeDB,40024,1,2,4,36,41,56,102)
	self:addTradeAcquire(RecipeDB,40024,6,1012,1,23159)

	-- Night's End -- 40060
	AddRecipe(40060,375,32420,1,1,375,385,390,395)
	self:addTradeFlags(RecipeDB,40060,1,2,4,36,41,60,102)
	self:addTradeAcquire(RecipeDB,40060,6,1012,2,23159)

	-- Bracers of Nimble Thought -- 41205
	AddRecipe(41205,375,32586,4,1,375,385,390,395)
	self:addTradeFlags(RecipeDB,41205,1,2,10,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,41205,8,27,8,34)

	-- Mantle of Nimble Thought -- 41206
	AddRecipe(41206,375,32587,4,1,375,385,390,395)
	self:addTradeFlags(RecipeDB,41206,1,2,6,37,41,53,54,56)
	self:addTradeAcquire(RecipeDB,41206,8,27,8,34)

	-- Swiftheal Wraps -- 41207
	AddRecipe(41207,375,32584,4,1,375,385,390,395)
	self:addTradeFlags(RecipeDB,41207,1,2,6,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,41207,8,27,8,34)

	-- Swiftheal Mantle -- 41208
	AddRecipe(41208,375,32585,4,1,375,385,390,395)
	self:addTradeFlags(RecipeDB,41208,1,2,10,37,41,53,54,56)
	self:addTradeAcquire(RecipeDB,41208,7,4)

	-- Green Winter Clothes -- 44950
	AddRecipe(44950,250,34087,2,1,250,250,250,250)
	self:addTradeFlags(RecipeDB,44950,1,2,4,7,36,41,56)
	self:addTradeAcquire(RecipeDB,44950,2,13420, A_SEASONAL, 1)

	-- Red Winter Clothes -- 44958
	AddRecipe(44958,250,34085,2,1,250,250,250,250)
	self:addTradeFlags(RecipeDB,44958,1,2,4,7,36,41,56)
	self:addTradeAcquire(RecipeDB,44958,2,13433, A_SEASONAL, 1)

	-- Sunfire Handwraps -- 46128
	AddRecipe(46128,365,34366,4,1,365,375,392,410)
	self:addTradeFlags(RecipeDB,46128,1,2,6,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,46128,8,24)

	-- Hands of Eternal Light -- 46129
	AddRecipe(46129,365,34367,4,1,365,375,392,410)
	self:addTradeFlags(RecipeDB,46129,1,2,6,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,46129,8,24)

	-- Sunfire Robe -- 46130
	AddRecipe(46130,365,34364,4,1,365,375,392,410)
	self:addTradeFlags(RecipeDB,46130,1,2,6,37,41,53,54,56)
	self:addTradeAcquire(RecipeDB,46130,8,24)

	-- Robe of Eternal Light -- 46131
	AddRecipe(46131,365,34365,4,1,365,375,392,410)
	self:addTradeFlags(RecipeDB,46131,1,2,6,37,41,53,54,56)
	self:addTradeAcquire(RecipeDB,46131,8,24)

	-- Dress Shoes -- 49677
	AddRecipe(49677,250,6836,1,1,250,255,270,285)
	self:addTradeFlags(RecipeDB,49677,1,2,4,36,40,56)
	self:addTradeAcquire(RecipeDB,49677,2,15165)

	-- Mycah's Botanical Bag -- 50194
	AddRecipe(50194,375,38225,1,1,375,385,390,395)
	self:addTradeFlags(RecipeDB,50194,1,2,4,36,41,113)
	self:addTradeAcquire(RecipeDB,50194,6,970,3,18382)

	-- Haliscan Jacket -- 50644
	AddRecipe(50644,250,38277,1,1,250,265,280,295)
	self:addTradeFlags(RecipeDB,50644,1,2,4,36,40,56)
	self:addTradeAcquire(RecipeDB,50644,2,15165)

	-- Haliscan Pantaloons -- 50647
	AddRecipe(50647,245,38278,1,1,245,250,255,260)
	self:addTradeFlags(RecipeDB,50647,1,2,4,36,40,56)
	self:addTradeAcquire(RecipeDB,50647,2,15165)

	-- Lightweave Embroidery -- 55642
	AddRecipe(55642,420,nil,1,2,420,420,420,420)
	self:addTradeFlags(RecipeDB,55642,1,2,3,36,41,53,54,60)
	self:addTradeAcquire(RecipeDB,55642,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Darkglow Embroidery -- 55769
	AddRecipe(55769,420,nil,1,2,420,420,420,420)
	self:addTradeFlags(RecipeDB,55769,1,2,3,36,41,60)
	self:addTradeAcquire(RecipeDB,55769,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Swordguard Embroidery -- 55777
	AddRecipe(55777,420,nil,1,2,420,420,420,420)
	self:addTradeFlags(RecipeDB,55777,1,2,3,36,41,51,60)
	self:addTradeAcquire(RecipeDB,55777,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Frostweave Net -- 55898
	AddRecipe(55898,360,41509,1,2,360,370,375,380)
	self:addTradeFlags(RecipeDB,55898,1,2,3,36,41)
	self:addTradeAcquire(RecipeDB,55898,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Bolt of Frostweave -- 55899
	AddRecipe(55899,350,41510,1,2,350,370,372,375)
	self:addTradeFlags(RecipeDB,55899,1,2,3,36,41)
	self:addTradeAcquire(RecipeDB,55899,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Bolt of Imbued Frostweave -- 55900
	AddRecipe(55900,400,41511,1,2,400,400,402,405)
	self:addTradeFlags(RecipeDB,55900,1,2,3,36,41)
	self:addTradeAcquire(RecipeDB,55900,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Duskweave Leggings -- 55901
	AddRecipe(55901,395,41548,2,2,395,405,410,415)
	self:addTradeFlags(RecipeDB,55901,1,2,3,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,55901,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Frostwoven Shoulders -- 55902
	AddRecipe(55902,350,41513,2,2,350,360,370,380)
	self:addTradeFlags(RecipeDB,55902,1,2,3,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,55902,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Frostwoven Robe -- 55903
	AddRecipe(55903,360,41515,2,2,360,370,380,390)
	self:addTradeFlags(RecipeDB,55903,1,2,3,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,55903,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Frostwoven Gloves -- 55904
	AddRecipe(55904,360,44211,1,2,360,370,380,390)
	self:addTradeFlags(RecipeDB,55904,1,2,3,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,55904,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Frostwoven Boots -- 55906
	AddRecipe(55906,375,41520,2,2,375,385,395,405)
	self:addTradeFlags(RecipeDB,55906,1,2,3,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,55906,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Frostwoven Cowl -- 55907
	AddRecipe(55907,380,41521,2,2)
	self:addTradeFlags(RecipeDB,55907,1,2,3,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,55907,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Frostwoven Belt -- 55908
	AddRecipe(55908,370,41522,2,2,370,380,390,400)
	self:addTradeFlags(RecipeDB,55908,1,2,3,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,55908,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Mystic Frostwoven Shoulders -- 55910
	AddRecipe(55910,385,41523,3,2,385,395,405,415)
	self:addTradeFlags(RecipeDB,55910,1,2,3,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,55910,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Mystic Frostwoven Robe -- 55911
	AddRecipe(55911,390,41525,3,2,390,400,410,420)
	self:addTradeFlags(RecipeDB,55911,1,2,3,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,55911,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Mystic Frostwoven Wristwraps -- 55913
	AddRecipe(55913,385,41528,3,2,385,395,405,415)
	self:addTradeFlags(RecipeDB,55913,1,2,3,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,55913,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Duskweave Belt -- 55914
	AddRecipe(55914,395,41543,2,2,395,400,405,410)
	self:addTradeFlags(RecipeDB,55914,1,2,3,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,55914,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Duskweave Cowl -- 55919
	AddRecipe(55919,395,41546,2,2,395,405,410,415)
	self:addTradeFlags(RecipeDB,55919,1,2,3,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,55919,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Duskweave Wristwraps -- 55920
	AddRecipe(55920,400,41551,2,2,400,410,415,420)
	self:addTradeFlags(RecipeDB,55920,1,2,3,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,55920,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Duskweave Robe -- 55921
	AddRecipe(55921,405,41549,2,2,405,415,420,425)
	self:addTradeFlags(RecipeDB,55921,1,2,3,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,55921,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Duskweave Gloves -- 55922
	AddRecipe(55922,405,41545,2,2,405,415,420,425)
	self:addTradeFlags(RecipeDB,55922,1,2,3,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,55922,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Duskweave Shoulders -- 55923
	AddRecipe(55923,410,41550,2,2,410,420,425,430)
	self:addTradeFlags(RecipeDB,55923,1,2,3,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,55923,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Black Duskweave Leggings -- 55925
	AddRecipe(55925,415,41553,3,2,415,425,430,435)
	self:addTradeFlags(RecipeDB,55925,1,2,3,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,55925,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Black Duskweave Robe -- 55941
	AddRecipe(55941,420,41554,3,2,420,430,435,440)
	self:addTradeFlags(RecipeDB,55941,1,2,3,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,55941,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Black Duskweave Wristwraps -- 55943
	AddRecipe(55943,415,41555,3,2,415,425,430,435)
	self:addTradeFlags(RecipeDB,55943,1,2,3,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,55943,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Red Lumberjack Shirt -- 55993
	AddRecipe(55993,400,41248,2,2,400,400,405,410)
	self:addTradeFlags(RecipeDB,55993,1,2,10,36,40)
	self:addTradeAcquire(RecipeDB,55993,7,2)

	-- Blue Lumberjack Shirt -- 55994
	AddRecipe(55994,400,41249,2,2,400,400,405,410)
	self:addTradeFlags(RecipeDB,55994,1,2,10,36,40)
	self:addTradeAcquire(RecipeDB,55994,7,2)

	-- Yellow Lumberjack Shirt -- 55995
	AddRecipe(55995,400,41251,1,2,400,400,405,410)
	self:addTradeFlags(RecipeDB,55995,1,2,3,36,41)
	self:addTradeAcquire(RecipeDB,55995,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Green Lumberjack Shirt -- 55996
	AddRecipe(55996,400,41250,2,2,400,400,405,410)
	self:addTradeFlags(RecipeDB,55996,1,2,10,36,40)
	self:addTradeAcquire(RecipeDB,55996,7,2)

	-- Red Workman's Shirt -- 55997
	AddRecipe(55997,400,41252,2,2,400,400,405,410)
	self:addTradeFlags(RecipeDB,55997,1,2,10,36,40)
	self:addTradeAcquire(RecipeDB,55997,7,2)

	-- Blue Workman's Shirt -- 55998
	AddRecipe(55998,400,41253,2,2,400,400,405,410)
	self:addTradeFlags(RecipeDB,55998,1,2,10,36,40)
	self:addTradeAcquire(RecipeDB,55998,7,2)

	-- Rustic Workman's Shirt -- 55999
	AddRecipe(55999,400,41254,2,2,400,400,405,410)
	self:addTradeFlags(RecipeDB,55999,1,2,10,36,40)
	self:addTradeAcquire(RecipeDB,55999,7,2)

	-- Green Workman's Shirt -- 56000
	AddRecipe(56000,400,41255,1,2,400,400,405,410)
	self:addTradeFlags(RecipeDB,56000,1,2,3,36,41)
	self:addTradeAcquire(RecipeDB,56000,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Moonshroud -- 56001
	AddRecipe(56001,415,41594,3,2,415,425,430,435)
	self:addTradeFlags(RecipeDB,56001,1,2,3,36,41)
	self:addTradeAcquire(RecipeDB,56001,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Ebonweave -- 56002
	AddRecipe(56002,415,41593,3,2,415,425,430,435)
	self:addTradeFlags(RecipeDB,56002,1,2,3,36,41)
	self:addTradeAcquire(RecipeDB,56002,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Spellweave -- 56003
	AddRecipe(56003,415,41595,3,2,415,425,430,435)
	self:addTradeFlags(RecipeDB,56003,1,2,3,36,41)
	self:addTradeAcquire(RecipeDB,56003,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Abyssal Bag -- 56004
	AddRecipe(56004,435,41597,1,2,435,440,445,450)
	self:addTradeFlags(RecipeDB,56004,1,2,4,F_WARLOCK,36,41,117)
	self:addTradeAcquire(RecipeDB,56004,6,1098,3,32538)

	-- Glacial Bag -- 56005
	AddRecipe(56005,445,41600,1,2,445,450,455,460)
	self:addTradeFlags(RecipeDB,56005,1,2,4,36,41,119)
	self:addTradeAcquire(RecipeDB,56005,6,1119,4,32540)

	-- Mysterious Bag -- 56006
	AddRecipe(56006,440,41598,1,2,440,445,450,455)
	self:addTradeFlags(RecipeDB,56006,1,2,4,36,41,122)
	self:addTradeAcquire(RecipeDB,56006,6,1091,3,32533)

	-- Frostweave Bag -- 56007
	AddRecipe(56007,410,41599,2,2,410,430,440,450)
	self:addTradeFlags(RecipeDB,56007,1,2,3,36,41)
	self:addTradeAcquire(RecipeDB,56007,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Shining Spellthread -- 56008
	AddRecipe(56008,400,41601,3,2,400,400,405,410)
	self:addTradeFlags(RecipeDB,56008,1,2,3,36,41,53,54)
	self:addTradeAcquire(RecipeDB,56008,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Brilliant Spellthread -- 56009
	AddRecipe(56009,430,41602,1,2,430,435,440,445)
	self:addTradeFlags(RecipeDB,56009,1,2,4,36,41,53,54,115)
	self:addTradeAcquire(RecipeDB,56009,6,1106,4,30431)

	-- Azure Spellthread -- 56010
	AddRecipe(56010,400,41603,3,2,400,400,405,410)
	self:addTradeFlags(RecipeDB,56010,1,2,3,36,41,53,54)
	self:addTradeAcquire(RecipeDB,56010,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Sapphire Spellthread -- 56011
	AddRecipe(56011,430,41604,1,2,430,435,440,445)
	self:addTradeFlags(RecipeDB,56011,1,2,4,36,41,53,54,118)
	self:addTradeAcquire(RecipeDB,56011,6,1090,4,32287)

	-- Cloak of the Moon -- 56014
	AddRecipe(56014,390,41607,2,2,390,395,400,405)
	self:addTradeFlags(RecipeDB,56014,1,2,3,36,41,53,54,60)
	self:addTradeAcquire(RecipeDB,56014,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Cloak of Frozen Spirits -- 56015
	AddRecipe(56015,395,41608,1,2,395,400,405,410)
	self:addTradeFlags(RecipeDB,56015,1,2,3,36,41,53,54,60)
	self:addTradeAcquire(RecipeDB,56015,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Wispcloak -- 56016
	AddRecipe(56016,420,41609,1,2,420,435,445,455)
	self:addTradeFlags(RecipeDB,56016,1,2,3,36,41,53,54,60)
	self:addTradeAcquire(RecipeDB,56016,1,26914,1,26964,1,26969)

	-- Deathchill Cloak -- 56017
	AddRecipe(56017,420,41610,1,2,420,435,445,455)
	self:addTradeFlags(RecipeDB,56017,1,2,3,36,41,53,54,60)
	self:addTradeAcquire(RecipeDB,56017,1,26914,1,26964,1,26969)

	-- Hat of Wintry Doom -- 56018
	AddRecipe(56018,425,41984,1,2,425,435,440,445)
	self:addTradeFlags(RecipeDB,56018,1,2,3,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,56018,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Silky Iceshard Boots -- 56019
	AddRecipe(56019,420,41985,1,2,420,430,440,450)
	self:addTradeFlags(RecipeDB,56019,1,2,3,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,56019,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Deep Frozen Cord -- 56020
	AddRecipe(56020,420,41986,1,2,420,430,440,450)
	self:addTradeFlags(RecipeDB,56020,1,2,3,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,56020,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Frostmoon Pants -- 56021
	AddRecipe(56021,425,42093,1,2,425,435,440,445)
	self:addTradeFlags(RecipeDB,56021,1,2,3,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,56021,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Light Blessed Mittens -- 56022
	AddRecipe(56022,420,42095,1,2,420,403,440,450)
	self:addTradeFlags(RecipeDB,56022,1,2,3,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,56022,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Aurora Slippers -- 56023
	AddRecipe(56023,420,42096,1,2,420,430,440,450)
	self:addTradeFlags(RecipeDB,56023,1,2,3,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,56023,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Moonshroud Robe -- 56024
	AddRecipe(56024,440,42100,4,2,440,450,455,460)
	self:addTradeFlags(RecipeDB,56024,1,2,3,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,56024,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Moonshroud Gloves -- 56025
	AddRecipe(56025,435,42103,1,2,435,445,450,455)
	self:addTradeFlags(RecipeDB,56025,1,2,3,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,56025,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Ebonweave Robe -- 56026
	AddRecipe(56026,440,42101,1,2,440,450,455,460)
	self:addTradeFlags(RecipeDB,56026,1,2,3,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,56026,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Ebonweave Gloves -- 56027
	AddRecipe(56027,435,42111,1,2,435,445,450,455)
	self:addTradeFlags(RecipeDB,56027,1,2,3,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,56027,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Spellweave Robe -- 56028
	AddRecipe(56028,440,42102,1,2,440,450,455,460)
	self:addTradeFlags(RecipeDB,56028,1,2,3,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,56028,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Spellweave Gloves -- 56029
	AddRecipe(56029,435,42113,1,2,435,445,450,455)
	self:addTradeFlags(RecipeDB,56029,1,2,3,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,56029,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Frostwoven Leggings -- 56030
	AddRecipe(56030,380,41519,2,2,380,390,400,410)
	self:addTradeFlags(RecipeDB,56030,1,2,3,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,56030,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Frostwoven Wristwraps -- 56031
	AddRecipe(56031,350,41512,2,2,350,360,370,380)
	self:addTradeFlags(RecipeDB,56031,1,2,3,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,56031,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Master's Spellthread -- 56034
	AddRecipe(56034,405,nil,1,2,405,405,405,405)
	self:addTradeFlags(RecipeDB,56034,1,2,3,36,41,53,54)
	self:addTradeAcquire(RecipeDB,56034,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Sanctified Spellthread -- 56039
	AddRecipe(56039,405,nil,1,2,405,405,405,405)
	self:addTradeFlags(RecipeDB,56039,1,2,3,36,41,53,54)
	self:addTradeAcquire(RecipeDB,56039,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Frostsavage Belt -- 59582
	AddRecipe(59582,415,43969,1,2,415,425,435,445)
	self:addTradeFlags(RecipeDB,59582,1,2,3,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,59582,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Frostsavage Bracers -- 59583
	AddRecipe(59583,415,43974,1,2,415,425,435,445)
	self:addTradeFlags(RecipeDB,59583,1,2,3,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,59583,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Frostsavage Shoulders -- 59584
	AddRecipe(59584,420,43973,1,2,420,430,440,450)
	self:addTradeFlags(RecipeDB,59584,1,2,3,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,59584,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Frostsavage Boots -- 59585
	AddRecipe(59585,420,43970,1,2,420,430,440,450)
	self:addTradeFlags(RecipeDB,59585,1,2,3,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,59585,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Frostsavage Gloves -- 59586
	AddRecipe(59586,420,41516,2,2,420,430,440,450)
	self:addTradeFlags(RecipeDB,59586,1,2,3,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,59586,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Frostsavage Robe -- 59587
	AddRecipe(59587,420,43972,1,2,420,430,440,450)
	self:addTradeFlags(RecipeDB,59587,1,2,3,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,59587,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Frostsavage Leggings -- 59588
	AddRecipe(59588,420,43975,1,2,420,430,440,450)
	self:addTradeFlags(RecipeDB,59588,1,2,3,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,59588,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Frostsavage Cowl -- 59589
	AddRecipe(59589,420,43971,1,2,420,430,440,450)
	self:addTradeFlags(RecipeDB,59589,1,2,3,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,59589,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Flying Carpet -- 60969
	AddRecipe(60969,410,44554,3,2,410,420,425,430)
	self:addTradeFlags(RecipeDB,60969,1,2,3,36,41)
	self:addTradeAcquire(RecipeDB,60969,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Magnificent Flying Carpet -- 60971
	AddRecipe(60971,425,44558,4,2,425,435,445,455)
	self:addTradeFlags(RecipeDB,60971,1,2,3,37,41)
	self:addTradeAcquire(RecipeDB,60971,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Glacial Waistband -- 60990
	AddRecipe(60990,420,43584,1,2,420,430,440,450)
	self:addTradeFlags(RecipeDB,60990,1,2,3,36,41,56)
	self:addTradeAcquire(RecipeDB,60990,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Glacial Robe -- 60993
	AddRecipe(60993,425,43583,4,2,425,435,445,455)
	self:addTradeFlags(RecipeDB,60993,1,2,3,36,41,56)
	self:addTradeAcquire(RecipeDB,60993,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Glacial Slippers -- 60994
	AddRecipe(60994,420,43585,1,2,420,430,440,450)
	self:addTradeFlags(RecipeDB,60994,1,2,3,36,41,56)
	self:addTradeAcquire(RecipeDB,60994,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Duskweave Boots -- 55924
	AddRecipe(55924,410,41544,1,2,410,410,410,420)
	self:addTradeFlags(RecipeDB,55924,1,2,3,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,55924,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Cord of the White Dawn -- 63205
	AddRecipe(63205,450,45104,4,2,450,455,460,465)
	self:addTradeFlags(RecipeDB,63205,1,2,6,11,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,63205,8,39)

	-- Sash of Ancient Power -- 63203
	AddRecipe(63203,450,45102,4,2,450,455,460,465)
	self:addTradeFlags(RecipeDB,63203,1,2,6,11,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,63203,8,39)

	-- Savior's Slippers -- 63206
	AddRecipe(63206,450,45567,4,2,450,455,460,465)
	self:addTradeFlags(RecipeDB,63206,1,2,6,11,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,63206,8,39)

	-- Spellslinger's Slippers -- 63204
	AddRecipe(63204,450,45566,4,2,450,455,460,465)
	self:addTradeFlags(RecipeDB,63204,1,2,6,11,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,63204,8,39)

	-- Emerald Bag -- 63924
	AddRecipe(63924,435,45773,3,2,435,440,445,450)
	self:addTradeFlags(RecipeDB,63924,1,2,4,36,41,120)
	self:addTradeAcquire(RecipeDB,63924,6,1073,3,31916,6,1073,3,32763)

	-- Cloak of Crimson Snow -- 64730
	AddRecipe(64730,405,45810,1,2,405,410,415,420)
	self:addTradeFlags(RecipeDB,64730,1,2,3,36,41,53,54,60)
	self:addTradeAcquire(RecipeDB,64730,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Frostguard Drape -- 64729
	AddRecipe(64729,400,45811,1,2,400,405,410,415)
	self:addTradeFlags(RecipeDB,64729,1,2,3,36,41,51,60)
	self:addTradeAcquire(RecipeDB,64729,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Spidersilk Drape -- 63742
	AddRecipe(63742,125,45626,1,2,125,150,167,185)
	self:addTradeFlags(RecipeDB,63742,1,2,3,36,41,53,54,60)
	self:addTradeAcquire(RecipeDB,63742,1,26914,1,26964,1,26969,1,27001,1,28699,1,1346,1,4159
	,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,33613,1,33636,1,11052,1,18772,1,
	2399,1,4576,1,17487,1,16640,1,16366,1,5153,1,4193,1,3523,1,33684,1,11557)

	 -- Leggings of Woven Death -- 70550
	 AddRecipe(70550,450,49891,4,2,450,475,487,500)
	 self:addTradeFlags(RecipeDB,70550,F_ALLIANCE,F_HORDE,F_VENDOR,F_ASHEN_VERDICT)
	 self:addTradeAcquire(RecipeDB, 70550, A_REPUTATION, 1156, REVERED, 37687)
	 
	 -- Deathfrost Boots -- 70551
	 AddRecipe(70551,450,49890,4,2,450,475,487,500)
	 self:addTradeFlags(RecipeDB,70551,F_ALLIANCE,F_HORDE,F_VENDOR,F_ASHEN_VERDICT)
	 self:addTradeAcquire(RecipeDB, 70551, A_REPUTATION, 1156, HONORED, 37687)
	 
	 -- Lightweave Leggings -- 70552
	 AddRecipe(70552,450,49892,4,2,450,475,487,500)
	 self:addTradeFlags(RecipeDB,70552,F_ALLIANCE,F_HORDE,F_VENDOR,F_ASHEN_VERDICT)
	 self:addTradeAcquire(RecipeDB, 70552, A_REPUTATION, 1156, REVERED, 37687)
	 
	 -- Sandals of Consecration -- 70553
	 AddRecipe(70553,450,49893,4,2,450,475,487,500)
	 self:addTradeFlags(RecipeDB,70553,F_ALLIANCE,F_HORDE,F_VENDOR,F_ASHEN_VERDICT)
	 self:addTradeAcquire(RecipeDB, 70553, A_REPUTATION, 1156, HONORED, 37687)

	-- Some recipes are only availible to specific factions.
	-- We only add the faction specific recipes if the user is part of that faction
	local BFAC = LibStub("LibBabble-Faction-3.0"):GetLookupTable()
	local _,faction = UnitFactionGroup("player")

	if (faction == BFAC["Alliance"]) then

		-- Bejeweled Wizard's Bracers -- 67079
		AddRecipe(67079,450,47585,3,2,450,460,467,475)
		self:addTradeFlags(RecipeDB,67079,1,6,11,36,40,53,54,56)
		self:addTradeAcquire(RecipeDB,67079,8,42)

		-- Merlin's Robe -- 67066
		AddRecipe(67066,450,47603,3,2,450,460,467,475)
		self:addTradeFlags(RecipeDB,67066,1,6,11,36,40,53,54,56)
		self:addTradeAcquire(RecipeDB,67066,8,42)

		-- Royal Moonshroud Bracers -- 67065
		AddRecipe(67065,450,47587,3,2,450,460,467,475)
		self:addTradeFlags(RecipeDB,67065,1,6,11,36,40,53,54,56)
		self:addTradeAcquire(RecipeDB,67065,8,42)

		-- Royal Moonshroud Robe -- 67064
		AddRecipe(67064,450,47605,3,2,450,460,467,475)
		self:addTradeFlags(RecipeDB,67064,1,6,11,36,40,53,54,56)
		self:addTradeAcquire(RecipeDB,67064,8,42)

	elseif (faction == BFAC["Horde"]) then

		-- Royal Moonshroud Robe -- 67144
		AddRecipe(67144,450,47606,3,2,450,460,467,475)
		self:addTradeFlags(RecipeDB,67144,2,6,11,36,40,53,54,56)
		self:addTradeAcquire(RecipeDB,67144,8,42)

		-- Bejeweled Wizard's Bracers -- 67145
		AddRecipe(67145,450,47586,3,2,450,460,467,475)
		self:addTradeFlags(RecipeDB,67145,2,6,11,36,40,53,54,56)
		self:addTradeAcquire(RecipeDB,67145,8,42)

		-- Merlin's Robe -- 67146
		AddRecipe(67146,450,47604,3,2,450,460,467,475)
		self:addTradeFlags(RecipeDB,67146,2,6,11,36,40,53,54,56)
		self:addTradeAcquire(RecipeDB,67146,8,42)

		-- Royal Moonshroud Bracers -- 67147
		AddRecipe(67147,450,47588,3,2,450,460,467,475)
		self:addTradeFlags(RecipeDB,67147,2,6,11,36,40,53,54,56)
		self:addTradeAcquire(RecipeDB,67147,8,42)

	end

	return num_recipes

end