function CulturePerPop(PlayerID, cityID)
local pPlayer = Players[PlayerID];
local pBuilding = GameInfoTypes["BUILDING_FIBER_NETWORK"];
for pCity in pPlayer:Cities() do
if (pPlayer:IsAlive()) then
if (pCity:GetNumBuilding(pBuilding) > 0) then
local pPop = pCity:GetPopulation();
local CultureBonus = math.floor(pPop / 4);
if CultureBonus > 0 then
pCity:SetNumRealBuilding(GameInfoTypes["BUILDING_CULTURE_PER_POP"], CultureBonus);
else pCity:SetNumRealBuilding(GameInfoTypes["BUILDING_CULTURE_PER_POP"], 0);
end
end
end
end
end
GameEvents.PlayerDoTurn.Add(CulturePerPop);