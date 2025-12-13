-- MercFunctionGlobals.lua
-- Author: sman
-- DateCreated: 12/12/17 5:09:13 PM
--------------------------------------------------------------
ON = 1
OFF = 0


g_MercsCanDesert = OFF					-- Change to "ON" to allow hired merc units to desert (unplanned disband)
g_MercsCanRebel = OFF					-- Change to "ON" to allow hired merc units to rebel (join Barbarian civ)

g_MercDesertChance = 2					-- Basic chance to desert, if ON
g_MercRebelChance = 2					-- Basic chance to rebel, if ON
g_MercEventMaxChance = 5				-- Max chance of either desertion or rebellion, if ON


g_Contract_Duration = 20				-- Duration is always 20 turns. Mod uses denominator to figure out what the cost will be based on game speed/map size/start era
g_Contract_Prompt = 15
g_ContractLengthDenominator = 4			-- To be used with unit purchase at captical:   cost = city:GetUnitPurchaseCost( unitID ) 
g_ContractMarkUp = 1.25					-- Mark up to be applied to contract puchase price

g_AIMercSpawnChance = 4					-- xx% chance the AI player can spawn a Merc unit, appropriate for its current or previous Era