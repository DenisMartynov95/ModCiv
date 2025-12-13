-- written by GAIA using Notepad++
CREATE TABLE IF NOT EXISTS Sapiens_DBUpdates (Name TEXT PRIMARY KEY, Value INTEGER DEFAULT 0);
INSERT OR IGNORE INTO Sapiens_DBUpdates (Name) VALUES ('StrategicBldgs_New');
--======================================================================================================================
-- ICON ATLASES
--======================================================================================================================
DELETE FROM IconTextureAtlases WHERE Atlas = 'GAIA_STRATRES_ATLAS';
INSERT INTO IconTextureAtlases 
(Atlas, 					IconSize,	Filename, 						IconsPerRow,	IconsPerColumn) VALUES		
('GAIA_STRATRES_ATLAS',		256,		'GAIA_StratResBldgs_256.dds',	4,				1),
('GAIA_STRATRES_ATLAS',		128,		'GAIA_StratResBldgs_128.dds',	4,				1),
('GAIA_STRATRES_ATLAS',		80,			'GAIA_StratResBldgs_080.dds',	1,				1),
('GAIA_STRATRES_ATLAS',		64,			'GAIA_StratResBldgs_064.dds',	4,				1),
('GAIA_STRATRES_ATLAS',		45,			'GAIA_StratResBldgs_045.dds',	4,				1);

--======================================================================================================================
-- COAL PLANT
--======================================================================================================================
INSERT OR IGNORE INTO BuildingClasses (Type, Description, DefaultBuilding, MaxPlayerInstances) VALUES
    ('BUILDINGCLASS_GAIA_COALPLANT', 'TXT_KEY_BUILDING_GAIA_COALPLANT', 'BUILDING_GAIA_COALPLANT', 3);

DELETE FROM Civilization_BuildingClassOverrides WHERE BuildingClassType = 'BUILDINGCLASS_GAIA_COALPLANT';
INSERT INTO Civilization_BuildingClassOverrides (CivilizationType, BuildingClassType, BuildingType) VALUES
    ('CIVILIZATION_BARBARIAN', 'BUILDINGCLASS_GAIA_COALPLANT', NULL),
    ('CIVILIZATION_MINOR', 'BUILDINGCLASS_GAIA_COALPLANT', NULL);

INSERT OR IGNORE INTO Buildings
    (Type, PrereqTech, Cost, Goldmaintenance, IconAtlas, PortraitIndex, NeverCapture,
    BuildingClass, Description, Civilopedia, Help, MinAreaSize, HurryCostModifier)
VALUES
    ('BUILDING_GAIA_COALPLANT', 'TECH_ELECTRICITY', 360, 5, 'GAIA_STRATRES_ATLAS', 1, 1,
    'BUILDINGCLASS_GAIA_COALPLANT', 'TXT_KEY_BUILDING_GAIA_COALPLANT', 'TXT_KEY_BUILDING_GAIA_COALPLANT_PEDIA', 
    'TXT_KEY_BUILDING_GAIA_COALPLANT_HELP', -1, 160);

DELETE FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_GAIA_COALPLANT';
INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield) VALUES
    ('BUILDING_GAIA_COALPLANT', 'YIELD_PRODUCTION', 2);

DELETE FROM Building_ResourceYieldChanges WHERE BuildingType = 'BUILDING_GAIA_COALPLANT';
INSERT INTO Building_ResourceYieldChanges (BuildingType, ResourceType, YieldType, Yield) VALUES
    ('BUILDING_GAIA_COALPLANT', 'RESOURCE_COAL', 'YIELD_PRODUCTION', 1),
    ('BUILDING_GAIA_COALPLANT', 'RESOURCE_COAL', 'YIELD_GOLD', 3);

DELETE FROM Building_ResourceQuantity WHERE BuildingType = 'BUILDING_GAIA_COALPLANT';
INSERT INTO Building_ResourceQuantity (BuildingType, ResourceType, Quantity) VALUES
    ('BUILDING_GAIA_COALPLANT', 'RESOURCE_COAL', 1);

