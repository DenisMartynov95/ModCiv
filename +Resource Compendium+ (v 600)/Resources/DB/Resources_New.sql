-- written by GAIA using Notepad++
CREATE TABLE IF NOT EXISTS Sapiens_DBUpdates (Name TEXT PRIMARY KEY, Value INTEGER DEFAULT 0);
INSERT OR IGNORE INTO Sapiens_DBUpdates (Name) VALUES ('Resources_New');
--=======================================================================================================================
-- NEW RESOURCES
--=======================================================================================================================
CREATE TABLE IF NOT EXISTS GAIA_Res_Config (
	Res_Name TEXT PRIMARY KEY, Res_Active INTEGER NOT NULL, 
	Res_Atlas TEXT, Res_PortraitIndex INTEGER
);
INSERT OR REPLACE INTO GAIA_Res_Config 
		(Res_Name,			Res_Active, Res_Atlas,					Res_PortraitIndex)
VALUES	('AMBER',			2,			'GAIA_RESOURCE_ATLAS',		0),
		('COFFEE',			1,			'GAIA_RESOURCE_ATLAS',		1),
		('CORAL',			1,			'GAIA_RESOURCE_ATLAS',		2),
		('JADE',			1,			'GAIA_RESOURCE_ATLAS',		3),
		('LAPIS',			1,			'GAIA_RESOURCE_ATLAS',		4),
		('OLIVES',			1,			'GAIA_RESOURCE_ATLAS',		5),	
		('POPPIES',			1,			'GAIA_RESOURCE_ATLAS',		6),
		('SEALS',			1,			'GAIA_RESOURCE_ATLAS',		7),
		('TEA',				1,			'GAIA_RESOURCE_ATLAS',		8),
		('TOBACCO',			1,			'GAIA_RESOURCE_ATLAS',		9),
		('LAVENDER',		1,			'GAIA_RESOURCE_ATLAS',		10),	
		('BERRIES',			2,			'GAIA_RESOURCE_ATLAS',		11),
		('CACTUS',			2,			'GAIA_RESOURCE_ATLAS',		12),	
		('COCONUTS',		2,			'GAIA_RESOURCE_ATLAS',		13),	
		('FLAX',			2,			'GAIA_RESOURCE_ATLAS',		14),
		('KELP',			2,			'GAIA_RESOURCE_ATLAS',		15),	
		('LAKEFISH',		2,			'GAIA_RESOURCE_ATLAS',		16),
		('MAIZE',			2,			'GAIA_RESOURCE_ATLAS',		17),
		('RICE',			2,			'GAIA_RESOURCE_ATLAS',		18),
		('RUBBER',			2,			'GAIA_RESOURCE_ATLAS',		19),
		('TIMBER',			2,			'GAIA_RESOURCE_ATLAS',		20),
		('TIN',				2,			'GAIA_RESOURCE_ATLAS',		21),	
		('CARPETS',			3,			'GAIA_RESOURCE_ATLAS',		22),
		('FURNITURE',		3,			'GAIA_RESOURCE_ATLAS',		23),
		('GLASSWARE',		3,			'GAIA_RESOURCE_ATLAS',		24),
		('LACQUERWARE',		3,			'GAIA_RESOURCE_ATLAS',		25),
		('MOSAICTILES',		3,			'GAIA_RESOURCE_ATLAS',		26),
		('PERFUME',			3,			'GAIA_RESOURCE_ATLAS',		27);

INSERT OR IGNORE INTO Resources 
		(Type,						ResourceClassType,		Description,						Civilopedia,									IconString,							ArtDefineTag,					IconAtlas,	PortraitIndex,		Happiness,	PlacementOrder,	ConstAppearance,	RandApp1,	RandApp2,	ResourceUsage,	MinAreaSize,	MaxLatitude,	Flatlands,	Player)
SELECT	'RESOURCE_GAIA_'||Res_Name,	'RESOURCECLASS_LUXURY',	'TXT_KEY_RESOURCE_GAIA_'||Res_Name,	'TXT_KEY_RESOURCE_GAIA_'||Res_Name||'_PEDIA',	'[ICON_RES_GAIA_'||Res_Name||']',	'ART_DEF_RES_GAIA_'||Res_Name,	Res_Atlas,	Res_PortraitIndex,	4,			4,				50,					25,			25,			2,				3,				90,				1,			67
FROM GAIA_Res_Config WHERE Res_Active = 1;

INSERT OR IGNORE INTO Resources 
		(Type,						ResourceClassType,		Description,						Civilopedia,									IconString,							ArtDefineTag,					IconAtlas,	PortraitIndex,		PlacementOrder,	ConstAppearance,	RandApp1,	RandApp2,	MinAreaSize,	MaxLatitude,	Flatlands)
SELECT	'RESOURCE_GAIA_'||Res_Name,	'RESOURCECLASS_BONUS',	'TXT_KEY_RESOURCE_GAIA_'||Res_Name,	'TXT_KEY_RESOURCE_GAIA_'||Res_Name||'_PEDIA',	'[ICON_RES_GAIA_'||Res_Name||']',	'ART_DEF_RES_GAIA_'||Res_Name,	Res_Atlas,	Res_PortraitIndex,	4,				50,					25,			25,			3,				90,				1		
FROM GAIA_Res_Config WHERE Res_Active = 2;

INSERT OR IGNORE INTO Resources 
		(Type,						ResourceClassType,		OnlyMinorCivs,	Description,						Civilopedia,									Help,										IconString,							ArtDefineTag,			IconAtlas,	PortraitIndex,		Happiness,	PlacementOrder,	ConstAppearance,	RandApp1,	RandApp2,	ResourceUsage,	AIObjective,	MinAreaSize,	MaxLatitude,	Flatlands,	Hills,	Player)
SELECT	'RESOURCE_GAIA_'||Res_Name,	'RESOURCECLASS_LUXURY',	1,				'TXT_KEY_RESOURCE_GAIA_'||Res_Name,	'TXT_KEY_RESOURCE_GAIA_'||Res_Name||'_PEDIA',	'TXT_KEY_RESOURCE_GAIA_'||Res_Name||'_HELP','[ICON_RES_GAIA_'||Res_Name||']',	'ART_DEF_RESOURCE_FUR',	Res_Atlas,	Res_PortraitIndex,	4,			3,				50,					25,			25,			2,				3,				1500,			90,				0,			0,		67
FROM GAIA_Res_Config WHERE Res_Active = 3;

