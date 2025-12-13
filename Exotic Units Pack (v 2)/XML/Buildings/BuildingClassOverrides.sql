-- Insert SQL Rules Here 
-- ===============================================================================================================================================
--
--								Building Overrides 
--
-- Please note: there are no overrides listed here for major civs.  This is intentional, to prevent buildings from being removed from the game
-- As several units requires these buildings, it would cause a CTD if the building were removed and the player somehow built, or a city state 
-- gifted it to a major civ.

-- ===============================================================================================================================================
--
--								BARBARIAN OVERRIDES 
--
-- These buildings should not available to Barbarians by default. 
-- To make a unit available, simply insert two dashes ("--") in front of the "INSERT" statement.
-- Commenting out the INSERT statement will allow the unit to appear in the game for the Barbarians
--
-- ===============================================================================================================================================

-- Camel Class Buildings

INSERT INTO Civilization_BuildingClassOverrides (CivilizationType, BuildingClassType, BuildingType) VALUES ('CIVILIZATION_BARBARIAN', 'BUILDINGCLASS_SMAN_EU_CAMEL_MARKET', null);
INSERT INTO Civilization_BuildingClassOverrides (CivilizationType, BuildingClassType, BuildingType) VALUES ('CIVILIZATION_BARBARIAN', 'BUILDINGCLASS_SMAN_EU_CAMEL_BAZAAR', null);
INSERT INTO Civilization_BuildingClassOverrides (CivilizationType, BuildingClassType, BuildingType) VALUES ('CIVILIZATION_BARBARIAN', 'BUILDINGCLASS_SMAN_SOUK_AL_JAMAL', null);

-- Elephant/Pachyderm Class Buildings
INSERT INTO Civilization_BuildingClassOverrides (CivilizationType, BuildingClassType, BuildingType) VALUES ('CIVILIZATION_BARBARIAN', 'BUILDINGCLASS_SMAN_EU_ELEPHANT_KHEDDA', null);
INSERT INTO Civilization_BuildingClassOverrides (CivilizationType, BuildingClassType, BuildingType) VALUES ('CIVILIZATION_BARBARIAN', 'BUILDINGCLASS_SMAN_EU_ELEPHANT_GAJASHAALA', null);

-- Mercenary Buildings
INSERT INTO Civilization_BuildingClassOverrides (CivilizationType, BuildingClassType, BuildingType) VALUES ('CIVILIZATION_BARBARIAN', 'BUILDINGCLASS_SMAN_EU_HEPTASTADION', null);
INSERT INTO Civilization_BuildingClassOverrides (CivilizationType, BuildingClassType, BuildingType) VALUES ('CIVILIZATION_BARBARIAN', 'BUILDINGCLASS_SMAN_EU_MEAD_HALL', null);
INSERT INTO Civilization_BuildingClassOverrides (CivilizationType, BuildingClassType, BuildingType) VALUES ('CIVILIZATION_BARBARIAN', 'BUILDINGCLASS_SMAN_EU_MERC_GUILD', null);
INSERT INTO Civilization_BuildingClassOverrides (CivilizationType, BuildingClassType, BuildingType) VALUES ('CIVILIZATION_BARBARIAN', 'BUILDINGCLASS_SMAN_EU_SHIPYARD', null);
INSERT INTO Civilization_BuildingClassOverrides (CivilizationType, BuildingClassType, BuildingType) VALUES ('CIVILIZATION_BARBARIAN', 'BUILDINGCLASS_SMAN_EU_MERC_CONSULATE', null);
INSERT INTO Civilization_BuildingClassOverrides (CivilizationType, BuildingClassType, BuildingType) VALUES ('CIVILIZATION_BARBARIAN', 'BUILDINGCLASS_SMAN_EU_NAVAL_YARD', null);
INSERT INTO Civilization_BuildingClassOverrides (CivilizationType, BuildingClassType, BuildingType) VALUES ('CIVILIZATION_BARBARIAN', 'BUILDINGCLASS_SMAN_EU_CONTRACTING_AGENCY', null);



-- ===============================================================================================================================================
--
--								CITY STATE OVERRIDES 
--
-- These buildings are usually not available to City States by default. 
-- To make a unit available, simply insert two dashes ("--") in front of the "INSERT" statement. 
-- Commenting out the INSERT statement will allow the unit to appear in the game for City States
-- As intentionally designed, some of the earlier class units are available to City States
--
-- ===============================================================================================================================================

-- Camel Class Buildings

INSERT INTO Civilization_BuildingClassOverrides (CivilizationType, BuildingClassType, BuildingType) VALUES ('CIVILIZATION_MINOR', 'BUILDINGCLASS_SMAN_EU_CAMEL_MARKET', null);
INSERT INTO Civilization_BuildingClassOverrides (CivilizationType, BuildingClassType, BuildingType) VALUES ('CIVILIZATION_MINOR', 'BUILDINGCLASS_SMAN_EU_CAMEL_BAZAAR', null);
INSERT INTO Civilization_BuildingClassOverrides (CivilizationType, BuildingClassType, BuildingType) VALUES ('CIVILIZATION_MINOR', 'BUILDINGCLASS_SMAN_SOUK_AL_JAMAL', null);

-- Elephant/Pachyderm Class Buildings
INSERT INTO Civilization_BuildingClassOverrides (CivilizationType, BuildingClassType, BuildingType) VALUES ('CIVILIZATION_MINOR', 'BUILDINGCLASS_SMAN_EU_ELEPHANT_KHEDDA', null);
INSERT INTO Civilization_BuildingClassOverrides (CivilizationType, BuildingClassType, BuildingType) VALUES ('CIVILIZATION_MINOR', 'BUILDINGCLASS_SMAN_EU_ELEPHANT_GAJASHAALA', null);

-- Mercenary Buildings
INSERT INTO Civilization_BuildingClassOverrides (CivilizationType, BuildingClassType, BuildingType) VALUES ('CIVILIZATION_MINOR', 'BUILDINGCLASS_SMAN_EU_HEPTASTADION', null);
INSERT INTO Civilization_BuildingClassOverrides (CivilizationType, BuildingClassType, BuildingType) VALUES ('CIVILIZATION_MINOR', 'BUILDINGCLASS_SMAN_EU_MEAD_HALL', null);
INSERT INTO Civilization_BuildingClassOverrides (CivilizationType, BuildingClassType, BuildingType) VALUES ('CIVILIZATION_MINOR', 'BUILDINGCLASS_SMAN_EU_MERC_GUILD', null);
INSERT INTO Civilization_BuildingClassOverrides (CivilizationType, BuildingClassType, BuildingType) VALUES ('CIVILIZATION_MINOR', 'BUILDINGCLASS_SMAN_EU_SHIPYARD', null);
INSERT INTO Civilization_BuildingClassOverrides (CivilizationType, BuildingClassType, BuildingType) VALUES ('CIVILIZATION_MINOR', 'BUILDINGCLASS_SMAN_EU_MERC_CONSULATE', null);
INSERT INTO Civilization_BuildingClassOverrides (CivilizationType, BuildingClassType, BuildingType) VALUES ('CIVILIZATION_MINOR', 'BUILDINGCLASS_SMAN_EU_NAVAL_YARD', null);
INSERT INTO Civilization_BuildingClassOverrides (CivilizationType, BuildingClassType, BuildingType) VALUES ('CIVILIZATION_MINOR', 'BUILDINGCLASS_SMAN_EU_CONTRACTING_AGENCY', null);
