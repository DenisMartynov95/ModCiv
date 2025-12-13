--=======================================================================================================================
-- *** BINGLES CIV IV TRAITS ***
--=======================================================================================================================
-- Leader_SharedTraits
------------------------------ 
CREATE TABLE IF NOT EXISTS
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(TYPE)        DEFAULT NULL,
    TraitOne            text    REFERENCES Policies(TYPE)       DEFAULT NULL,
    TraitTwo            text    REFERENCES Policies(TYPE)       DEFAULT NULL);
     
INSERT INTO Leader_SharedTraits
        (LeaderType,            TraitOne,                   TraitTwo)
VALUES  ('LEADER_LEONIDAS',			'POLICY_AGGRESSIVE_X',		'POLICY_IMPERIALISTIC_X');
------------------------------ 
-- Leaders
------------------------------ 
UPDATE Leaders
SET Description = 'Leonidas [ICON_WAR][ICON_CITY_STATE]'
WHERE TYPE = 'LEADER_LEONIDAS'
AND EXISTS (SELECT * FROM Policies WHERE TYPE = 'POLICY_PHILOSOPHICAL_X');
--==========================================================================================================================
-- *** JFD's CULTURAL DIVERSITY ***
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_CultureTypes (
    CivilizationType                            text    REFERENCES Civilizations(Type)      default null,
    CultureType                                 text                                        default null,
    SplashScreenTag                             text                                        default null,
    SoundtrackTag                               text                                        default null);
 
INSERT OR REPLACE INTO Civilization_JFD_CultureTypes
        (CivilizationType,      CultureType,            SplashScreenTag,        SoundtrackTag)
