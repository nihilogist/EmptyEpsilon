template = ShipTemplate():setName("Pirate Destroyer"):setClass("Escort", "Destroyer"):setModel("battleship_destroyer_4_upgraded")
template:setDescription([[This ship appears to be based on the Cobra Class destroyer. Its armament has been heavily altered from the standard pattern.]])
template:setRadarTrace("radar_cobra.png")
template:setHull(200)
template:setShields(100)
template:setSpeed(40, 6, 5)
--                  Arc, Dir, Range, CycleTime, Dmg
template:setBeam(0, 270, 0, 2000.0, 10.0, 11)
template:setTubes(1, 15.0)
template:setTubeSalvoSpread(0, 2)
template:setWeaponStorage("Homing", 3)



variation = template:copy("Pirate Destroyer"):setType("playership")
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
template:setBeam(0, 270, 0, 2000.0, 10.0, 11)



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

template = ShipTemplate():setName("Wrecked Destroyer"):setClass("Escort", "Destroyer"):setModel("battleship_destroyer_4_upgraded")
template:setDescription([[The wreck of a once-proud Cobra Destroyer, now darkened forever in the void of the Wake.]])
template:setRadarTrace("radar_cobra.png")
template:setHull(50)
template:setSpeed(0, 0, 0)