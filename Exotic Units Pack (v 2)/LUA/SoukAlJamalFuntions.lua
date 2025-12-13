-- Souk al Jamal Functions
-- Author: sman
-- DateCreated: 12/03/17 11:21:04 AM
--------------------------------------------------------------

----------------------------------------------------------------
-- Global Variables
----------------------------------------------------------------

iUnitCamelBowman = GameInfoTypes.UNIT_SMAN_CAMEL_BOWMAN
iUnitClassCamelBowman = GameInfoTypes.UNITCLASS_SMAN_CAMEL_BOWMAN
iUnitCamelRifleman = GameInfoTypes.UNIT_SMAN_CAMEL_RIFLEMAN
iUnitClassCamelRifleman = GameInfoTypes.UNITCLASS_SMAN_CAMEL_RIFLEMAN

iBuildingClassCamelMarket = GameInfoTypes.BUILDINGCLASS_SMAN_CAMEL_MARKET
iBuildingCamelMarket = GameInfoTypes.BUILDING_SMAN_CAMEL_MARKET
iBuildingClassSoukAlJamal = GameInfoTypes.BUILDINGCLASS_SMAN_SOUK_AL_JAMAL
iBuildingSoukAlJamal = GameInfoTypes.BUILDING_SMAN_SOUK_AL_JAMAL

iResourceCamel = GameInfoTypes.RESOURCE_SMAN_CAMELS


----------------------------------------------------------------
-- Main Functions
----------------------------------------------------------------

function checkCamelCount(playerID)					
	print("checkCamelCount function.  Player: " .. Players[playerID]:GetCivilizationShortDescription() .. "     Game Turn: " .. Game.GetGameTurn() )

	local pPlayer = Players[playerID]

	if (not pPlayer:IsAlive()) or (pPlayer:IsMinorCiv()) then 
		--print("Minor/Defunct civ.  Exiting early...")
		return 
	end							-- exit early for minor/defunct civs


	local iCamelMarketCount = pPlayer:GetBuildingClassCount(iBuildingClassCamelMarket)
	local iSoukAlJamalCount = pPlayer:GetBuildingClassCount(iBuildingClassSoukAlJamal)
	local iCamelBowmanCount = pPlayer:GetUnitClassCount(iUnitClassCamelBowman)
	local iCamelRifelmanCount = pPlayer:GetUnitClassCount(iUnitClassCamelRifleman)
	local iTotalCamelsUsed = iCamelBowmanCount + iCamelRifelmanCount
	
	local iCurrentCamelCountTotal = pPlayer:GetNumResourceTotal(iResourceCamel, true)

										pPlayer:GetNumResourceTotal(newRes, true)


	local iCurrentCamelCountLocal = pPlayer:GetNumResourceTotal(iResourceCamel, false)
	local iCurrentCamelCountImported = iCurrentCamelCountTotal - iCurrentCamelCountLocal
	
	local iNewCamelCount = 0	
	local iCamelsUsed = iCamelBowmanCount + iCamelRifelmanCount

	print("Old Camel count.  Total: " .. iCurrentCamelCountTotal .. "    Local: " .. iCurrentCamelCountLocal .. "    Imported: " .. iCurrentCamelCountImported);
	print("Camels used: " .. iCamelsUsed .. " (" .. iCamelBowmanCount .. "+" .. iCamelRifelmanCount .. ")")
	
	pPlayer:ChangeNumResourceTotal(iResourceCamel, iCurrentCamelCountTotal * -1 )
	local iCurrentCamelCountTotal = pPlayer:GetNumResourceTotal(iResourceCamel, true)
	print("Reset Camel count: " .. iCurrentCamelCountTotal)
	

	if iSoukAlJamalCount > 0 then
		print("This player has " .. iSoukAlJamalCount .. " Souk al Jamals built")
		iNewCamelCount = iCamelMarketCount * 3
		print ("Local Camel resource count should actually be " .. iNewCamelCount)
	else
		print("This player has not built the Souk al Jamal.")
		iNewCamelCount = iCamelMarketCount
		print ("Local Camel resource count should actually be " .. iNewCamelCount)
	end
	
	iNewCamelCount = (iNewCamelCount + iCurrentCamelCountImported) - iCamelsUsed
	print("New Available Camel count: " .. iNewCamelCount)

	pPlayer:ChangeNumResourceTotal(iResourceCamel, iNewCamelCount)	
		
end

GameEvents.PlayerDoTurn.Add( checkCamelCount )