DROP TABLE GAIA_Res_Config;
--=======================================================================================================================
-- RESOURCE DEFINES
--=======================================================================================================================	
-------------------------------------------------------------------------------------------------------------------------
-- TechCityTrade
--------------------------------------------------------------------------------------------------------------------------
UPDATE Resources SET TechCityTrade = (SELECT PrereqTech FROM Builds WHERE Type = 'BUILD_FARM')
		WHERE Type IN ('RESOURCE_GAIA_MAIZE', 'RESOURCE_GAIA_RICE');

UPDATE Resources SET TechCityTrade = (SELECT PrereqTech FROM Builds WHERE Type = 'BUILD_FISHING_BOATS')
		WHERE Type IN ('RESOURCE_GAIA_CORAL', 'RESOURCE_GAIA_SEALS','RESOURCE_GAIA_LAKEFISH');
		
UPDATE Resources SET TechCityTrade = (SELECT PrereqTech FROM Builds WHERE Type = 'BUILD_LUMBERMILL')
		WHERE Type IN ('RESOURCE_GAIA_TIMBER');

UPDATE Resources SET TechCityTrade = (SELECT PrereqTech FROM Builds WHERE Type = 'BUILD_MINE')
		WHERE Type IN ('RESOURCE_GAIA_AMBER', 'RESOURCE_GAIA_TIN');

UPDATE Resources SET TechCityTrade = (SELECT PrereqTech FROM Builds WHERE Type = 'BUILD_PLANTATION')
		WHERE Type IN 
		('RESOURCE_GAIA_COFFEE', 'RESOURCE_GAIA_CACTUS',
		'RESOURCE_GAIA_COCONUTS', 'RESOURCE_GAIA_FLAX', 'RESOURCE_GAIA_LAVENDER', 'RESOURCE_GAIA_OLIVES',
		'RESOURCE_GAIA_POPPIES', 'RESOURCE_GAIA_TEA', 'RESOURCE_GAIA_TOBACCO', 'RESOURCE_GAIA_BERRIES');
		
UPDATE Resources SET TechCityTrade = (SELECT PrereqTech FROM Builds WHERE Type = 'BUILD_QUARRY')
		WHERE Type IN ('RESOURCE_GAIA_JADE', 'RESOURCE_GAIA_LAPIS');

UPDATE Resources SET TechReveal = 'TECH_INDUSTRIALIZATION', TechCityTrade = 'TECH_INDUSTRIALIZATION'
		WHERE Type = 'RESOURCE_GAIA_RUBBER';

UPDATE Resources SET TechReveal = 'TECH_COMPASS', TechCityTrade = 'TECH_COMPASS'
		WHERE Type = 'RESOURCE_GAIA_KELP';

-------------------------------------------------------------------------------------------------------------------------
-- Resource_YieldChanges
-------------------------------------------------------------------------------------------------------------------------
DELETE FROM Resource_YieldChanges
WHERE ResourceType LIKE '%AMBER%'
   OR ResourceType LIKE '%COFFEE%'
   OR ResourceType LIKE '%CORAL%'
   OR ResourceType LIKE '%JADE%'
   OR ResourceType LIKE '%LAPIS%'
   OR ResourceType LIKE '%OLIVE%'
   OR ResourceType LIKE '%POPP%'
   OR ResourceType LIKE '%OPIUM%'
   OR ResourceType LIKE '%SEAL%'
   OR ResourceType LIKE '%TEA%'
   OR ResourceType LIKE '%TOBACCO%'
   OR ResourceType LIKE '%CIGAR%'
   OR ResourceType LIKE '%LAVENDER%'
   OR ResourceType LIKE '%BERR%'
   OR ResourceType LIKE '%CACT%'
   OR ResourceType LIKE '%COCONUT%'
   OR ResourceType LIKE '%FLAX%'
   OR ResourceType LIKE '%LAKEFISH%'
   OR ResourceType LIKE '%TROUT%'
   OR ResourceType LIKE '%MAIZE%'
   OR ResourceType LIKE '%RICE%'
   OR ResourceType LIKE '%RUBBER%'
   OR ResourceType LIKE '%TIMBER%'
   OR ResourceType LIKE '%TIN%'
   OR ResourceType LIKE '%CARPET%'
   OR ResourceType LIKE '%FURNITURE%'
   OR ResourceType LIKE '%GLASS%'
   OR ResourceType LIKE '%LACQ%'
   OR ResourceType LIKE '%TILES%'
   OR ResourceType LIKE '%PERFUME%'
   OR ResourceType LIKE '%FRAGRANCE%'
   OR ResourceType LIKE '%KELP%'
;
INSERT INTO Resource_YieldChanges
		(ResourceType,				YieldType,			Yield)
