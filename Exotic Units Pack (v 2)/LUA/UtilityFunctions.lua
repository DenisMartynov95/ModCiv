-- Utility Functions
-- Author: sman
-- DateCreated: 12/08/17 6:42:01 PM
--------------------------------------------------------------


--=================================================================================================================================================================
-- Global Variables
--=================================================================================================================================================================

iUnitFireShip = GameInfoTypes.UNIT_EXOTIC_UNIT_FIRE_SHIP


--=================================================================================================================================================================
-- MAIN FUNCTIONS
--=================================================================================================================================================================

function setEUFireshipDamage(playerID, unitID)												-- Fire Ships start off damaged...
	local pUnit	= Players[playerID]:GetUnitByID(unitID)		

	if not pUnit then return end

	if(pUnit:GetUnitType() == iUnitFireShip) then									
		pUnit:SetDamage (70)
	end
end
Events.SerialEventUnitCreated.Add( setEUFireshipDamage );