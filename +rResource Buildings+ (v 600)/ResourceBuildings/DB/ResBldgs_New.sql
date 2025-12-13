-- written by GAIA using Notepad++
CREATE TABLE IF NOT EXISTS Sapiens_DBUpdates (Name TEXT PRIMARY KEY, Value INTEGER DEFAULT 0);
INSERT OR IGNORE INTO Sapiens_DBUpdates (Name) VALUES ('ResBldgs_New');
--======================================================================================================================
-- ICON ATLASES
--======================================================================================================================
DELETE FROM IconTextureAtlases WHERE Atlas = 'GAIA_RESBLDG_ATLAS';
INSERT INTO IconTextureAtlases	
		(Atlas, 					IconSize,	Filename, 							IconsPerRow,	IconsPerColumn) 
VALUES	('GAIA_SEAWEEDMARKET_ICON',	256,		'GAIA_SeaweedMarket_256.dds',		1,				1),
		('GAIA_SEAWEEDMARKET_ICON',	128,		'GAIA_SeaweedMarket_128.dds',		1,				1),
		('GAIA_SEAWEEDMARKET_ICON',	64,			'GAIA_SeaweedMarket_064.dds',		1,				1),
		('GAIA_SEAWEEDMARKET_ICON',	45,			'GAIA_SeaweedMarket_045.dds',		1,				1),
		('GAIA_RESBLDG_ATLAS',		256,		'GAIA_ResBuildings_256.dds',		5,				4),
		('GAIA_RESBLDG_ATLAS',		128,		'GAIA_ResBuildings_128.dds',		5,				4),
		('GAIA_RESBLDG_ATLAS',		64,			'GAIA_ResBuildings_064.dds',		5,				4),
		('GAIA_RESBLDG_ATLAS',		45,			'GAIA_ResBuildings_045.dds',		5,				4);

--======================================================================================================================
-- RESOURCE BUILDINGS
--======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- AGRIBUSINESS
------------------------------------------------------------------------------------------------------------------------
INSERT OR IGNORE INTO BuildingClasses (Type, Description, DefaultBuilding)
VALUES ('BUILDINGCLASS_GAIA_AGRIBUSINESS', 'TXT_KEY_BUILDING_GAIA_AGRIBUSINESS', 'BUILDING_GAIA_AGRIBUSINESS');
INSERT OR IGNORE INTO Buildings
    (Type, PrereqTech, Cost, Goldmaintenance, IconAtlas, PortraitIndex, BuildingClass, Description, Civilopedia, Help, 
    MinAreaSize, HurryCostModifier, ConquestProb)
VALUES
    ('BUILDING_GAIA_AGRIBUSINESS', 'TECH_COMBINED_ARMS', 360, 0, 'GAIA_RESBLDG_ATLAS', 6, 
    'BUILDINGCLASS_GAIA_AGRIBUSINESS', 'TXT_KEY_BUILDING_GAIA_AGRIBUSINESS', 'TXT_KEY_BUILDING_GAIA_AGRIBUSINESS_PEDIA', 'TXT_KEY_BUILDING_GAIA_AGRIBUSINESS_HELP', 
    -1, 160, 66);

DELETE FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_GAIA_AGRIBUSINESS';
INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield) 
VALUES ('BUILDING_GAIA_AGRIBUSINESS', 'YIELD_FOOD', 2), 
       ('BUILDING_GAIA_AGRIBUSINESS', 'YIELD_PRODUCTION', 1), 
       ('BUILDING_GAIA_AGRIBUSINESS', 'YIELD_GOLD', 3);

--Building_ResourceYieldChanges
DELETE FROM Building_ResourceYieldChanges WHERE BuildingType = 'BUILDING_GAIA_AGRIBUSINESS';
INSERT INTO Building_ResourceYieldChanges (BuildingType, ResourceType, YieldType, Yield)
	SELECT 'BUILDING_GAIA_AGRIBUSINESS', ResourceType, 'YIELD_PRODUCTION', 1
	FROM Improvement_ResourceTypes WHERE ImprovementType = 'IMPROVEMENT_FARM';
INSERT INTO Building_ResourceYieldChanges (BuildingType, ResourceType, YieldType, Yield)
	SELECT 'BUILDING_GAIA_AGRIBUSINESS', ResourceType, 'YIELD_GOLD', 1
	FROM Improvement_ResourceTypes WHERE ImprovementType = 'IMPROVEMENT_FARM';
INSERT INTO Building_ResourceYieldChanges (BuildingType, ResourceType, YieldType, Yield)
	SELECT 'BUILDING_GAIA_AGRIBUSINESS', ResourceType, 'YIELD_PRODUCTION', 1
	FROM Improvement_ResourceTypes WHERE ImprovementType = 'IMPROVEMENT_PASTURE';
INSERT INTO Building_ResourceYieldChanges (BuildingType, ResourceType, YieldType, Yield)
	SELECT 'BUILDING_GAIA_AGRIBUSINESS', ResourceType, 'YIELD_GOLD', 1
	FROM Improvement_ResourceTypes WHERE ImprovementType = 'IMPROVEMENT_PASTURE';

--Building_LocalResourceOrs
DELETE FROM Building_LocalResourceOrs WHERE BuildingType = 'BUILDING_GAIA_AGRIBUSINESS';
INSERT INTO Building_LocalResourceOrs (BuildingType, ResourceType)
	SELECT 'BUILDING_GAIA_AGRIBUSINESS', ResourceType
	FROM Improvement_ResourceTypes WHERE ImprovementType = 'IMPROVEMENT_FARM';
INSERT INTO Building_LocalResourceOrs (BuildingType, ResourceType)
	SELECT 'BUILDING_GAIA_AGRIBUSINESS', ResourceType
	FROM Improvement_ResourceTypes WHERE ImprovementType = 'IMPROVEMENT_PASTURE';

