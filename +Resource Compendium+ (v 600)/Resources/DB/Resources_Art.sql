-- written by GAIA using Notepad++
CREATE TABLE IF NOT EXISTS Sapiens_DBUpdates (Name TEXT PRIMARY KEY, Value INTEGER DEFAULT 0);
INSERT OR IGNORE INTO Sapiens_DBUpdates (Name) VALUES ('Resources_Art');
--=======================================================================================================================
-- RESOURCE ART INFO
--=======================================================================================================================
-----------------------------------------------------------------------------------------------------------------------------
-- ICON ATLASES
-----------------------------------------------------------------------------------------------------------------------------
DELETE FROM IconTextureAtlases WHERE Atlas = 'GAIA_RESOURCE_ATLAS';
INSERT INTO IconTextureAtlases 
(Atlas, 					IconSize,	Filename, 						IconsPerRow,	IconsPerColumn) VALUES		
('GAIA_RESOURCE_ATLAS',		256, 		'GAIA_Resources_256.dds',		8, 				4),
('GAIA_RESOURCE_ATLAS',		80, 		'GAIA_Resources_080.dds',		8, 				4),
('GAIA_RESOURCE_ATLAS',		64, 		'GAIA_Resources_064.dds',		8, 				4),
('GAIA_RESOURCE_ATLAS',		45, 		'GAIA_Resources_045.dds',		8, 				4);

-----------------------------------------------------------------------------------------------------------------------------
-- FONT ICONS
-----------------------------------------------------------------------------------------------------------------------------
INSERT OR IGNORE INTO IconFontTextures (IconFontTexture, IconFontTextureFile) VALUES
('ICON_FONT_TEXTURE_GAIA_AMBER', 		'Font_GAIA_Amber'),
('ICON_FONT_TEXTURE_GAIA_COFFEE', 		'Font_GAIA_Coffee'),
('ICON_FONT_TEXTURE_GAIA_CORAL', 		'Font_GAIA_Coral'),
('ICON_FONT_TEXTURE_GAIA_JADE', 		'Font_GAIA_Jade'),
('ICON_FONT_TEXTURE_GAIA_LAPIS', 		'Font_GAIA_Lapis'),
('ICON_FONT_TEXTURE_GAIA_LAVENDER', 	'Font_GAIA_Lavender'),
('ICON_FONT_TEXTURE_GAIA_OLIVES', 		'Font_GAIA_Olives'),
('ICON_FONT_TEXTURE_GAIA_POPPIES', 		'Font_GAIA_Poppies'),
('ICON_FONT_TEXTURE_GAIA_ROSES', 		'Font_GAIA_Roses'),
('ICON_FONT_TEXTURE_GAIA_SEALS', 		'Font_GAIA_Seals'),
('ICON_FONT_TEXTURE_GAIA_TEA', 			'Font_GAIA_Tea'),
('ICON_FONT_TEXTURE_GAIA_TOBACCO', 		'Font_GAIA_Tobacco'),
('ICON_FONT_TEXTURE_GAIA_BERRIES',		'Font_GAIA_Berries'),
('ICON_FONT_TEXTURE_GAIA_CACTUS', 		'Font_GAIA_Cactus'),
('ICON_FONT_TEXTURE_GAIA_COCONUTS', 	'Font_GAIA_Coconuts'),
('ICON_FONT_TEXTURE_GAIA_FLAX', 		'Font_GAIA_Flax'),
('ICON_FONT_TEXTURE_GAIA_LAKEFISH', 	'Font_GAIA_Lakefish'),
('ICON_FONT_TEXTURE_GAIA_MAIZE', 		'Font_GAIA_Maize'),
('ICON_FONT_TEXTURE_GAIA_RICE', 		'Font_GAIA_Rice'),
('ICON_FONT_TEXTURE_GAIA_RUBBER', 		'Font_GAIA_Rubber'),
('ICON_FONT_TEXTURE_GAIA_TIMBER', 		'Font_GAIA_Timber'),
('ICON_FONT_TEXTURE_GAIA_TIN', 			'Font_GAIA_Tin'),
('ICON_FONT_TEXTURE_GAIA_CARPETS', 		'Font_GAIA_Carpets'),
('ICON_FONT_TEXTURE_GAIA_FURNITURE', 	'Font_GAIA_Furniture'),
('ICON_FONT_TEXTURE_GAIA_GLASSWARE', 	'Font_GAIA_Glassware'),
('ICON_FONT_TEXTURE_GAIA_LACQUERWARE', 	'Font_GAIA_Lacquerware'),
('ICON_FONT_TEXTURE_GAIA_MOSAICTILES', 	'Font_GAIA_MosaicTiles'),
('ICON_FONT_TEXTURE_GAIA_PERFUME', 		'Font_GAIA_Perfume'),
('ICON_FONT_TEXTURE_GAIA_KELP', 		'Font_GAIA_Kelp'),
('ICON_FONT_TEXTURE_GAIA_MINERALS', 	'Font_GAIA_Minerals'),
('ICON_FONT_TEXTURE_GAIA_TULIPS',		'Font_GAIA_Tulips'),
('ICON_FONT_TEXTURE_GAIA_YERBAMATE', 	'Font_GAIA_YerbaMate'),
('ICON_FONT_TEXTURE_GAIA_BEAVERS', 		'Font_GAIA_Beavers'),
('ICON_FONT_TEXTURE_GAIA_RAFFIA',		'Font_GAIA_Raffia');

INSERT OR IGNORE INTO IconFontMapping (IconName, IconFontTexture, IconMapping) VALUES
('ICON_RES_GAIA_AMBER', 		'ICON_FONT_TEXTURE_GAIA_AMBER',			1),
('ICON_RES_GAIA_COFFEE',		'ICON_FONT_TEXTURE_GAIA_COFFEE',		1),
('ICON_RES_GAIA_CORAL', 		'ICON_FONT_TEXTURE_GAIA_CORAL',			1),
('ICON_RES_GAIA_JADE', 			'ICON_FONT_TEXTURE_GAIA_JADE',			1),
('ICON_RES_GAIA_LAPIS', 		'ICON_FONT_TEXTURE_GAIA_LAPIS',			1),
('ICON_RES_GAIA_LAVENDER', 		'ICON_FONT_TEXTURE_GAIA_LAVENDER',		1),
('ICON_RES_GAIA_OLIVES',		'ICON_FONT_TEXTURE_GAIA_OLIVES',		1),
('ICON_RES_GAIA_POPPIES', 		'ICON_FONT_TEXTURE_GAIA_POPPIES',		1),
('ICON_RES_GAIA_ROSES', 		'ICON_FONT_TEXTURE_GAIA_ROSES',			1),
('ICON_RES_GAIA_SEALS', 		'ICON_FONT_TEXTURE_GAIA_SEALS',			1),
('ICON_RES_GAIA_TEA', 			'ICON_FONT_TEXTURE_GAIA_TEA',			1),
('ICON_RES_GAIA_TOBACCO', 		'ICON_FONT_TEXTURE_GAIA_TOBACCO',		1),
('ICON_RES_GAIA_BERRIES', 		'ICON_FONT_TEXTURE_GAIA_BERRIES',		1),
('ICON_RES_GAIA_CACTUS', 		'ICON_FONT_TEXTURE_GAIA_CACTUS',		1),
('ICON_RES_GAIA_COCONUTS', 		'ICON_FONT_TEXTURE_GAIA_COCONUTS',		1),
('ICON_RES_GAIA_FLAX', 			'ICON_FONT_TEXTURE_GAIA_FLAX',			1),
('ICON_RES_GAIA_LAKEFISH', 		'ICON_FONT_TEXTURE_GAIA_LAKEFISH',		1),
('ICON_RES_GAIA_MAIZE',			'ICON_FONT_TEXTURE_GAIA_MAIZE',			1),
('ICON_RES_GAIA_RICE', 			'ICON_FONT_TEXTURE_GAIA_RICE',			1),
('ICON_RES_GAIA_RUBBER', 		'ICON_FONT_TEXTURE_GAIA_RUBBER',		1),
('ICON_RES_GAIA_TIMBER', 		'ICON_FONT_TEXTURE_GAIA_TIMBER',		1),
('ICON_RES_GAIA_TIN', 			'ICON_FONT_TEXTURE_GAIA_TIN',			1),
('ICON_RES_GAIA_CARPETS', 		'ICON_FONT_TEXTURE_GAIA_CARPETS',		1),
('ICON_RES_GAIA_FURNITURE', 	'ICON_FONT_TEXTURE_GAIA_FURNITURE',		1),
('ICON_RES_GAIA_GLASSWARE', 	'ICON_FONT_TEXTURE_GAIA_GLASSWARE',		1),
('ICON_RES_GAIA_LACQUERWARE', 	'ICON_FONT_TEXTURE_GAIA_LACQUERWARE',	1),
('ICON_RES_GAIA_MOSAICTILES', 	'ICON_FONT_TEXTURE_GAIA_MOSAICTILES',	1),
('ICON_RES_GAIA_PERFUME', 		'ICON_FONT_TEXTURE_GAIA_PERFUME',		1),
('ICON_RES_GAIA_KELP', 			'ICON_FONT_TEXTURE_GAIA_KELP',			1),
('ICON_RES_GAIA_MINERALS', 		'ICON_FONT_TEXTURE_GAIA_MINERALS',		1),
('ICON_RES_GAIA_TULIPS',		'ICON_FONT_TEXTURE_GAIA_TULIPS',		1),
('ICON_RES_GAIA_YERBAMATE', 	'ICON_FONT_TEXTURE_GAIA_YERBAMATE',		1),
('ICON_RES_GAIA_BEAVERS', 		'ICON_FONT_TEXTURE_GAIA_BEAVERS',		1),
('ICON_RES_GAIA_RAFFIA',		'ICON_FONT_TEXTURE_GAIA_RAFFIA',		1);

