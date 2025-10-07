SET @ENTRY:=200004;
SET @GUID:=4000004;

DELETE FROM `creature_template` WHERE `entry`=@ENTRY;

INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(@ENTRY, 0, 0, 0, 0, 0, 18718, 0, 0, 0, "Oscar Isidro Parrilli", "Profesiones 450", NULL, 0, 83, 83, 2, 35, 1, 1, 1, 1, 3, 0, 35, 2000, 2000, 1, 1, 1, 768, 2048, 0, 0, 0, 0, 0, 0, 6, 36, 0, 0, 0, 0, 0, 0, 0, "", 0, 3, 1, 2000, 1, 1, 0, 0, 1, 0, 0, 2, "", 12340);

DELETE FROM `creature` WHERE `id`=@ENTRY;

INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `ScriptName`, `VerifiedBuild`) VALUES
(@GUID, @ENTRY, 571, 0, 0, 1, 1, 0, 0, 5787.18, 450.444, 658.782, 6.21808, 300, 0, 27890000, 0, 0, 0, 0, 0, "", 0);