DELETE FROM Building_Flavors WHERE BuildingType = 'BUILDING_GAIA_AGRIBUSINESS';
INSERT INTO Building_Flavors (BuildingType, FlavorType, Flavor) 
VALUES ('BUILDING_GAIA_AGRIBUSINESS', 'FLAVOR_GROWTH', 40);

-------------------------------------------------------------------------------------------------------------------------
-- CHOCOLATIER
-------------------------------------------------------------------------------------------------------------------------
INSERT OR IGNORE INTO BuildingClasses (Type, Description, DefaultBuilding)
VALUES ('BUILDINGCLASS_GAIA_CHOCOLATIER', 'TXT_KEY_BUILDING_GAIA_CHOCOLATIER', 'BUILDING_GAIA_CHOCOLATIER');
INSERT OR IGNORE INTO Buildings
    (Type, PrereqTech, Cost, Goldmaintenance, IconAtlas, PortraitIndex, BuildingClass, Description, Civilopedia, Help, 
    MinAreaSize, HurryCostModifier, ConquestProb)
VALUES
    ('BUILDING_GAIA_CHOCOLATIER', 'TECH_GUILDS', 120, 0, 'GAIA_RESBLDG_ATLAS', 1, 
    'BUILDINGCLASS_GAIA_CHOCOLATIER', 'TXT_KEY_BUILDING_GAIA_CHOCOLATIER', 'TXT_KEY_BUILDING_GAIA_CHOCOLATIER_PEDIA', 'TXT_KEY_BUILDING_GAIA_CHOCOLATIER_HELP', 
    -1, 160, 66);

DELETE FROM Building_ResourceYieldChanges WHERE BuildingType = 'BUILDING_GAIA_CHOCOLATIER';
INSERT INTO Building_ResourceYieldChanges (BuildingType, ResourceType, YieldType, Yield) 
VALUES ('BUILDING_GAIA_CHOCOLATIER', 'RESOURCE_COCOA', 'YIELD_GOLD', 3),
       ('BUILDING_GAIA_CHOCOLATIER', 'RESOURCE_SUGAR', 'YIELD_GOLD', 3),
       ('BUILDING_GAIA_CHOCOLATIER', 'RESOURCE_SPICES', 'YIELD_GOLD', 3),
       ('BUILDING_GAIA_CHOCOLATIER', 'RESOURCE_COCOA', 'YIELD_FOOD', 3),
       ('BUILDING_GAIA_CHOCOLATIER', 'RESOURCE_SUGAR', 'YIELD_FOOD', 3),
       ('BUILDING_GAIA_CHOCOLATIER', 'RESOURCE_SPICES', 'YIELD_FOOD', 3);

DELETE FROM Building_LocalResourceOrs WHERE BuildingType = 'BUILDING_GAIA_CHOCOLATIER';
INSERT INTO Building_LocalResourceOrs (BuildingType, ResourceType) 
VALUES ('BUILDING_GAIA_CHOCOLATIER', 'RESOURCE_COCOA'),
       ('BUILDING_GAIA_CHOCOLATIER', 'RESOURCE_SUGAR'),
       ('BUILDING_GAIA_CHOCOLATIER', 'RESOURCE_SPICES');

DELETE FROM Building_Flavors WHERE BuildingType = 'BUILDING_GAIA_CHOCOLATIER';
INSERT INTO Building_Flavors (BuildingType, FlavorType, Flavor) 
VALUES ('BUILDING_GAIA_CHOCOLATIER', 'FLAVOR_GOLD', 15),
       ('BUILDING_GAIA_CHOCOLATIER', 'FLAVOR_GROWTH', 15),
       ('BUILDING_GAIA_CHOCOLATIER', 'FLAVOR_HAPPINESS', 20);

-------------------------------------------------------------------------------------------------------------------------
-- FISHPOND
-------------------------------------------------------------------------------------------------------------------------
INSERT OR IGNORE INTO BuildingClasses (Type, Description, DefaultBuilding)
VALUES ('BUILDINGCLASS_GAIA_FISHPOND', 'TXT_KEY_BUILDING_GAIA_FISHPOND', 'BUILDING_GAIA_FISHPOND');
INSERT OR IGNORE INTO Buildings
    (Type, PrereqTech, Cost, Goldmaintenance, IconAtlas, PortraitIndex, BuildingClass, Description, Civilopedia, Help, 
    MinAreaSize, HurryCostModifier, ConquestProb)
VALUES
    ('BUILDING_GAIA_FISHPOND', 'TECH_GAIA_FISHING', 50, 1, 'GAIA_RESBLDG_ATLAS', 0, 
    'BUILDINGCLASS_GAIA_FISHPOND', 'TXT_KEY_BUILDING_GAIA_FISHPOND', 'TXT_KEY_BUILDING_GAIA_FISHPOND_PEDIA', 'TXT_KEY_BUILDING_GAIA_FISHPOND_HELP', 
    -1, 160, 66);
UPDATE Buildings SET PrereqTech = 'TECH_POTTERY' WHERE Type = 'BUILDING_GAIA_FISHPOND'
	AND NOT EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_GAIA_FISHING');

DELETE FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_GAIA_FISHPOND';
INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield) 
VALUES ('BUILDING_GAIA_FISHPOND', 'YIELD_FOOD', 1);

DELETE FROM Building_ResourceYieldChanges WHERE BuildingType = 'BUILDING_GAIA_FISHPOND';
INSERT INTO Building_ResourceYieldChanges (BuildingType, ResourceType, YieldType, Yield) 
VALUES ('BUILDING_GAIA_FISHPOND', 'RESOURCE_FISH', 'YIELD_FOOD', 1),
       ('BUILDING_GAIA_FISHPOND', 'RESOURCE_GAIA_LAKEFISH', 'YIELD_FOOD', 1);

