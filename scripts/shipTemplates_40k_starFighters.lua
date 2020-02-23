--[[               Starfighters
Starfighters are single to 3 person small ships. These are most commonly used as light firepower roles.
They are common in larger groups. And need a close by station or support ship, as they lack long time life support.
It's rare to see starfighters with more then 1 shield section.

One of the most well known starfighters at earth is the X-Wing.

Starfighters come in 3 subclasses:
* Interceptors: Fast, low on firepower, high on manouverability
* Gunship: Equiped with more weapons, but hands in maneuverbility because of it.
* Bomber: Slowest of all starfighters, but pack a large punch in a small package. Usually come without any lasers, but the largers bombers have been known to deliver nukes.
----------------------------------------------------------]]
template = ShipTemplate():setName("Fury Interceptor"):setClass("Starfighter", "Interceptor"):setModel("WespeScoutYellow")
template:setRadarTrace("radar_fury.png")
template:setDescription([[The Fury Interceptor is the most common type of starfighter used by the Imperial Navy.]])
template:setHull(30)
template:setShields(20)
template:setSpeed(120, 30, 25)
template:setDefaultAI('fighter')
--                  Arc, Dir, Range, CycleTime, Dmg
template:setBeam(0, 30, 0, 700.0, 4.0, 2)

variation = template:copy("Mars-Pattern Fury Interceptor"):setType("playership")
variation:setModel("WespeScoutRed")
variation:setDescription([[The Fury Interceptor is the most common type of starfighter used by the Imperial Navy.]])
variation:setHull(35)
variation:setShields(22)
variation:setSpeed(100, 35, 25)
--                  Arc, Dir, Range, CycleTime, Dmg
variation:setBeam(0, 1, 0, 1200.0, 1.0, 3)
variation:setBeamWeaponTurret(0, 30, 0, 0.3)
variation:setBeamWeaponTargetingDetails(0, 100, 50)
variation:setTubes(1, 5)
variation:setWeaponTubeExclusiveFor(0, "Seeker")
variation:setTubeDirection(0, 0)
variation:setWeaponStorage("Seeker", 6)

variation:setRepairCrewCount(1)
variation:addRoomSystem(3, 0, 1, 1, "Maneuver");
variation:addRoomSystem(1, 0, 2, 1, "BeamWeapons");

variation:addRoomSystem(0, 1, 1, 2, "RearShield");
variation:addRoomSystem(1, 1, 2, 2, "Reactor");
variation:addRoomSystem(3, 1, 2, 1, "Warp");
variation:addRoomSystem(3, 2, 2, 1, "JumpDrive");
variation:addRoomSystem(5, 1, 1, 2, "FrontShield");

variation:addRoomSystem(1, 3, 2, 1, "MissileSystem");
variation:addRoomSystem(3, 3, 1, 1, "Impulse");

variation:addDoor(2, 1, true);
variation:addDoor(3, 1, true);
variation:addDoor(1, 1, false);
variation:addDoor(3, 1, false);
variation:addDoor(3, 2, false);
variation:addDoor(3, 3, true);
variation:addDoor(2, 3, true);
variation:addDoor(5, 1, false);
variation:addDoor(5, 2, false);


template = ShipTemplate():setName("Starhawk Bomber"):setClass("Starfighter", "Bomber"):setModel("WespeScoutYellow")
template:setRadarTrace("radar_fury.png")
template:setDescription([[The Starhawk is the more effective replacement for the Marauder bomber following that model's reassignment by the Imperial Navy to serve solely as an atmospheric bomber.]])
template:setHull(50)
template:setShields(40)
template:setSpeed(50, 20, 15)
template:setDefaultAI('fighter')
--                  Arc, Dir, Range, CycleTime, Dmg
template:setBeam(0, 30, 0, 700.0, 4.0, 2)

variation = template:copy("Calixis-Pattern Starhawk Bomber"):setType("playership")
variation:setModel("WespeScoutRed")
variation:setDescription([[The Starhawk is the more effective replacement for the Marauder bomber following that model's reassignment by the Imperial Navy to serve solely as an atmospheric bomber.]])
variation:setHull(60)
variation:setShields(40)
variation:setBeam(0, 30, 0, 900.0, 2.0, 4.0)
variation:setTubes(2, 10.0)
variation:setWeaponStorage("Homing", 4)

variation:setRepairCrewCount(1)
variation:addRoomSystem(3, 0, 1, 1, "Maneuver");
variation:addRoomSystem(1, 0, 2, 1, "BeamWeapons");

variation:addRoomSystem(0, 1, 1, 2, "RearShield");
variation:addRoomSystem(1, 1, 2, 2, "Reactor");
variation:addRoomSystem(3, 1, 2, 1, "Warp");
variation:addRoomSystem(3, 2, 2, 1, "JumpDrive");
variation:addRoomSystem(5, 1, 1, 2, "FrontShield");

variation:addRoomSystem(1, 3, 2, 1, "MissileSystem");
variation:addRoomSystem(3, 3, 1, 1, "Impulse");

variation:addDoor(2, 1, true);
variation:addDoor(3, 1, true);
variation:addDoor(1, 1, false);
variation:addDoor(3, 1, false);
variation:addDoor(3, 2, false);
variation:addDoor(3, 3, true);
variation:addDoor(2, 3, true);
variation:addDoor(5, 1, false);
variation:addDoor(5, 2, false);

-- Pirate starfighters

template = ShipTemplate():setName("Defensive Turret"):setClass("Starfighter", "Interceptor"):setModel("WespeScoutYellow")
template:setRadarTrace("radar_fury.png")
template:setDescription([[This defensive turret appears to be a badly-patched Fury Interceptor, with inactive plasma drives.]])
template:setHull(20)
template:setShields(0)
template:setSpeed(0, 30, 0)
template:setDefaultAI('fighter')
--                  Arc, Dir, Range, CycleTime, Dmg
template:setBeam(0, 30, 0, 900.0, 8.0, 6)

template = ShipTemplate():setName("Hauler"):setClass("Starfighter", "Improvised"):setModel("WespeScoutYellow")
template:setRadarTrace("radar_fury.png")
template:setDescription([[This in-system hauler vessel has been upgraded with weapons batteries, either for protection from pirates, or to become one.

Whilst it may not pose a significant threat to Imperial Navy vessels on its own, a swarm of them can be a dangerous foe.]])
template:setHull(10)
template:setShields(0)
template:setSpeed(70, 25, 10)
template:setDefaultAI('fighter')
--                  Arc, Dir, Range, CycleTime, Dmg
template:setBeam(0, 45, 0, 900.0, 3.0, 2)