-----------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_LandmarkTypes
-----------------------------------------------------------------------------------------------------------------------------
DELETE FROM ArtDefine_LandmarkTypes WHERE Type IN (
    'SPECIAL',
    'ART_DEF_RESOURCE_CITRUS',
    'ART_DEF_RESOURCE_COPPER',
    'ART_DEF_RESOURCE_CRAB',
    'ART_DEF_RESOURCE_SALT',
    'ART_DEF_RESOURCE_TRUFFLES',
    'ART_DEF_RES_GAIA_AMBER',
    'ART_DEF_RES_GAIA_COFFEE',
    'ART_DEF_RES_GAIA_CORAL',
    'ART_DEF_RES_GAIA_JADE',
    'ART_DEF_RES_GAIA_LAPIS',
    'ART_DEF_RES_GAIA_LAVENDER',
    'ART_DEF_RES_GAIA_OLIVES',
    'ART_DEF_RES_GAIA_POPPIES',
    --'ART_DEF_RES_GAIA_ROSES',
    'ART_DEF_RES_GAIA_SEALS',
    'ART_DEF_RES_GAIA_TEA',
    'ART_DEF_RES_GAIA_TOBACCO',
    'ART_DEF_RES_GAIA_BERRIES',
    'ART_DEF_RES_GAIA_CACTUS',
    'ART_DEF_RES_GAIA_COCONUTS',
    'ART_DEF_RES_GAIA_FLAX',
    'ART_DEF_RES_GAIA_MAIZE',
    'ART_DEF_RES_GAIA_RICE',
    'ART_DEF_RES_GAIA_RUBBER',
	'ART_DEF_RES_GAIA_TIMBER',
    'ART_DEF_RES_GAIA_TIN',
	'ART_DEF_RES_GAIA_KELP'
);
INSERT INTO ArtDefine_LandmarkTypes 
    (Type,                                 LandmarkType,        FriendlyName)
VALUES
    ('SPECIAL',                             'LayoutHandler',      'Special'),
    ('ART_DEF_RESOURCE_CITRUS',             'Resource',           'Citrus'),
    ('ART_DEF_RESOURCE_COPPER',             'Resource',           'Copper'),
    ('ART_DEF_RESOURCE_CRAB',               'Resource',           'Crab'),
    ('ART_DEF_RESOURCE_SALT',               'Resource',           'Salt'),
    ('ART_DEF_RESOURCE_TRUFFLES',           'Resource',           'Truffles'),
    ('ART_DEF_RES_GAIA_AMBER',              'Resource',           'Amber'),
    ('ART_DEF_RES_GAIA_COFFEE',             'Resource',           'Coffee'),
    ('ART_DEF_RES_GAIA_CORAL',              'Resource',           'Coral'),
    ('ART_DEF_RES_GAIA_JADE',               'Resource',           'Jade'),
    ('ART_DEF_RES_GAIA_LAPIS',              'Resource',           'Lapis Lazuli'),
    ('ART_DEF_RES_GAIA_LAVENDER',           'Resource',           'Lavender'),
    ('ART_DEF_RES_GAIA_OLIVES',             'Resource',           'Olives'),
    ('ART_DEF_RES_GAIA_POPPIES',            'Resource',           'Poppies'),
    ('ART_DEF_RES_GAIA_SEALS',              'Resource',           'Seals'),
    ('ART_DEF_RES_GAIA_TEA',                'Resource',           'Tea'),
    ('ART_DEF_RES_GAIA_TOBACCO',            'Resource',           'Tobacco'),    
    ('ART_DEF_RES_GAIA_BERRIES',            'Resource',           'Berries'),
    ('ART_DEF_RES_GAIA_CACTUS',				'Resource',           'Cactus'),
    ('ART_DEF_RES_GAIA_COCONUTS',           'Resource',           'Coconuts'),
    ('ART_DEF_RES_GAIA_FLAX',               'Resource',           'Flax'),
    ('ART_DEF_RES_GAIA_MAIZE',              'Resource',           'Maize'),
    ('ART_DEF_RES_GAIA_RICE',               'Resource',           'Rice'),
    ('ART_DEF_RES_GAIA_RUBBER',             'Resource',           'Rubber'),
	('ART_DEF_RES_GAIA_TIMBER',             'Resource',           'Timber'),
    ('ART_DEF_RES_GAIA_TIN',                'Resource',           'Tin'),
	('ART_DEF_RES_GAIA_KELP',                'Resource',           'Kelp');

