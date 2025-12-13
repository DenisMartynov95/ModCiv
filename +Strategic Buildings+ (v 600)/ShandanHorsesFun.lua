-- written by GAIA using Notepad++
--=======================================================================================================================
-- SHANDAN HORSE FARM
--=======================================================================================================================
local bDebugMode = false
local DebugPrint = bDebugMode and function(text) print(tostring(text)) end or function() end

local bIsCoreModActive = (function()
	for _, v in ipairs(Modding.GetActivatedMods()) do
		if v.ID == "ab0bea08-fb7a-4c23-9234-cbe5252552b6" then
			DebugPrint("Gaia's Core Mod is active") return true
		end
	end
	if DB.Query("SELECT 1 FROM Missions WHERE Type = 'MISSION_GAIA_TRANSFORM' LIMIT 1")() then
		DebugPrint("Gaia's Core Mod is active") return true
	end
	return false
end)()

--=======================================================================================================================
-- SPAWN HORSES
--=======================================================================================================================
local eBuildingRanch = GameInfoTypes.BUILDING_GAIA_SHANDAN
local eResourceHorse = GameInfoTypes.RESOURCE_HORSE

function OnConstructionSpawnHorses(iPlayer, iCity, iBuilding)
	if iBuilding ~= eBuildingRanch then return end

	local pPlayer = Players[iPlayer]
	if not pPlayer then return end
	local pCity = pPlayer:GetCityByID(iCity)
	if not pCity then return end

	local iSpawned = 0
	local tEligiblePlots = {}

	for i = 1, pCity:GetNumCityPlots() - 1 do
		local pPlot = pCity:GetCityIndexPlot(i)
		if pPlot 
			and not pPlot:IsWater() 
			and not pPlot:IsMountain() 
			and not pPlot:IsCity()
			and not pPlot:IsHills()
			and not pPlot:IsRiver()
			and pPlot:GetFeatureType() == -1
			and pPlot:GetResourceType() == -1 then
				table.insert(tEligiblePlots, pPlot)
		end
	end

	-- Shuffle eligible plots
	for i = #tEligiblePlots, 2, -1 do
		local j = math.random(i)
		tEligiblePlots[i], tEligiblePlots[j] = tEligiblePlots[j], tEligiblePlots[i]
	end

	-- Spawn up to 2 Horse resources (quantity = 2)
	for _, pPlot in ipairs(tEligiblePlots) do
		pPlot:SetResourceType(eResourceHorse, 2)
		iSpawned = iSpawned + 1
		if iSpawned >= 2 then break end
	end

	-- Visual feedback
	if pPlayer:IsHuman() and pPlayer:IsTurnActive() and iSpawned > 0 then
		local vCityPos = HexToWorld(ToHexFromGrid(Vector2(pCity:GetX(), pCity:GetY())))
		local sCityName = pCity:GetName()
		Events.AddPopupTextEvent(vCityPos, "[COLOR_YIELD_FOOD]+2 [ICON_RES_HORSE] Horses spawned[ENDCOLOR]", 1)
		pPlayer:AddNotification(NotificationTypes.NOTIFICATION_DISCOVERED_LUXURY_RESOURCE,
			'[COLOR_CYAN]'..sCityName..'[ENDCOLOR] has discovered new [ICON_RES_HORSE] Horses in its working range.',
			'New Horses near '..sCityName,
			pCity:GetX(), pCity:GetY(), iCity)
	end
end

--=======================================================================================================================
-- EVENT HANDLERS
--=======================================================================================================================
if not bIsCoreModActive then
	GameEvents.CityConstructed.Add(OnConstructionSpawnHorses)
end
--=======================================================================================================================