VALUES	('RESOURCE_GAIA_AMBER',		'YIELD_GOLD',		5),
		('RESOURCE_GAIA_COFFEE',	'YIELD_GOLD',		5),
		('RESOURCE_GAIA_CORAL',		'YIELD_GOLD',		5),
		('RESOURCE_GAIA_JADE',		'YIELD_GOLD',		5),
		('RESOURCE_GAIA_LAPIS',		'YIELD_GOLD',		5),
		('RESOURCE_GAIA_OLIVES',	'YIELD_GOLD',		4),
		('RESOURCE_GAIA_OLIVES',	'YIELD_FOOD',		1),
		('RESOURCE_GAIA_POPPIES',	'YIELD_GOLD',		4),
		('RESOURCE_GAIA_SEALS',		'YIELD_FOOD',		1),
		('RESOURCE_GAIA_SEALS',		'YIELD_GOLD',		4),
		('RESOURCE_GAIA_TEA',		'YIELD_GOLD',		4),
		('RESOURCE_GAIA_TOBACCO',	'YIELD_GOLD',		5),
		('RESOURCE_GAIA_LAVENDER',	'YIELD_CULTURE',	1),
		
		('RESOURCE_GAIA_RICE',		'YIELD_FOOD',		1),
		('RESOURCE_GAIA_MAIZE',		'YIELD_FOOD',		1),
		('RESOURCE_GAIA_BERRIES',	'YIELD_FOOD',		1),
		('RESOURCE_GAIA_CACTUS',	'YIELD_FOOD',		1),
		('RESOURCE_GAIA_COCONUTS',	'YIELD_FOOD',		1),
		('RESOURCE_GAIA_FLAX',		'YIELD_GOLD',		3),
		('RESOURCE_GAIA_TIMBER',	'YIELD_PRODUCTION', 1),
		('RESOURCE_GAIA_TIN',		'YIELD_PRODUCTION', 1), 
		('RESOURCE_GAIA_LAKEFISH',	'YIELD_FAITH',		1),
		('RESOURCE_GAIA_RUBBER',	'YIELD_PRODUCTION', 1),
		('RESOURCE_GAIA_RUBBER',	'YIELD_GOLD',		3),

		('RESOURCE_PORCELAIN',		'YIELD_CULTURE',	1),
		('RESOURCE_JEWELRY',		'YIELD_CULTURE',	1),
		('RESOURCE_GAIA_CARPETS',	'YIELD_GOLD',		3),
		('RESOURCE_GAIA_CARPETS',	'YIELD_CULTURE',	1),
		('RESOURCE_GAIA_FURNITURE',	'YIELD_GOLD',		3),
		('RESOURCE_GAIA_FURNITURE',	'YIELD_CULTURE',	1),
		('RESOURCE_GAIA_GLASSWARE',	'YIELD_GOLD',		4),
		('RESOURCE_GAIA_GLASSWARE',	'YIELD_CULTURE',	1),
		('RESOURCE_GAIA_LACQUERWARE','YIELD_GOLD',		4),
		('RESOURCE_GAIA_LACQUERWARE','YIELD_CULTURE',	1),
		('RESOURCE_GAIA_MOSAICTILES','YIELD_GOLD',		3),
		('RESOURCE_GAIA_MOSAICTILES','YIELD_CULTURE',	1),
		('RESOURCE_GAIA_PERFUME',	'YIELD_GOLD',		4),
		('RESOURCE_GAIA_PERFUME',	'YIELD_CULTURE',	1),
		
		('RESOURCE_GAIA_KELP',		'YIELD_FOOD',		1);
		
UPDATE Resource_YieldChanges SET Yield =  1 WHERE YieldType = 'YIELD_GOLD' 
	AND ResourceType IN ('RESOURCE_PORCELAIN', 'RESOURCE_JEWELRY');

-------------------------------------------------------------------------------------------------------------------------
-- Resource_Flavors (Bonus Resources)
-------------------------------------------------------------------------------------------------------------------------
DELETE FROM Resource_Flavors
WHERE ResourceType LIKE '%AMBER%'
   OR ResourceType LIKE '%COFFEE%'
   OR ResourceType LIKE '%CORAL%'
   OR ResourceType LIKE '%JADE%'
   OR ResourceType LIKE '%LAPIS%'
   OR ResourceType LIKE '%OLIVE%'
   OR ResourceType LIKE '%POPP%'
   OR ResourceType LIKE '%OPIUM%'
   OR ResourceType LIKE '%SEAL%'
   OR ResourceType LIKE '%TEA%'
   OR ResourceType LIKE '%TOBACCO%'
   OR ResourceType LIKE '%CIGAR%'
   OR ResourceType LIKE '%LAVENDER%'
   OR ResourceType LIKE '%BERR%'
   OR ResourceType LIKE '%CACT%'
   OR ResourceType LIKE '%COCONUT%'
   OR ResourceType LIKE '%FLAX%'
   OR ResourceType LIKE '%LAKEFISH%'
   OR ResourceType LIKE '%TROUT%'
   OR ResourceType LIKE '%MAIZE%'
   OR ResourceType LIKE '%RICE%'
   OR ResourceType LIKE '%RUBBER%'
   OR ResourceType LIKE '%TIMBER%'
   OR ResourceType LIKE '%TIN%'
   OR ResourceType LIKE '%CARPET%'
   OR ResourceType LIKE '%FURNITURE%'
   OR ResourceType LIKE '%GLASS%'
   OR ResourceType LIKE '%LACQ%'
   OR ResourceType LIKE '%TILES%'
   OR ResourceType LIKE '%PERFUME%'
   OR ResourceType LIKE '%FRAGRANCE%'
   OR ResourceType LIKE '%KELP%'
;
INSERT INTO Resource_Flavors
		(ResourceType,					FlavorType,				Flavor)