-----------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_Landmarks
-----------------------------------------------------------------------------------------------------------------------------
UPDATE ArtDefine_Landmarks SET Scale = 0.14 WHERE ResourceType = 'ART_DEF_RESOURCE_WHALE'; /*0.12*/
DELETE FROM ArtDefine_Landmarks WHERE ResourceType IN (
    'ART_DEF_RESOURCE_CITRUS',
    'ART_DEF_RESOURCE_COPPER',
    'ART_DEF_RESOURCE_CRAB',
    'ART_DEF_RESOURCE_SALT',
    'ART_DEF_RESOURCE_SUGAR',
    'ART_DEF_RESOURCE_TRUFFLES',
    'ART_DEF_RES_GAIA_AMBER',
    'ART_DEF_RES_GAIA_COFFEE',
    'ART_DEF_RES_GAIA_CORAL',
    'ART_DEF_RES_GAIA_JADE',
    'ART_DEF_RES_GAIA_LAPIS',
    'ART_DEF_RES_GAIA_LAVENDER',
    'ART_DEF_RES_GAIA_OLIVES',
    'ART_DEF_RES_GAIA_POPPIES',
    'ART_DEF_RES_GAIA_SEALS',
    'ART_DEF_RES_GAIA_TEA',
    'ART_DEF_RES_GAIA_TOBACCO',
    'ART_DEF_RES_GAIA_BERRIES',
    'ART_DEF_RES_GAIA_CACTUS',
    'ART_DEF_RES_GAIA_COCONUTS',
    'ART_DEF_RES_GAIA_FLAX',
    'ART_DEF_RES_GAIA_MAIZE',
    'ART_DEF_RES_GAIA_RICE',
    'ART_DEF_RES_GAIA_RUBBER',
    'ART_DEF_RES_GAIA_TIMBER',
    'ART_DEF_RES_GAIA_TIN',
	'ART_DEF_RES_GAIA_KELP'
);
INSERT INTO ArtDefine_Landmarks 
(Era,				State,					Scale,	ImprovementType,						LayoutHandler,	ResourceType,					Model,												TerrainContour) VALUES
-------------------------------------------------------------------------------------------------------------------------
--RESOURCE DUPLICATE
-------------------------------------------------------------------------------------------------------------------------
--Citrus
('Any',				'Any',					0.94,	'ART_DEF_IMPROVEMENT_NONE',				'SNAPSHOT',		'ART_DEF_RESOURCE_CITRUS',		'Citrus.fxsxml',									1),
('Ancient',			'UnderConstruction',	0.96,	'ART_DEF_IMPROVEMENT_PLANTATION',		'SNAPSHOT',		'ART_DEF_RESOURCE_CITRUS',		'Plantation_MID_Citrus_HB.fxsxml',					1),
('Ancient',			'Constructed',			0.96,	'ART_DEF_IMPROVEMENT_PLANTATION',		'SNAPSHOT',		'ART_DEF_RESOURCE_CITRUS',		'Plantation_MID_Citrus.fxsxml',						1),
('Ancient',			'Pillaged',				0.96,	'ART_DEF_IMPROVEMENT_PLANTATION',		'SNAPSHOT',		'ART_DEF_RESOURCE_CITRUS',		'Plantation_MID_Citrus_PIL.fxsxml',					1),
('Industrial',		'UnderConstruction',	0.96,	'ART_DEF_IMPROVEMENT_PLANTATION',		'SNAPSHOT',		'ART_DEF_RESOURCE_CITRUS',		'Plantation_IND_Citrus_HB.fxsxml',					1),
('Industrial',		'Constructed',			0.96,	'ART_DEF_IMPROVEMENT_PLANTATION',		'SNAPSHOT',		'ART_DEF_RESOURCE_CITRUS',		'Plantation_IND_Citrus.fxsxml',						1),
('Industrial',		'Pillaged',				0.96,	'ART_DEF_IMPROVEMENT_PLANTATION',		'SNAPSHOT',		'ART_DEF_RESOURCE_CITRUS',		'Plantation_IND_Citrus_PIL.fxsxml',					1),
--Copper
('Any',				'Any',					1,		'ART_DEF_IMPROVEMENT_NONE',				'SNAPSHOT',		'ART_DEF_RESOURCE_COPPER',		'Copper.fxsxml',									1),
('Ancient',			'UnderConstruction',	0.9,	'ART_DEF_IMPROVEMENT_MINE',				'SNAPSHOT',		'ART_DEF_RESOURCE_COPPER',		'HB_MED_Copper_Mine.fxsxml',						1),
('Ancient',			'Constructed',			0.9,	'ART_DEF_IMPROVEMENT_MINE',				'SNAPSHOT',		'ART_DEF_RESOURCE_COPPER',		'MED_Mine_Copper.fxsxml',							1),
('Ancient',			'Pillaged',				0.9,	'ART_DEF_IMPROVEMENT_MINE',				'SNAPSHOT',		'ART_DEF_RESOURCE_COPPER',		'PL_MED_Mine_Copper.fxsxml',						1),
('Industrial',		'UnderConstruction',	0.9,	'ART_DEF_IMPROVEMENT_MINE',				'SNAPSHOT',		'ART_DEF_RESOURCE_COPPER',		'HB_IND_Copper_Mine.fxsxml',						1),
('Industrial',		'Constructed',			0.9,	'ART_DEF_IMPROVEMENT_MINE',				'SNAPSHOT',		'ART_DEF_RESOURCE_COPPER',		'IND_Mine_Copper.fxsxml',							1),
('Industrial',		'Pillaged',				0.9,	'ART_DEF_IMPROVEMENT_MINE',				'SNAPSHOT',		'ART_DEF_RESOURCE_COPPER',		'PL_MED_Mine_Copper.fxsxml',						1),
-- Crab
('Any', 			'Any',					0.07,	'ART_DEF_IMPROVEMENT_NONE',				'ANIMATED',		'ART_DEF_RESOURCE_CRAB',		'Crab.fxsxml',										1),
('Any',				'Any',					0.07,	'ART_DEF_IMPROVEMENT_FISHING_BOATS',	'ANIMATED',		'ART_DEF_RESOURCE_CRAB',		'Crab.fxsxml',										1),
--Salt
('Any',				'Any',					1,		'ART_DEF_IMPROVEMENT_NONE',				'SNAPSHOT',		'ART_DEF_RESOURCE_SALT',		'Salt.fxsxml',										1),
('Ancient',			'UnderConstruction',	0.9,	'ART_DEF_IMPROVEMENT_MINE',				'SNAPSHOT',		'ART_DEF_RESOURCE_SALT',		'HB_MED_Slat_Mine.fxsxml',							1),
('Ancient',			'Constructed',			0.9,	'ART_DEF_IMPROVEMENT_MINE',				'SNAPSHOT',		'ART_DEF_RESOURCE_SALT',		'MED_Mine_Salt.fxsxml',								1),
('Ancient',			'Pillaged',				0.9,	'ART_DEF_IMPROVEMENT_MINE',				'SNAPSHOT',		'ART_DEF_RESOURCE_SALT',		'PL_MED_Mine_Salt.fxsxml',							1),
('Industrial',		'UnderConstruction',	0.9,	'ART_DEF_IMPROVEMENT_MINE',				'SNAPSHOT',		'ART_DEF_RESOURCE_SALT',		'HB_IND_Salt_Mine.fxsxml',							1),
('Industrial',		'Constructed',			0.9,	'ART_DEF_IMPROVEMENT_MINE',				'SNAPSHOT',		'ART_DEF_RESOURCE_SALT',		'IND_Mine_Salt.fxsxml',								1),
('Industrial',		'Pillaged',				0.9,	'ART_DEF_IMPROVEMENT_MINE',				'SNAPSHOT',		'ART_DEF_RESOURCE_SALT',		'PL_IND_Mine_Salt.fxsxml',							1),
-- Sugar
('Any',				'Any',					0.98,	'ART_DEF_IMPROVEMENT_NONE',				'SNAPSHOT',		'ART_DEF_RESOURCE_SUGAR',		'resource_sugar_alt.fxsxml',						1),
('Ancient', 		'UnderConstruction',	0.96,	'ART_DEF_IMPROVEMENT_PLANTATION',		'SNAPSHOT',		'ART_DEF_RESOURCE_SUGAR',		'hb_plantation_mid_sugar_alt.fxsxml',				1),
('Ancient', 		'Constructed',			0.96,	'ART_DEF_IMPROVEMENT_PLANTATION',		'SNAPSHOT',		'ART_DEF_RESOURCE_SUGAR',		'plantation_mid_sugar_alt.fxsxml',					1),
('Ancient', 		'Pillaged',				0.96,	'ART_DEF_IMPROVEMENT_PLANTATION',		'SNAPSHOT',		'ART_DEF_RESOURCE_SUGAR',		'pl_plantation_mid_sugar_alt.fxsxml',				1),
('Industrial',		'UnderConstruction',	0.96,	'ART_DEF_IMPROVEMENT_PLANTATION',		'SNAPSHOT',		'ART_DEF_RESOURCE_SUGAR',		'hb_plantation_ind_sugar_alt.fxsxml',				1),
('Industrial', 		'Constructed',			0.96,	'ART_DEF_IMPROVEMENT_PLANTATION',		'SNAPSHOT',		'ART_DEF_RESOURCE_SUGAR',		'plantation_ind_sugar_alt.fxsxml',					1),
('Industrial', 		'Pillaged',				0.96,	'ART_DEF_IMPROVEMENT_PLANTATION',		'SNAPSHOT',		'ART_DEF_RESOURCE_SUGAR',		'pl_plantation_ind_sugar_alt.fxsxml',				1),
-- Truffles
('Any',				'Any',					0.13,	'ART_DEF_IMPROVEMENT_NONE',				'ANIMATED',		'ART_DEF_RESOURCE_TRUFFLES',	'Truffles.fxsxml',									1),
('Any', 			'Any',					0.13,	'ART_DEF_IMPROVEMENT_CAMP',				'ANIMATED',		'ART_DEF_RESOURCE_TRUFFLES',	'Truffles.fxsxml',									1),
-------------------------------------------------------------------------------------------------------------------------
--NEW RESOURCES
-------------------------------------------------------------------------------------------------------------------------
-- Amber
('Any',				'Any',					1,		'ART_DEF_IMPROVEMENT_NONE',				'SNAPSHOT',		'ART_DEF_RES_GAIA_AMBER',		'amber.fxsxml',										1),
('Ancient',			'UnderConstruction',	1,		'ART_DEF_IMPROVEMENT_MINE',				'SNAPSHOT',		'ART_DEF_RES_GAIA_AMBER',		'hb_med_mine_amber.fxsxml',							1),
('Ancient',			'Constructed',			1,		'ART_DEF_IMPROVEMENT_MINE',				'SNAPSHOT',		'ART_DEF_RES_GAIA_AMBER',		'med_mine_amber.fxsxml',							1),
('Ancient',			'Pillaged',				1,		'ART_DEF_IMPROVEMENT_MINE',				'SNAPSHOT',		'ART_DEF_RES_GAIA_AMBER',		'pl_med_mine_amber.fxsxml',							1),
('Industrial',		'UnderConstruction',	1,		'ART_DEF_IMPROVEMENT_MINE',				'SNAPSHOT',		'ART_DEF_RES_GAIA_AMBER',		'hb_ind_mine_amber.fxsxml',							1),
('Industrial',		'Constructed',			1,		'ART_DEF_IMPROVEMENT_MINE',				'SNAPSHOT',		'ART_DEF_RES_GAIA_AMBER',		'ind_mine_amber.fxsxml',							1),
('Industrial',		'Pillaged',				1,		'ART_DEF_IMPROVEMENT_MINE',				'SNAPSHOT',		'ART_DEF_RES_GAIA_AMBER',		'pl_ind_mine_amber.fxsxml',							1),
-- Coffee
('Any',				'Any',					0.96,	'ART_DEF_IMPROVEMENT_NONE',				'SNAPSHOT',		'ART_DEF_RES_GAIA_COFFEE',		'resource_coffee.fxsxml',							1),
('Ancient', 		'UnderConstruction',	0.96,	'ART_DEF_IMPROVEMENT_PLANTATION',		'SNAPSHOT',		'ART_DEF_RES_GAIA_COFFEE',		'hb_plantation_mid_coffee.fxsxml',					1),
('Ancient', 		'Constructed',			0.96,	'ART_DEF_IMPROVEMENT_PLANTATION',		'SNAPSHOT',		'ART_DEF_RES_GAIA_COFFEE',		'plantation_mid_coffee.fxsxml',						1),
('Ancient', 		'Pillaged',				0.96,	'ART_DEF_IMPROVEMENT_PLANTATION',		'SNAPSHOT',		'ART_DEF_RES_GAIA_COFFEE',		'pl_plantation_mid_coffee.fxsxml',					1),
('Industrial',		'UnderConstruction',	0.96,	'ART_DEF_IMPROVEMENT_PLANTATION',		'SNAPSHOT',		'ART_DEF_RES_GAIA_COFFEE',		'hb_plantation_ind_coffee.fxsxml',					1),
('Industrial', 		'Constructed',			0.96,	'ART_DEF_IMPROVEMENT_PLANTATION',		'SNAPSHOT',		'ART_DEF_RES_GAIA_COFFEE',		'plantation_ind_coffee.fxsxml',						1),
('Industrial', 		'Pillaged',				0.96,	'ART_DEF_IMPROVEMENT_PLANTATION',		'SNAPSHOT',		'ART_DEF_RES_GAIA_COFFEE',		'pl_plantation_ind_coffee.fxsxml',					1),
-- Coral
('Ancient', 		'Any',					0.07,	'ART_DEF_IMPROVEMENT_NONE',				'ANIMATED',		'ART_DEF_RES_GAIA_CORAL',		'coral.fxsxml',										1),
('Ancient', 		'Any',					0.07,	'ART_DEF_IMPROVEMENT_FISHING_BOATS',	'ANIMATED',		'ART_DEF_RES_GAIA_CORAL',		'coral.fxsxml',										1),
('Industrial',		'Any',					0.07,	'ART_DEF_IMPROVEMENT_NONE',				'ANIMATED',		'ART_DEF_RES_GAIA_CORAL',		'coral_industrial.fxsxml',							1),
('Industrial', 		'Any',					0.07,	'ART_DEF_IMPROVEMENT_FISHING_BOATS',	'ANIMATED',		'ART_DEF_RES_GAIA_CORAL',		'coral_industrial.fxsxml',							1),
-- Jade
('Any',				'Any',					1,		'ART_DEF_IMPROVEMENT_NONE',				'SNAPSHOT',		'ART_DEF_RES_GAIA_JADE',		'jade.fxsxml',										1),
('Ancient',			'UnderConstruction',	1,		'ART_DEF_IMPROVEMENT_QUARRY',			'SNAPSHOT',		'ART_DEF_RES_GAIA_JADE',		'hb_med_mine_jade.fxsxml',							1),
('Ancient',			'Constructed',			1,		'ART_DEF_IMPROVEMENT_QUARRY',			'SNAPSHOT',		'ART_DEF_RES_GAIA_JADE',		'med_mine_jade.fxsxml',								1),
('Ancient',			'Pillaged',				1,		'ART_DEF_IMPROVEMENT_QUARRY',			'SNAPSHOT',		'ART_DEF_RES_GAIA_JADE',		'pl_med_mine_jade.fxsxml',							1),
('Industrial',		'UnderConstruction',	1,		'ART_DEF_IMPROVEMENT_QUARRY',			'SNAPSHOT',		'ART_DEF_RES_GAIA_JADE',		'hb_ind_mine_jade.fxsxml',							1),
('Industrial',		'Constructed',			1,		'ART_DEF_IMPROVEMENT_QUARRY',			'SNAPSHOT',		'ART_DEF_RES_GAIA_JADE',		'ind_mine_jade.fxsxml',								1),
('Industrial',		'Pillaged',				1,		'ART_DEF_IMPROVEMENT_QUARRY',			'SNAPSHOT',		'ART_DEF_RES_GAIA_JADE',		'pl_ind_mine_jade.fxsxml',							1),
-- Lapis
('Any',				'Any',					1,		'ART_DEF_IMPROVEMENT_NONE',				'SNAPSHOT',		'ART_DEF_RES_GAIA_LAPIS',		'lapis.fxsxml',										1),
('Ancient',			'UnderConstruction',	1,		'ART_DEF_IMPROVEMENT_QUARRY',			'SNAPSHOT',		'ART_DEF_RES_GAIA_LAPIS',		'hb_med_mine_lapis.fxsxml',							1),
('Ancient',			'Constructed',			1,		'ART_DEF_IMPROVEMENT_QUARRY',			'SNAPSHOT',		'ART_DEF_RES_GAIA_LAPIS',		'med_mine_lapis.fxsxml',							1),
('Ancient',			'Pillaged',				1,		'ART_DEF_IMPROVEMENT_QUARRY',			'SNAPSHOT',		'ART_DEF_RES_GAIA_LAPIS',		'pl_med_mine_lapis.fxsxml',							1),
('Industrial',		'UnderConstruction',	1,		'ART_DEF_IMPROVEMENT_QUARRY',			'SNAPSHOT',		'ART_DEF_RES_GAIA_LAPIS',		'hb_ind_mine_lapis.fxsxml',							1),
('Industrial',		'Constructed',			1,		'ART_DEF_IMPROVEMENT_QUARRY',			'SNAPSHOT',		'ART_DEF_RES_GAIA_LAPIS',		'ind_mine_lapis.fxsxml',							1),
('Industrial',		'Pillaged',				1,		'ART_DEF_IMPROVEMENT_QUARRY',			'SNAPSHOT',		'ART_DEF_RES_GAIA_LAPIS',		'pl_ind_mine_lapis.fxsxml',							1),
-- Lavender
('Any',				'Any',					1,		'ART_DEF_IMPROVEMENT_NONE',				'SNAPSHOT',		'ART_DEF_RES_GAIA_LAVENDER',	'Resource_Lavender.fxsxml',							1),
('Ancient',			'UnderConstruction',	1,		'ART_DEF_IMPROVEMENT_PLANTATION',		'SNAPSHOT',		'ART_DEF_RES_GAIA_LAVENDER',	'HB_Plantation_MID_Lavender.fxsxml',				1),
('Ancient',			'Constructed',			1,		'ART_DEF_IMPROVEMENT_PLANTATION',		'SNAPSHOT',		'ART_DEF_RES_GAIA_LAVENDER',	'Plantation_MID_Lavender.fxsxml',					1),
('Ancient',			'Pillaged',				1,		'ART_DEF_IMPROVEMENT_PLANTATION',		'SNAPSHOT',		'ART_DEF_RES_GAIA_LAVENDER',	'PL_Plantation_MID_Lavender.fxsxml',				1),
('Industrial',		'UnderConstruction',	1,		'ART_DEF_IMPROVEMENT_PLANTATION',		'SNAPSHOT',		'ART_DEF_RES_GAIA_LAVENDER',	'HB_Plantation_IND_Lavender.fxsxml',				1),
('Industrial',		'Constructed',			1,		'ART_DEF_IMPROVEMENT_PLANTATION',		'SNAPSHOT',		'ART_DEF_RES_GAIA_LAVENDER',	'Plantation_IND_Lavender.fxsxml',					1),
('Industrial',		'Pillaged',				1,		'ART_DEF_IMPROVEMENT_PLANTATION',		'SNAPSHOT',		'ART_DEF_RES_GAIA_LAVENDER',	'PL_Plantation_IND_Lavender.fxsxml',				1),
-- Olives
('Any',				'Any',					0.94,	'ART_DEF_IMPROVEMENT_NONE',				'SNAPSHOT',		'ART_DEF_RES_GAIA_OLIVES',		'olive.fxsxml',										1),
('Ancient', 		'UnderConstruction',	0.96,	'ART_DEF_IMPROVEMENT_PLANTATION',		'SNAPSHOT',		'ART_DEF_RES_GAIA_OLIVES',		'plantation_mid_olive_hb.fxsxml',					1),
('Ancient', 		'Constructed',			0.96,	'ART_DEF_IMPROVEMENT_PLANTATION',		'SNAPSHOT',		'ART_DEF_RES_GAIA_OLIVES',		'plantation_mid_olive.fxsxml',						1),
('Ancient', 		'Pillaged',				0.96,	'ART_DEF_IMPROVEMENT_PLANTATION',		'SNAPSHOT',		'ART_DEF_RES_GAIA_OLIVES',		'plantation_mid_olive_pil.fxsxml',					1),
('Industrial',		'UnderConstruction',	0.96,	'ART_DEF_IMPROVEMENT_PLANTATION',		'SNAPSHOT',		'ART_DEF_RES_GAIA_OLIVES',		'plantation_ind_olive_hb.fxsxml',					1),
('Industrial', 		'Constructed',			0.96,	'ART_DEF_IMPROVEMENT_PLANTATION',		'SNAPSHOT',		'ART_DEF_RES_GAIA_OLIVES',		'plantation_ind_olive.fxsxml',						1),
('Industrial', 		'Pillaged',				0.96,	'ART_DEF_IMPROVEMENT_PLANTATION',		'SNAPSHOT',		'ART_DEF_RES_GAIA_OLIVES',		'plantation_ind_olive_pil.fxsxml',					1),
-- Poppies
('Any',				'Any',					1,		'ART_DEF_IMPROVEMENT_NONE',				'SNAPSHOT',		'ART_DEF_RES_GAIA_POPPIES',		'Resource_Poppy.fxsxml',							1),
('Ancient',			'UnderConstruction',	1,		'ART_DEF_IMPROVEMENT_PLANTATION',		'SNAPSHOT',		'ART_DEF_RES_GAIA_POPPIES',		'HB_Plantation_MID_Poppy.fxsxml',					1),
('Ancient',			'Constructed',			1,		'ART_DEF_IMPROVEMENT_PLANTATION',		'SNAPSHOT',		'ART_DEF_RES_GAIA_POPPIES',		'Plantation_MID_Poppy.fxsxml',						1),
('Ancient',			'Pillaged',				1,		'ART_DEF_IMPROVEMENT_PLANTATION',		'SNAPSHOT',		'ART_DEF_RES_GAIA_POPPIES',		'PL_Plantation_MID_Poppy.fxsxml',					1),
('Industrial',		'UnderConstruction',	1,		'ART_DEF_IMPROVEMENT_PLANTATION',		'SNAPSHOT',		'ART_DEF_RES_GAIA_POPPIES',		'HB_Plantation_IND_Poppy.fxsxml',					1),
('Industrial',		'Constructed',			1,		'ART_DEF_IMPROVEMENT_PLANTATION',		'SNAPSHOT',		'ART_DEF_RES_GAIA_POPPIES',		'Plantation_IND_Poppy.fxsxml',						1),
('Industrial',		'Pillaged',				1,		'ART_DEF_IMPROVEMENT_PLANTATION',		'SNAPSHOT',		'ART_DEF_RES_GAIA_POPPIES',		'PL_Plantation_IND_Poppy.fxsxml',					1),
-- Seals
('Any',				'Any',					0.10,	'ART_DEF_IMPROVEMENT_NONE',				'SNAPSHOT',		'ART_DEF_RES_GAIA_SEALS',		'seals.fxsxml',										1),
('Any',				'Any', 					0.7,  	'ART_DEF_IMPROVEMENT_FISHING_BOATS', 	'SNAPSHOT', 	'ART_DEF_RES_GAIA_SEALS', 		'seals.fxsxml', 									1),
-- Tea
('Any',				'Any',					0.94,	'ART_DEF_IMPROVEMENT_NONE',				'SNAPSHOT',		'ART_DEF_RES_GAIA_TEA',			'resource_tea.fxsxml',								1),
('Ancient', 		'UnderConstruction',	0.96,	'ART_DEF_IMPROVEMENT_PLANTATION',		'SNAPSHOT',		'ART_DEF_RES_GAIA_TEA',			'hb_plantation_mid_tea.fxsxml',						1),
('Ancient', 		'Constructed',			0.96,	'ART_DEF_IMPROVEMENT_PLANTATION',		'SNAPSHOT',		'ART_DEF_RES_GAIA_TEA',			'plantation_mid_tea.fxsxml',						1),
('Ancient', 		'Pillaged',				0.96,	'ART_DEF_IMPROVEMENT_PLANTATION',		'SNAPSHOT',		'ART_DEF_RES_GAIA_TEA',			'pl_plantation_mid_tea.fxsxml',						1),
('Industrial',		'UnderConstruction',	0.96,	'ART_DEF_IMPROVEMENT_PLANTATION',		'SNAPSHOT',		'ART_DEF_RES_GAIA_TEA',			'hb_plantation_ind_tea.fxsxml',						1),
('Industrial', 		'Constructed',			0.96,	'ART_DEF_IMPROVEMENT_PLANTATION',		'SNAPSHOT',		'ART_DEF_RES_GAIA_TEA',			'plantation_ind_tea.fxsxml',						1),
('Industrial', 		'Pillaged',				0.96,	'ART_DEF_IMPROVEMENT_PLANTATION',		'SNAPSHOT',		'ART_DEF_RES_GAIA_TEA',			'pl_plantation_ind_tea.fxsxml',						1),
-- Tobacco
('Any',				'Any',					0.94,	'ART_DEF_IMPROVEMENT_NONE',				'SNAPSHOT',		'ART_DEF_RES_GAIA_TOBACCO',		'resource_tobacco.fxsxml',							1),
('Ancient', 		'UnderConstruction',	0.96,	'ART_DEF_IMPROVEMENT_PLANTATION',		'SNAPSHOT',		'ART_DEF_RES_GAIA_TOBACCO',		'hb_plantation_mid_tobacco.fxsxml',					1),
('Ancient', 		'Constructed',			0.96,	'ART_DEF_IMPROVEMENT_PLANTATION',		'SNAPSHOT',		'ART_DEF_RES_GAIA_TOBACCO',		'plantation_mid_tobacco.fxsxml',					1),
('Ancient', 		'Pillaged',				0.96,	'ART_DEF_IMPROVEMENT_PLANTATION',		'SNAPSHOT',		'ART_DEF_RES_GAIA_TOBACCO',		'pl_plantation_mid_tobacco.fxsxml',					1),
('Industrial',		'UnderConstruction',	0.96,	'ART_DEF_IMPROVEMENT_PLANTATION',		'SNAPSHOT',		'ART_DEF_RES_GAIA_TOBACCO',		'hb_plantation_ind_tobacco.fxsxml',					1),
('Industrial', 		'Constructed',			0.96,	'ART_DEF_IMPROVEMENT_PLANTATION',		'SNAPSHOT',		'ART_DEF_RES_GAIA_TOBACCO',		'plantation_ind_tobacco.fxsxml',					1),
('Industrial', 		'Pillaged',				0.96,	'ART_DEF_IMPROVEMENT_PLANTATION',		'SNAPSHOT',		'ART_DEF_RES_GAIA_TOBACCO',		'pl_plantation_ind_tobacco.fxsxml',					1),
-- Berries
('Any',				'Any',					0.96,	'ART_DEF_IMPROVEMENT_NONE',				'SNAPSHOT',		'ART_DEF_RES_GAIA_BERRIES',		'Berries.fxsxml',									1),
('Ancient', 		'UnderConstruction',	0.96,	'ART_DEF_IMPROVEMENT_PLANTATION',		'SNAPSHOT',		'ART_DEF_RES_GAIA_BERRIES',		'plantation_mid_berries_hb.fxsxml',					1),
('Ancient', 		'Constructed',			0.96,	'ART_DEF_IMPROVEMENT_PLANTATION',		'SNAPSHOT',		'ART_DEF_RES_GAIA_BERRIES',		'plantation_mid_berries.fxsxml',					1),
('Ancient', 		'Pillaged',				0.96,	'ART_DEF_IMPROVEMENT_PLANTATION',		'SNAPSHOT',		'ART_DEF_RES_GAIA_BERRIES',		'plantation_mid_berries_pil.fxsxml',				1),
('Industrial',		'UnderConstruction',	0.96,	'ART_DEF_IMPROVEMENT_PLANTATION',		'SNAPSHOT',		'ART_DEF_RES_GAIA_BERRIES',		'plantation_ind_berries_hb.fxsxml',					1),
('Industrial', 		'Constructed',			0.96,	'ART_DEF_IMPROVEMENT_PLANTATION',		'SNAPSHOT',		'ART_DEF_RES_GAIA_BERRIES',		'plantation_ind_berries.fxsxml',					1),
('Industrial', 		'Pillaged',				0.96,	'ART_DEF_IMPROVEMENT_PLANTATION',		'SNAPSHOT',		'ART_DEF_RES_GAIA_BERRIES',		'plantation_ind_berries_hb.fxsxml',					1),
-- Cactus
('Any',				'Any',					0.94,	'ART_DEF_IMPROVEMENT_NONE',				'SNAPSHOT',		'ART_DEF_RES_GAIA_CACTUS',		'resource_drug_peyote.fxsxml',						1),
('Ancient',			'UnderConstruction',	1,		'ART_DEF_IMPROVEMENT_PLANTATION',		'SNAPSHOT',		'ART_DEF_RES_GAIA_CACTUS',		'hb_plantation_mid_drug_peyote.fxsxml',				1),
('Ancient',			'Constructed',			1,		'ART_DEF_IMPROVEMENT_PLANTATION',		'SNAPSHOT',		'ART_DEF_RES_GAIA_CACTUS',		'plantation_mid_drug_peyote.fxsxml',				1),
('Ancient',			'Pillaged',				1,		'ART_DEF_IMPROVEMENT_PLANTATION',		'SNAPSHOT',		'ART_DEF_RES_GAIA_CACTUS',		'pl_plantation_mid_drug_peyote.fxsxml',				1),
('Industrial',		'UnderConstruction',	1,		'ART_DEF_IMPROVEMENT_PLANTATION',		'SNAPSHOT',		'ART_DEF_RES_GAIA_CACTUS',		'hb_plantation_ind_drug_peyote.fxsxml',				1),
('Industrial',		'Constructed',			1,		'ART_DEF_IMPROVEMENT_PLANTATION',		'SNAPSHOT',		'ART_DEF_RES_GAIA_CACTUS',		'plantation_ind_drug_peyote.fxsxml',				1),
('Industrial',		'Pillaged',				1,		'ART_DEF_IMPROVEMENT_PLANTATION',		'SNAPSHOT',		'ART_DEF_RES_GAIA_CACTUS',		'pl_plantation_ind_drug_peyote.fxsxml',				1),
-- Coconut
('Any',				'Any',					1,		'ART_DEF_IMPROVEMENT_NONE',				'SNAPSHOT',		'ART_DEF_RES_GAIA_COCONUTS',	'Coconuttrees.fxsxml',								1),
('Industrial',		'Constructed',			1,		'ART_DEF_IMPROVEMENT_PLANTATION',		'SNAPSHOT',		'ART_DEF_RES_GAIA_COCONUTS',	'Plantation_IND_Coconuttrees.fxsxml',				1),
('Industrial',		'UnderConstruction',	1,		'ART_DEF_IMPROVEMENT_PLANTATION',		'SNAPSHOT',		'ART_DEF_RES_GAIA_COCONUTS',	'Plantation_IND_Coconuttrees_HB.fxsxml',			1),
('Industrial',		'Pillaged',				1,		'ART_DEF_IMPROVEMENT_PLANTATION',		'SNAPSHOT',		'ART_DEF_RES_GAIA_COCONUTS',	'Plantation_IND_Coconuttrees_PIL.fxsxml',			1),
('Ancient',			'Constructed',			1,		'ART_DEF_IMPROVEMENT_PLANTATION',		'SNAPSHOT',		'ART_DEF_RES_GAIA_COCONUTS',	'Plantation_MID_Coconuttrees.fxsxml',				1),
('Ancient',			'UnderConstruction',	1,		'ART_DEF_IMPROVEMENT_PLANTATION',		'SNAPSHOT',		'ART_DEF_RES_GAIA_COCONUTS',	'Plantation_MID_Coconuttrees_HB.fxsxml',			1),
('Ancient',			'Pillaged',				1,		'ART_DEF_IMPROVEMENT_PLANTATION',		'SNAPSHOT',		'ART_DEF_RES_GAIA_COCONUTS',	'Plantation_MID_Coconuttrees_PIL.fxsxml',			1),
-- Flax
('Any', 			'Any',					1,		'ART_DEF_IMPROVEMENT_NONE',				'SNAPSHOT',		'ART_DEF_RES_GAIA_FLAX',		'resource_flax.fxsxml',								1),
('Ancient', 		'UnderConstruction',	1,		'ART_DEF_IMPROVEMENT_PLANTATION',		'SNAPSHOT',		'ART_DEF_RES_GAIA_FLAX',		'hb_plantation_mid_flax.fxsxml',					1),
('Ancient', 		'Constructed',			1,		'ART_DEF_IMPROVEMENT_PLANTATION',		'SNAPSHOT',		'ART_DEF_RES_GAIA_FLAX',		'plantation_mid_flax.fxsxml',						1),
('Ancient', 		'Pillaged',				1,		'ART_DEF_IMPROVEMENT_PLANTATION',		'SNAPSHOT',		'ART_DEF_RES_GAIA_FLAX',		'pl_plantation_mid_flax.fxsxml',					1),
('Industrial', 		'UnderConstruction',	1,		'ART_DEF_IMPROVEMENT_PLANTATION',		'SNAPSHOT',		'ART_DEF_RES_GAIA_FLAX',		'hb_plantation_ind_flax.fxsxml',					1),
('Industrial', 		'Constructed',			1,		'ART_DEF_IMPROVEMENT_PLANTATION',		'SNAPSHOT',		'ART_DEF_RES_GAIA_FLAX',		'plantation_ind_flax.fxsxml',						1),
('Industrial', 		'Pillaged',				1,		'ART_DEF_IMPROVEMENT_PLANTATION',		'SNAPSHOT',		'ART_DEF_RES_GAIA_FLAX',		'pl_plantation_ind_flax.fxsxml',					1),
-- Maize
('Any',				'Any',					0.94,	'ART_DEF_IMPROVEMENT_NONE',				'SNAPSHOT',		'ART_DEF_RES_GAIA_MAIZE',		'resource_maize.fxsxml',							1),
('Any',				'Any',					1,		'ART_DEF_IMPROVEMENT_FARM',				'SNAPSHOT',		'ART_DEF_RES_GAIA_MAIZE',		NULL,												1),
('Any',				'UnderConstruction',	1,		'ART_DEF_IMPROVEMENT_FARM',				'SNAPSHOT',		'ART_DEF_RES_GAIA_MAIZE',		NULL,												1),
('Ancient',			'UnderConstruction',	1,		'ART_DEF_IMPROVEMENT_FARM',				'FARM',			'ART_DEF_RES_GAIA_MAIZE',		'HB_Medieval_Farm.fxsxml',							1),
('Ancient',			'Constructed',			1,		'ART_DEF_IMPROVEMENT_FARM',				'FARM',			'ART_DEF_RES_GAIA_MAIZE',		'Medieval_Farm.fxsxml',								1),
('Ancient',			'Pillaged',				1,		'ART_DEF_IMPROVEMENT_FARM',				'FARM',			'ART_DEF_RES_GAIA_MAIZE',		'PL_Medieval_Farm.fxsxml',							1),
('Industrial',		'UnderConstruction',	1,		'ART_DEF_IMPROVEMENT_FARM',				'FARM',			'ART_DEF_RES_GAIA_MAIZE',		'HB_Modern_Farm.fxsxml',							1),
('Industrial',		'Constructed',			1,		'ART_DEF_IMPROVEMENT_FARM',				'FARM',			'ART_DEF_RES_GAIA_MAIZE',		'Modern_Farm.fxsxml',								1),
('Industrial',		'Pillaged',				1,		'ART_DEF_IMPROVEMENT_FARM',				'FARM',			'ART_DEF_RES_GAIA_MAIZE',		'PL_Modern_Farm.fxsxml',							1),
-- Rice
('Any',				'Any',					0.94,	'ART_DEF_IMPROVEMENT_NONE',				'SNAPSHOT',		'ART_DEF_RES_GAIA_RICE',		'resource_rice.fxsxml',								1),
('Any',				'Any',					1,		'ART_DEF_IMPROVEMENT_FARM',				'SNAPSHOT',		'ART_DEF_RES_GAIA_RICE',		NULL,												1),
('Any',				'UnderConstruction',	1,		'ART_DEF_IMPROVEMENT_FARM',				'SNAPSHOT',		'ART_DEF_RES_GAIA_RICE',		NULL,												1),
('Ancient',			'UnderConstruction',	1,		'ART_DEF_IMPROVEMENT_FARM',				'FARM',			'ART_DEF_RES_GAIA_RICE',		'HB_Medieval_Farm.fxsxml',							1),
('Ancient',			'Constructed',			1,		'ART_DEF_IMPROVEMENT_FARM',				'FARM',			'ART_DEF_RES_GAIA_RICE',		'Medieval_Farm.fxsxml',								1),
('Ancient',			'Pillaged',				1,		'ART_DEF_IMPROVEMENT_FARM',				'FARM',			'ART_DEF_RES_GAIA_RICE',		'PL_Medieval_Farm.fxsxml',							1),
('Industrial',		'UnderConstruction',	1,		'ART_DEF_IMPROVEMENT_FARM',				'FARM',			'ART_DEF_RES_GAIA_RICE',		'HB_Modern_Farm.fxsxml',							1),
('Industrial',		'Constructed',			1,		'ART_DEF_IMPROVEMENT_FARM',				'FARM',			'ART_DEF_RES_GAIA_RICE',		'Modern_Farm.fxsxml',								1),
('Industrial',		'Pillaged',				1,		'ART_DEF_IMPROVEMENT_FARM',				'FARM',			'ART_DEF_RES_GAIA_RICE',		'PL_Modern_Farm.fxsxml',							1),
-- Rubber
('Any',				'Any',					1,		'ART_DEF_IMPROVEMENT_NONE',				'SNAPSHOT',		'ART_DEF_RES_GAIA_RUBBER',		'Rubbertrees.fxsxml',								1),
('Ancient',			'UnderConstruction',	1,		'ART_DEF_IMPROVEMENT_PLANTATION',		'SNAPSHOT',		'ART_DEF_RES_GAIA_RUBBER',		'Plantation_MID_Rubbertrees_HB.fxsxml',				1),
('Ancient',			'Constructed',			1,		'ART_DEF_IMPROVEMENT_PLANTATION',		'SNAPSHOT',		'ART_DEF_RES_GAIA_RUBBER',		'Plantation_MID_Rubbertrees.fxsxml',				1),
('Ancient',			'Pillaged',				1,		'ART_DEF_IMPROVEMENT_PLANTATION',		'SNAPSHOT',		'ART_DEF_RES_GAIA_RUBBER',		'Plantation_MID_Rubbertrees_PIL.fxsxml',			1),
('Industrial',		'UnderConstruction',	1,		'ART_DEF_IMPROVEMENT_PLANTATION',		'SNAPSHOT',		'ART_DEF_RES_GAIA_RUBBER',		'Plantation_IND_Rubbertrees_HB.fxsxml',				1),
('Industrial',		'Constructed',			1,		'ART_DEF_IMPROVEMENT_PLANTATION',		'SNAPSHOT',		'ART_DEF_RES_GAIA_RUBBER',		'Plantation_IND_Rubbertrees.fxsxml',				1),
('Industrial',		'Pillaged',				1,		'ART_DEF_IMPROVEMENT_PLANTATION',		'SNAPSHOT',		'ART_DEF_RES_GAIA_RUBBER',		'Plantation_IND_Rubbertrees_PIL.fxsxml',			1),
-- Timber
('Any',				'Any',					1,		'ART_DEF_IMPROVEMENT_NONE',				'SNAPSHOT',		'ART_DEF_RES_GAIA_TIMBER',		'Lumbertrees.fxsxml',								1),
('Ancient',			'Constructed',			0.8,	'ART_DEF_IMPROVEMENT_LUMBERMILL',		'SNAPSHOT',		'ART_DEF_RES_GAIA_TIMBER',		'Lumbermill_MID_Lumbertrees.fxsxml',				1),
('Ancient',			'UnderConstruction',	0.8,	'ART_DEF_IMPROVEMENT_LUMBERMILL',		'SNAPSHOT',		'ART_DEF_RES_GAIA_TIMBER',		'Lumbermill_MID_Lumbertrees_HB.fxsxml',				1),
('Ancient',			'Pillaged',				0.8,	'ART_DEF_IMPROVEMENT_LUMBERMILL',		'SNAPSHOT',		'ART_DEF_RES_GAIA_TIMBER',		'Lumbermill_MID_Lumbertrees_PIL.fxsxml',			1),
-- Tin
('Any',				'Any',					1,		'ART_DEF_IMPROVEMENT_NONE',				'SNAPSHOT',		'ART_DEF_RES_GAIA_TIN',			'tin.fxsxml',										1),
('Industrial',		'Constructed',			0.9,	'ART_DEF_IMPROVEMENT_MINE',				'SNAPSHOT',		'ART_DEF_RES_GAIA_TIN',			'ind_mine_tin.fxsxml',								1),
('Industrial',		'UnderConstruction',	0.9,	'ART_DEF_IMPROVEMENT_MINE',				'SNAPSHOT',		'ART_DEF_RES_GAIA_TIN',			'hb_ind_tin_mine.fxsxml',							1),
('Industrial',		'Pillaged',				0.9,	'ART_DEF_IMPROVEMENT_MINE',				'SNAPSHOT',		'ART_DEF_RES_GAIA_TIN',			'pl_ind_mine_tin.fxsxml',							1),
('Ancient',			'Constructed',			0.9,	'ART_DEF_IMPROVEMENT_MINE',				'SNAPSHOT',		'ART_DEF_RES_GAIA_TIN',			'med_mine_tin.fxsxml',								1),
('Ancient',			'UnderConstruction',	0.9,	'ART_DEF_IMPROVEMENT_MINE',				'SNAPSHOT',		'ART_DEF_RES_GAIA_TIN',			'hb_med_tin_mine.fxsxml',							1),
('Ancient',			'Pillaged',				0.9,	'ART_DEF_IMPROVEMENT_MINE',				'SNAPSHOT',		'ART_DEF_RES_GAIA_TIN',			'pl_med_mine_tin.fxsxml',							1),
--KELPFARM
('Ancient',			'Any', 					0.07,  	'ART_DEF_IMPROVEMENT_FISHING_BOATS', 	'ANIMATED', 	'ART_DEF_RES_GAIA_KELP', 		'Assets/Buildings/Resources/Pearls/Pearls.fxsxml', 				1),
('Industrial',		'Any', 					0.07,  	'ART_DEF_IMPROVEMENT_FISHING_BOATS', 	'ANIMATED', 	'ART_DEF_RES_GAIA_KELP', 		'Assets/Buildings/Resources/Pearls/Pearls_Industrial.fxsxml', 	1);

