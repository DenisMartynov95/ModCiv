-- =======================================================================================================
--		Predator Drone Art Defines
-- =======================================================================================================

-- Unit Art Defines
INSERT INTO ArtDefine_UnitInfos (Type, DamageStates, Formation) VALUES ('ART_DEF_UNIT_EXOTIC_UNIT_REAPER_DRONE', 1, "FighterWing");
INSERT INTO ArtDefine_UnitInfoMemberInfos VALUES ('ART_DEF_UNIT_EXOTIC_UNIT_REAPER_DRONE', 'ART_DEF_UNIT_MEMBER_EXOTIC_UNIT_REAPER_DRONE', 1);
INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType, Asset) VALUES ('ART_DEF_UNIT_EXOTIC_UNIT_REAPER_DRONE', 'Unit', 'SV_Longswordsman.dds');

-- Unit Member Art Defines

INSERT INTO ArtDefine_UnitMemberInfos (Type, Scale, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
	VALUES ('ART_DEF_UNIT_MEMBER_EXOTIC_UNIT_REAPER_DRONE', 0.16, "Air", 'SMAN_EU_Reaper.fxsxml', "METAL", "METALLRG");


INSERT INTO ArtDefine_UnitMemberCombats (UnitMemberType, EnableActions, AttackRadius, MoveRate, TurnRateMin, TurnRateMax, HasRefaceAfterCombat)
	VALUES ('ART_DEF_UNIT_MEMBER_EXOTIC_UNIT_REAPER_DRONE', "Idle Attack Bombard Death Run", 135.0, 2.0, 0.25, 0.5, 0);


INSERT INTO ArtDefine_UnitMemberCombatWeapons (UnitMemberType, "Index", SubIndex, ProjectileSpeed, HitEffect, HitRadius, WeaponTypeTag, WeaponTypeSoundOverrideTag)
	VALUES ('ART_DEF_UNIT_MEMBER_EXOTIC_UNIT_REAPER_DRONE', 0, 0, 3.0, 'ART_DEF_VEFFECT_FIGHTER_MACHINE_GUN_HIT_$(TERRAIN)', 15.0, "BULLETHC", "BULLETHC");
INSERT INTO ArtDefine_UnitMemberCombatWeapons (UnitMemberType, "Index", SubIndex, VisKillStrengthMin, VisKillStrengthMax, HitEffect, HitRadius, WeaponTypeTag, WeaponTypeSoundOverrideTag)
	VALUES ('ART_DEF_UNIT_MEMBER_EXOTIC_UNIT_REAPER_DRONE', 1, 0, 1.0, 1.0, 'ART_DEF_VEFFECT_FIGHTER_MACHINE_GUN_HIT_$(TERRAIN)', 15.0, "BULLETHC", "BULLETHC");
INSERT INTO ArtDefine_UnitMemberCombatWeapons (UnitMemberType, "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, WeaponTypeTag, WeaponTypeSoundOverrideTag)
	VALUES ('ART_DEF_UNIT_MEMBER_EXOTIC_UNIT_REAPER_DRONE', 1, 1, 'PROJECTILE', 25.0, 50.0, 3.0, 'EXPLOSIVE', 'EXPLOSION200POUND');



-- =======================================================================================================
--		Complete Member Definitions: use when an analogous unit exists in the database
-- ======================================================================================================
--INSERT INTO ArtDefine_UnitMemberCombats (UnitMemberType, EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
--	SELECT	('ART_DEF_UNIT_MEMBER_EXOTIC_UNIT_REAPER_DRONE'), EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
--	FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_SWORDSMAN');


--INSERT INTO ArtDefine_UnitMemberCombatWeapons (UnitMemberType, "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
--	SELECT ('ART_DEF_UNIT_MEMBER_EXOTIC_UNIT_REAPER_DRONE'), "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
--	FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_SWORDSMAN');


--INSERT INTO ArtDefine_UnitMemberInfos (Type, Scale, ZOffset, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
--	SELECT	('ART_DEF_UNIT_MEMBER_EXOTIC_UNIT_REAPER_DRONE'), Scale, ZOffset, Domain, ('Swordsman_Arabia_v3.fxsxml'), MaterialTypeTag, MaterialTypeSoundOverrideTag
--	FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_SWORDSMAN');