DELETE FROM Building_Flavors WHERE BuildingType = 'BUILDING_GAIA_COALPLANT';
INSERT INTO Building_Flavors (BuildingType, FlavorType, Flavor) VALUES
    ('BUILDING_GAIA_COALPLANT', 'FLAVOR_PRODUCTION', 20),
    ('BUILDING_GAIA_COALPLANT', 'FLAVOR_OFFENSE', 10),
    ('BUILDING_GAIA_COALPLANT', 'FLAVOR_DEFENSE', 10);

--======================================================================================================================
-- OIL REFINERY
--======================================================================================================================
INSERT OR IGNORE INTO BuildingClasses (Type, Description, DefaultBuilding, MaxPlayerInstances) VALUES
    ('BUILDINGCLASS_GAIA_OILREFINERY', 'TXT_KEY_BUILDING_GAIA_OILREFINERY', 'BUILDING_GAIA_OILREFINERY', 4);

DELETE FROM Civilization_BuildingClassOverrides WHERE BuildingClassType = 'BUILDINGCLASS_GAIA_OILREFINERY';
INSERT INTO Civilization_BuildingClassOverrides (CivilizationType, BuildingClassType, BuildingType) VALUES
    ('CIVILIZATION_BARBARIAN', 'BUILDINGCLASS_GAIA_OILREFINERY', NULL),
    ('CIVILIZATION_MINOR', 'BUILDINGCLASS_GAIA_OILREFINERY', NULL);

INSERT OR IGNORE INTO Buildings
    (Type, PrereqTech, Cost, Goldmaintenance, IconAtlas, PortraitIndex, NeverCapture,
    BuildingClass, Description, Civilopedia, Help, MinAreaSize, HurryCostModifier)
VALUES
    ('BUILDING_GAIA_OILREFINERY', 'TECH_COMBINED_ARMS', 500, 7, 'GAIA_STRATRES_ATLAS', 2, 1,
    'BUILDINGCLASS_GAIA_OILREFINERY', 'TXT_KEY_BUILDING_GAIA_OILREFINERY', 'TXT_KEY_BUILDING_GAIA_OILREFINERY_PEDIA', 
    'TXT_KEY_BUILDING_GAIA_OILREFINERY_HELP', -1, 160);

DELETE FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_GAIA_OILREFINERY';
INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield) VALUES
    ('BUILDING_GAIA_OILREFINERY', 'YIELD_PRODUCTION', 2);

DELETE FROM Building_ResourceYieldChanges WHERE BuildingType = 'BUILDING_GAIA_OILREFINERY';
INSERT INTO Building_ResourceYieldChanges (BuildingType, ResourceType, YieldType, Yield) VALUES
    ('BUILDING_GAIA_OILREFINERY', 'RESOURCE_OIL', 'YIELD_GOLD', 15);

DELETE FROM Building_ResourceQuantity WHERE BuildingType = 'BUILDING_GAIA_OILREFINERY';
INSERT INTO Building_ResourceQuantity (BuildingType, ResourceType, Quantity) VALUES
    ('BUILDING_GAIA_OILREFINERY', 'RESOURCE_OIL', 1);

DELETE FROM Building_Flavors WHERE BuildingType = 'BUILDING_GAIA_OILREFINERY';
INSERT INTO Building_Flavors (BuildingType, FlavorType, Flavor) VALUES
    ('BUILDING_GAIA_OILREFINERY', 'FLAVOR_PRODUCTION', 40),
    ('BUILDING_GAIA_OILREFINERY', 'FLAVOR_GROWTH', 10),
    ('BUILDING_GAIA_OILREFINERY', 'FLAVOR_OFFENSE', 10),
    ('BUILDING_GAIA_OILREFINERY', 'FLAVOR_DEFENSE', 10);

--======================================================================================================================
-- NUCLEAR REPROCESSING PLANT
--======================================================================================================================
INSERT OR IGNORE INTO BuildingClasses (Type, Description, DefaultBuilding, MaxPlayerInstances) VALUES
    ('BUILDINGCLASS_GAIA_REPROCESSPLANT', 'TXT_KEY_BUILDING_GAIA_REPROCESSPLANT', 'BUILDING_GAIA_REPROCESSPLANT', 2);