VALUES  ('CIVILIZATION_SPARTA', 'JFD_Mediterranean',    'JFD_Mediterranean',    'JFD_MediterraneanClassical');
--==========================================================================================================================
-- *** BARATHOR's YNAEMP ***
--==========================================================================================================================
-- Civilizations_YagemStartPosition (Earth Giant)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(TYPE, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
            (TYPE,                                      X,      Y,      AltX,   AltY)
VALUES      ('CIVILIZATION_SPARTA',                    66,     51,     NULL,   NULL);     
--==========================================================================================================================
-- Civilizations_YahemStartPosition (Earth Huge)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(TYPE, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
            (TYPE,                                      X,      Y,      AltX,   AltY)
VALUES      ('CIVILIZATION_SPARTA',                    68,     57,     NULL,   NULL);
--==========================================================================================================================
-- Civilizations_CordiformStartPosition (Earth Standard)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(TYPE, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
            (TYPE,                                      X,      Y,      AltX,   AltY)
VALUES      ('CIVILIZATION_SPARTA',                    42,     23,     NULL,   NULL);
--==========================================================================================================================
-- Civilizations_GreatestEarthStartPosition (Earth Greatest)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(TYPE, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
            (TYPE,                                      X,      Y,      AltX,   AltY)
VALUES      ('CIVILIZATION_SPARTA',                    57,     41,     NULL,   NULL);
--==========================================================================================================================
-- Civilizations_EuroLargeStartPosition (Europe Large)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeStartPosition(TYPE, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroLargeStartPosition
            (TYPE,                                      X,      Y,      AltX,   AltY)
VALUES      ('CIVILIZATION_SPARTA',                    48,     25,     NULL,   NULL);
--==========================================================================================================================
-- Civilizations_YagemRequestedResource (Earth Giant)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YagemRequestedResource(TYPE, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YagemRequestedResource
            (TYPE,                                      Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT      ('CIVILIZATION_SPARTA'),                   Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE TYPE = 'CIVILIZATION_GREECE';
--==========================================================================================================================
-- Civilizations_YahemRequestedResource (Earth Huge)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YahemRequestedResource(TYPE, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YahemRequestedResource
            (TYPE,                                      Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT      ('CIVILIZATION_SPARTA'),                   Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YahemRequestedResource WHERE TYPE = 'CIVILIZATION_GREECE';
--==========================================================================================================================
-- Civilizations_CordiformRequestedResource (Earth Standard)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_CordiformRequestedResource(TYPE, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_CordiformRequestedResource
            (TYPE,                                      Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT      ('CIVILIZATION_SPARTA'),                   Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_CordiformRequestedResource WHERE TYPE = 'CIVILIZATION_GREECE';
--==========================================================================================================================
-- Civilizations_GreatestEarthRequestedResource (Earth Greatest)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthRequestedResource(TYPE, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_GreatestEarthRequestedResource
            (TYPE,                                      Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT      ('CIVILIZATION_SPARTA'),                   Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE TYPE = 'CIVILIZATION_GREECE';
--==========================================================================================================================
-- Civilizations_EuroLargeRequestedResource (Europe Large)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeRequestedResource(TYPE, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroLargeRequestedResource
            (TYPE,                                      Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT      ('CIVILIZATION_SPARTA'),                   Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroLargeRequestedResource WHERE TYPE = 'CIVILIZATION_GREECE';
--==========================================================================================================================
-- *** JFD's USER SETTINGS ***
--==========================================================================================================================
-- JFD_GlobalUserSettings
-------------------------------------
CREATE TABLE IF NOT EXISTS
JFD_GlobalUserSettings (
    TYPE                                        text                                            DEFAULT NULL,
    VALUE                                       INTEGER                                         DEFAULT 1);
--==========================================================================================================================    
-- *** JFD's and Pouakai's MERCENARIES ***
--==========================================================================================================================
-- Flavors
------------------------------------------------------------    
INSERT OR REPLACE INTO Flavors
        (TYPE)
VALUES  ('FLAVOR_JFD_MERCENARY');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------    
INSERT INTO Leader_Flavors
        (LeaderType,                FlavorType,                 Flavor)
VALUES  ('LEADER_LEONIDAS',    'FLAVOR_JFD_MERCENARY',     6);
--==========================================================================================================================
-- *** Hazel16's MAP LABELS ***
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
        (CivType,               CultureType,        CultureEra)
VALUES  ('CIVILIZATION_SPARTA', 'MEDITERRANEAN',    'ANY');
--==========================================================================================================================   
-- *** JFD's PIETY ***
--==========================================================================================================================           
INSERT OR REPLACE INTO Flavors
            (TYPE)
VALUES      ('FLAVOR_JFD_RELIGIOUS_INTOLERANCE');
 
INSERT INTO Leader_Flavors
            (LeaderType,            FlavorType,                             Flavor)
VALUES      ('LEADER_LEONIDAS',    'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',     7);
--==========================================================================================================================
-- *** JFD COLONIES ***
--==========================================================================================================================
-- Civilization_JFD_ColonialCityNames
------------------------------ 
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_ColonialCityNames (
    CivilizationType                            text    REFERENCES Civilizations(Type)      default null,
    ColonyName                                  text                                        default null,
    LinguisticType                              text                                        default null,
    CultureType                                 text                                        default null);
 
INSERT OR REPLACE INTO Civilization_JFD_ColonialCityNames
        (CivilizationType,      ColonyName,                         LinguisticType)
VALUES  ('CIVILIZATION_THEBES', null,                               'JFD_Hellenic'),
        ('CIVILIZATION_THEBES', 'TXT_KEY_COLONY_NAME_GREECE_01',    null),
        ('CIVILIZATION_THEBES', 'TXT_KEY_COLONY_NAME_GREECE_02',    null),
        ('CIVILIZATION_THEBES', 'TXT_KEY_COLONY_NAME_GREECE_03',    null),
        ('CIVILIZATION_THEBES', 'TXT_KEY_COLONY_NAME_GREECE_04',    null),
        ('CIVILIZATION_THEBES', 'TXT_KEY_COLONY_NAME_GREECE_05',    null),
        ('CIVILIZATION_THEBES', 'TXT_KEY_COLONY_NAME_GREECE_06',    null),
        ('CIVILIZATION_THEBES', 'TXT_KEY_COLONY_NAME_GREECE_07',    null),
        ('CIVILIZATION_THEBES', 'TXT_KEY_COLONY_NAME_GREECE_08',    null),
        ('CIVILIZATION_THEBES', 'TXT_KEY_COLONY_NAME_GREECE_09',    null),
        ('CIVILIZATION_THEBES', 'TXT_KEY_COLONY_NAME_GREECE_10',    null),
        ('CIVILIZATION_THEBES', 'TXT_KEY_COLONY_NAME_GREECE_11',    null),
        ('CIVILIZATION_THEBES', 'TXT_KEY_COLONY_NAME_GREECE_12',    null),
        ('CIVILIZATION_THEBES', 'TXT_KEY_COLONY_NAME_GREECE_13',    null);
		------------------------------  
-- Civilization_JFD_RevolutionaryCivilizationsToSpawn
------------------------------  
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_RevolutionaryCivilizationsToSpawn (
    CivilizationType                            text    REFERENCES Civilizations(Type)      default null,
    RevolutionaryCivilizationType               text    REFERENCES Civilizations(Type)      default null);
     
INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
        (CivilizationType,                      RevolutionaryCivilizationType)
VALUES  ('CIVILIZATION_GREECE',                 'CIVILIZATION_SPARTA'),
        ('CIVILIZATION_SPARTA',                 'CIVILIZATION_GREECE');
--==========================================================================================================================
-- *** JFD PROSPERITY ***
--==========================================================================================================================
-- Civilization_JFD_Currencies
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
    Civilization_JFD_Currencies (
    CivilizationType                text        REFERENCES Civilizations(TYPE)  DEFAULT NULL,
    CurrencyType                    text                                        DEFAULT NULL);
 
INSERT INTO Civilization_JFD_Currencies
        (CivilizationType,          CurrencyType)
SELECT  'CIVILIZATION_SPARTA', CurrencyType
FROM Civilization_JFD_Currencies WHERE CivilizationType = 'CIVILIZATION_GREECE';
--==========================================================================================================================
-- *** ETHNIC UNITS/GEDEMON's R.E.D. ***
--==========================================================================================================================
UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_EURO' )
    THEN '_GREECE'
    ELSE '_EURO' END) 
WHERE Type = 'CIVILIZATION_SPARTA';
--==========================================================================================================================    
-- *** JFD's SOVEREIGNTY ***
--==========================================================================================================================
-- Civilization_JFD_Governments
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
    Civilization_JFD_Governments (
    CivilizationType                text        REFERENCES Civilizations(TYPE)                  DEFAULT NULL,
    CultureType                     text                                                        DEFAULT NULL,
    LegislatureName                 text                                                        DEFAULT NULL,
    OfficeTitle                     text                                                        DEFAULT NULL,
    GovernmentType                  text                                                        DEFAULT NULL,
    Weight                          INTEGER                                                     DEFAULT 0);
 
INSERT INTO Civilization_JFD_Governments
        (CivilizationType,                  LegislatureName,                                    OfficeTitle,                                                GovernmentType,             Weight)
VALUES  ('CIVILIZATION_SPARTA',   'TXT_KEY_JFD_LEGISLATURE_NAME_CIVILIZATION_SPARTA',  'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_SPARTA',  'GOVERNMENT_JFD_MONARCHY',  100);
------------------------------------------------------------    
-- Civilization_JFD_HeadsOfGovernment  
------------------------------------------------------------    
CREATE TABLE IF NOT EXISTS  
    Civilization_JFD_HeadsOfGovernment (    
    CivilizationType                text        REFERENCES Civilizations(TYPE)                  DEFAULT NULL,
    CultureType                     text                                                        DEFAULT NULL,
    HeadOfGovernmentName            text                                                        DEFAULT NULL);
 
INSERT INTO Civilization_JFD_HeadsOfGovernment
        (CivilizationType,                      HeadOfGovernmentName)
VALUES  ('CIVILIZATION_SPARTA',       'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_GREECE_1'),
        ('CIVILIZATION_SPARTA',       'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_GREECE_2'),
        ('CIVILIZATION_SPARTA',       'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_GREECE_3'),
        ('CIVILIZATION_SPARTA',       'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_GREECE_4'),
        ('CIVILIZATION_SPARTA',       'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_GREECE_5'),
        ('CIVILIZATION_SPARTA',       'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_GREECE_6'),
        ('CIVILIZATION_SPARTA',       'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_GREECE_7'),
        ('CIVILIZATION_SPARTA',       'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_GREECE_8'),
        ('CIVILIZATION_SPARTA',       'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_GREECE_9');
------------------------------------------------------------
-- Civilization_JFD_Titles
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
    Civilization_JFD_Titles (
    CivilizationType                text        REFERENCES Civilizations(TYPE)                  DEFAULT NULL,
    CultureType                     text                                                        DEFAULT NULL,
    ReligionType                    text        REFERENCES Religions(TYPE)                      DEFAULT NULL,
    DefaultTitle                    text                                                        DEFAULT NULL,
    UniqueTitle                     text                                                        DEFAULT NULL,
    UseAdjective                    BOOLEAN                                                     DEFAULT 0);
 
INSERT INTO Civilization_JFD_Titles
        (CivilizationType,                  DefaultTitle,   UniqueTitle)
SELECT  'CIVILIZATION_SPARTA', DefaultTitle,   UniqueTitle
FROM Civilization_JFD_Titles WHERE CivilizationType = 'CIVILIZATION_GREECE';
------------------------------------------------------------
-- Civilization_JFD_Politics
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
    Civilization_JFD_Politics (
    CivilizationType                    text        REFERENCES Civilizations(TYPE)                  DEFAULT NULL,
    PoliticsType                        text                                                        DEFAULT NULL,
    UniqueName                          text                                                        DEFAULT NULL);
 
INSERT INTO Civilization_JFD_Politics
        (CivilizationType,                  PoliticsType, UniqueName)
SELECT  'CIVILIZATION_SPARTA', PoliticsType, UniqueName
FROM Civilization_JFD_Politics WHERE CivilizationType = 'CIVILIZATION_GREECE';
------------------------------------------------------------
-- Flavors
------------------------------------------------------------    
INSERT OR REPLACE INTO Flavors
        (TYPE)
VALUES  ('FLAVOR_JFD_REFORM_GOVERNMENT'),
        ('FLAVOR_JFD_REFORM_CULTURE'),
        ('FLAVOR_JFD_REFORM_ECONOMIC'),
        ('FLAVOR_JFD_REFORM_FOREIGN'),
        ('FLAVOR_JFD_REFORM_INDUSTRY'),
        ('FLAVOR_JFD_REFORM_MILITARY'),
        ('FLAVOR_JFD_REFORM_RELIGION');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------    
INSERT INTO Leader_Flavors
        (LeaderType,            FlavorType,                         Flavor)
VALUES  ('LEADER_LEONIDAS',    'FLAVOR_JFD_REFORM_GOVERNMENT',     7),
        ('LEADER_LEONIDAS',    'FLAVOR_JFD_REFORM_CULTURE',        6),
        ('LEADER_LEONIDAS',    'FLAVOR_JFD_REFORM_ECONOMIC',       5),
        ('LEADER_LEONIDAS',    'FLAVOR_JFD_REFORM_FOREIGN',        7),
        ('LEADER_LEONIDAS',    'FLAVOR_JFD_REFORM_INDUSTRY',       4),
        ('LEADER_LEONIDAS',    'FLAVOR_JFD_REFORM_MILITARY',       7),
        ('LEADER_LEONIDAS',    'FLAVOR_JFD_REFORM_RELIGION',       4);