DELETE FROM Building_LocalResourceOrs WHERE BuildingType = 'BUILDING_GAIA_FISHPOND';
INSERT INTO Building_LocalResourceOrs (BuildingType, ResourceType) 
VALUES ('BUILDING_GAIA_FISHPOND', 'RESOURCE_FISH'),
       ('BUILDING_GAIA_FISHPOND', 'RESOURCE_GAIA_LAKEFISH');

DELETE FROM Building_Flavors WHERE BuildingType = 'BUILDING_GAIA_FISHPOND';
INSERT INTO Building_Flavors (BuildingType, FlavorType, Flavor) 
VALUES ('BUILDING_GAIA_FISHPOND', 'FLAVOR_NAVAL_GROWTH', 20),
       ('BUILDING_GAIA_FISHPOND', 'FLAVOR_GROWTH', 15),
       ('BUILDING_GAIA_FISHPOND', 'FLAVOR_PRODUCTION', 30),
       ('BUILDING_GAIA_FISHPOND', 'FLAVOR_CITY_DEFENSE', 50);

-------------------------------------------------------------------------------------------------------------------------
-- HERBALIST
-------------------------------------------------------------------------------------------------------------------------
INSERT OR IGNORE INTO BuildingClasses (Type, Description, DefaultBuilding)
VALUES ('BUILDINGCLASS_GAIA_HERBALIST', 'TXT_KEY_BUILDING_GAIA_HERBALIST', 'BUILDING_GAIA_HERBALIST');
INSERT OR IGNORE INTO Buildings
    (Type, PrereqTech, Cost, Goldmaintenance, IconAtlas, PortraitIndex, BuildingClass, Description, Civilopedia, Help, 
    MinAreaSize, HurryCostModifier, ConquestProb)
VALUES
    ('BUILDING_GAIA_HERBALIST', 'TECH_CALENDAR', 80, 1, 'GAIA_RESBLDG_ATLAS', 5, 
    'BUILDINGCLASS_GAIA_HERBALIST', 'TXT_KEY_BUILDING_GAIA_HERBALIST', 'TXT_KEY_BUILDING_GAIA_HERBALIST_PEDIA', 'TXT_KEY_BUILDING_GAIA_HERBALIST_HELP', 
    -1, 160, 66);

DELETE FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_GAIA_HERBALIST';
INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield) 
VALUES ('BUILDING_GAIA_HERBALIST', 'YIELD_FOOD', 1),
       ('BUILDING_GAIA_HERBALIST', 'YIELD_PRODUCTION', 1);

--Building_ResourceYieldChanges
DELETE FROM Building_ResourceYieldChanges WHERE BuildingType = 'BUILDING_GAIA_HERBALIST';
INSERT INTO Building_ResourceYieldChanges (BuildingType, ResourceType, YieldType, Yield) VALUES
('BUILDING_GAIA_HERBALIST', 'RESOURCE_GAIA_CACTUS', 'YIELD_SCIENCE', 0),
('BUILDING_GAIA_HERBALIST', 'RESOURCE_GAIA_POPPIES', 'YIELD_SCIENCE', 0);
--('BUILDING_GAIA_HERBALIST', 'RESOURCE_GAIA_TULIPS', 'YIELD_PRODUCTION', 1); -- has unique improvement

INSERT INTO Building_ResourceYieldChanges (BuildingType, ResourceType, YieldType, Yield)
SELECT 'BUILDING_GAIA_HERBALIST', ResourceType, 'YIELD_PRODUCTION', 1
FROM Improvement_ResourceTypes WHERE ImprovementType = 'IMPROVEMENT_PLANTATION';

--Building_LocalResourceOrs
DELETE FROM Building_LocalResourceOrs WHERE BuildingType = 'BUILDING_GAIA_HERBALIST';
INSERT INTO Building_LocalResourceOrs (BuildingType, ResourceType)
SELECT 'BUILDING_GAIA_HERBALIST', ResourceType
FROM Improvement_ResourceTypes WHERE ImprovementType = 'IMPROVEMENT_PLANTATION';
--INSERT INTO Building_LocalResourceOrs (BuildingType, ResourceType) VALUES
--('BUILDING_GAIA_HERBALIST','RESOURCE_GAIA_TULIPS'); -- has unique improvement

--Building_Flavors
DELETE FROM Building_Flavors WHERE BuildingType = 'BUILDING_GAIA_HERBALIST';
INSERT INTO Building_Flavors (BuildingType, FlavorType, Flavor) 
VALUES ('BUILDING_GAIA_HERBALIST', 'FLAVOR_GROWTH', 10),
       ('BUILDING_GAIA_HERBALIST', 'FLAVOR_PRODUCTION', 10),
       ('BUILDING_GAIA_HERBALIST', 'FLAVOR_SCIENCE', 5),
       ('BUILDING_GAIA_HERBALIST', 'FLAVOR_CULTURE', 5);

-------------------------------------------------------------------------------------------------------------------------
-- JEWELER
-------------------------------------------------------------------------------------------------------------------------
INSERT OR IGNORE INTO BuildingClasses (Type, Description, DefaultBuilding)
VALUES ('BUILDINGCLASS_GAIA_JEWELER', 'TXT_KEY_BUILDING_GAIA_JEWELER', 'BUILDING_GAIA_JEWELER');
INSERT OR IGNORE INTO Buildings
    (Type, PrereqTech, Cost, Goldmaintenance, IconAtlas, PortraitIndex, BuildingClass, Description, Civilopedia, Help, 
    MinAreaSize, HurryCostModifier, ConquestProb)