VALUES	('RESOURCE_GAIA_AMBER',			'FLAVOR_HAPPINESS',		10),
		('RESOURCE_GAIA_COFFEE',		'FLAVOR_HAPPINESS',		10),
		('RESOURCE_GAIA_CORAL',			'FLAVOR_HAPPINESS',		10),
		('RESOURCE_GAIA_JADE',			'FLAVOR_HAPPINESS',		10),
		('RESOURCE_GAIA_LAPIS',			'FLAVOR_HAPPINESS',		10),
		('RESOURCE_GAIA_OLIVES',		'FLAVOR_HAPPINESS',		10),
		('RESOURCE_GAIA_POPPIES',		'FLAVOR_HAPPINESS',		10),
		('RESOURCE_GAIA_SEALS',			'FLAVOR_HAPPINESS',		10),
		('RESOURCE_GAIA_TEA',			'FLAVOR_HAPPINESS',		10),
		('RESOURCE_GAIA_TOBACCO',		'FLAVOR_HAPPINESS',		10),
		('RESOURCE_GAIA_LAVENDER',		'FLAVOR_HAPPINESS',		10),
		
		('RESOURCE_GAIA_RICE',			'FLAVOR_GROWTH',		10),
		('RESOURCE_GAIA_MAIZE',			'FLAVOR_GROWTH',		10),
		('RESOURCE_GAIA_BERRIES',		'FLAVOR_GROWTH',		10),
		('RESOURCE_GAIA_CACTUS',		'FLAVOR_GROWTH',		4),
		('RESOURCE_GAIA_COCONUTS',		'FLAVOR_GROWTH',		4),
		('RESOURCE_GAIA_COCONUTS',		'FLAVOR_PRODUCTION',	6),
		('RESOURCE_GAIA_FLAX',			'FLAVOR_GOLD',			4),
		('RESOURCE_GAIA_FLAX',			'FLAVOR_CULTURE',		3),
		('RESOURCE_GAIA_FLAX',			'FLAVOR_PRODUCTION',	3),
		('RESOURCE_GAIA_TIMBER',		'FLAVOR_PRODUCTION',	5),
		('RESOURCE_GAIA_TIMBER',		'FLAVOR_GOLD',			5),
		('RESOURCE_GAIA_TIN',			'FLAVOR_PRODUCTION',	5),
		('RESOURCE_GAIA_LAKEFISH',		'FLAVOR_GROWTH',		10),
		('RESOURCE_GAIA_RUBBER',		'FLAVOR_PRODUCTION',	5),
		('RESOURCE_GAIA_RUBBER',		'FLAVOR_GOLD',			5),

		('RESOURCE_GAIA_CARPETS',		'FLAVOR_HAPPINESS',		10),
		('RESOURCE_GAIA_FURNITURE',		'FLAVOR_HAPPINESS',		10),
		('RESOURCE_GAIA_GLASSWARE',		'FLAVOR_HAPPINESS',		10),
		('RESOURCE_GAIA_LACQUERWARE',	'FLAVOR_HAPPINESS',		10),
		('RESOURCE_GAIA_MOSAICTILES',	'FLAVOR_HAPPINESS',		10),
		('RESOURCE_GAIA_PERFUME',		'FLAVOR_HAPPINESS',		10),

		('RESOURCE_GAIA_KELP',			'FLAVOR_GROWTH',		10);

-------------------------------------------------------------------------------------------------------------------------
-- Improvement_ResourceTypes
-------------------------------------------------------------------------------------------------------------------------
DELETE FROM Improvement_ResourceTypes
WHERE ResourceType LIKE '%AMBER%'
   OR ResourceType LIKE '%COFFEE%'
   OR ResourceType LIKE '%CORAL%'
   OR ResourceType LIKE '%JADE%'
   OR ResourceType LIKE '%LAPIS%'
   OR ResourceType LIKE '%OLIVE%'
   OR ResourceType LIKE '%POPP%'
   OR ResourceType LIKE '%OPIUM%'
   OR ResourceType LIKE '%SEAL%'
   OR ResourceType LIKE '%TEA%'
   OR ResourceType LIKE '%TOBACCO%'
   OR ResourceType LIKE '%CIGAR%'
   OR ResourceType LIKE '%LAVENDER%'
   OR ResourceType LIKE '%BERR%'
   OR ResourceType LIKE '%CACT%'
   OR ResourceType LIKE '%COCONUT%'
   OR ResourceType LIKE '%FLAX%'
   OR ResourceType LIKE '%LAKEFISH%'
   OR ResourceType LIKE '%TROUT%'
   OR ResourceType LIKE '%MAIZE%'
   OR ResourceType LIKE '%RICE%'
   OR ResourceType LIKE '%RUBBER%'
   OR ResourceType LIKE '%TIMBER%'
   OR ResourceType LIKE '%TIN%'
   OR ResourceType LIKE '%CARPET%'
   OR ResourceType LIKE '%FURNITURE%'
   OR ResourceType LIKE '%GLASS%'
   OR ResourceType LIKE '%LACQ%'
   OR ResourceType LIKE '%TILES%'
   OR ResourceType LIKE '%PERFUME%'
   OR ResourceType LIKE '%FRAGRANCE%'
   OR ResourceType LIKE '%KELP%'
;
INSERT INTO Improvement_ResourceTypes (ImprovementType,	ResourceType) VALUES
('IMPROVEMENT_FARM',				'RESOURCE_GAIA_RICE'),
('IMPROVEMENT_FARM',				'RESOURCE_GAIA_MAIZE'),

('IMPROVEMENT_FISHING_BOATS',		'RESOURCE_GAIA_CORAL'),
('IMPROVEMENT_FISHING_BOATS',		'RESOURCE_GAIA_LAKEFISH'),
('IMPROVEMENT_FISHING_BOATS',		'RESOURCE_GAIA_SEALS'),
('IMPROVEMENT_FISHING_BOATS',		'RESOURCE_GAIA_KELP'),

('IMPROVEMENT_LUMBERMILL',			'RESOURCE_GAIA_TIMBER'),

('IMPROVEMENT_MINE',				'RESOURCE_GAIA_AMBER'),
('IMPROVEMENT_MINE',				'RESOURCE_GAIA_TIN'),

('IMPROVEMENT_PLANTATION',			'RESOURCE_GAIA_COFFEE'),
('IMPROVEMENT_PLANTATION',			'RESOURCE_GAIA_LAVENDER'),
('IMPROVEMENT_PLANTATION',			'RESOURCE_GAIA_OLIVES'),
('IMPROVEMENT_PLANTATION',			'RESOURCE_GAIA_TEA'),
('IMPROVEMENT_PLANTATION',			'RESOURCE_GAIA_POPPIES'),
('IMPROVEMENT_PLANTATION',			'RESOURCE_GAIA_TOBACCO'),
('IMPROVEMENT_PLANTATION',			'RESOURCE_GAIA_BERRIES'),
('IMPROVEMENT_PLANTATION',			'RESOURCE_GAIA_CACTUS'),
('IMPROVEMENT_PLANTATION',			'RESOURCE_GAIA_COCONUTS'),
('IMPROVEMENT_PLANTATION',			'RESOURCE_GAIA_FLAX'),
('IMPROVEMENT_PLANTATION',			'RESOURCE_GAIA_RUBBER'),

('IMPROVEMENT_QUARRY',				'RESOURCE_GAIA_JADE'),
('IMPROVEMENT_QUARRY',				'RESOURCE_GAIA_LAPIS');
		
