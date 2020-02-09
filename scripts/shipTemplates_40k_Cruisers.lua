--[[                  Cruisers
Corvettes are the common large ships. Larger then a frigate, smaller then a dreadnaught.
They generally have 4 or more shield sections. Run with a crew of 20 to 250.
This class generally has jumpdrives or warpdrives. But lack the maneuverability that is seen in frigates.

They come in 3 different subclasses:
* Destroyer: Combat oriented ships. No science, no transport. Just death in a large package.
* Support: Large scale support roles. Drone carriers fall in this category. As well as mobile repair centers.
* Freighter: Large scale transport ships. Most common here are the jump freighters, using specialized jumpdrives to cross large distances with large amounts of cargo.
----------------------------------------------------------]]

--[[----------------------Destroyers----------------------]]

template = ShipTemplate():setName("Dauntless"):setClass("Cruiser", "Light Cruiser"):setModel("battleship_destroyer_1_upgraded")
template:setDescription([[This ship was built to address the desperate need for carriers in Battle fleet Gothic, and the Dauntless served its role as a cruiser/light carrier hybrid admirably well.]])
template:setRadarTrace("radar_dauntless.png")
template:setHull(750)
template:setShields(200, 200, 200, 200)
template:setSpeed(30, 3.5, 5)
--                  Arc, Dir, Range, CycleTime, Dmg
template:setBeam(0, 90, 0, 5000.0, 20.0, 30)
template:setTubes(2, 10.0)
template:setWeaponStorage("HVLI", 20)
template:setWeaponStorage("Homing", 4)
template:setTubeDirection(0, -90)
template:setTubeDirection(1, 90)
template:weaponTubeDisallowMissle(0, "Homing"):weaponTubeDisallowMissle(1, "Homing")
template:setTubeSalvoSpread(0, 5)
template:setTubeSalvoSpread(1, 5)
template:setTubeBatterySize(0, 12)
template:setTubeBatterySize(1, 12)
template:setTubeTurretArc(0, 90)
template:setTubeTurretArc(1, 90)
template:setTubeTurretRotationSpeed(0, 0.3)
template:setTubeTurretRotationSpeed(1, 0.3)
template:setDockClasses("Starfighter")

variation = template:copy("Regency Pattern Dauntless"):setType("playership")
variation:setDescription([[This ship dates from the Regency era in the Prosperitas sector. It appears to differ slightly from the standard Mars-template Dauntless light cruiser.]])
variation:setShields(200, 200)
variation:setHull(1000)
variation:setSpeed(30, 5, 15)
variation:setWeaponStorage("Homing", 12)
variation:setWeaponStorage("HVLI", 100)
variation:setTubes(3, 10.0) -- 3 weapons tubes
-- Tubes 1 and 2 are 12 shot macrocannon batteries with 90 degree arcs
variation:weaponTubeDisallowMissle(0, "Homing"):weaponTubeDisallowMissle(1, "Homing")
variation:setTubeIsTurreted(0, true):setTubeIsTurreted(1, true)
variation:setTubeTurretArc(0, 90):setTubeTurretArc(1, 90)
-- Tube 3 is a quin-linked torpedo launcher
variation:setTubeIsTurreted(2, false)
variation:setTubeDirection(2, 0)
variation:setTubeSalvoSpread(2, 4)
variation:setTubeBatterySize(2, 5)
variation:weaponTubeDisallowMissle(2, "HVLI")
-- We also set a small amount of armour on the ship
variation:setArmour(4.0)

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
 
--Airlock doors
--variation:addDoor(2, 2, false);
--variation:addDoor(2, 5, false);





--[[----------------------Freighters----------------------]]

