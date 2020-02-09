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




 
--Airlock doors
--variation:addDoor(2, 2, false);
--variation:addDoor(2, 5, false);





--[[----------------------Freighters----------------------]]