VALUES
    ('BUILDING_GAIA_JEWELER', 'TECH_METAL_CASTING', 100, 0, 'GAIA_RESBLDG_ATLAS', 2, 
    'BUILDINGCLASS_GAIA_JEWELER', 'TXT_KEY_BUILDING_GAIA_JEWELER', 'TXT_KEY_BUILDING_GAIA_JEWELER_PEDIA', 'TXT_KEY_BUILDING_GAIA_JEWELER_HELP', 
    -1, 160, 66);

DELETE FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_GAIA_JEWELER';
INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield) VALUES
('BUILDING_GAIA_JEWELER', 'YIELD_GOLD', 1); 

DELETE FROM Building_YieldModifiers WHERE BuildingType = 'BUILDING_GAIA_JEWELER';
INSERT INTO Building_YieldModifiers (BuildingType, YieldType, Yield) VALUES
('BUILDING_GAIA_JEWELER', 'YIELD_GOLD', 5); 

DELETE FROM Building_ResourceYieldChanges WHERE BuildingType = 'BUILDING_GAIA_JEWELER';
INSERT INTO Building_ResourceYieldChanges (BuildingType, ResourceType, YieldType, Yield) 
VALUES ('BUILDING_GAIA_JEWELER', 'RESOURCE_GEMS',			'YIELD_GOLD',		5),
       ('BUILDING_GAIA_JEWELER', 'RESOURCE_PEARLS',			'YIELD_GOLD',		5),
       ('BUILDING_GAIA_JEWELER', 'RESOURCE_GAIA_AMBER',		'YIELD_GOLD',		5),
       ('BUILDING_GAIA_JEWELER', 'RESOURCE_GAIA_CORAL',		'YIELD_GOLD',		5),
       ('BUILDING_GAIA_JEWELER', 'RESOURCE_GAIA_CORAL',		'YIELD_CULTURE',	1),
       ('BUILDING_GAIA_JEWELER', 'RESOURCE_GEMS',			'YIELD_CULTURE',	1),
       ('BUILDING_GAIA_JEWELER', 'RESOURCE_PEARLS',			'YIELD_CULTURE',	1),
       ('BUILDING_GAIA_JEWELER', 'RESOURCE_GAIA_AMBER',		'YIELD_CULTURE',	1);

DELETE FROM Building_LocalResourceOrs WHERE BuildingType = 'BUILDING_GAIA_JEWELER';
INSERT INTO Building_LocalResourceOrs (BuildingType, ResourceType) 
VALUES ('BUILDING_GAIA_JEWELER', 'RESOURCE_GEMS'),
       ('BUILDING_GAIA_JEWELER', 'RESOURCE_PEARLS'),
       ('BUILDING_GAIA_JEWELER', 'RESOURCE_GAIA_AMBER'),
       ('BUILDING_GAIA_JEWELER', 'RESOURCE_GAIA_CORAL');
	   
DELETE FROM Building_Flavors WHERE BuildingType = 'BUILDING_GAIA_JEWELER';
INSERT INTO Building_Flavors (BuildingType, FlavorType, Flavor) 
VALUES ('BUILDING_GAIA_JEWELER', 'FLAVOR_GOLD', 10),
       ('BUILDING_GAIA_JEWELER', 'FLAVOR_CULTURE', 20);

-------------------------------------------------------------------------------------------------------------------------
-- PERFUMERY
-------------------------------------------------------------------------------------------------------------------------
INSERT OR IGNORE INTO BuildingClasses (Type, Description, DefaultBuilding)
VALUES ('BUILDINGCLASS_GAIA_PERFUMERY', 'TXT_KEY_BUILDING_GAIA_PERFUMERY', 'BUILDING_GAIA_PERFUMERY');
INSERT OR IGNORE INTO Buildings
    (Type, PrereqTech, Cost, Goldmaintenance, IconAtlas, PortraitIndex, BuildingClass, Description, Civilopedia, Help, 
    MinAreaSize, HurryCostModifier, ConquestProb, CultureRateModifier)
VALUES
    ('BUILDING_GAIA_PERFUMERY', 'TECH_CHEMISTRY', 250, 0, 'GAIA_RESBLDG_ATLAS', 3, 
    'BUILDINGCLASS_GAIA_PERFUMERY', 'TXT_KEY_BUILDING_GAIA_PERFUMERY', 'TXT_KEY_BUILDING_GAIA_PERFUMERY_PEDIA', 'TXT_KEY_BUILDING_GAIA_PERFUMERY_HELP', 
    -1, 160, 66, 5);

DELETE FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_GAIA_PERFUMERY';
INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield) 
VALUES ('BUILDING_GAIA_PERFUMERY', 'YIELD_CULTURE', 1);

DELETE FROM Building_ResourceYieldChanges WHERE BuildingType = 'BUILDING_GAIA_PERFUMERY';
INSERT INTO Building_ResourceYieldChanges (BuildingType, ResourceType, YieldType, Yield) VALUES
--('BUILDING_GAIA_PERFUMERY', 'RESOURCE_GAIA_ROSES', 'YIELD_GOLD', 1),
('BUILDING_GAIA_PERFUMERY', 'RESOURCE_GAIA_LAVENDER', 'YIELD_GOLD', 3),
('BUILDING_GAIA_PERFUMERY', 'RESOURCE_GAIA_BERRIES', 'YIELD_CULTURE', 1);

DELETE FROM Building_LocalResourceOrs WHERE BuildingType = 'BUILDING_GAIA_PERFUMERY';
INSERT INTO Building_LocalResourceOrs (BuildingType, ResourceType) VALUES
--('BUILDING_GAIA_PERFUMERY', 'RESOURCE_GAIA_ROSES'),
('BUILDING_GAIA_PERFUMERY', 'RESOURCE_GAIA_LAVENDER'),
('BUILDING_GAIA_PERFUMERY', 'RESOURCE_GAIA_BERRIES');

