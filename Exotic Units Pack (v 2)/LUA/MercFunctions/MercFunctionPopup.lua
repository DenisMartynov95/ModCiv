-- MercFunctionPopup.lua
-- Author: sman
-- DateCreated: 12/12/17 9:24:56 AM
--------------------------------------------------------------
print("Loading MercFunctionPopup")

-- ============================================================================================
--   Includes
include("IconSupport")
include("MercFunctionGlobals.lua")

-- ============================================================================================
--   Globals
local iMercIndex = 0
local tMercs = {}

-- ============================================================================================
--   Callbacks

function OnRehire()																			-- Processing Rehire request code
	ContextPtr:SetHide(true)																-- Show popup
	RehireUnit()																			-- Call gold decrementing function 
	cycleNextMercUnit()																		-- Iterated to next mercenary unit
end
Controls.Rehire:RegisterCallback(Mouse.eLClick, OnRehire)									-- Activate the callback

function OnDisband()																		-- Processing Disband request code
	ContextPtr:SetHide(true)																-- Show popup
	DisbandUnit()																			-- Call unit disband function
	cycleNextMercUnit()																		-- Iterated to next mercenary unit
end
Controls.Disband:RegisterCallback(Mouse.eLClick, OnDisband)									-- Activate the callback

IconHookup(2, 80, "EXPANSION_TECH_ATLAS_1", Controls.DialogTopIcon)							-- Point nice 'gold coin' icon at top of popup
ContextPtr:SetHide(true)																	-- Initially hide popup window

-- ============================================================================================
--   Support Functions
function SendNotification(iKey, pUnit)																-- Builds notification for the right side of the screen
	--local pUnit = Players[Game.GetActivePlayer()]:GetUnitByID(tMercs[iMercIndex])			-- iKey parameter determines which notification displays
	local unitName = pUnit:GetNameNoDesc() or pUnit:GetName()								-- Try nickname first, then unit type description
	local x = pUnit:GetX() or -1															-- unitName, x, and y are needed by the notification routine
	local y = pUnit:GetY() or -1															
	
	--if not unitName then
	--	unitName = pUnit:GetName()
	--end
	if iKey == 1 then																		-- Rehire Unit
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes.NOTIFICATION_GREAT_PERSON_ACTIVE_PLAYER, 
			"'" .. unitName .. "' Mercenaries rehired for another contract.", 
			"'" .. unitName .. "' Mercenaries rehired.", x, y, pUnit:GetUnitType(), -1)
	elseif iKey == 2 then																	-- Disband Unit	
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes.NOTIFICATION_UNIT_DIED, 
			"'" .. unitName .. "' Mercenaries disbanded.", 
			"'" .. unitName .. "' Mercenaries disbanded.", x, y, pUnit:GetUnitType(), -1)
	elseif iKey == 3 then																	-- Upcoming contract expiration
		local remainingTurns = g_Contract_Duration - g_Contract_Prompt																		
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes.NOTIFICATION_GREAT_PERSON_ACTIVE_PLAYER, 
			"'" .. unitName .. "' Mercenary contract will expire in " .. remainingTurns .. " turns!", 
			"'" .. unitName .. "' Mercenary contract will expire in " .. remainingTurns .. " turns!", x, y, pUnit:GetUnitType(), -1)
	elseif iKey == 4 then																	-- Unit	has deserted!
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes.NOTIFICATION_UNIT_DIED, 
			"'" .. unitName .. "' Mercenaries took your Gold then deserted!", 
			"'" .. unitName .. "' Mercenaries deserted!", x, y, pUnit:GetUnitType(), -1)
	elseif iKey == 5 then																	-- Unit has rebelled!
		local remainingTurns = g_Contract_Duration - g_Contract_Prompt																		
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes.NOTIFICATION_REBELS, 
			"'" .. unitName .. "' Mercenaries have raised mutiny in your lands!", 
			"'" .. unitName .. "' Mercenaries have mutinied!", x, y, pUnit:GetUnitType(), -1)
	end
end

function RehireUnit()																		-- Rehire function. Can only reach here if sufficient funds on hand for this unit.
	local pPlayer = Players[Game.GetActivePlayer()]											-- Need Player instance so we can get/decrement right treasury
	local pUnit = pPlayer:GetUnitByID(tMercs[iMercIndex])
	local goldNeeded = math.floor((pPlayer:GetCapitalCity():GetUnitPurchaseCost(pUnit:GetUnitType()) / g_ContractLengthDenominator) * g_ContractMarkUp)
	--print("Rehiring Unit " .. pUnit:GetName())
	SendNotification(1, pUnit)																-- Sends the "Rehiring Unit" message on right side of screen	
	pPlayer:ChangeGold (goldNeeded * -1)													-- Decrement gold from treasury
