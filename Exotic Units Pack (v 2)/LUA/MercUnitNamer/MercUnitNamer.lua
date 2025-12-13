-- MercUnitNamer.lua
-- Author: sman
-- DateCreated: 12/14/17 5:01:40 PM
--------------------------------------------------------------

--print("Mercenary UnitNamer Script Loaded")

include ("MercUnitNamerData.lua")

--=================================================================================================================================================================
-- Global Variables
--=================================================================================================================================================================


--=================================================================================================================================================================
-- MAIN FUNCTIONS
--=================================================================================================================================================================

function doNamingOfExoticUnits(playerID, unitID)
	local pPlayer			= Players[playerID]												-- Player owning unit to be processed
	local pUnit				= pPlayer:GetUnitByID(unitID)									-- Specific Unit instance to be processed
	local NewUnitName		= ""

	if not pPlayer then																		-- Check for missing keys, bail early if anything is missing
		print("In doNamingOfExoticUnits.  Missing playerID;  UnitID: " .. unitID)
		return
	elseif not pUnit then
		print("In doNamingOfExoticUnits.  playerID: " .. playerID .. ";  Missing UnitID")
		return
	end

	if (pUnit:HasName()) then																-- If unit already has name, keep same name, exit early	
		local unitOldName = pUnit:GetNameNoDesc()											--  Unique short name for this unit 
		pUnit:SetName(unitOldName)					
		LuaEvents.SerialEventUpdateTooltip(playerID, unitID)								-- Update tooltip with existing unit name
		return
	end

	if GameInfo.Units[pUnit:GetUnitType()].IsMercUnit ~= 0 then								-- Element 'IsMercUnit' added to Units table, default=0. Equals 1 for Merc units
		if(GameInfo.Units[pUnit:GetUnitType()].Domain == "DOMAIN_SEA")  then		
			NewUnitName = "MS " .. ShipNames[math.random(1, #ShipNames)]					-- Pick any name in "ShipNames", prepend "MS" prefix (merc ship)
		else
			if ((pUnit:GetUnitType() == GameInfoTypes["UNIT_EXOTIC_UNIT_RABBLE"])) then				-- Rabble get a special "nearest city to spawn" name
			--if ((pUnit:GetUnitType() == GameInfoTypes["UNIT_SCOUT"])) then					-- Rabble get a special "nearest city to spawn" name
				local sSpawnCity = GetUnitSpawnCity (pPlayer, pUnit)
				if sSpawnCity ~= "" then
					NewUnitName = sSpawnCity .. " Rabble"
				else
					NewUnitName = "Rabble"
				end
			else		
				local NewUnitAdjective = LandAdjectives[math.random(1, #LandAdjectives)] .. " "	-- Pick any adjective in "LandAdjectives" and append a space			
				if math.random(1,100) < 5 then NewUnitAdjective = "" end					-- Small chance of no adjective at all				
				local NewUnitNoun = LandNouns[math.random(1, #LandNouns)]					-- Pick any noun in "LandNouns"							
				NewUnitName = NewUnitAdjective .. NewUnitNoun								-- Concat adjective and noun to form name
			end
		end
	else
		return																				-- Return early for non-Merc units, no renaming taking place
	end
	
	if not NewUnitName then																	-- Just in case new name generation fails
		NewUnitName = "Sman's Folly"
	end
	
	pUnit:SetName(NewUnitName)																-- Rename the current unit
	LuaEvents.SerialEventUpdateTooltip(playerID, unitID)									-- Update the unit tooltop	

end
Events.SerialEventUnitCreated.Add( doNamingOfExoticUnits )

function GetUnitSpawnCity (pPlayer, pUnit)
	local spawnCityName = ""
	local pPlot = pUnit:GetPlot()

	if (pPlot:IsCity()) then
		local pCity = pPlot:GetPlotCity()
		if pCity then spawnCityName = pCity:GetName() end
	else
		local pCapitalCity = pPlayer:GetCapitalCity()
		if pCapitalCity then spawnCityName =  pCapitalCity:GetName() end
	end
	return spawnCityName
end
