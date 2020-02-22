template = ShipTemplate():setName("Pirate Destroyer"):setClass("Escort", "Destroyer"):setModel("battleship_destroyer_4_upgraded")
template:setDescription([[This ship appears to be based on the Cobra Class destroyer. Its armament has been heavily altered from the standard pattern.]])
template:setRadarTrace("radar_cobra.png")
template:setHull(150)
template:setShields(30)
template:setSpeed(35, 5, 5)
--                  Arc, Dir, Range, CycleTime, Dmg
template:setBeam(0, 270, 0, 2000.0, 20.0, 30)
-- Two weapons batteries
template:setTubes(2, 20.0)
-- Battery 1: Twin-linked torpedo launcher
template:weaponTubeDisallowMissle(0, "HVLI")
template:setTubeBatterySize(0, 2)
template:setTubeSalvoSpread(0, 5)
template:setTubeLoadTime(0, 100.0)
-- Battery 2: Quad-linked macrocannon
template:weaponTubeDisallowMissle(1, "Homing")
template:setTubeBatterySize(1, 4)
template:setTubeSalvoSpread(1, 5)
template:setTubeTurretArc(1, 270)
template:setTubeTurretRotationSpeed(1, 0.6)
-- Small stock of torpedos, much larger of macrocannon shells
template:setWeaponStorage("Homing", 3)
template:setWeaponStorage("HVLI", 100)



variation = template:copy("Militia Destroyer"):setType("playership")
variation:setDescription([[This ship appears to be based on the Cobra Class destroyer. Its armament has been heavily altered from the standard pattern]])
variation:addRoomSystem(1, 0, 2, 1, "Maneuver");
variation:addRoomSystem(1, 1, 2, 1, "BeamWeapons");
variation:addRoom(2, 2, 2, 1);

variation:addRoomSystem(0, 3, 1, 2, "RearShield");
variation:addRoomSystem(1, 3, 2, 2, "Reactor");
variation:addRoomSystem(3, 3, 2, 2, "Warp");
variation:addRoomSystem(5, 3, 1, 2, "JumpDrive");
variation:addRoom(6, 3, 2, 1);
variation:addRoom(6, 4, 2, 1);
variation:addRoomSystem(8, 3, 1, 2, "FrontShield");

variation:addRoom(2, 5, 2, 1);
variation:addRoomSystem(1, 6, 2, 1, "MissileSystem");
variation:addRoomSystem(1, 7, 2, 1, "Impulse");

variation:addDoor(1, 1, true);
variation:addDoor(2, 2, true);
variation:addDoor(3, 3, true);
variation:addDoor(1, 3, false);
variation:addDoor(3, 4, false);
variation:addDoor(3, 5, true);
variation:addDoor(2, 6, true);
variation:addDoor(1, 7, true);
variation:addDoor(5, 3, false);
variation:addDoor(6, 3, false);
variation:addDoor(6, 4, false);
variation:addDoor(8, 3, false);
variation:addDoor(8, 4, false);

template = ShipTemplate():setName("Unknown Destroyer"):setClass("Escort", "Destroyer"):setModel("battleship_destroyer_4_upgraded")
template:setDescription([[The sensor readings this ship gives off are unlike anything the auspex has ever seen.]])
template:setRadarTrace("radar_cobra_ghost.png")
template:setHull(200)
template:setSpeed(40, 6, 5)
--                  Arc, Dir, Range, CycleTime, Dmg
-- Two weapons batteries
template:setTubes(2, 15.0)
-- Battery 1: Twin-linked torpedo launcher
template:weaponTubeDisallowMissle(0, "HVLI")
template:setTubeBatterySize(0, 2)
template:setTubeSalvoSpread(0, 5)
-- Battery 2: Quad-linked macrocannon
template:weaponTubeDisallowMissle(1, "Homing")
template:setTubeBatterySize(1, 4)
template:setTubeSalvoSpread(1, 5)
template:setWeaponStorage("Homing", 1)
template:setWeaponStorage("HVLI", 100)



variation = template:copy("Unknown Destroyer"):setType("playership")
variation:setDescription([[The sensor readings this ship gives off are unlike anything the auspex has ever seen.]])
variation:addRoomSystem(1, 0, 2, 1, "Maneuver");
variation:addRoomSystem(1, 1, 2, 1, "BeamWeapons");
variation:addRoom(2, 2, 2, 1);

variation:addRoomSystem(0, 3, 1, 2, "RearShield");
variation:addRoomSystem(1, 3, 2, 2, "Reactor");
variation:addRoomSystem(3, 3, 2, 2, "Warp");
variation:addRoomSystem(5, 3, 1, 2, "JumpDrive");
variation:addRoom(6, 3, 2, 1);
variation:addRoom(6, 4, 2, 1);
variation:addRoomSystem(8, 3, 1, 2, "FrontShield");

variation:addRoom(2, 5, 2, 1);
variation:addRoomSystem(1, 6, 2, 1, "MissileSystem");
variation:addRoomSystem(1, 7, 2, 1, "Impulse");

variation:addDoor(1, 1, true);
variation:addDoor(2, 2, true);
variation:addDoor(3, 3, true);
variation:addDoor(1, 3, false);
variation:addDoor(3, 4, false);
variation:addDoor(3, 5, true);
variation:addDoor(2, 6, true);
variation:addDoor(1, 7, true);
variation:addDoor(5, 3, false);
variation:addDoor(6, 3, false);
variation:addDoor(6, 4, false);
variation:addDoor(8, 3, false);
variation:addDoor(8, 4, false);

template = ShipTemplate():setName("Torpedo Ship"):setClass("Escort", "Destroyer"):setModel("battleship_destroyer_4_upgraded")
template:setDescription([[This ship appears to be based on the Cobra Class destroyer. Its armament has been heavily altered from the standard pattern.]])
template:setRadarTrace("radar_cobra.png")
template:setHull(150)
template:setShields(30)
template:setSpeed(35, 5, 5)

-- One tube only
template:setTubes(1, 20.0)
-- Battery 1: Twin-linked torpedo launcher
template:weaponTubeDisallowMissle(0, "HVLI")
template:setTubeBatterySize(0, 1)
template:setTubeLoadTime(0, 20.0)
-- Small stock of torpedos, much larger of macrocannon shells
template:setWeaponStorage("Homing", 3)