-----------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_StrategicView
-----------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Resource_ArtDefine_StrategicView AS SELECT * FROM ArtDefine_StrategicView WHERE TileType = 'Resource';
DELETE FROM ArtDefine_StrategicView WHERE TileType = 'Resource';
INSERT OR REPLACE INTO ArtDefine_StrategicView
		(StrategicViewType,					TileType,		Asset)
VALUES	('ART_DEF_RES_GAIA_AMBER',			'Resource',		'SV_GAIA_Amber.dds'),
		('ART_DEF_RES_GAIA_COFFEE',			'Resource',		'SV_GAIA_Coffee.dds'),
		('ART_DEF_RES_GAIA_CORAL',			'Resource',		'SV_GAIA_Coral.dds'),
		('ART_DEF_RES_GAIA_JADE',			'Resource',		'SV_GAIA_Jade.dds'),
		('ART_DEF_RES_GAIA_LAPIS',			'Resource',		'SV_GAIA_Lapis.dds'),
		('ART_DEF_RES_GAIA_LAVENDER',		'Resource',		'SV_GAIA_Lavender.dds'),
		('ART_DEF_RES_GAIA_OLIVES',			'Resource',		'SV_GAIA_Olives.dds'),
		('ART_DEF_RES_GAIA_POPPIES',		'Resource',		'SV_GAIA_Poppies.dds'),
		('ART_DEF_RES_GAIA_SEALS', 			'Resource',		'SV_GAIA_Seals.dds'),
		('ART_DEF_RES_GAIA_TEA',			'Resource',		'SV_GAIA_Tea.dds'),
		('ART_DEF_RES_GAIA_TOBACCO',		'Resource',		'SV_GAIA_Tobacco.dds'),
		('ART_DEF_RES_GAIA_BERRIES',		'Resource',		'SV_GAIA_Berries.dds'),
		('ART_DEF_RES_GAIA_CACTUS',			'Resource',		'SV_GAIA_Cactus.dds'),
		('ART_DEF_RES_GAIA_COCONUTS',		'Resource',		'SV_GAIA_Coconuts.dds'),
		('ART_DEF_RES_GAIA_FLAX',			'Resource',		'SV_GAIA_Flax.dds'),
		('ART_DEF_RES_GAIA_MAIZE',			'Resource',		'SV_GAIA_Maize.dds'),		
		('ART_DEF_RES_GAIA_RICE',			'Resource',		'SV_GAIA_Rice.dds'),
		('ART_DEF_RES_GAIA_RUBBER',			'Resource',		'SV_GAIA_Rubber.dds'),		
		('ART_DEF_RES_GAIA_TIMBER',			'Resource',		'SV_GAIA_Timber.dds'),		
		('ART_DEF_RES_GAIA_TIN',			'Resource',		'SV_GAIA_Tin.dds'),
		('ART_DEF_RES_GAIA_KELP',			'Resource',		'SV_GAIA_Kelp.dds');
		
