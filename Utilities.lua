-----------------------------------------------------------------------
-- Upvalued Lua API.
-----------------------------------------------------------------------
local _G = getfenv(0)

local tonumber = _G.tonumber

-----------------------------------------------------------------------
-- AddOn namespace.
-----------------------------------------------------------------------
local FOLDER_NAME, private = ...

local LibStub = _G.LibStub

local addon = LibStub("AceAddon-3.0"):GetAddon(private.addon_name)
local BFAC = LibStub("LibBabble-Faction-3.0"):GetLookupTable()

-----------------------------------------------------------------------
-- Methods.
-----------------------------------------------------------------------
do
	local FACTION_NAMES = {
		[1] = BFAC["Neutral"],
		[2] = BFAC["Alliance"],
		[3] = BFAC["Horde"]
	}

	function private:AddListEntry(lookup_list, identifier, name, location, coord_x, coord_y, faction)
		if lookup_list[identifier] then
			addon:Debug("Duplicate lookup: %s - %s.", identifier, name)
			return
		end

		local entry = {
			name = name,
			location = location,
		}
		lookup_list[identifier] = entry

		if faction then
			if _G.type(faction) == "string" then
				entry.faction = faction
			else
				entry.faction = FACTION_NAMES[faction + 1]
			end
		end

		if coord_x and coord_y then
			lookup_list[identifier].coord_x = coord_x
			lookup_list[identifier].coord_y = coord_y
		end

		--@alpha@
		if not location and lookup_list ~= private.custom_list and lookup_list ~= private.reputation_list then
			addon:Debug("Lookup ID: %s (%s) has an unknown location.", identifier, lookup_list[identifier].name or _G.UNKNOWN)
		end

		if faction and lookup_list == private.mob_list then
			addon:Debug("Mob %d (%s) has been assigned to faction %s.", identifier, name, lookup_list[identifier].faction)
		end
		--@end-alpha@
		return entry
	end
end -- do

function private.ItemLinkToID(item_link)
	if not item_link then
		return
	end

	local id = item_link:match("item:(%d+)")

	if not id then
		return
	end
	return tonumber(id)
end
