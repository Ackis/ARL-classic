--[[

************************************************************************

ARL-Trainer.lua

Trainer data for all of Ackis Recipe List

Auto-generated using ARLDataminer.rb
Entries to this file will be overwritten

300 found from data mining.  0 ignored.

************************************************************************

File date: @file-date-iso@ 
File revision: @file-revision@ 
Project revision: @project-revision@
Project version: @project-version@

************************************************************************

Format:

	self:addLookupList(TrainerDB,NPC ID, NPC Name, NPC Location, X Coord, Y Coord, Faction)

************************************************************************

]]--

local MODNAME			= "Ackis Recipe List"
local addon				= LibStub("AceAddon-3.0"):GetAddon(MODNAME)

local L					= LibStub("AceLocale-3.0"):GetLocale(MODNAME)
local BFAC				= LibStub("LibBabble-Faction-3.0"):GetLookupTable()
local BZONE				= LibStub("LibBabble-Zone-3.0"):GetLookupTable()
local BBOSS				= LibStub("LibBabble-Boss-3.0"):GetLookupTable()

function addon:InitTrainer(TrainerDB)

	self:addLookupList(TrainerDB,223,L["Dan Golthas"],BZONE["Undercity"],71.30,60.17,2)
	self:addLookupList(TrainerDB,514,L["Smith Argus"],BZONE["Elwynn Forest"],41.94,65.83,1)
	self:addLookupList(TrainerDB,957,L["Dane Lindgren"],BZONE["Stormwind City"],64.40,37.51,0)
	self:addLookupList(TrainerDB,1103,L["Eldrin"],BZONE["Elwynn Forest"],79.87,68.03,1)
	self:addLookupList(TrainerDB,1215,L["Alchemist Mallory"],BZONE["Elwynn Forest"],40.01,49.15,1)
	self:addLookupList(TrainerDB,1241,L["Tognus Flintfire"],BZONE["Dun Morogh"],46.06,51.95,0)
	self:addLookupList(TrainerDB,1246,L["Vosur Brakthel"],BZONE["Ironforge"],67.90,53.02,1)
	self:addLookupList(TrainerDB,1300,L["Lawrence Schneider"],BZONE["Stormwind City"],53.26,80.97,0)
	self:addLookupList(TrainerDB,1317,L["Lucan Cordell"],BZONE["Stormwind City"],52.91,73.90,0)
	self:addLookupList(TrainerDB,1346,L["Georgio Bolero"],BZONE["Stormwind City"],52.98,81.17,0)
	self:addLookupList(TrainerDB,1355,L["Cook Ghilm"],BZONE["Dun Morogh"],68.35,54.46,1)
	self:addLookupList(TrainerDB,1382,L["Mudduk"],BZONE["Stranglethorn Vale"],31.98,28.77,2)
	self:addLookupList(TrainerDB,1383,L["Snarl"],BZONE["Orgrimmar"],79.93,22.96,0)
	self:addLookupList(TrainerDB,1385,L["Brawn"],BZONE["Stranglethorn Vale"],32.01,29.03,2)
	self:addLookupList(TrainerDB,1386,L["Rogvar"],BZONE["Swamp of Sorrows"],48.41,55.96,0)
	self:addLookupList(TrainerDB,1430,L["Tomas"],BZONE["Elwynn Forest"],43.92,65.96,1)
	self:addLookupList(TrainerDB,1466,L["Gretta Finespindle"],BZONE["Ironforge"],39.97,33.29,1)
	self:addLookupList(TrainerDB,1470,L["Ghak Healtouch"],BZONE["Loch Modan"],37.17,48.95,0)
	self:addLookupList(TrainerDB,1632,L["Adele Fielder"],BZONE["Elwynn Forest"],46.69,63.08,1)
	self:addLookupList(TrainerDB,1676,L["Finbus Geargrind"],BZONE["Duskwood"],77.35,49.01,1)
	self:addLookupList(TrainerDB,1681,L["Brock Stoneseeker"],BZONE["Loch Modan"],37.16,47.76,1)
	self:addLookupList(TrainerDB,1699,L["Gremlock Pilsnor"],BZONE["Dun Morogh"],47.37,51.98,0)
	self:addLookupList(TrainerDB,1701,L["Dank Drizzlecut"],BZONE["Dun Morogh"],68.97,55.28,1)
	self:addLookupList(TrainerDB,1702,L["Bronk Guzzlegear"],BZONE["Dun Morogh"],49.92,50.64,0)
	self:addLookupList(TrainerDB,1703,L["Uthrar Threx"],BZONE["Ironforge"],44.05,28.82,0)
	self:addLookupList(TrainerDB,2132,L["Carolai Anise"],BZONE["Tirisfal Glades"],59.92,51.99,0)
	self:addLookupList(TrainerDB,2326,L["Thamner Pol"],BZONE["Dun Morogh"],47.24,51.98,0)
	self:addLookupList(TrainerDB,2327,L["Shaina Fuller"],BZONE["Stormwind City"],52.28,45.13,1)
	self:addLookupList(TrainerDB,2329,L["Michelle Belle"],BZONE["Elwynn Forest"],42.95,65.85,1)
	self:addLookupList(TrainerDB,2391,L["Serge Hinott"],BZONE["Hillsbrad Foothills"],61.61,19.13,2)
	self:addLookupList(TrainerDB,2399,L["Daryl Stack"],BZONE["Hillsbrad Foothills"],63.62,21.05,2)
	self:addLookupList(TrainerDB,2454,L["Skeletal Fiend (Enraged Form)"],BZONE["Duskwood"],0,0,0)
	self:addLookupList(TrainerDB,2627,L["Grarnik Goodstitch"],BZONE["Stranglethorn Vale"],28.71,76.83,0)
	self:addLookupList(TrainerDB,2798,L["Pand Stonebinder"],BZONE["Thunder Bluff"],28.63,22.55,2)
	self:addLookupList(TrainerDB,2818,L["Slagg"],BZONE["Arathi Highlands"],74.04,35.62,2)
	self:addLookupList(TrainerDB,2836,L["Brikk Keencraft"],BZONE["Stranglethorn Vale"],29.04,74.97,0)
	self:addLookupList(TrainerDB,2837,L["Jaxin Chong"],BZONE["Stranglethorn Vale"],27.57,77.71,0)
	self:addLookupList(TrainerDB,2855,L["Snang"],BZONE["Orgrimmar"],62.77,49.66,0)
	self:addLookupList(TrainerDB,2857,L["Thund"],BZONE["Orgrimmar"],76.07,25.22,0)
	self:addLookupList(TrainerDB,2998,L["Karn Stonehoof"],BZONE["Thunder Bluff"],40.19,55.49,2)
	self:addLookupList(TrainerDB,3001,L["Brek Stonehoof"],BZONE["Thunder Bluff"],35.58,57.52,0)
	self:addLookupList(TrainerDB,3004,L["Tepa"],BZONE["Thunder Bluff"],43.80,44.95,2)
	self:addLookupList(TrainerDB,3007,L["Una"],BZONE["Thunder Bluff"],42.37,43.59,0)
	self:addLookupList(TrainerDB,3008,L["Mak"],BZONE["Thunder Bluff"],43.33,43.11,2)
	self:addLookupList(TrainerDB,3009,L["Bena Winterhoof"],BZONE["Thunder Bluff"],47.07,34.17,2)
	self:addLookupList(TrainerDB,3011,L["Teg Dawnstrider"],BZONE["Thunder Bluff"],45.56,40.85,2)
	self:addLookupList(TrainerDB,3026,L["Aska Mistrunner"],BZONE["Thunder Bluff"],52.09,52.27,2)
	self:addLookupList(TrainerDB,3067,L["Pyall Silentstride"],BZONE["Mulgore"],46.17,58.51,2)
	self:addLookupList(TrainerDB,3069,L["Chaw Stronghide"],BZONE["Mulgore"],45.98,58.39,0)
	self:addLookupList(TrainerDB,3087,L["Crystal Boughman"],BZONE["Redridge Mountains"],22.81,44.34,1)
	self:addLookupList(TrainerDB,3136,L["Clarise Gnarltree"],BZONE["Duskwood"],73.66,49.49,1)
	self:addLookupList(TrainerDB,3137,L["Matt Johnson"],BZONE["Duskwood"],74.75,50.22,1)
	self:addLookupList(TrainerDB,3174,L["Dwukk"],BZONE["Durotar"],52.91,40.76,2)
	self:addLookupList(TrainerDB,3175,L["Krunn"],BZONE["Durotar"],52.14,41.63,2)
	self:addLookupList(TrainerDB,3181,L["Fremal Doohickey"],BZONE["Wetlands"],10.82,60.97,1)
	self:addLookupList(TrainerDB,3184,L["Miao'zan"],BZONE["Durotar"],55.93,74.66,0)
	self:addLookupList(TrainerDB,3290,L["Deek Fizzlebizz"],BZONE["Loch Modan"],45.69,13.82,1)
	self:addLookupList(TrainerDB,3345,L["Godan"],BZONE["Orgrimmar"],53.91,38.85,0)
	self:addLookupList(TrainerDB,3347,L["Yelmak"],BZONE["Orgrimmar"],56.55,33.33,0)
	self:addLookupList(TrainerDB,3355,L["Saru Steelfury"],BZONE["Orgrimmar"],82.16,23.75,0)
	self:addLookupList(TrainerDB,3357,L["Makaru"],BZONE["Orgrimmar"],72.93,27.68,0)
	self:addLookupList(TrainerDB,3363,L["Magar"],BZONE["Orgrimmar"],63.00,50.92,0)
	self:addLookupList(TrainerDB,3365,L["Karolek"],BZONE["Orgrimmar"],62.85,44.74,0)
	self:addLookupList(TrainerDB,3373,L["Arnok"],BZONE["Orgrimmar"],34.79,83.62,0)
	self:addLookupList(TrainerDB,3390,L["Apothecary Helbrim"],BZONE["The Barrens"],52.13,29.95,2)
	self:addLookupList(TrainerDB,3391,L["Gazlowe"],BZONE["The Barrens"],63.05,36.74,0)
	self:addLookupList(TrainerDB,3399,L["Zamja"],BZONE["Orgrimmar"],57.57,52.99,0)
	self:addLookupList(TrainerDB,3412,L["Nogg"],BZONE["Orgrimmar"],76.16,26.27,0)
	self:addLookupList(TrainerDB,3478,L["Traugh"],BZONE["The Barrens"],51.54,29.41,2)
	self:addLookupList(TrainerDB,3484,L["Kil'hala"],BZONE["The Barrens"],51.98,31.90,2)
	self:addLookupList(TrainerDB,3494,L["Tinkerwiz"],BZONE["The Barrens"],63.09,37.12,0)
	self:addLookupList(TrainerDB,3523,L["Bowen Brisboise"],BZONE["Tirisfal Glades"],52.55,55.92,0)
	self:addLookupList(TrainerDB,3549,L["Shelene Rhobart"],BZONE["Tirisfal Glades"],65.36,60.46,2)
	self:addLookupList(TrainerDB,3555,L["Johan Focht"],BZONE["Silverpine Forest"],44.03,40.92,0)
	self:addLookupList(TrainerDB,3557,L["Guillaume Sorouy"],BZONE["Silverpine Forest"],42.99,40.85,0)
	self:addLookupList(TrainerDB,3603,L["Cyndra Kindwhisper"],BZONE["Teldrassil"],57.61,60.65,0)
	self:addLookupList(TrainerDB,3605,L["Nadyia Maneweaver"],BZONE["Teldrassil"],41.76,50.09,0)
	self:addLookupList(TrainerDB,3606,L["Alanna Raveneye"],BZONE["Teldrassil"],37.07,35.11,0)
	self:addLookupList(TrainerDB,3703,L["Krulmoo Fullmoon"],BZONE["The Barrens"],44,59.34,2)
	self:addLookupList(TrainerDB,3704,L["Mahani"],BZONE["The Barrens"],45.36,58.98,2)
	self:addLookupList(TrainerDB,3964,L["Kylanna"],BZONE["Ashenvale"],51.16,66.81,1)
	self:addLookupList(TrainerDB,3967,L["Aayndia Floralwind"],BZONE["Ashenvale"],35.92,52.06,1)
	self:addLookupList(TrainerDB,4159,L["Me'lynn"],BZONE["Darnassus"],63.02,23.12,0)
	self:addLookupList(TrainerDB,4160,L["Ainethil"],BZONE["Darnassus"],55.18,23.69,0)
	self:addLookupList(TrainerDB,4193,L["Grondal Moonbreeze"],BZONE["Darkshore"],37.77,40.87,1)
	self:addLookupList(TrainerDB,4210,L["Alegorn"],BZONE["Darnassus"],49.43,20.83,0)
	self:addLookupList(TrainerDB,4211,L["Dannelor"],BZONE["Darnassus"],51.94,13.36,0)
	self:addLookupList(TrainerDB,4212,L["Telonis"],BZONE["Darnassus"],64.30,21.94,0)
	self:addLookupList(TrainerDB,4213,L["Taladan"],BZONE["Darnassus"],59.35,13.48,0)
	self:addLookupList(TrainerDB,4254,L["Geofram Bouldertoe"],BZONE["Ironforge"],51.03,26.83,1)
	self:addLookupList(TrainerDB,4258,L["Bengus Deepforge"],BZONE["Ironforge"],52.93,41.99,1)
	self:addLookupList(TrainerDB,4552,L["Eunice Burch"],BZONE["Undercity"],63.43,44.51,2)
	self:addLookupList(TrainerDB,4576,L["Josef Gregorian"],BZONE["Undercity"],70.96,30.56,0)
	self:addLookupList(TrainerDB,4578,L["Josephine Lister"],BZONE["Undercity"],85.50,23.31,0)
	self:addLookupList(TrainerDB,4586,L["Graham Van Talen"],BZONE["Undercity"],76.32,73.02,0)
	self:addLookupList(TrainerDB,4588,L["Arthur Moore"],BZONE["Undercity"],70.50,58.81,2)
	self:addLookupList(TrainerDB,4591,L["Mary Edras"],BZONE["Undercity"],74.06,58.02,0)
	self:addLookupList(TrainerDB,4596,L["James Van Brunt"],BZONE["Undercity"],61.47,30.45,0)
	self:addLookupList(TrainerDB,4598,L["Brom Killian"],BZONE["Undercity"],56.12,36.06,0)
	self:addLookupList(TrainerDB,4605,L["Basil Frye"],BZONE["Undercity"],59.91,28.81,2)
	self:addLookupList(TrainerDB,4609,L["Doctor Marsh"],BZONE["Undercity"],52.98,73.95,0)
	self:addLookupList(TrainerDB,4611,L["Doctor Herbert Halsey"],BZONE["Undercity"],47.93,72.84,0)
	self:addLookupList(TrainerDB,4616,L["Lavinia Crowe"],BZONE["Undercity"],61.53,61.60,0)
	self:addLookupList(TrainerDB,5127,L["Fimble Finespindle"],BZONE["Ironforge"],40.15,34.12,0)
	self:addLookupList(TrainerDB,5150,L["Nissa Firestone"],BZONE["Ironforge"],54.81,59.78,0)
	self:addLookupList(TrainerDB,5153,L["Jormund Stonebrow"],BZONE["Ironforge"],43.00,29.34,1)
	self:addLookupList(TrainerDB,5157,L["Gimble Thistlefuzz"],BZONE["Ironforge"],60.00,45.39,0)
	self:addLookupList(TrainerDB,5159,L["Daryl Riknussun"],BZONE["Ironforge"],60.74,37.66,1)
	self:addLookupList(TrainerDB,5164,L["Grumnus Steelshaper"],BZONE["Ironforge"],50.90,43.08,1)
	self:addLookupList(TrainerDB,5174,L["Springspindle Fizzlegear"],BZONE["Ironforge"],68.77,45.51,1)
	self:addLookupList(TrainerDB,5177,L["Tally Berryfizz"],BZONE["Ironforge"],67.42,53.45,1)
	self:addLookupList(TrainerDB,5392,L["Yarr Hammerstone"],BZONE["Dun Morogh"],50.64,49.97,0)
	self:addLookupList(TrainerDB,5482,L["Stephen Ryback"],BZONE["Stormwind City"],78.11,52.82,0)
	self:addLookupList(TrainerDB,5499,L["Lilyssia Nightbreeze"],BZONE["Stormwind City"],55.63,85.93,0)
	self:addLookupList(TrainerDB,5500,L["Tel'Athir"],BZONE["Stormwind City"],55.26,84.94,0)
	self:addLookupList(TrainerDB,5511,L["Therum Deepforge"],BZONE["Stormwind City"],63.92,38.21,1)
	self:addLookupList(TrainerDB,5513,L["Gelman Stonehand"],BZONE["Stormwind City"],59.11,38.21,0)
	self:addLookupList(TrainerDB,5518,L["Lilliam Sparkspindle"],BZONE["Stormwind City"],62.57,31.03,1)
	self:addLookupList(TrainerDB,5564,L["Simon Tanner"],BZONE["Stormwind City"],71.96,60.60,0)
	self:addLookupList(TrainerDB,5567,L["Sellandus"],BZONE["Stormwind City"],51.92,84.31,0)
	self:addLookupList(TrainerDB,5695,L["Vance Undergloom"],BZONE["Tirisfal Glades"],61.59,53.18,0)
	self:addLookupList(TrainerDB,5759,L["Nurse Neela"],BZONE["Tirisfal Glades"],61.81,51.97,0)
	self:addLookupList(TrainerDB,5784,L["Waldor"],BZONE["The Barrens"],46.12,36.18,0)
	self:addLookupList(TrainerDB,5811,L["Kamari"],BZONE["Orgrimmar"],63.02,45.02,0)
	self:addLookupList(TrainerDB,5939,L["Vira Younghoof"],BZONE["Mulgore"],46.71,60.83,2)
	self:addLookupList(TrainerDB,5943,L["Rawrk"],BZONE["Durotar"],54.13,42.85,0)
	self:addLookupList(TrainerDB,5997,L["Nethergarde Engineer"],BZONE["Blasted Lands"],61.36,7.458,1)
	self:addLookupList(TrainerDB,6094,L["Byancie"],BZONE["Teldrassil"],55.63,57.20,0)
	self:addLookupList(TrainerDB,6286,L["Zarrin"],BZONE["Teldrassil"],57.21,61.48,0)
	self:addLookupList(TrainerDB,6297,L["Kurdram Stonehammer"],BZONE["Darkshore"],37.82,41.05,1)
	self:addLookupList(TrainerDB,6299,L["Delfrum Flintbeard"],BZONE["Darkshore"],37.93,41.05,1)
	self:addLookupList(TrainerDB,7230,L["Shayis Steelfury"],BZONE["Orgrimmar"],80.12,23.54,0)
	self:addLookupList(TrainerDB,7231,L["Kelgruk Bloodaxe"],BZONE["Orgrimmar"],81.55,20.29,0)
	self:addLookupList(TrainerDB,7232,L["Borgus Steelhand"],BZONE["Stormwind City"],59.92,35.04,0)
	self:addLookupList(TrainerDB,7406,L["Oglethorpe Obnoticus"],BZONE["Stranglethorn Vale"],28.88,75.98,0)
	self:addLookupList(TrainerDB,7866,L["Peter Galen"],BZONE["Azshara"],36.94,66.15,1)
	self:addLookupList(TrainerDB,7867,L["Thorkaf Dragoneye"],BZONE["Badlands"],62.20,57.76,2)
	self:addLookupList(TrainerDB,7868,L["Sarah Tanner"],BZONE["Searing Gorge"],63.36,74.59,1)
	self:addLookupList(TrainerDB,7869,L["Brumn Winterhoof"],BZONE["Arathi Highlands"],28.45,44.30,2)
	self:addLookupList(TrainerDB,7870,L["Caryssia Moonhunter"],BZONE["Thousand Needles"],9.003,18.80,1)
	self:addLookupList(TrainerDB,7871,L["Se'Jib"],BZONE["Stranglethorn Vale"],37.20,34.74,2)
	self:addLookupList(TrainerDB,7944,L["Tinkmaster Overspark"],BZONE["Ironforge"],70.54,50.28,1)
	self:addLookupList(TrainerDB,7948,L["Kylanna Windwhisper"],BZONE["Feralas"],32.67,44.09,0)
	self:addLookupList(TrainerDB,7949,L["Xylinnia Starshine"],BZONE["Feralas"],31.72,44.61,0)
	self:addLookupList(TrainerDB,8126,L["Nixx Sprocketspring"],BZONE["Tanaris"],52.04,27.00,0)
	self:addLookupList(TrainerDB,8128,L["Pikkle"],BZONE["Tanaris"],50.82,28.76,0)
	self:addLookupList(TrainerDB,8153,L["Narv Hidecrafter"],BZONE["Desolace"],55.61,55.63,2)
	self:addLookupList(TrainerDB,8306,L["Duhng"],BZONE["The Barrens"],54.89,31.91,2)
	self:addLookupList(TrainerDB,8736,L["Buzzek Bracketswing"],BZONE["Tanaris"],52.27,27.25,0)
	self:addLookupList(TrainerDB,8738,L["Vazario Linkgrease"],BZONE["The Barrens"],63.02,37.07,0)
	self:addLookupList(TrainerDB,9264,L["Firebrand Pyromancer"],BZONE["Blackrock Spire"],0,0,0)
	self:addLookupList(TrainerDB,9584,L["Jalane Ayrole"],BZONE["Stormwind City"],40.06,85.04,1)
	self:addLookupList(TrainerDB,10266,L["Ug'thok"],BZONE["Orgrimmar"],80.85,23.55,0)
	self:addLookupList(TrainerDB,10276,L["Rotgath Stonebeard"],BZONE["Ironforge"],51.88,43.19,1)
	self:addLookupList(TrainerDB,10277,L["Groum Stonebeard"],BZONE["Ironforge"],51.94,42.30,1)
	self:addLookupList(TrainerDB,10278,L["Thrag Stonehoof"],BZONE["Thunder Bluff"],40.21,57.09,2)
	self:addLookupList(TrainerDB,11017,L["Roxxik"],BZONE["Orgrimmar"],75.85,22.65,0)
	self:addLookupList(TrainerDB,11025,L["Mukdrak"],BZONE["Durotar"],52.46,41.48,2)
	self:addLookupList(TrainerDB,11026,L["Sprite Jumpsprocket"],BZONE["Stormwind City"],62.32,31.29,0)
	self:addLookupList(TrainerDB,11028,L["Jemma Quikswitch"],BZONE["Ironforge"],68.67,44.53,1)
	self:addLookupList(TrainerDB,11029,L["Trixie Quikswitch"],BZONE["Ironforge"],68.44,45.08,1)
	self:addLookupList(TrainerDB,11031,L["Franklin Lloyd"],BZONE["Undercity"],76.59,74.17,0)
	self:addLookupList(TrainerDB,11037,L["Jenna Lemkenilli"],BZONE["Darkshore"],37.87,41.10,1)
	self:addLookupList(TrainerDB,11041,L["Milla Fairancora"],BZONE["Darnassus"],54.65,22.08,0)
	self:addLookupList(TrainerDB,11042,L["Sylvanna Forestmoon"],BZONE["Darnassus"],55.93,24.14,0)
	self:addLookupList(TrainerDB,11044,L["Doctor Martin Felben"],BZONE["Undercity"],47.07,74.80,0)
	self:addLookupList(TrainerDB,11046,L["Whuut"],BZONE["Orgrimmar"],56.39,34.51,2)
	self:addLookupList(TrainerDB,11047,L["Kray"],BZONE["Thunder Bluff"],47.73,34.74,2)
	self:addLookupList(TrainerDB,11048,L["Victor Ward"],BZONE["Undercity"],71.38,29.92,0)
	self:addLookupList(TrainerDB,11049,L["Rhiannon Davis"],BZONE["Undercity"],71.15,30.16,0)
	self:addLookupList(TrainerDB,11050,L["Trianna"],BZONE["Darnassus"],63.22,23.05,0)
	self:addLookupList(TrainerDB,11051,L["Vhan"],BZONE["Thunder Bluff"],43.91,44.51,0)
	self:addLookupList(TrainerDB,11052,L["Timothy Worthington"],BZONE["Dustwallow Marsh"],66.31,50.91,1)
	self:addLookupList(TrainerDB,11065,L["Thonys Pillarstone"],BZONE["Ironforge"],60.64,44.86,0)
	self:addLookupList(TrainerDB,11066,L["Jhag"],BZONE["Orgrimmar"],53.88,38.75,0)
	self:addLookupList(TrainerDB,11067,L["Malcomb Wynn"],BZONE["Undercity"],61.52,61.29,0)
	self:addLookupList(TrainerDB,11068,L["Betty Quin"],BZONE["Stormwind City"],52.92,73.86,0)
	self:addLookupList(TrainerDB,11070,L["Lalina Summermoon"],BZONE["Darnassus"],59.53,13.01,1)
	self:addLookupList(TrainerDB,11071,L["Mot Dawnstrider"],BZONE["Thunder Bluff"],45.59,40.63,2)
	self:addLookupList(TrainerDB,11072,L["Kitta Firewind"],BZONE["Elwynn Forest"],65.28,69.98,1)
	self:addLookupList(TrainerDB,11073,L["Annora"],BZONE["Uldaman"],0,0,0)
	self:addLookupList(TrainerDB,11074,L["Hgarth"],BZONE["Stonetalon Mountains"],49.05,56.67,2)
	self:addLookupList(TrainerDB,11081,L["Faldron"],BZONE["Darnassus"],64.59,21.47,0)
	self:addLookupList(TrainerDB,11083,L["Darianna"],BZONE["Darnassus"],65.18,21.04,0)
	self:addLookupList(TrainerDB,11084,L["Tarn"],BZONE["Thunder Bluff"],43.17,43.08,0)
	self:addLookupList(TrainerDB,11096,L["Randal Worth"],BZONE["Stormwind City"],71.76,62.96,0)
	self:addLookupList(TrainerDB,11097,L["Drakk Stonehand"],BZONE["The Hinterlands"],13.69,42.98,0)
	self:addLookupList(TrainerDB,11098,L["Hahrana Ironhide"],BZONE["Feralas"],74.46,43.05,0)
	self:addLookupList(TrainerDB,11146,L["Ironus Coldsteel"],BZONE["Ironforge"],50.94,43.64,1)
	self:addLookupList(TrainerDB,11177,L["Okothos Ironrager"],BZONE["Orgrimmar"],80.17,21.77,0)
	self:addLookupList(TrainerDB,11178,L["Borgosh Corebender"],BZONE["Orgrimmar"],80.39,23.93,0)
	self:addLookupList(TrainerDB,11557,L["Meilosh"],BZONE["Felwood"],66.26,2.931,0)
	self:addLookupList(TrainerDB,13445,L["Great-father Winter"],BZONE[""],0,0,0)
	self:addLookupList(TrainerDB,15400,L["Arathel Sunforge"],BZONE["Eversong Woods"],59.90,61.99,2)
	self:addLookupList(TrainerDB,15501,L["Aleinia"],BZONE["Eversong Woods"],48.00,48.06,0)
	self:addLookupList(TrainerDB,16160,L["Magistrix Eredania"],BZONE["Eversong Woods"],38.71,72.53,2)
	self:addLookupList(TrainerDB,16161,L["Arcanist Sheynathren"],BZONE["Eversong Woods"],38.11,71.95,2)
	self:addLookupList(TrainerDB,16253,L["Master Chef Mouldier"],BZONE["Ghostlands"],47.88,31.20,0)
	self:addLookupList(TrainerDB,16272,L["Kanaria"],BZONE["Eversong Woods"],48.95,46.96,2)
	self:addLookupList(TrainerDB,16277,L["Quarelestra"],BZONE["Eversong Woods"],48.99,47.07,2)
	self:addLookupList(TrainerDB,16278,L["Sathein"],BZONE["Eversong Woods"],53.73,52.02,2)
	self:addLookupList(TrainerDB,16366,L["Sempstress Ambershine"],BZONE["Eversong Woods"],37.33,72.34,2)
	self:addLookupList(TrainerDB,16583,L["Rohok"],BZONE["Hellfire Peninsula"],53.04,38.26,0)
	self:addLookupList(TrainerDB,16588,L["Apothecary Antonivich"],BZONE["Hellfire Peninsula"],52.40,35.83,0)
	self:addLookupList(TrainerDB,16633,L["Sedana"],BZONE["Silvermoon City"],69.82,25.54,0)
	self:addLookupList(TrainerDB,16634,L["Dolothos"],BZONE["Silvermoon City"],68.57,25.58,0)
	self:addLookupList(TrainerDB,16639,L["Galana"],BZONE["Silvermoon City"],57.25,50.39,2)
	self:addLookupList(TrainerDB,16640,L["Keelen Sheets"],BZONE["Silvermoon City"],56.85,50.20,0)
	self:addLookupList(TrainerDB,16642,L["Camberon"],BZONE["Silvermoon City"],66.89,17.05,0)
	self:addLookupList(TrainerDB,16643,L["Razia"],BZONE["Silvermoon City"],66.98,18.36,0)
	self:addLookupList(TrainerDB,16662,L["Alestus"],BZONE["Silvermoon City"],77.84,72.64,2)
	self:addLookupList(TrainerDB,16663,L["Belil"],BZONE["Silvermoon City"],79.21,40.12,0)
	self:addLookupList(TrainerDB,16667,L["Danwe"],BZONE["Silvermoon City"],76.88,39.68,0)
	self:addLookupList(TrainerDB,16668,L["Gloresse"],BZONE["Silvermoon City"],76.41,38.72,0)
	self:addLookupList(TrainerDB,16669,L["Bemarrin"],BZONE["Silvermoon City"],79.75,39.77,0)
	self:addLookupList(TrainerDB,16671,L["Mirvedon"],BZONE["Silvermoon City"],79.75,37.70,0)
	self:addLookupList(TrainerDB,16676,L["Sylann"],BZONE["Silvermoon City"],69.36,71.04,2)
	self:addLookupList(TrainerDB,16687,L["Talmar"],BZONE["Silvermoon City"],83.06,80.31,0)
	self:addLookupList(TrainerDB,16688,L["Lynalis"],BZONE["Silvermoon City"],83.56,81.19,0)
	self:addLookupList(TrainerDB,16703,L["Amin"],BZONE["Silvermoon City"],90.38,74.92,0)
	self:addLookupList(TrainerDB,16719,L["Mumman"],BZONE["The Exodar"],56.70,28.64,1)
	self:addLookupList(TrainerDB,16723,L["Lucc"],BZONE["The Exodar"],28.49,62.18,1)
	self:addLookupList(TrainerDB,16724,L["Miall"],BZONE["The Exodar"],60.73,89.37,0)
	self:addLookupList(TrainerDB,16725,L["Nahogg"],BZONE["The Exodar"],41.01,39.39,0)
	self:addLookupList(TrainerDB,16726,L["Ockil"],BZONE["The Exodar"],55.13,91.84,1)
	self:addLookupList(TrainerDB,16727,L["Padaar"],BZONE["The Exodar"],44.67,25.49,0)
	self:addLookupList(TrainerDB,16728,L["Akham"],BZONE["The Exodar"],66.59,74.49,1)
	self:addLookupList(TrainerDB,16729,L["Refik"],BZONE["The Exodar"],63.23,67.81,0)
	self:addLookupList(TrainerDB,16731,L["Nus"],BZONE["The Exodar"],40.39,24.29,0)
	self:addLookupList(TrainerDB,16740,L["Edrem"],BZONE["The Exodar"],60.80,87.08,0)
	self:addLookupList(TrainerDB,16741,L["Deriz"],BZONE["The Exodar"],28.68,61.79,1)
	self:addLookupList(TrainerDB,16742,L["Kudrii"],BZONE["The Exodar"],39.45,39.51,0)
	self:addLookupList(TrainerDB,16743,L["Ghermas"],BZONE["The Exodar"],55.99,90.53,0)
	self:addLookupList(TrainerDB,16745,L["Feruul"],BZONE["The Exodar"],66.42,74.39,0)
	self:addLookupList(TrainerDB,16746,L["Kayaart"],BZONE["The Exodar"],63.27,69.08,0)
	self:addLookupList(TrainerDB,16752,L["Muaat"],BZONE["The Exodar"],60.44,87.74,0)
	self:addLookupList(TrainerDB,16823,L["Humphry"],BZONE["Hellfire Peninsula"],57.18,63.76,1)
	self:addLookupList(TrainerDB,17214,L["Anchorite Fateema"],BZONE["Bloodmyst Isle"],53.85,55.00,1)
	self:addLookupList(TrainerDB,17215,L["Daedal"],BZONE["Bloodmyst Isle"],53.82,55.15,1)
	self:addLookupList(TrainerDB,17222,L["Artificer Daelo"],BZONE["Azuremyst Isle"],49.14,51.11,0)
	self:addLookupList(TrainerDB,17245,L["Blacksmith Calypso"],BZONE["Azuremyst Isle"],46.72,70.58,1)
	self:addLookupList(TrainerDB,17246,L["\"Cookie\" McWeaksauce"],BZONE["Bloodmyst Isle"],54.16,55.38,1)
	self:addLookupList(TrainerDB,17424,L["Anchorite Paetheus"],BZONE["Bloodmyst Isle"],55.16,54.98,1)
	self:addLookupList(TrainerDB,17442,L["Moordo"],BZONE["Azuremyst Isle"],45.15,23.71,1)
	self:addLookupList(TrainerDB,17487,L["Erin Kelly"],BZONE["Azuremyst Isle"],46.86,70.09,1)
	self:addLookupList(TrainerDB,17488,L["Dulvi"],BZONE["Azuremyst Isle"],49.06,51.67,1)
	self:addLookupList(TrainerDB,17634,L["K. Lee Smallfry"],BZONE["Zangarmarsh"],69.16,49.71,0)
	self:addLookupList(TrainerDB,17637,L["Mack Diver"],BZONE["Zangarmarsh"],34.38,51.44,2)
	self:addLookupList(TrainerDB,17708,L["Living Ruby Serpent"],L["Unknown Zone"],0,0,0)
	self:addLookupList(TrainerDB,18747,L["Krugosh"],BZONE["Hellfire Peninsula"],55.29,38.03,0)
	self:addLookupList(TrainerDB,18749,L["Dalinna"],BZONE["Undercity"],39.64,32.23,0)
	self:addLookupList(TrainerDB,18751,L["Kalaen"],BZONE["Undercity"],47.56,38.68,0)
	self:addLookupList(TrainerDB,18752,L["Zebig"],BZONE["Hellfire Peninsula"],55.17,38.08,2)
	self:addLookupList(TrainerDB,18753,L["Felannia"],BZONE["Hellfire Peninsula"],52.37,35.99,0)
	self:addLookupList(TrainerDB,18754,L["Barim Spilthoof"],BZONE["Hellfire Peninsula"],56.42,39.11,0)
	self:addLookupList(TrainerDB,18771,L["Brumman"],BZONE["Hellfire Peninsula"],54.04,64.44,1)
	self:addLookupList(TrainerDB,18772,L["Hama"],BZONE["Hellfire Peninsula"],54.00,63.58,0)
	self:addLookupList(TrainerDB,18773,L["Johan Barnes"],BZONE["Hellfire Peninsula"],53.69,65.77,1)
	self:addLookupList(TrainerDB,18774,L["Tatiana"],BZONE["Eastern Plaguelands"],48.95,46.72,0)
	self:addLookupList(TrainerDB,18775,L["Lebowski"],BZONE["Hellfire Peninsula"],56.06,64.90,1)
	self:addLookupList(TrainerDB,18779,L["Hurnak Grimmord"],BZONE["Hellfire Peninsula"],57.17,63.73,0)
	self:addLookupList(TrainerDB,18802,L["Alchemist Gribble"],BZONE["Hellfire Peninsula"],54.18,66.00,0)
	self:addLookupList(TrainerDB,18804,L["Prospector Nachlan"],BZONE["Bloodmyst Isle"],56.31,54.58,1)
	self:addLookupList(TrainerDB,18987,L["Gaston"],BZONE["Hellfire Peninsula"],53.99,63.58,0)
	self:addLookupList(TrainerDB,18988,L["Baxter"],BZONE["Undercity"],57.79,46.99,0)
	self:addLookupList(TrainerDB,18993,L["Naka"],BZONE["Ironforge"],41.94,50.53,0)
	self:addLookupList(TrainerDB,19052,L["Lorokeem"],BZONE["Shattrath City"],46.12,21.66,0)
	self:addLookupList(TrainerDB,19063,L["Hamanar"],BZONE["Shattrath City"],36.09,20.04,0)
	self:addLookupList(TrainerDB,19184,L["Mildred Fletcher"],BZONE["Shattrath City"],65.94,14.77,0)
	self:addLookupList(TrainerDB,19185,L["Jack Trapper"],BZONE["Shattrath City"],63.39,68.35,0)
	self:addLookupList(TrainerDB,19186,L["Kylene"],BZONE["Shattrath City"],75.84,32.83,0)
	self:addLookupList(TrainerDB,19187,L["Darmari"],BZONE["Shattrath City"],67.24,66.66,0)
	self:addLookupList(TrainerDB,19248,L["Enchanter Salias"],BZONE["Shattrath City"],44.29,90.73,0)
	self:addLookupList(TrainerDB,19249,L["Enchantress Metura"],BZONE["Shattrath City"],43.90,90.36,0)
	self:addLookupList(TrainerDB,19250,L["Enchanter Aeldron"],BZONE["Shattrath City"],43.93,90.38,0)
	self:addLookupList(TrainerDB,19251,L["Enchantress Volali"],BZONE["Shattrath City"],43.45,91.95,0)
	self:addLookupList(TrainerDB,19252,L["High Enchanter Bardolan"],BZONE["Shattrath City"],43.64,92.01,0)
	self:addLookupList(TrainerDB,19341,L["Grutah"],BZONE["Shadowmoon Valley"],29.95,30.95,0)
	self:addLookupList(TrainerDB,19369,L["Celie Steelwing"],BZONE["Shadowmoon Valley"],37.20,57.98,0)
	self:addLookupList(TrainerDB,19478,L["Fera Palerunner"],BZONE["Blade's Edge Mountains"],53.90,55.18,2)
	self:addLookupList(TrainerDB,19539,L["Jazdalaad"],BZONE["Netherstorm"],44.08,34.77,0)
	self:addLookupList(TrainerDB,19540,L["Asarnan"],BZONE["Netherstorm"],44.52,34.56,0)
	self:addLookupList(TrainerDB,19576,L["Xyrol"],BZONE["Netherstorm"],33.12,66.78,0)
	self:addLookupList(TrainerDB,19775,L["Kalinda"],BZONE["Silvermoon City"],90.88,74.41,0)
	self:addLookupList(TrainerDB,19778,L["Farii"],BZONE["The Exodar"],44.72,25.55,0)
	self:addLookupList(TrainerDB,20124,L["Kradu Grimblade"],BZONE["Shattrath City"],70.28,44.43,0)
	self:addLookupList(TrainerDB,20125,L["Zula Slagfury"],BZONE["Shattrath City"],70.38,43.78,0)
	self:addLookupList(TrainerDB,21087,L["Grikka"],BZONE["Blade's Edge Mountains"],77.03,65.63,2)
	self:addLookupList(TrainerDB,22477,L["Anchorite Ensham"],BZONE["Terokkar Forest"],31.07,75.96,0)
	self:addLookupList(TrainerDB,22823,L["Hch'uu"],BZONE["Zangarmarsh"],19.78,52.02,0)
	self:addLookupList(TrainerDB,22827,L["Gorgolon the All-seeing"],BZONE["Blade's Edge Mountains"],0,0,0)
	self:addLookupList(TrainerDB,22833,L["Outland Children's Week Dark Portal Trigger"],L["Unknown Zone"],0,0,0)
	self:addLookupList(TrainerDB,22834,L["Clintar Dreamwalker"],BZONE["Moonglade"],75.27,66.73,0)
	self:addLookupList(TrainerDB,22835,L["Cenarion Dreamwarden"],BZONE["Moonglade"],71.54,61.74,0)
	self:addLookupList(TrainerDB,22848,L["Storm Fury"],BZONE["Black Temple"],0,0,0)
	self:addLookupList(TrainerDB,22851,L["Outland Children's Week Exodar 01 Trigger"],L["Unknown Zone"],0,0,0)
	self:addLookupList(TrainerDB,22853,L["Illidari Defiler"],BZONE["Black Temple"],0,0,0)
	self:addLookupList(TrainerDB,22861,L["Lightsworn Vindicator"],BZONE["Orgrimmar"],47.38,53.72,0)
	self:addLookupList(TrainerDB,22866,L["Outland Children's Week Silvermoon 01 Trigger"],L["Unknown Zone"],0,0,0)
	self:addLookupList(TrainerDB,24315,L["Ancient Female Vrykul"],BZONE["Howling Fjord"],60.41,49.80,2)

end
