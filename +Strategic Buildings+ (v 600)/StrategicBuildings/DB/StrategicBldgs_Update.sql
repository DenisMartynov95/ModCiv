-- written by GAIA using Notepad++
CREATE TABLE IF NOT EXISTS Sapiens_DBUpdates (Name TEXT PRIMARY KEY, Value INTEGER DEFAULT 0);
INSERT OR IGNORE INTO Sapiens_DBUpdates (Name) VALUES ('StrategicBldgs_Update');
--======================================================================================================================
-- IRON WORKS
--======================================================================================================================
UPDATE Buildings SET Help = 'TXT_KEY_GAIA_BUILDING_IRONWORKS_HELP' WHERE Type = 'BUILDING_IRONWORKS';

DELETE FROM Building_ResourceQuantity WHERE BuildingType = 'BUILDING_IRONWORKS';
INSERT INTO Building_ResourceQuantity (BuildingType, ResourceType, Quantity) VALUES ('BUILDING_IRONWORKS', 'RESOURCE_IRON', 3);

DELETE FROM Building_ResourceYieldChanges WHERE BuildingType = 'BUILDING_IRONWORKS';
INSERT INTO Building_ResourceYieldChanges
		(BuildingType,			ResourceType,		YieldType,		Yield)
VALUES	('BUILDING_IRONWORKS',	'RESOURCE_IRON',	'YIELD_GOLD',	5);

--======================================================================================================================
-- RECYCLING CENTER
--======================================================================================================================
UPDATE Buildings SET Help = 'TXT_KEY_GAIA_BUILDING_RECYCLING_CENTER_HELP' WHERE Type = 'BUILDING_RECYCLING_CENTER';
UPDATE Buildings SET NeverCapture = 1, ConquestProb = 0 WHERE Type = 'BUILDING_RECYCLING_CENTER';

DELETE FROM Building_ResourceYieldChanges WHERE BuildingType = 'BUILDING_RECYCLING_CENTER';
INSERT INTO Building_ResourceYieldChanges
		(BuildingType,					ResourceType,			YieldType,			Yield)
VALUES	('BUILDING_RECYCLING_CENTER',	'RESOURCE_ALUMINUM',	'YIELD_SCIENCE',	1);

DELETE FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_RECYCLING_CENTER';
INSERT INTO Building_YieldChanges (BuildingType, YieldType,	Yield) VALUES
	('BUILDING_RECYCLING_CENTER', 'YIELD_PRODUCTION', 1);

DELETE FROM Building_Flavors WHERE BuildingType = 'BUILDING_RECYCLING_CENTER';
INSERT INTO Building_Flavors (BuildingType,	FlavorType,	Flavor) VALUES
	('BUILDING_RECYCLING_CENTER', 'FLAVOR_PRODUCTION', 20);

--======================================================================================================================
UPDATE Sapiens_DBUpdates SET Value = 1 WHERE Name = 'StrategicBldgs_Update';