DELETE FROM Building_Flavors WHERE BuildingType = 'BUILDING_GAIA_PERFUMERY';
INSERT INTO Building_Flavors (BuildingType, FlavorType, Flavor) VALUES
('BUILDING_GAIA_PERFUMERY', 'FLAVOR_HAPPINESS', 10),
('BUILDING_GAIA_PERFUMERY', 'FLAVOR_CULTURE', 10),
('BUILDING_GAIA_PERFUMERY', 'FLAVOR_GOLD', 10);

-------------------------------------------------------------------------------------------------------------------------
-- SEAWEED MARKET
-------------------------------------------------------------------------------------------------------------------------
INSERT OR IGNORE INTO BuildingClasses (Type, Description, DefaultBuilding)
VALUES ('BUILDINGCLASS_GAIA_SEAWEEDMARKET', 'TXT_KEY_BUILDING_GAIA_SEAWEEDMARKET', 'BUILDING_GAIA_SEAWEEDMARKET');
INSERT OR IGNORE INTO Buildings
    (Type, PrereqTech, Cost, Goldmaintenance, IconAtlas, PortraitIndex, BuildingClass, Description, Civilopedia, Help, 
    MinAreaSize, HurryCostModifier, ConquestProb)
VALUES
    ('BUILDING_GAIA_SEAWEEDMARKET', 'TECH_GAIA_SEAFARING', 120, 0, 'GAIA_SEAWEEDMARKET_ICON', 0, 
    'BUILDINGCLASS_GAIA_SEAWEEDMARKET', 'TXT_KEY_BUILDING_GAIA_SEAWEEDMARKET', 'TXT_KEY_BUILDING_GAIA_SEAWEEDMARKET_PEDIA', 'TXT_KEY_BUILDING_GAIA_SEAWEEDMARKET_HELP', 
    -1, 160, 66);

UPDATE Buildings SET PrereqTech = 'TECH_COMPASS' WHERE Type = 'BUILDING_GAIA_SEAWEEDMARKET'
	AND NOT EXISTS (SELECT 1 FROM Technologies WHERE Type = 'TECH_GAIA_SEAFARING');

DELETE FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_GAIA_PERFUMERY';
INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield) VALUES
('BUILDING_GAIA_SEAWEEDMARKET', 'YIELD_FOOD', 1),
('BUILDING_GAIA_SEAWEEDMARKET', 'YIELD_GOLD', 5);

DELETE FROM Building_LocalResourceOrs WHERE BuildingType = 'BUILDING_GAIA_SEAWEEDMARKET';
INSERT INTO Building_LocalResourceOrs (BuildingType, ResourceType) 
VALUES ('BUILDING_GAIA_SEAWEEDMARKET', 'RESOURCE_GAIA_KELP');

DELETE FROM Building_ResourceYieldChanges WHERE BuildingType = 'BUILDING_GAIA_SEAWEEDMARKET';
INSERT INTO Building_ResourceYieldChanges (BuildingType, ResourceType, YieldType, Yield) VALUES
('BUILDING_GAIA_SEAWEEDMARKET', 'RESOURCE_GAIA_KELP', 'YIELD_FOOD', 1),
('BUILDING_GAIA_SEAWEEDMARKET', 'RESOURCE_GAIA_KELP', 'YIELD_GOLD', 5);

DELETE FROM Building_Flavors WHERE BuildingType = 'BUILDING_GAIA_SEAWEEDMARKET';
INSERT INTO Building_Flavors (BuildingType, FlavorType, Flavor) 
VALUES ('BUILDING_GAIA_SEAWEEDMARKET', 'FLAVOR_GOLD', 20),
       ('BUILDING_GAIA_SEAWEEDMARKET', 'FLAVOR_GROWTH', 20);

CREATE TABLE IF NOT EXISTS _Building_InternalTradeRouteYieldChanges (
	BuildingType TEXT REFERENCES Buildings(Type), YieldType TEXT REFERENCES Yields(Type), Yield INTEGER DEFAULT 0
);
DELETE FROM _Building_InternalTradeRouteYieldChanges WHERE BuildingType = 'BUILDING_GAIA_SEAWEEDMARKET';
INSERT INTO _Building_InternalTradeRouteYieldChanges (BuildingType, YieldType, Yield) 
VALUES ('BUILDING_GAIA_SEAWEEDMARKET', 'YIELD_FOOD', 2);

UPDATE Buildings SET Help = 'TXT_KEY_BUILDING_GAIA_SEAWEEDMARKET_HELP2' WHERE Type = 'BUILDING_GAIA_SEAWEEDMARKET'
	AND EXISTS (SELECT 1 FROM Missions WHERE Type = 'MISSION_GAIA_TRANSFORM');

-------------------------------------------------------------------------------------------------------------------------
-- SMELTER
-------------------------------------------------------------------------------------------------------------------------

INSERT OR IGNORE INTO BuildingClasses (Type, Description, DefaultBuilding)
VALUES ('BUILDINGCLASS_GAIA_SMELTER', 'TXT_KEY_BUILDING_GAIA_SMELTER', 'BUILDING_GAIA_SMELTER');
INSERT OR IGNORE INTO Buildings
    (Type, PrereqTech, Cost, Goldmaintenance, IconAtlas, PortraitIndex, BuildingClass, Description, Civilopedia, Help, 
    MinAreaSize, HurryCostModifier, ConquestProb, AllowsProductionTradeRoutes, FreeStartEra)
