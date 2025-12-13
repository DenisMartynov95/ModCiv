-- written by GAIA using Notepad++
CREATE TABLE IF NOT EXISTS Sapiens_DBUpdates (Name TEXT PRIMARY KEY, Value INTEGER DEFAULT 0);
INSERT OR IGNORE INTO Sapiens_DBUpdates (Name) VALUES ('ResBldgs_Update');
--======================================================================================================================
-- GLOBAL DEFINES
--======================================================================================================================
-- Sets the limit for Building_LocalResourceOrs
UPDATE Defines SET Value = 32 WHERE Name = 'NUM_BUILDING_RESOURCE_PREREQS'; /*5*/

--======================================================================================================================
-- STONEWORKS
--======================================================================================================================
UPDATE Buildings SET ProhibitedCityTerrain = NULL WHERE BuildingClass = 'BUILDINGCLASS_STONE_WORKS';

DELETE FROM Building_ResourceYieldChanges WHERE BuildingType = 'BUILDING_STONE_WORKS' AND ResourceType IN ('RESOURCE_GAIA_JADE', 'RESOURCE_GAIA_LAPIS');
INSERT INTO Building_ResourceYieldChanges
		(BuildingType,					ResourceType,				YieldType,				Yield)
VALUES	('BUILDING_STONE_WORKS',		'RESOURCE_GAIA_JADE',		'YIELD_PRODUCTION',		1),
		('BUILDING_STONE_WORKS',		'RESOURCE_GAIA_LAPIS',		'YIELD_PRODUCTION',		1);

DELETE FROM Building_LocalResourceOrs WHERE BuildingType = 'BUILDING_STONE_WORKS' and ResourceType IN ('RESOURCE_GAIA_JADE', 'RESOURCE_GAIA_LAPIS');
INSERT INTO Building_LocalResourceOrs
		(BuildingType,					ResourceType)
VALUES	('BUILDING_STONE_WORKS',		'RESOURCE_GAIA_JADE'),
		('BUILDING_STONE_WORKS',		'RESOURCE_GAIA_LAPIS');

UPDATE Buildings SET Help = 'TXT_KEY_GAIA_BUILDING_STONE_WORKS_HELP' WHERE Type = 'BUILDING_STONE_WORKS';

--======================================================================================================================
-- WORKSHOP
--======================================================================================================================
UPDATE Buildings SET AllowsProductionTradeRoutes = 0 WHERE BuildingClass = 'BUILDINGCLASS_WORKSHOP';
DELETE FROM Building_ResourceYieldChanges WHERE BuildingType IN ('BUILDING_WORKSHOP', 'BUILDING_LONGHOUSE') AND ResourceType = 'RESOURCE_GAIA_TIMBER';
INSERT INTO Building_ResourceYieldChanges
		(BuildingType,					ResourceType,				YieldType,				Yield)
VALUES	('BUILDING_WORKSHOP',			'RESOURCE_GAIA_TIMBER',			'YIELD_PRODUCTION',		1),
		('BUILDING_LONGHOUSE',			'RESOURCE_GAIA_TIMBER',			'YIELD_PRODUCTION',		1);

UPDATE Buildings SET Help = 'TXT_KEY_GAIA_BUILDING_WORKSHOP_HELP' WHERE Type = 'BUILDING_WORKSHOP';
UPDATE Buildings SET Help = 'TXT_KEY_GAIA_BUILDING_LONGHOUSE_HELP' WHERE Type = 'BUILDING_LONGHOUSE';

CREATE TABLE IF NOT EXISTS _Building_InternalTradeRouteYieldChanges (
	BuildingType TEXT REFERENCES Buildings(Type), YieldType TEXT REFERENCES Yields(Type), Yield INTEGER DEFAULT 0
);
DELETE FROM _Building_InternalTradeRouteYieldChanges WHERE BuildingType IN ('BUILDING_WORKSHOP', 'BUILDING_LONGHOUSE');
INSERT INTO _Building_InternalTradeRouteYieldChanges (BuildingType, YieldType, Yield) VALUES
('BUILDING_WORKSHOP',	'YIELD_PRODUCTION', 1),
('BUILDING_LONGHOUSE',	'YIELD_PRODUCTION', 1);

UPDATE Buildings SET Help = 'TXT_KEY_GAIA_BUILDING_WORKSHOP_HELP2' WHERE Type = 'BUILDING_WORKSHOP'
	AND EXISTS (SELECT 1 FROM Missions WHERE Type = 'MISSION_GAIA_TRANSFORM');
UPDATE Buildings SET Help = 'TXT_KEY_GAIA_BUILDING_LONGHOUSE_HELP2' WHERE Type = 'BUILDING_LONGHOUSE'
	AND EXISTS (SELECT 1 FROM Missions WHERE Type = 'MISSION_GAIA_TRANSFORM');

--======================================================================================================================
-- FACTORY
--======================================================================================================================
DELETE FROM Building_ResourceYieldChanges WHERE BuildingType = 'BUILDING_FACTORY' AND ResourceType = 'RESOURCE_GAIA_RUBBER';
INSERT INTO Building_ResourceYieldChanges
		(BuildingType,			ResourceType,				YieldType,				Yield)
VALUES	('BUILDING_FACTORY',	'RESOURCE_GAIA_RUBBER',		'YIELD_PRODUCTION',		1);

UPDATE Buildings SET Help = 'TXT_KEY_GAIA_BUILDING_FACTORY_HELP' WHERE Type = 'BUILDING_FACTORY';

--======================================================================================================================
UPDATE Sapiens_DBUpdates SET Value = 1 WHERE Name = 'ResBldgs_Update';