DELETE FROM Civilization_BuildingClassOverrides WHERE BuildingClassType = 'BUILDINGCLASS_GAIA_REPROCESSPLANT';
INSERT INTO Civilization_BuildingClassOverrides (CivilizationType, BuildingClassType, BuildingType) VALUES
    ('CIVILIZATION_BARBARIAN', 'BUILDINGCLASS_GAIA_REPROCESSPLANT', NULL),
    ('CIVILIZATION_MINOR', 'BUILDINGCLASS_GAIA_REPROCESSPLANT', NULL);

INSERT OR IGNORE INTO Buildings
    (Type, PrereqTech, Cost, Goldmaintenance, IconAtlas, PortraitIndex, NeverCapture,
    BuildingClass, Description, Civilopedia, Help, MinAreaSize, HurryCostModifier)
VALUES
    ('BUILDING_GAIA_REPROCESSPLANT', 'TECH_MOBILE_TACTICS', 1500, 20, 'GAIA_STRATRES_ATLAS', 3, 1,
    'BUILDINGCLASS_GAIA_REPROCESSPLANT', 'TXT_KEY_BUILDING_GAIA_REPROCESSPLANT', 'TXT_KEY_BUILDING_GAIA_REPROCESSPLANT_PEDIA', 
    'TXT_KEY_BUILDING_GAIA_REPROCESSPLANT_HELP', -1, 160);

DELETE FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_GAIA_REPROCESSPLANT';
INSERT INTO Building_ClassesNeededInCity (BuildingType, BuildingClassType) VALUES
    ('BUILDING_GAIA_REPROCESSPLANT', 'BUILDINGCLASS_NUCLEAR_PLANT');

DELETE FROM Building_PrereqBuildingClasses WHERE BuildingType = 'BUILDING_GAIA_REPROCESSPLANT';
INSERT INTO Building_PrereqBuildingClasses (BuildingType, BuildingClassType, NumBuildingNeeded) VALUES
    ('BUILDING_GAIA_REPROCESSPLANT', 'BUILDINGCLASS_NUCLEAR_PLANT', -1);

DELETE FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_GAIA_REPROCESSPLANT';
INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield) VALUES
    ('BUILDING_GAIA_REPROCESSPLANT', 'YIELD_PRODUCTION', 2);

DELETE FROM Building_ResourceYieldChanges WHERE BuildingType = 'BUILDING_GAIA_REPROCESSPLANT';
INSERT INTO Building_ResourceYieldChanges (BuildingType, ResourceType, YieldType, Yield) VALUES
    ('BUILDING_GAIA_REPROCESSPLANT', 'RESOURCE_URANIUM', 'YIELD_PRODUCTION', 1);

DELETE FROM Building_ResourceQuantity WHERE BuildingType = 'BUILDING_GAIA_REPROCESSPLANT';
INSERT INTO Building_ResourceQuantity (BuildingType, ResourceType, Quantity) VALUES
    ('BUILDING_GAIA_REPROCESSPLANT', 'RESOURCE_URANIUM', 5);

DELETE FROM Building_Flavors WHERE BuildingType = 'BUILDING_GAIA_REPROCESSPLANT';
INSERT INTO Building_Flavors (BuildingType, FlavorType, Flavor) VALUES
    ('BUILDING_GAIA_REPROCESSPLANT', 'FLAVOR_PRODUCTION', 50),
    ('BUILDING_GAIA_REPROCESSPLANT', 'FLAVOR_GROWTH', 50),
    ('BUILDING_GAIA_REPROCESSPLANT', 'FLAVOR_OFFENSE', 50),
    ('BUILDING_GAIA_REPROCESSPLANT', 'FLAVOR_DEFENSE', 50);