VALUES
    ('BUILDING_GAIA_SMELTER', 'TECH_BRONZE_WORKING', 80, 1, 'GAIA_RESBLDG_ATLAS', 4, 
    'BUILDINGCLASS_GAIA_SMELTER', 'TXT_KEY_BUILDING_GAIA_SMELTER', 'TXT_KEY_BUILDING_GAIA_SMELTER_PEDIA', 'TXT_KEY_BUILDING_GAIA_SMELTER_HELP', 
    -1, 160, 66, 1, 'ERA_RENAISSANCE');

DELETE FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_GAIA_SMELTER';
INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield) 
VALUES ('BUILDING_GAIA_SMELTER', 'YIELD_PRODUCTION', 1);

DELETE FROM Building_ResourceYieldChanges WHERE BuildingType = 'BUILDING_GAIA_SMELTER';
INSERT INTO Building_ResourceYieldChanges (BuildingType, ResourceType, YieldType, Yield) 
VALUES ('BUILDING_GAIA_SMELTER', 'RESOURCE_GAIA_TIN', 'YIELD_PRODUCTION', 1);

DELETE FROM Building_Flavors WHERE BuildingType = 'BUILDING_GAIA_SMELTER';
INSERT INTO Building_Flavors (BuildingType, FlavorType, Flavor) 
VALUES ('BUILDING_GAIA_SMELTER', 'FLAVOR_PRODUCTION', 30),
       ('BUILDING_GAIA_SMELTER', 'FLAVOR_I_TRADE_ORIGIN', 10),
       ('BUILDING_GAIA_SMELTER', 'FLAVOR_I_LAND_TRADE_ROUTE', 10),
       ('BUILDING_GAIA_SMELTER', 'FLAVOR_I_SEA_TRADE_ROUTE', 10);

-------------------------------------------------------------------------------------------------------------------------
-- SUPERMARKET
-------------------------------------------------------------------------------------------------------------------------
INSERT OR IGNORE INTO BuildingClasses (Type, Description, DefaultBuilding)
VALUES ('BUILDINGCLASS_GAIA_SUPERMARKET', 'TXT_KEY_BUILDING_GAIA_SUPERMARKET', 'BUILDING_GAIA_SUPERMARKET');
INSERT OR IGNORE INTO Buildings
    (Type, PrereqTech, Cost, Goldmaintenance, IconAtlas, PortraitIndex, BuildingClass, Description, Civilopedia, Help, 
    MinAreaSize, HurryCostModifier, ConquestProb)
VALUES
    ('BUILDING_GAIA_SUPERMARKET', 'TECH_ECONOMICS', 250, 3, 'BW_ATLAS_1', 41, 
    'BUILDINGCLASS_GAIA_SUPERMARKET', 'TXT_KEY_BUILDING_GAIA_SUPERMARKET', 'TXT_KEY_BUILDING_GAIA_SUPERMARKET_PEDIA', 'TXT_KEY_BUILDING_GAIA_SUPERMARKET_HELP', 
    -1, 160, 66);

DELETE FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_GAIA_SUPERMARKET';
INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield) 
VALUES ('BUILDING_GAIA_SUPERMARKET', 'YIELD_FOOD', 2);

DELETE FROM Building_ResourceYieldChanges WHERE BuildingType = 'BUILDING_GAIA_SUPERMARKET';
INSERT INTO Building_ResourceYieldChanges (BuildingType, ResourceType, YieldType, Yield) 
VALUES ('BUILDING_GAIA_SUPERMARKET', 'RESOURCE_CITRUS', 'YIELD_FOOD', 1),
       ('BUILDING_GAIA_SUPERMARKET', 'RESOURCE_GAIA_OLIVES', 'YIELD_FOOD', 1),
       ('BUILDING_GAIA_SUPERMARKET', 'RESOURCE_SALT', 'YIELD_FOOD', 1),
       ('BUILDING_GAIA_SUPERMARKET', 'RESOURCE_TRUFFLES', 'YIELD_FOOD', 1),
       ('BUILDING_GAIA_SUPERMARKET', 'RESOURCE_CITRUS', 'YIELD_GOLD', 1),
       ('BUILDING_GAIA_SUPERMARKET', 'RESOURCE_GAIA_OLIVES', 'YIELD_GOLD', 5),
       ('BUILDING_GAIA_SUPERMARKET', 'RESOURCE_SALT', 'YIELD_GOLD', 5),
       ('BUILDING_GAIA_SUPERMARKET', 'RESOURCE_TRUFFLES', 'YIELD_GOLD', 5);

DELETE FROM Building_LocalResourceOrs WHERE BuildingType = 'BUILDING_GAIA_SUPERMARKET';
INSERT INTO Building_LocalResourceOrs (BuildingType, ResourceType) 
VALUES ('BUILDING_GAIA_SUPERMARKET', 'RESOURCE_CITRUS'),
       ('BUILDING_GAIA_SUPERMARKET', 'RESOURCE_GAIA_OLIVES'),
       ('BUILDING_GAIA_SUPERMARKET', 'RESOURCE_SALT'),
       ('BUILDING_GAIA_SUPERMARKET', 'RESOURCE_TRUFFLES');

DELETE FROM Building_Flavors WHERE BuildingType = 'BUILDING_GAIA_SUPERMARKET';
INSERT INTO Building_Flavors (BuildingType, FlavorType, Flavor) 
VALUES ('BUILDING_GAIA_SUPERMARKET', 'FLAVOR_GROWTH', 25);

-------------------------------------------------------------------------------------------------------------------------
-- TANNERY
-------------------------------------------------------------------------------------------------------------------------
INSERT OR IGNORE INTO BuildingClasses (Type, Description, DefaultBuilding)
VALUES ('BUILDINGCLASS_GAIA_TANNERY', 'TXT_KEY_BUILDING_GAIA_TANNERY', 'BUILDING_GAIA_TANNERY');
INSERT OR IGNORE INTO Buildings
    (Type, PrereqTech, Cost, Goldmaintenance, IconAtlas, PortraitIndex, BuildingClass, Description, Civilopedia, Help, 
    MinAreaSize, HurryCostModifier, ConquestProb)