end

function DisbandUnit()																		-- Disband function. We reach here automatically if sufficient funds on hand for this unit
	local pPlayer = Players[Game.GetActivePlayer()]											-- or when the player presses the 'Disband' button on the popup.
	local pUnit = pPlayer:GetUnitByID(tMercs[iMercIndex])
	--print("Disbanding Unit " .. pUnit:GetName())
	SendNotification(2, pUnit)																-- Sends the "Disband Unit" message on right side of screen
	pUnit:Kill()																			-- Delete unit
end

function RefreshMercFunPopup()																-- Builds text for popup. Returns -1 if insufficient funds to renew. Returns 0 Otherwise
	local pPlayer = Players[Game.GetActivePlayer()]
	local pUnit = pPlayer:GetUnitByID(tMercs[iMercIndex])
	local goldOnHand = pPlayer:GetGold()				
	local unitType = Locale.ConvertTextKey(GameInfo.Units[pUnit:GetUnitType()].Description)	
	local unitNickname = pUnit:GetNameNoDesc() or "Mercenaries"
	local displayName = "'" .. unitNickname .. "'  (" .. unitType .. ")"
	local unitPlot = pUnit:GetPlot()
	local mercPrompt = "Rehire these Mercenaries or let them disband?"
	-- Here is where we determine the contract renewal cost:  normal gold purchase / contract denominator, then marked up 
	local goldNeeded = math.floor((pPlayer:GetCapitalCity():GetUnitPurchaseCost(pUnit:GetUnitType()) / g_ContractLengthDenominator) * g_ContractMarkUp)						
		
	IconHookup(GameInfo.Units[pUnit:GetUnitType()].PortraitIndex, 80, "SMAN_EXOTIC_UNIT_ATLAS", Controls.DialogTopIcon)	-- Put the merc unit's icon at top of popup	
	Controls.Rehire:SetDisabled(false)
	Controls.Message2:LocalizeAndSetText("TXT_KEY_MERC_FUN_MESSAGE_2", displayName)			-- Update data appearing on popup
	Controls.Message3:LocalizeAndSetText("TXT_KEY_MERC_FUN_MESSAGE_3", goldNeeded)
	Controls.Message4:LocalizeAndSetText("TXT_KEY_MERC_FUN_MESSAGE_4", goldOnHand)	
			
	if goldNeeded > goldOnHand then
		mercPrompt = "Not enough [ICON_GOLD] Gold! These Mercenaries must disband!"
		Controls.Rehire:SetDisabled(true)													-- Disable the 'Rehire' button
	end
	Controls.Message5:LocalizeAndSetText("TXT_KEY_MERC_FUN_MESSAGE_5", mercPrompt)

	if (pUnit ~= nil) then																	-- Move camera to where the unit is located
		UI.LookAt(unitPlot)
		if (unitPlot ~= nil) then
			UI.SelectUnit(pUnit)
		end
	end
end 

