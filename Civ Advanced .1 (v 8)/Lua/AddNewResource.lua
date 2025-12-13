-- Resource Generator V4.0
-- Author: Deep_Blue
--------------------------------------------------------------
include( "SaveUtils" ); MY_MOD_NAME = "5HA9_0P12_XVIU_RESOURCE_GENERATOR_BY_DEEP_BLUE";

include("ResGenerator.lua");

local ResG02_savedData = Modding.OpenSaveData();

if (ResG02_savedData.GetValue("Resources_Generation_Completed") ~= nil) then
	if (ResG02_savedData.GetValue("Resources_Generation_Completed") == 1) then
		print("Resource Generator Aborted: Previous Save exists... ")
		return;
	end
else
	print("Resource Generator loading... ")
end
--======================================================================================
-- Put the tpye of your resource here, Example: 

OnMapResourceGenerator("RESOURCE_RICE" , {"FEATURE_FOREST", "FEATURE_JUNGLE"} );
OnMapResourceGenerator("RESOURCE_MAIZE", {"FEATURE_FOREST", "FEATURE_JUNGLE"} );
OnMapResourceGenerator("RESOURCE_COFFEE");
OnMapResourceGenerator("RESOURCE_TOBACCO");
OnMapResourceGenerator("RESOURCE_TEA");
OnMapResourceGenerator("RESOURCE_COCOA");
--OnMapResourceGenerator("RESOURCE_SILICA");
OnMapResourceGenerator("RESOURCE_OLIVE");
OnMapResourceGenerator("RESOURCE_PEACH");
OnMapResourceGenerator("RESOURCE_APPLE");
OnMapResourceGenerator("RESOURCE_CLAY" , {"FEATURE_FOREST"} );

-- this function will automatically spread the resource on the map according to:
-- 1) map size
-- 2) number of civilizations in the game
-- 3) Pre-game resource options (sparse,standard,..)
-- 4) defined terrain&feature Booleans in resource xml file.
-- You can add as many resources as you want, example:
-- OnMapResourceGenerator("RESOURCE_MyResource1");
-- OnMapResourceGenerator("RESOURCE_MyResource2");
-- etc..

--[[ 

Advanced Options: 
----------------
you can use additional option with the function:

OnMapResourceGenerator("RESOURCE_MyResource" , Excludes )

Excludes is a table containing any Terrain or feature you do not want, put them in any order but 
they must have exact Type string in Civ5Terrains.xml and Civ5Features.xml otherwise they will be igonred.

Example:

OnMapResourceGenerator("RESOURCE_COPPER" , {"TERRAIN_DESERT", "TERRAIN_PLAINS"} )

--]]
 
--======================================================================================

ResG02_savedData.SetValue("Resources_Generation_Completed", 1);