VALUES
    ('BUILDING_GAIA_TANNERY', 'TECH_HORSEBACK_RIDING', 100, 1, 'GAIA_RESBLDG_ATLAS', 7, 
    'BUILDINGCLASS_GAIA_TANNERY', 'TXT_KEY_BUILDING_GAIA_TANNERY', 'TXT_KEY_BUILDING_GAIA_TANNERY_PEDIA', 'TXT_KEY_BUILDING_GAIA_TANNERY_HELP', 
    -1, 160, 66);

DELETE FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_GAIA_TANNERY';
INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield) 
VALUES ('BUILDING_GAIA_TANNERY', 'YIELD_FOOD', 1),
       ('BUILDING_GAIA_TANNERY', 'YIELD_PRODUCTION', 1);

DELETE FROM Building_ResourceYieldChanges WHERE BuildingType = 'BUILDING_GAIA_TANNERY';
INSERT INTO Building_ResourceYieldChanges (BuildingType, ResourceType, YieldType, Yield) 
VALUES ('BUILDING_GAIA_TANNERY', 'RESOURCE_FUR', 'YIELD_GOLD', 5),
       ('BUILDING_GAIA_TANNERY', 'RESOURCE_GAIA_SEALS', 'YIELD_GOLD', 5);

DELETE FROM Building_LocalResourceOrs WHERE BuildingType = 'BUILDING_GAIA_TANNERY';
INSERT INTO Building_LocalResourceOrs (BuildingType, ResourceType) 
VALUES ('BUILDING_GAIA_TANNERY', 'RESOURCE_GAIA_SEALS');

--Building_ResourceYieldChanges
DELETE FROM Building_ResourceYieldChanges WHERE BuildingType = 'BUILDING_GAIA_TANNERY';
INSERT INTO Building_ResourceYieldChanges (BuildingType, ResourceType, YieldType, Yield)
	SELECT 'BUILDING_GAIA_TANNERY', ResourceType, 'YIELD_PRODUCTION', 1
	FROM Improvement_ResourceTypes WHERE ImprovementType = 'IMPROVEMENT_CAMP';

--Building_LocalResourceOrs
DELETE FROM Building_LocalResourceOrs WHERE BuildingType = 'BUILDING_GAIA_TANNERY';
INSERT INTO Building_LocalResourceOrs (BuildingType, ResourceType)
	SELECT 'BUILDING_GAIA_TANNERY', ResourceType
	FROM Improvement_ResourceTypes WHERE ImprovementType = 'IMPROVEMENT_CAMP';

DELETE FROM Building_Flavors WHERE BuildingType = 'BUILDING_GAIA_TANNERY';
INSERT INTO Building_Flavors (BuildingType, FlavorType, Flavor) 
VALUES ('BUILDING_GAIA_TANNERY', 'FLAVOR_PRODUCTION', 10),
       ('BUILDING_GAIA_TANNERY', 'FLAVOR_GROWTH', 10),
       ('BUILDING_GAIA_TANNERY', 'FLAVOR_GOLD', 10);

-------------------------------------------------------------------------------------------------------------------------
-- TEAHOUSE
-------------------------------------------------------------------------------------------------------------------------
INSERT OR IGNORE INTO BuildingClasses (Type, Description, DefaultBuilding)
VALUES ('BUILDINGCLASS_GAIA_TEAHOUSE', 'TXT_KEY_BUILDING_GAIA_TEAHOUSE', 'BUILDING_GAIA_TEAHOUSE');
INSERT OR IGNORE INTO Buildings
    (Type, PrereqTech, Cost, Goldmaintenance, IconAtlas, PortraitIndex, BuildingClass, Description, Civilopedia, Help, 
    MinAreaSize, HurryCostModifier, ConquestProb)
VALUES
    ('BUILDING_GAIA_TEAHOUSE', 'TECH_STEEL', 160, 2, 'GAIA_RESBLDG_ATLAS', 9, 
    'BUILDINGCLASS_GAIA_TEAHOUSE', 'TXT_KEY_BUILDING_GAIA_TEAHOUSE', 'TXT_KEY_BUILDING_GAIA_TEAHOUSE_PEDIA', 'TXT_KEY_BUILDING_GAIA_TEAHOUSE_HELP', 
    -1, 160, 66);

DELETE FROM Building_ResourceYieldChanges WHERE BuildingType = 'BUILDING_GAIA_TEAHOUSE';
INSERT INTO Building_ResourceYieldChanges (BuildingType, ResourceType, YieldType, Yield) 
VALUES ('BUILDING_GAIA_TEAHOUSE', 'RESOURCE_GAIA_TEA', 'YIELD_GOLD', 3),
       ('BUILDING_GAIA_TEAHOUSE', 'RESOURCE_GAIA_COFFEE', 'YIELD_GOLD', 3),
       ('BUILDING_GAIA_TEAHOUSE', 'RESOURCE_GAIA_TOBACCO', 'YIELD_GOLD', 3),
       ('BUILDING_GAIA_TEAHOUSE', 'RESOURCE_GAIA_TEA', 'YIELD_CULTURE', 3),
       ('BUILDING_GAIA_TEAHOUSE', 'RESOURCE_GAIA_COFFEE', 'YIELD_CULTURE', 3),
       ('BUILDING_GAIA_TEAHOUSE', 'RESOURCE_GAIA_TOBACCO', 'YIELD_CULTURE', 3);

