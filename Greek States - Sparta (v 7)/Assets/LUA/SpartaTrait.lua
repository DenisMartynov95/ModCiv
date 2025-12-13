-- Lua Script1
-- Author: DJSHenninger
-- DateCreated: 1/29/2015 4:10:21 PM
--------------------------------------------------------------
function SpartaTrait(playerID)
print("Sparta function is running")
	local player = Players[playerID]
	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_SPARTA"] and player:IsAlive() then
		for city in player:Cities() do
			if (city:GetNumBuilding(GameInfoTypes["BUILDING_SPARTA_DUMMY"]) > 0) then
				city:SetNumRealBuilding(GameInfoTypes["BUILDING_SPARTA_DUMMY"], 0);
			end
			local spartapopulationAmount = math.floor(city:GetPopulation())
			city:SetNumRealBuilding(GameInfoTypes["BUILDING_SPARTA_DUMMY"], spartapopulationAmount)
		end
	end
end
GameEvents.PlayerDoTurn.Add(SpartaTrait)

print("my lua loaded to the end")