-------------------------------------------------------------------------------------------------------------------------
-- Improvement_ResourceType_Yields
-------------------------------------------------------------------------------------------------------------------------
DELETE FROM Improvement_ResourceType_Yields
WHERE ResourceType LIKE '%AMBER%'
   OR ResourceType LIKE '%COFFEE%'
   OR ResourceType LIKE '%CORAL%'
   OR ResourceType LIKE '%JADE%'
   OR ResourceType LIKE '%LAPIS%'
   OR ResourceType LIKE '%OLIVE%'
   OR ResourceType LIKE '%POPP%'
   OR ResourceType LIKE '%OPIUM%'
   OR ResourceType LIKE '%SEAL%'
   OR ResourceType LIKE '%TEA%'
   OR ResourceType LIKE '%TOBACCO%'
   OR ResourceType LIKE '%CIGAR%'
   OR ResourceType LIKE '%LAVENDER%'
   OR ResourceType LIKE '%BERR%'
   OR ResourceType LIKE '%CACT%'
   OR ResourceType LIKE '%COCONUT%'
   OR ResourceType LIKE '%FLAX%'
   OR ResourceType LIKE '%LAKEFISH%'
   OR ResourceType LIKE '%TROUT%'
   OR ResourceType LIKE '%MAIZE%'
   OR ResourceType LIKE '%RICE%'
   OR ResourceType LIKE '%RUBBER%'
   OR ResourceType LIKE '%TIMBER%'
   OR ResourceType LIKE '%TIN%'
   OR ResourceType LIKE '%CARPET%'
   OR ResourceType LIKE '%FURNITURE%'
   OR ResourceType LIKE '%GLASS%'
   OR ResourceType LIKE '%LACQ%'
   OR ResourceType LIKE '%TILES%'
   OR ResourceType LIKE '%PERFUME%'
   OR ResourceType LIKE '%FRAGRANCE%'
   OR ResourceType LIKE '%KELP%'
;
INSERT INTO Improvement_ResourceType_Yields
		(ImprovementType,				ResourceType,				YieldType,				Yield)
VALUES	('IMPROVEMENT_FISHING_BOATS',	'RESOURCE_GAIA_CORAL',		'YIELD_PRODUCTION',		1),
		('IMPROVEMENT_FISHING_BOATS',	'RESOURCE_GAIA_CORAL',		'YIELD_GOLD',			3),
		('IMPROVEMENT_FISHING_BOATS',	'RESOURCE_GAIA_LAKEFISH',	'YIELD_FOOD',			1),
		('IMPROVEMENT_FISHING_BOATS',	'RESOURCE_GAIA_SEALS',		'YIELD_GOLD',			3),
		('IMPROVEMENT_FISHING_BOATS',	'RESOURCE_GAIA_SEALS',		'YIELD_FOOD',			1),
		('IMPROVEMENT_FISHING_BOATS',	'RESOURCE_GAIA_KELP',		'YIELD_FOOD',			2),
	
		('IMPROVEMENT_LUMBERMILL',		'RESOURCE_GAIA_TIMBER',		'YIELD_PRODUCTION',		1),
		('IMPROVEMENT_LUMBERMILL',		'RESOURCE_GAIA_TIMBER',		'YIELD_GOLD',			2),

		('IMPROVEMENT_MINE',			'RESOURCE_GAIA_AMBER',		'YIELD_PRODUCTION',		1),
		('IMPROVEMENT_MINE',			'RESOURCE_GAIA_AMBER',		'YIELD_GOLD',			2),
		('IMPROVEMENT_MINE',			'RESOURCE_GAIA_TIN',		'YIELD_SCIENCE',		1),
		('IMPROVEMENT_MINE',			'RESOURCE_GAIA_TIN',		'YIELD_PRODUCTION',		1),
		
		('IMPROVEMENT_PLANTATION',		'RESOURCE_GAIA_COFFEE',		'YIELD_PRODUCTION',		1),
		('IMPROVEMENT_PLANTATION',		'RESOURCE_GAIA_COFFEE',		'YIELD_GOLD',			10),
		('IMPROVEMENT_PLANTATION',		'RESOURCE_GAIA_OLIVES',		'YIELD_GOLD',			5),
		('IMPROVEMENT_PLANTATION',		'RESOURCE_GAIA_OLIVES',		'YIELD_FOOD',			1),
		('IMPROVEMENT_PLANTATION',		'RESOURCE_GAIA_TEA',		'YIELD_PRODUCTION',		1),
		('IMPROVEMENT_PLANTATION',		'RESOURCE_GAIA_TEA',		'YIELD_GOLD',			7),
		('IMPROVEMENT_PLANTATION',		'RESOURCE_GAIA_TOBACCO',	'YIELD_GOLD',			12),
		('IMPROVEMENT_PLANTATION',		'RESOURCE_GAIA_TOBACCO',	'YIELD_FAITH',			1),
		('IMPROVEMENT_PLANTATION',		'RESOURCE_GAIA_LAVENDER',	'YIELD_GOLD',			3),
		('IMPROVEMENT_PLANTATION',		'RESOURCE_GAIA_LAVENDER',	'YIELD_CULTURE',		1),
		('IMPROVEMENT_PLANTATION',		'RESOURCE_GAIA_POPPIES',	'YIELD_GOLD',			4),
		('IMPROVEMENT_PLANTATION',		'RESOURCE_GAIA_POPPIES',	'YIELD_SCIENCE',		0),
		('IMPROVEMENT_PLANTATION',		'RESOURCE_GAIA_BERRIES',	'YIELD_GOLD',			4),	
		('IMPROVEMENT_PLANTATION',		'RESOURCE_GAIA_BERRIES',	'YIELD_FOOD',			1),
		('IMPROVEMENT_PLANTATION',		'RESOURCE_GAIA_CACTUS',		'YIELD_FOOD',			1),
		('IMPROVEMENT_PLANTATION',		'RESOURCE_GAIA_CACTUS',		'YIELD_GOLD',			1),
		('IMPROVEMENT_PLANTATION',		'RESOURCE_GAIA_COCONUTS',	'YIELD_FOOD',			1),
		('IMPROVEMENT_PLANTATION',		'RESOURCE_GAIA_COCONUTS',	'YIELD_PRODUCTION',		1),
		('IMPROVEMENT_PLANTATION',		'RESOURCE_GAIA_FLAX',		'YIELD_CULTURE',		1),
		('IMPROVEMENT_PLANTATION',		'RESOURCE_GAIA_FLAX',		'YIELD_PRODUCTION',		1),
		('IMPROVEMENT_PLANTATION',		'RESOURCE_GAIA_RUBBER',		'YIELD_PRODUCTION',		1),
		('IMPROVEMENT_PLANTATION',		'RESOURCE_GAIA_RUBBER',		'YIELD_GOLD',			2),
		
		('IMPROVEMENT_QUARRY',			'RESOURCE_GAIA_JADE',		'YIELD_PRODUCTION',		1),
		('IMPROVEMENT_QUARRY',			'RESOURCE_GAIA_JADE',		'YIELD_GOLD',			1),
		('IMPROVEMENT_QUARRY',			'RESOURCE_GAIA_LAPIS',		'YIELD_PRODUCTION',		1),
		('IMPROVEMENT_QUARRY',			'RESOURCE_GAIA_LAPIS',		'YIELD_GOLD',			1);