DELETE FROM Building_LocalResourceOrs WHERE BuildingType = 'BUILDING_GAIA_TEAHOUSE';
INSERT INTO Building_LocalResourceOrs (BuildingType, ResourceType) 
VALUES ('BUILDING_GAIA_TEAHOUSE', 'RESOURCE_GAIA_TEA'),
       ('BUILDING_GAIA_TEAHOUSE', 'RESOURCE_GAIA_COFFEE'),
       ('BUILDING_GAIA_TEAHOUSE', 'RESOURCE_GAIA_TOBACCO');

DELETE FROM Building_Flavors WHERE BuildingType = 'BUILDING_GAIA_TEAHOUSE';
INSERT INTO Building_Flavors (BuildingType, FlavorType, Flavor) 
VALUES ('BUILDING_GAIA_TEAHOUSE', 'FLAVOR_GOLD', 10),
       ('BUILDING_GAIA_TEAHOUSE', 'FLAVOR_CULTURE', 10),
       ('BUILDING_GAIA_TEAHOUSE', 'FLAVOR_I_TRADE_ORIGIN', 10),
       ('BUILDING_GAIA_TEAHOUSE', 'FLAVOR_I_LAND_TRADE_ROUTE', 10),
       ('BUILDING_GAIA_TEAHOUSE', 'FLAVOR_I_SEA_TRADE_ROUTE', 10);

-------------------------------------------------------------------------------------------------------------------------
-- TEXTILEMILL
-------------------------------------------------------------------------------------------------------------------------
INSERT OR IGNORE INTO BuildingClasses (Type, Description, DefaultBuilding)
VALUES ('BUILDINGCLASS_GAIA_TEXTILEMILL', 'TXT_KEY_BUILDING_GAIA_TEXTILEMILL', 'BUILDING_GAIA_TEXTILEMILL');
INSERT OR IGNORE INTO Buildings
    (Type, PrereqTech, Cost, Goldmaintenance, IconAtlas, PortraitIndex, BuildingClass, Description, Civilopedia, Help, 
    MinAreaSize, HurryCostModifier, ConquestProb)
VALUES
    ('BUILDING_GAIA_TEXTILEMILL', 'TECH_ECONOMICS', 300, 4, 'GAIA_RESBLDG_ATLAS', 8, 
    'BUILDINGCLASS_GAIA_TEXTILEMILL', 'TXT_KEY_BUILDING_GAIA_TEXTILEMILL', 'TXT_KEY_BUILDING_GAIA_TEXTILEMILL_PEDIA', 'TXT_KEY_BUILDING_GAIA_TEXTILEMILL_HELP', 
    -1, 160, 66);

DELETE FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_GAIA_TEXTILEMILL';
INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield) 
VALUES ('BUILDING_GAIA_TEXTILEMILL', 'YIELD_PRODUCTION', 2);

DELETE FROM Building_ResourceYieldChanges WHERE BuildingType = 'BUILDING_GAIA_TEXTILEMILL';
INSERT INTO Building_ResourceYieldChanges (BuildingType, ResourceType, YieldType, Yield) 
VALUES ('BUILDING_GAIA_TEXTILEMILL', 'RESOURCE_SILK', 'YIELD_GOLD', 3),
       ('BUILDING_GAIA_TEXTILEMILL', 'RESOURCE_COTTON', 'YIELD_GOLD', 4),
       ('BUILDING_GAIA_TEXTILEMILL', 'RESOURCE_SHEEP', 'YIELD_GOLD', 4),
       ('BUILDING_GAIA_TEXTILEMILL', 'RESOURCE_DYE', 'YIELD_GOLD', 4),
       ('BUILDING_GAIA_TEXTILEMILL', 'RESOURCE_GAIA_FLAX', 'YIELD_GOLD', 4),
       ('BUILDING_GAIA_TEXTILEMILL', 'RESOURCE_SILK', 'YIELD_PRODUCTION', 1),
       ('BUILDING_GAIA_TEXTILEMILL', 'RESOURCE_COTTON', 'YIELD_PRODUCTION', 1),
       ('BUILDING_GAIA_TEXTILEMILL', 'RESOURCE_SHEEP', 'YIELD_PRODUCTION', 1),
       ('BUILDING_GAIA_TEXTILEMILL', 'RESOURCE_DYE', 'YIELD_PRODUCTION', 1),
       ('BUILDING_GAIA_TEXTILEMILL', 'RESOURCE_GAIA_FLAX', 'YIELD_PRODUCTION', 1);

DELETE FROM Building_LocalResourceOrs WHERE BuildingType = 'BUILDING_GAIA_TEXTILEMILL';
INSERT INTO Building_LocalResourceOrs (BuildingType, ResourceType) 
VALUES ('BUILDING_GAIA_TEXTILEMILL', 'RESOURCE_COTTON'),
       ('BUILDING_GAIA_TEXTILEMILL', 'RESOURCE_SHEEP'),
       ('BUILDING_GAIA_TEXTILEMILL', 'RESOURCE_SILK'),
       ('BUILDING_GAIA_TEXTILEMILL', 'RESOURCE_DYE'),
       ('BUILDING_GAIA_TEXTILEMILL', 'RESOURCE_GAIA_FLAX');

DELETE FROM Building_Flavors WHERE BuildingType = 'BUILDING_GAIA_TEXTILEMILL';
INSERT INTO Building_Flavors (BuildingType, FlavorType, Flavor) 
VALUES ('BUILDING_GAIA_TEXTILEMILL', 'FLAVOR_PRODUCTION', 25),
       ('BUILDING_GAIA_TEXTILEMILL', 'FLAVOR_GOLD', 15);

--======================================================================================================================
UPDATE Sapiens_DBUpdates SET Value = 1 WHERE Name = 'ResBldgs_New';