function BuildMercTable(pPlayer)															-- Populates the tMercs table, and initiates processing each element (merc unit) for this player.
	local gameTurn = Game.GetGameTurn()		
	for i, v in ipairs(tMercs) do tMercs[i] = nil end										-- Start each process with an empty tMercs table

	for pUnit in pPlayer:Units() do															-- Cycle through all player[0]'s units
		if GameInfo.Units[pUnit:GetUnitType()].IsMercUnit == 1 then							-- Element 'IsMercUnit' added to Units table, default=0. Equals 1 for Merc units
			local unitCreationTurn = pUnit:GetGameTurnCreated()
			local unitLifeSpan = gameTurn - unitCreationTurn
			local contractAge = unitLifeSpan % g_Contract_Duration
			
			if contractAge == 0 then														-- If contractAge == 0, add this unit to tMercs table (contract is 20 turns old, or whatever value of g_Contract_Duration is)
				tMercs[#tMercs + 1] = pUnit:GetID()											-- Unit is a Mercenary, add to tMerc table for later processing
				print ("Unit " .. pUnit:GetName() .. " added to tMercs table...")
			elseif contractAge == g_Contract_Prompt then									-- If we're at 75% of contract max (20 or 'g_Contract_Duration' turns) then send a reminder notification
				SendNotification(3, pUnit)													-- Sends the "Contract Expiring" message on right side of screen
			end
		end
	end
	
	if #tMercs>0 then																		-- If table has 1 or more elements, then there are units whose contract is expiring this turn						
		iMercIndex = 1																		-- Start at the beginning of the merc table						
		RefreshMercFunPopup()																-- Update popup contents
		ContextPtr:SetHide(false);															-- Show Merc popup window to ask if player wants to rehire or disband
	end
end

function cycleNextMercUnit()																-- This loop processes the next tMerc table element
	if iMercIndex >= #tMercs then return end												-- If we are at the last unit (or beyond), we don't need to process any more units; exit now
	iMercIndex = iMercIndex + 1																-- Increment tMerc table index - next unexamined merc unit
	RefreshMercFunPopup()									
	ContextPtr:SetHide(false); 
end

function processAIMercs (pPlayer)															-- Function removes old/creates new merc units for AI
	local gameTurn = Game.GetGameTurn()															
	-- ======================================================================================= 
	-- Remove excess merc units for AI

	for pUnit in pPlayer:Units() do															-- Cycle through all pPlayer's units
		if GameInfo.Units[pUnit:GetUnitType()].IsMercUnit == 1 then							-- Element 'IsMercUnit' added to Units table, default=0. Equals 1 for Merc units
			local unitCreationTurn = pUnit:GetGameTurnCreated()								-- Need turn merc unit created to determine how old it is
			local unitLifeSpan = gameTurn - unitCreationTurn								-- unitLifeSpan is the unit age in turns
						
			if unitLifeSpan > 15 then														-- If life span is > 14 turns, then there is a growing chance to disband 
				local chanceKill = 5 + (unitLifeSpan * 2)									-- By the time unit reaches 48 turns in age, chance to delete should be ~100%
				if math.random(1, 100) < chanceKill then
					--print ("--> AI player " .. pPlayer:GetName()  .. " - Unit " .. pUnit:GetName() .. " deserted.  LifeSpan: " .. unitLifeSpan)
					pUnit:Kill()															-- Remove the merc unit from the game
				end
			end
		end
	end

	-- ======================================================================================= 
	-- Award new merc units for non-Barb AI. Since AI won't purchase units, we'll have to "award" them periodically...   g_AIMercSpawnChance

	if pPlayer:IsBarbarian() then return end												-- Barb AI will create merc units without help, based on override settings
	if math.random(1, 100) < g_AIMercSpawnChance then										-- Spawns a merc unit at the AI's current tech level; just 1 test (unit) / turn
		local tMercUnits = {}																-- table holds IDs of legally buildable merc units for pPlayer

		for unit_idx in GameInfo.Units() do													-- Cycle through all unit types, looking for merc units
			if unit_idx.IsMercUnit ~= 1 then 												-- unit_idx is not merc, move to next unit
				--print("--> is NOT a merc unit")
			elseif pPlayer:CanTrain(unit_idx.ID, true, true, true, false) then				-- Is the unit trainable by this civ?  Checks against overrides, prereq tech, etc.
					--print("-->  AI player " .. pPlayer:GetName()  .. " CAN train unit " .. unit_idx.ID)		-- If trainable, add to tMercUnits table - for later possible spawning
					tMercUnits[#tMercUnits + 1] = unit_idx.ID								-- Add this unit type to the tMercUnits table
			end
		end

		if #tMercUnits>0 then																-- If table has 1 or more elements, then there are units whose contract is expiring this turn						
			local spawnCity																	-- Initialize as nil. If no good spawn city is found, exit early; no merc unit spawned
			local spawnedMercID = math.random(1, #tMercUnits) or 1							-- Pick one of the units in the table, or default to the first unit in the table

			if GameInfo.Units[tMercUnits[spawnedMercID]].Domain == "DOMAIN_SEA" then		-- Sea merc units can only spawn in coastal cities
				for pCity in pPlayer:Cities() do											-- Cycle through all pPlayer's cities
					if pCity:IsCoastal() then												-- If city is coastal, set it to spawnCity, stop looking
						spawnCity = pCity	
						break																-- If a coastal city is found, break out of the for loop early
					end
				end
			else																			-- All other domains (land/air/hover) units spawn in capital
				spawnCity = pPlayer:GetCapitalCity()
			end
			if not spawnCity then	-- No capital means no city to spawn mercs (complete kills set on?). Could also mean player has no coastal cities for ships. No merc unit spawn
				print("No capital and/or coastal cities to spawn unit " .. tMercUnits[spawnedMercID] .. ".  Exiting early, no AI merc unit spawned")
				return 
			end																																	

			local plotX = spawnCity:GetX()													-- Get spawn city X
			local plotY = spawnCity:GetY()													-- Get spawn city Y
			local pUnit = pPlayer:InitUnit(tMercUnits[spawnedMercID], plotX, plotY)			-- Spawn the unit at the correct plot
			--print("--> Spawning AI Merc unit for player " .. pPlayer:GetName() .. " at (X/Y): " .. plotX .. " / " .. plotY .. "    Unit: " .. pUnit:GetName())
			pUnit:SetDamage(0)																-- New units fully healed
			pUnit:JumpToNearestValidPlot()													-- Final placement of the unit is the nearest "legal" tile to the city
		end
	end
end

function processMercEvents(pPlayer)	
	if g_MercsCanDesert == ON then
		local desertChance = g_MercDesertChance
		-- Placeholder to add adjustments to desertChance based on gold income/deficits
		if desertChance > g_MercEventMaxChance then desertChance = g_MercEventMaxChance end	-- Set upper boundary of desertion chance
		for pUnit in pPlayer:Units() do														-- Cycle through all the human player's units
			if GameInfo.Units[pUnit:GetUnitType()].IsMercUnit == 1 then						-- If 'IsMercUnit' == 1, then this is a merc unit				
				if math.random(1, 100) < desertChance then									-- Is the random 1-100 number below desert threshold?
					SendNotification(4, pUnit)												-- Desert notification
					pUnit:Kill()															-- Delete unit
				end
			end
		end
	end

	if g_MercsCanRebel == ON then
		local rebelChance = g_MercRebelChance
		-- Placeholder to add adjustments to rebelChance based on global happiness/unhappiness
		if rebelChance > g_MercEventMaxChance then rebelChance = g_MercEventMaxChance end	-- Set upper boundary of rebellion chance
		for pUnit in pPlayer:Units() do														-- Cycle through all the human player's units
			if GameInfo.Units[pUnit:GetUnitType()].IsMercUnit == 1 then						-- If 'IsMercUnit' == 1, then this is a merc unit
				if math.random(1, 100) < rebelChance then									-- Is the random 1-100 number below rebel threshold?
					SendNotification(5, pUnit)												-- Rebel notification
					local pUnitID = pUnit:GetUnitType()										-- Determine unit type of the rebelling unit
					local unitX = pUnit:GetX()												-- Rebelling unit X
					local unitY = pUnit:GetY()												-- Rebelling unit Y
					local oldUnitName = pUnit:GetNameNoDesc()								-- Get unit's current name
					pUnit:Kill(63)															-- Remove friendly version of unit
					local barbarianUnit = Players[63]:InitUnit(pUnitID, unitX, unitY)		-- Create Barb version of unit
					barbarianUnit:SetName(oldUnitName)										-- Give new Barb unit old unit's name
				end
			end
		end		
	end
end

function setContractParameters()															-- Function determines contract price, by adjusting the global ContLenDenominator
	local GameSpeed = Game.GetGameSpeedType() or 2											-- Set to Standard if function fails for some reason
	local GameStartEra = Game.GetStartEra() or 0											-- Set to Ancient if function fails for some reason
	local GameWorldSize = Map.GetWorldSize() or 3											-- Set to Standard if function fails for some reason
		
	local UnitLifeCycle = ((60 * (GameInfo.GameSpeeds[GameSpeed].ResearchPercent/100)) * (GameInfo.Worlds[GameWorldSize].ResearchPercent/100)) * 
								(GameInfo.Eras[GameStartEra].ResearchPercent/100)
	
	if UnitLifeCycle < 20 then UnitLifeCycle = 20 end										-- Life cycle is entire competitive life span of unit.
	g_ContractLengthDenominator = math.floor(UnitLifeCycle / 20)							-- Figure out how many 20 turn blocks are inside that life cycle;	
	if g_ContractLengthDenominator < 1 then g_ContractLengthDenominator = 1 end				--   will use that denominator to divide the purchase cost into the contract cost
	print("DENOMINATOR: " .. g_ContractLengthDenominator)
end

-- ============================================================================================
--   Main Function
function MercenaryProcessing (playerID)
	local pPlayer = Players[playerID]
	local gameTurn = Game.GetGameTurn()			
	
	if not pPlayer:IsAlive() then return end												-- Don't process eliminated players

	if pPlayer:IsHuman() then																-- Process for mercs is different for human player than AI
		--processMercEvents(pPlayer)															-- Determine if mercs can disband or revolt
		--BuildMercTable(pPlayer)				
	else																					-- AI merc processing
		processAIMercs (pPlayer)
	end	
end
GameEvents.PlayerDoTurn.Add( MercenaryProcessing )

function OnGameInit ()
	g_GameStartTurn = Game.GetGameTurn()													-- Determine first game turn for later processing
	setContractParameters()
	
	--g_Contract_Duration = 6				-- FOR TESTING - remove from final version!!!
	--g_Contract_Prompt = 4

end
Events.SequenceGameInitComplete.Add( OnGameInit )