INSERT INTO ArtDefine_StrategicView SELECT * FROM Resource_ArtDefine_StrategicView AS t
	WHERE NOT EXISTS (SELECT 1 FROM ArtDefine_StrategicView AS a WHERE a.StrategicViewType = t.StrategicViewType);
DROP TABLE Resource_ArtDefine_StrategicView;

--=======================================================================================================================
-- RESOURCE ART UPDATES
--=======================================================================================================================
UPDATE Resources SET ArtDefineTag = 'ART_DEF_RESOURCE_FISH' WHERE Type = 'RESOURCE_GAIA_LAKEFISH';
UPDATE Resources SET ArtDefineTag = 'ART_DEF_RESOURCE_OIL_WATER' WHERE Type = 'RESOURCE_GAIA_MINERALS';
UPDATE Resources SET ArtDefineTag = 'ART_DEF_RES_GAIA_POPPIES' WHERE Type = 'RESOURCE_GAIA_TULIPS';
UPDATE Resources SET ArtDefineTag = 'ART_DEF_RESOURCE_FUR' WHERE Type IN ('RESOURCE_JEWELRY', 'RESOURCE_PORCELAIN');

--=======================================================================================================================
UPDATE Sapiens_DBUpdates SET Value = 1 WHERE Name = 'Resources_Art';