--=======================================================================================================================
-- RESOURCE TERRAINS
--=======================================================================================================================	
UPDATE Resources SET Flatlands = 0 
WHERE Type IN (
    'RESOURCE_GAIA_CORAL',
    'RESOURCE_GAIA_SEALS',
    'RESOURCE_GAIA_LAKEFISH'
);
UPDATE Resources SET Hills = 1 
WHERE Type IN (
    'RESOURCE_GAIA_LAPIS',
    'RESOURCE_GAIA_LAVENDER',
    'RESOURCE_GAIA_POPPIES',	
    'RESOURCE_GAIA_RUBBER',
    'RESOURCE_GAIA_TIMBER',
    'RESOURCE_GAIA_TIN'
);
-------------------------------------------------------------------------------------------------------------------------
-- Resource_TerrainBooleans
-------------------------------------------------------------------------------------------------------------------------
DELETE FROM Resource_TerrainBooleans
WHERE ResourceType LIKE '%AMBER%'
   OR ResourceType LIKE '%COFFEE%'
   OR ResourceType LIKE '%CORAL%'
   OR ResourceType LIKE '%JADE%'
   OR ResourceType LIKE '%LAPIS%'
   OR ResourceType LIKE '%OLIVE%'
   OR ResourceType LIKE '%POPP%'
   OR ResourceType LIKE '%OPIUM%'
   OR ResourceType LIKE '%SEAL%'
   OR ResourceType LIKE '%TEA%'
   OR ResourceType LIKE '%TOBACCO%'
   OR ResourceType LIKE '%CIGAR%'
   OR ResourceType LIKE '%LAVENDER%'
   OR ResourceType LIKE '%BERR%'
   OR ResourceType LIKE '%CACT%'
   OR ResourceType LIKE '%COCONUT%'
   OR ResourceType LIKE '%FLAX%'
   OR ResourceType LIKE '%LAKEFISH%'
   OR ResourceType LIKE '%TROUT%'
   OR ResourceType LIKE '%MAIZE%'
   OR ResourceType LIKE '%RICE%'
   OR ResourceType LIKE '%RUBBER%'
   OR ResourceType LIKE '%TIMBER%'
   OR ResourceType LIKE '%TIN%'
   OR ResourceType LIKE '%CARPET%'
   OR ResourceType LIKE '%FURNITURE%'
   OR ResourceType LIKE '%GLASS%'
   OR ResourceType LIKE '%LACQ%'
   OR ResourceType LIKE '%TILES%'
   OR ResourceType LIKE '%PERFUME%'
   OR ResourceType LIKE '%FRAGRANCE%'
   OR ResourceType LIKE '%KELP%'
;
INSERT INTO Resource_TerrainBooleans 	
(ResourceType, 				TerrainType) VALUES
('RESOURCE_GAIA_AMBER',		'TERRAIN_TUNDRA'),
('RESOURCE_GAIA_AMBER',		'TERRAIN_GRASS'),
('RESOURCE_GAIA_AMBER',		'TERRAIN_PLAINS'),
('RESOURCE_GAIA_AMBER',		'TERRAIN_DESERT'),
('RESOURCE_GAIA_AMBER',		'TERRAIN_HILL'),
('RESOURCE_GAIA_COFFEE',	'TERRAIN_GRASS'),
('RESOURCE_GAIA_COFFEE',	'TERRAIN_PLAINS'),
('RESOURCE_GAIA_CORAL',		'TERRAIN_COAST'),
('RESOURCE_GAIA_JADE',		'TERRAIN_GRASS'),
('RESOURCE_GAIA_JADE',		'TERRAIN_PLAINS'),
('RESOURCE_GAIA_JADE',		'TERRAIN_DESERT'),
('RESOURCE_GAIA_JADE',		'TERRAIN_TUNDRA'),
('RESOURCE_GAIA_JADE',		'TERRAIN_HILL'),
('RESOURCE_GAIA_LAPIS',		'TERRAIN_GRASS'),
('RESOURCE_GAIA_LAPIS',		'TERRAIN_PLAINS'),
('RESOURCE_GAIA_LAPIS',		'TERRAIN_DESERT'),
('RESOURCE_GAIA_LAPIS',		'TERRAIN_TUNDRA'),
('RESOURCE_GAIA_LAPIS',		'TERRAIN_HILL'),
('RESOURCE_GAIA_OLIVES',	'TERRAIN_GRASS'),
('RESOURCE_GAIA_OLIVES',	'TERRAIN_PLAINS'),
('RESOURCE_GAIA_POPPIES',	'TERRAIN_GRASS'),
('RESOURCE_GAIA_POPPIES',	'TERRAIN_PLAINS'),		
('RESOURCE_GAIA_TEA',		'TERRAIN_GRASS'),
('RESOURCE_GAIA_TEA',		'TERRAIN_PLAINS'),
('RESOURCE_GAIA_TOBACCO',	'TERRAIN_GRASS'),
('RESOURCE_GAIA_TOBACCO',	'TERRAIN_PLAINS'),
('RESOURCE_GAIA_LAVENDER','TERRAIN_GRASS'),
('RESOURCE_GAIA_LAVENDER','TERRAIN_PLAINS'),
('RESOURCE_GAIA_CACTUS',	'TERRAIN_DESERT'),
('RESOURCE_GAIA_COCONUTS',	'TERRAIN_GRASS'),
('RESOURCE_GAIA_COCONUTS',	'TERRAIN_PLAINS'),
('RESOURCE_GAIA_COCONUTS',	'TERRAIN_DESERT'),
('RESOURCE_GAIA_FLAX',		'TERRAIN_GRASS'),
('RESOURCE_GAIA_FLAX',		'TERRAIN_PLAINS'),
('RESOURCE_GAIA_FLAX',		'TERRAIN_DESERT'),
('RESOURCE_GAIA_MAIZE',		'TERRAIN_GRASS'),
('RESOURCE_GAIA_MAIZE',		'TERRAIN_PLAINS'),
('RESOURCE_GAIA_RICE',		'TERRAIN_GRASS'),
('RESOURCE_GAIA_RUBBER',	'TERRAIN_GRASS'),
('RESOURCE_GAIA_RUBBER',	'TERRAIN_PLAINS'),
('RESOURCE_GAIA_TIMBER',	'TERRAIN_GRASS'),
('RESOURCE_GAIA_TIMBER',	'TERRAIN_PLAINS'),
('RESOURCE_GAIA_TIMBER',	'TERRAIN_TUNDRA'),
('RESOURCE_GAIA_TIN',		'TERRAIN_GRASS'),
('RESOURCE_GAIA_TIN',		'TERRAIN_PLAINS'),
('RESOURCE_GAIA_TIN',		'TERRAIN_DESERT'),
('RESOURCE_GAIA_TIN',		'TERRAIN_TUNDRA'),
('RESOURCE_GAIA_TIN',		'TERRAIN_SNOW'),
('RESOURCE_GAIA_KELP',		'TERRAIN_COAST');

