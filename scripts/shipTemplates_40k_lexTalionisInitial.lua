template = ShipTemplate():setName("LexTalionisInitial"):setClass("Cruiser", "Light Cruiser"):setModel("dauntlessLightCruiser"):setType("playership")
template:setDescription([[This ship dates from the Regency era in the Prosperitas sector. It appears to differ slightly from the standard Mars-template Dauntless light cruiser.]])
template:setRadarTrace("radar_dauntless.png")
template:setHull(1000)
template:setShields(200)
template:setSpeed(10, 3, 0.5)
--                  Arc, Dir, Range, CycleTime, Dmg
template:setBeam(0, 90, 0, 1000.0, 30.0, 60)

template:setWeaponStorage("HVLI", 500)

template:setTubes(1, 60.0) -- 3 weapons tubes
-- Tubes 1 and 2 are 12 shot macrocannon batteries with 90 degree arcs
template:setTubeDirection(0, -90)
template:setWeaponTubeExclusiveFor(0, "HVLI")
template:setTubeSalvoSpread(0, 5):setTubeBatterySize(0, 12)
template:setTubeIsTurreted(0, true)
template:setTubeTurretArc(0, 90)
template:setTubeTurretRotationSpeed(0, 0.1)
-- We also set a small amount of armour on the ship
template:setArmour(4.0)
template:setDockClasses("Starfighter")

template:addRoomSystem(1, 0, 2, 1, "Maneuver");
template:addRoomSystem(1, 1, 2, 1, "BeamWeapons");
template:addRoom(2, 2, 2, 1);

template:addRoomSystem(0, 3, 1, 2, "RearShield");
template:addRoomSystem(1, 3, 2, 2, "Reactor");
template:addRoomSystem(3, 3, 2, 2, "Warp");
template:addRoomSystem(5, 3, 1, 2, "JumpDrive");
template:addRoom(6, 3, 2, 1);
template:addRoom(6, 4, 2, 1);
template:addRoomSystem(8, 3, 1, 2, "FrontShield");

template:addRoom(2, 5, 2, 1);
template:addRoomSystem(1, 6, 2, 1, "MissileSystem");
template:addRoomSystem(1, 7, 2, 1, "Impulse");

template:addDoor(1, 1, true);
template:addDoor(2, 2, true);
template:addDoor(3, 3, true);
template:addDoor(1, 3, false);
template:addDoor(3, 4, false);
template:addDoor(3, 5, true);
template:addDoor(2, 6, true);
template:addDoor(1, 7, true);
template:addDoor(5, 3, false);
template:addDoor(6, 3, false);
template:addDoor(6, 4, false);
template:addDoor(8, 3, false);
template:addDoor(8, 4, false);