--==========================================================================================================================
-- SHANDAN MILITARY HORSE RANCH
--==========================================================================================================================
INSERT OR IGNORE INTO BuildingClasses (Type, Description, DefaultBuilding, MaxGlobalInstances) VALUES
	('BUILDINGCLASS_GAIA_SHANDAN', 'TXT_KEY_BUILDING_GAIA_SHANDAN', 'BUILDING_GAIA_SHANDAN', 1);

DELETE FROM Civilization_BuildingClassOverrides WHERE BuildingClassType = 'BUILDINGCLASS_GAIA_SHANDAN';
INSERT INTO Civilization_BuildingClassOverrides (CivilizationType, BuildingClassType, BuildingType) VALUES
	('CIVILIZATION_BARBARIAN', 'BUILDINGCLASS_GAIA_SHANDAN', NULL),
	('CIVILIZATION_MINOR', 'BUILDINGCLASS_GAIA_SHANDAN', NULL);

INSERT OR IGNORE INTO Buildings 
	(Type, BuildingClass, Description, Civilopedia, Help, Quote, ThemingBonusHelp, Cost, FaithCost, NukeImmune, HurryCostModifier, 
	 MinAreaSize, ConquestProb, IconAtlas, PortraitIndex, WonderSplashImage, Flat, NearbyTerrainRequired, PrereqTech, MaxStartEra) 
VALUES 
	('BUILDING_GAIA_SHANDAN', 'BUILDINGCLASS_GAIA_SHANDAN', 'TXT_KEY_BUILDING_GAIA_SHANDAN', 'TXT_KEY_WONDER_GAIA_SHANDAN_PEDIA', 
	 'TXT_KEY_WONDER_GAIA_SHANDAN_HELP', 'TXT_KEY_WONDER_GAIA_SHANDAN_QUOTE', NULL, 180, 0, 1, -1, -1, 100, 'GAIA_STRATRES_ATLAS', 0, 
	 'GAIA_ShandanHorseFarm.dds', 1, 'TERRAIN_PLAINS', 'TECH_ANIMAL_HUSBANDRY', 'ERA_CLASSICAL');

DELETE FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_GAIA_SHANDAN';
INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield) VALUES
	('BUILDING_GAIA_SHANDAN', 'YIELD_CULTURE', 1),
	('BUILDING_GAIA_SHANDAN', 'YIELD_FOOD', 1),
	('BUILDING_GAIA_SHANDAN', 'YIELD_PRODUCTION', 1),
	('BUILDING_GAIA_SHANDAN', 'YIELD_GOLD', 5);

DELETE FROM _Building_ImprovedResourceYieldChanges WHERE BuildingType = 'BUILDING_GAIA_SHANDAN';
INSERT INTO _Building_ImprovedResourceYieldChanges (BuildingType, ResourceType, YieldType, Yield) VALUES
	('BUILDING_GAIA_SHANDAN', 'RESOURCE_HORSE', 'YIELD_FOOD',		1),
	('BUILDING_GAIA_SHANDAN', 'RESOURCE_HORSE', 'YIELD_PRODUCTION', 1),
	('BUILDING_GAIA_SHANDAN', 'RESOURCE_HORSE', 'YIELD_GOLD',		5);

DELETE FROM _Building_ResourcePlotsToPlace WHERE BuildingType = 'BUILDING_GAIA_SHANDAN';
INSERT INTO _Building_ResourcePlotsToPlace (BuildingType, ResourceType, NumPlots, ResourceQuantityToPlace) VALUES
	('BUILDING_GAIA_SHANDAN', 'RESOURCE_HORSE', 2, 2);

DELETE FROM Building_Flavors WHERE BuildingType = 'BUILDING_GAIA_SHANDAN';
INSERT INTO Building_Flavors (BuildingType, FlavorType, Flavor) VALUES
	('BUILDING_GAIA_SHANDAN', 'FLAVOR_WONDER', 20),
	('BUILDING_GAIA_SHANDAN', 'FLAVOR_PRODUCTION', 20),
	('BUILDING_GAIA_SHANDAN', 'FLAVOR_GOLD', 20);

--======================================================================================================================
UPDATE Sapiens_DBUpdates SET Value = 1 WHERE Name = 'StrategicBldgs_New';