-------------------------------------------------------------------------------------------------------------------------
-- Resource_FeatureTerrainBooleans
-------------------------------------------------------------------------------------------------------------------------
DELETE FROM Resource_FeatureTerrainBooleans
WHERE ResourceType LIKE '%AMBER%'
   OR ResourceType LIKE '%COFFEE%'
   OR ResourceType LIKE '%CORAL%'
   OR ResourceType LIKE '%JADE%'
   OR ResourceType LIKE '%LAPIS%'
   OR ResourceType LIKE '%OLIVE%'
   OR ResourceType LIKE '%POPP%'
   OR ResourceType LIKE '%OPIUM%'
   OR ResourceType LIKE '%SEAL%'
   OR ResourceType LIKE '%TEA%'
   OR ResourceType LIKE '%TOBACCO%'
   OR ResourceType LIKE '%CIGAR%'
   OR ResourceType LIKE '%LAVENDER%'
   OR ResourceType LIKE '%BERR%'
   OR ResourceType LIKE '%CACT%'
   OR ResourceType LIKE '%COCONUT%'
   OR ResourceType LIKE '%FLAX%'
   OR ResourceType LIKE '%LAKEFISH%'
   OR ResourceType LIKE '%TROUT%'
   OR ResourceType LIKE '%MAIZE%'
   OR ResourceType LIKE '%RICE%'
   OR ResourceType LIKE '%RUBBER%'
   OR ResourceType LIKE '%TIMBER%'
   OR ResourceType LIKE '%TIN%'
   OR ResourceType LIKE '%CARPET%'
   OR ResourceType LIKE '%FURNITURE%'
   OR ResourceType LIKE '%GLASS%'
   OR ResourceType LIKE '%LACQ%'
   OR ResourceType LIKE '%TILES%'
   OR ResourceType LIKE '%PERFUME%'
   OR ResourceType LIKE '%FRAGRANCE%'
   OR ResourceType LIKE '%KELP%'
;
INSERT INTO Resource_FeatureTerrainBooleans
(ResourceType,				TerrainType) VALUES	
('RESOURCE_GAIA_POPPIES',	'TERRAIN_GRASS'),
('RESOURCE_GAIA_POPPIES',	'TERRAIN_PLAINS'),		
('RESOURCE_GAIA_LAVENDER','TERRAIN_GRASS'),
('RESOURCE_GAIA_LAVENDER','TERRAIN_PLAINS'),
('RESOURCE_GAIA_COCONUTS',	'TERRAIN_GRASS'),
('RESOURCE_GAIA_COCONUTS',	'TERRAIN_PLAINS'),
('RESOURCE_GAIA_COCONUTS',	'TERRAIN_DESERT'),
('RESOURCE_GAIA_FLAX',		'TERRAIN_GRASS'),
('RESOURCE_GAIA_FLAX',		'TERRAIN_PLAINS'),
('RESOURCE_GAIA_FLAX',		'TERRAIN_DESERT'),
('RESOURCE_GAIA_RICE',		'TERRAIN_GRASS'),
('RESOURCE_GAIA_RUBBER',	'TERRAIN_GRASS'),
('RESOURCE_GAIA_RUBBER',	'TERRAIN_PLAINS'),
('RESOURCE_GAIA_TIMBER',	'TERRAIN_GRASS'),
('RESOURCE_GAIA_TIMBER',	'TERRAIN_PLAINS'),
('RESOURCE_GAIA_TIMBER',	'TERRAIN_TUNDRA'),
('RESOURCE_GAIA_TIN',		'TERRAIN_GRASS'),
('RESOURCE_GAIA_TIN',		'TERRAIN_PLAINS'),
('RESOURCE_GAIA_TIN',		'TERRAIN_DESERT'),
('RESOURCE_GAIA_TIN',		'TERRAIN_TUNDRA'),
('RESOURCE_GAIA_TIN',		'TERRAIN_SNOW');

