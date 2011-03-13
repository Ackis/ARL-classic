--[[
************************************************************************
Seasonal.lua
************************************************************************
File date: @file-date-iso@
File hash: @file-abbreviated-hash@
Project hash: @project-abbreviated-hash@
Project version: @project-version@
************************************************************************
Please see http://www.wowace.com/addons/arl/ for more information.
************************************************************************
License:
	Please see LICENSE.txt
This source code is released under All Rights Reserved.
************************************************************************
]]--

-------------------------------------------------------------------------------
-- Upvalued Lua API.
-------------------------------------------------------------------------------
local _G = getfenv(0)

local MODNAME		= "Ackis Recipe List"
local addon		= LibStub("AceAddon-3.0"):GetAddon(MODNAME)
local L			= LibStub("AceLocale-3.0"):GetLocale(MODNAME)

local GetCategoryInfo = _G.GetCategoryInfo

function addon:InitSeasons(DB)
	local function AddSeason(identifier, name)
		addon:AddListEntry(DB, identifier, name, GetCategoryInfo(155))
	end
	AddSeason("WINTER_VEIL", GetCategoryInfo(156))
	AddSeason("LUNAR_FESTIVAL", GetCategoryInfo(160))
	AddSeason("MIDSUMMER", GetCategoryInfo(161))
	AddSeason("PILGRIMS_BOUNTY", GetCategoryInfo(14981))
	AddSeason("DAY_OF_THE_DEAD", L["Day of the Dead"])
end
