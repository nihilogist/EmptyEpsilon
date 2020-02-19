--[[----------------------Sword Class Cruiser----------------------]]

template = ShipTemplate():setName("Lunar"):setClass("Cruiser", "Medium Cruiser"):setModel("swordClassFrigate")
template:setDescription([[A staple design of the Imperial Navy, the Sword-class frigate has a reputation as a dependable escort vessel.]])
template:setRadarTrace("radar_dauntless.png")
template:setHull(800)
template:setShields(300)
template:setSpeed(20, 2.5, 5)

--                  Arc, Dir, Range, CycleTime, Dmg
template:setBeam(0, 90, 90, 5000.0, 30.0, 120)
template:setBeam(1, 90, -90, 5000.0, 30.0, 120)

template:setTubes(4, 14.0)
template:setWeaponStorage("HVLI", 100)
template:setTubeDirection(1, 90)
template:setTubeDirection(2, 90)
template:setTubeDirection(3, -90)
template:setTubeDirection(4, -90)
template:setWeaponTubeExclusiveFor(1, "HVLI"):setTubeSalvoSpread(1, 5):setTubeBatterySize(1, 10):setTubeTurretArc(1, 90):setTubeTurretRotationSpeed(1, 0.3)
template:setWeaponTubeExclusiveFor(2, "HVLI"):setTubeSalvoSpread(2, 5):setTubeBatterySize(2, 10):setTubeTurretArc(2, 90):setTubeTurretRotationSpeed(2, 0.3)
template:setWeaponTubeExclusiveFor(3, "HVLI"):setTubeSalvoSpread(3, 5):setTubeBatterySize(3, 10):setTubeTurretArc(3, 90):setTubeTurretRotationSpeed(3, 0.3)
template:setWeaponTubeExclusiveFor(4, "HVLI"):setTubeSalvoSpread(4, 5):setTubeBatterySize(4, 10):setTubeTurretArc(4, 90):setTubeTurretRotationSpeed(4, 0.3)