-------------------------------------------------------------------------------------------------------------------------
-- Resource_FeatureBooleans
-------------------------------------------------------------------------------------------------------------------------
DELETE FROM Resource_FeatureBooleans
WHERE ResourceType LIKE '%AMBER%'
   OR ResourceType LIKE '%COFFEE%'
   OR ResourceType LIKE '%CORAL%'
   OR ResourceType LIKE '%JADE%'
   OR ResourceType LIKE '%LAPIS%'
   OR ResourceType LIKE '%OLIVE%'
   OR ResourceType LIKE '%POPP%'
   OR ResourceType LIKE '%OPIUM%'
   OR ResourceType LIKE '%SEAL%'
   OR ResourceType LIKE '%TEA%'
   OR ResourceType LIKE '%TOBACCO%'
   OR ResourceType LIKE '%CIGAR%'
   OR ResourceType LIKE '%LAVENDER%'
   OR ResourceType LIKE '%BERR%'
   OR ResourceType LIKE '%CACT%'
   OR ResourceType LIKE '%COCONUT%'
   OR ResourceType LIKE '%FLAX%'
   OR ResourceType LIKE '%LAKEFISH%'
   OR ResourceType LIKE '%TROUT%'
   OR ResourceType LIKE '%MAIZE%'
   OR ResourceType LIKE '%RICE%'
   OR ResourceType LIKE '%RUBBER%'
   OR ResourceType LIKE '%TIMBER%'
   OR ResourceType LIKE '%TIN%'
   OR ResourceType LIKE '%CARPET%'
   OR ResourceType LIKE '%FURNITURE%'
   OR ResourceType LIKE '%GLASS%'
   OR ResourceType LIKE '%LACQ%'
   OR ResourceType LIKE '%TILES%'
   OR ResourceType LIKE '%PERFUME%'
   OR ResourceType LIKE '%FRAGRANCE%'
   OR ResourceType LIKE '%KELP%'
;
INSERT INTO Resource_FeatureBooleans
(ResourceType,				FeatureType) VALUES
('RESOURCE_GAIA_POPPIES',	'FEATURE_FOREST'),
('RESOURCE_GAIA_POPPIES',	'FEATURE_FLOOD_PLAINS'),
('RESOURCE_GAIA_LAVENDER','FEATURE_JUNGLE'),
('RESOURCE_GAIA_BERRIES',	'FEATURE_MARSH'),
('RESOURCE_GAIA_BERRIES',	'FEATURE_FOREST'),
('RESOURCE_GAIA_COCONUTS',	'FEATURE_JUNGLE'),
('RESOURCE_GAIA_FLAX',		'FEATURE_FLOOD_PLAINS'),
('RESOURCE_GAIA_RICE',		'FEATURE_MARSH'),
('RESOURCE_GAIA_RUBBER',	'FEATURE_JUNGLE'),
('RESOURCE_GAIA_TIMBER',	'FEATURE_FOREST'),
('RESOURCE_GAIA_TIMBER',	'FEATURE_JUNGLE'),
('RESOURCE_GAIA_TIN',		'FEATURE_FOREST'),
('RESOURCE_GAIA_TIN',		'FEATURE_JUNGLE'),
('RESOURCE_GAIA_TIN',		'FEATURE_MARSH');

--=======================================================================================================================
-- PREVENT DUPLICATES OR CONFLICTING RESOURCES
--=======================================================================================================================
CREATE TRIGGER IF NOT EXISTS GAIA_PreventResourcesOverlap
AFTER INSERT ON Resources
WHEN
	NEW.Type LIKE '%AMBER%' OR
	NEW.Type LIKE '%COFFEE%' OR
	NEW.Type LIKE '%CORAL%' OR
	NEW.Type LIKE '%JADE%' OR
	NEW.Type LIKE '%LAPIS%' OR
	NEW.Type LIKE '%OLIVE%' OR
	NEW.Type LIKE '%POPP%' OR
	NEW.Type LIKE '%OPIUM%' OR
	NEW.Type LIKE '%SEAL%' OR
	NEW.Type LIKE '%TEA%' OR
	NEW.Type LIKE '%TOBACCO%' OR
	NEW.Type LIKE '%CIGAR%' OR
	NEW.Type LIKE '%LAVENDER%' OR
	NEW.Type LIKE '%BERR%' OR
	NEW.Type LIKE '%CACT%' OR
	NEW.Type LIKE '%COCONUT%' OR
	NEW.Type LIKE '%FLAX%' OR
	NEW.Type LIKE '%LAKEFISH%' OR
	NEW.Type LIKE '%TROUT%' OR
	NEW.Type LIKE '%MAIZE%' OR
	NEW.Type LIKE '%RICE%' OR
	NEW.Type LIKE '%RUBBER%' OR
	NEW.Type LIKE '%TIMBER%' OR
	NEW.Type LIKE '%TIN%' OR
	NEW.Type LIKE '%CARPET%' OR
	NEW.Type LIKE '%FURNITURE%' OR
	NEW.Type LIKE '%GLASS%' OR
	NEW.Type LIKE '%LACQ%' OR
	NEW.Type LIKE '%TILES%' OR
	NEW.Type LIKE '%PERFUME%' OR
	NEW.Type LIKE '%FRAGRANCE%' OR
	NEW.Type LIKE '%KELP%'
BEGIN
	DELETE FROM Resources WHERE Type = NEW.Type;
END;
--======================================================================================================================
-- ID REMAPPER
--======================================================================================================================
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM Resources ORDER BY ID;
UPDATE Resources SET ID = ( SELECT IDRemapper.id-1 FROM IDRemapper WHERE Resources.Type = IDRemapper.Type);
DROP TABLE IDRemapper;
UPDATE sqlite_sequence SET seq = (SELECT COUNT(ID) FROM Resources)-1 WHERE name = 'Resources';

-------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IDRemapper (id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT);
INSERT INTO IDRemapper (Type) SELECT Type FROM Improvements ORDER BY ID;
UPDATE Improvements SET ID = (SELECT IDRemapper.id - 1 FROM IDRemapper WHERE Improvements.Type = IDRemapper.Type);
DROP TABLE IDRemapper;
UPDATE sqlite_sequence SET seq = (SELECT COUNT(ID) FROM Improvements) - 1 WHERE name = 'Improvements';

-------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IDRemapper (id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT);
INSERT INTO IDRemapper (Type) SELECT Type FROM Builds ORDER BY ID;
UPDATE Builds SET ID = (SELECT IDRemapper.id - 1 FROM IDRemapper WHERE Builds.Type = IDRemapper.Type);
DROP TABLE IDRemapper;
UPDATE sqlite_sequence SET seq = (SELECT COUNT(ID) FROM Builds) - 1 WHERE name = 'Builds';

--=======================================================================================================================	
UPDATE Sapiens_DBUpdates SET Value = 1 WHERE Name = 'Resources_New';
