-- Written by GAIA using Notepad++
-- Based on an idea by Hammurabi1337, originally from the Bonus Resources Expanded mod, with contributions from Leugi.
-- 
-- SaveUtils are adapted from Sukritact_SaveUtils, themselves a modification of NewSaveUtils.lua.
-- Additional contributions by HungryForFood, including the OpenSaveData function, which enables reopening save data.
-- 
-- This script integrates persistent save/load utilities and graphical adjustments to properly represent and manage 
-- farm-related resources.
--=======================================================================================================================

MY_MOD_NAME = "Resource Compendium"

--=======================================================================================================================
-- SAVE UTILS
--=======================================================================================================================

-- Open a single connection to the Modding save data
g_SaveData = Modding.OpenSaveData()
g_Properties = nil

-- Reopen the save data (if needed)
function OpenSaveData()
	g_SaveData = Modding.OpenSaveData()
	g_Properties = nil
end

-- Get a property from the modding database, using a local cache
function GetPersistentProperty(name)
	if g_Properties == nil then
		g_Properties = {}
	end
	if g_Properties[name] == nil then
		g_Properties[name] = g_SaveData.GetValue(name)
	end
	return g_Properties[name]
end

-- Set a property in the modding database and update the cache
function SetPersistentProperty(name, value)
	if g_Properties == nil then
		g_Properties = {}
	end
	if g_Properties[name] ~= value then
		g_SaveData.SetValue(name, value)
		g_Properties[name] = value
	end
end

--------------------------------------------------
-- Utility Functions
--------------------------------------------------

function CompilePlotID(pPlot)
	return (pPlot:GetX() .. "_Y" .. pPlot:GetY())
end

--------------------------------------------------
-- Save/Load Functions
--------------------------------------------------

function save(pObject, sKey, Val)
	if Val == true then
		Val = "bTrue"
	elseif Val == false then
		Val = "bFalse"
	end

	local sTrueKey = nil
	if type(pObject) == "string" then
		if string.upper(pObject) == "GAME" then
			sTrueKey = (MY_MOD_NAME .. "_" .. sKey)
		else
			return
		end
	elseif pObject == nil or type(pObject) ~= "table" then
		return
	end

	local metaIndex = getmetatable(pObject).__index
	if metaIndex == Player then
		sTrueKey = (MY_MOD_NAME .. "_Player" .. pObject:GetID() .. "_" .. sKey)
	elseif metaIndex == Team then
		sTrueKey = (MY_MOD_NAME .. "_Team" .. pObject:GetID() .. "_" .. sKey)
	elseif metaIndex == Unit then
		sTrueKey = (MY_MOD_NAME .. "_Unit" .. CompileUnitID(pObject) .. "_" .. sKey)
	elseif metaIndex == Plot then
		sTrueKey = (MY_MOD_NAME .. "_Plot" .. CompilePlotID(pObject) .. "_" .. sKey)
	end

	if sTrueKey then
		SetPersistentProperty(sTrueKey, Val)
	end
end

function Load_Booleanfy(Val)
	if Val == "bTrue" then
		return true
	elseif Val == "bFalse" then
		return false
	end
	return Val
end

function load(pObject, sKey)
	local sTrueKey = nil
	if type(pObject) == "string" then
		if string.upper(pObject) == "GAME" then
			sTrueKey = (MY_MOD_NAME .. "_" .. sKey)
		else
			return
		end
	elseif pObject == nil or type(pObject) ~= "table" then
		return
	end

	local metaIndex = getmetatable(pObject).__index
	if metaIndex == Player then
		sTrueKey = (MY_MOD_NAME .. "_Player" .. pObject:GetID() .. "_" .. sKey)
	elseif metaIndex == Team then
		sTrueKey = (MY_MOD_NAME .. "_Team" .. pObject:GetID() .. "_" .. sKey)
	elseif metaIndex == Unit then
		sTrueKey = (MY_MOD_NAME .. "_Unit" .. CompileUnitID(pObject) .. "_" .. sKey)
	elseif metaIndex == Plot then
		sTrueKey = (MY_MOD_NAME .. "_Plot" .. CompilePlotID(pObject) .. "_" .. sKey)
	end

	if sTrueKey then
		return Load_Booleanfy(GetPersistentProperty(sTrueKey))
	end
end

--=======================================================================================================================
-- FARM RESOURCES ART
--=======================================================================================================================
-- This section reassigns the continent art type on plots based on the resource:
--   - For Rice: assign Asia (continent 2)
--   - For Maize: assign America (continent 1)
--   - If neither Rice nor Maize is present, restore the original continent type.

iResourceRice    = GameInfoTypes["RESOURCE_GAIA_RICE"]
iContinentRice   = 2 -- Asia
iResourceMaize   = GameInfoTypes["RESOURCE_GAIA_MAIZE"]
iContinentMaize  = 1 -- America
iResourceWheat   = GameInfoTypes["RESOURCE_WHEAT"]
iImprovementFarm = GameInfoTypes["IMPROVEMENT_FARM"]

function DoChangeContinent(iPlayer, iX, iY, iImprovement)
	local pPlot = Map.GetPlot(iX, iY)
	if not pPlot then return end

	local iContinentCurrent = pPlot:GetContinentArtType()
	if iImprovement == iImprovementFarm then
		if pPlot:GetResourceType() == iResourceRice and iContinentCurrent ~= iContinentRice then
			pPlot:SetContinentArtType(iContinentRice)
			save(pPlot, "OriginalContinent", iContinentCurrent)
		elseif pPlot:GetResourceType() == iResourceMaize and iContinentCurrent ~= iContinentMaize then
			pPlot:SetContinentArtType(iContinentMaize)
			save(pPlot, "OriginalContinent", iContinentCurrent)
		elseif (pPlot:GetResourceType() ~= iResourceWheat) and (iContinentCurrent == iContinentRice or iContinentCurrent == iContinentMaize) then
			pPlot:SetContinentArtType(iContinentCurrent + 2)
			save(pPlot, "OriginalContinent", iContinentCurrent)
		end
	elseif pPlot:GetResourceType() ~= iResourceWheat then
		local iContinentOriginal = tonumber(load(pPlot, "OriginalContinent"))
		if iContinentOriginal and iContinentOriginal >= 0 and iContinentOriginal <= 4 then
			pPlot:SetContinentArtType(iContinentOriginal)
			save(pPlot, "OriginalContinent", nil)
		end
	end
end
GameEvents.BuildFinished.Add(DoChangeContinent)

--=======================================================================================================================
