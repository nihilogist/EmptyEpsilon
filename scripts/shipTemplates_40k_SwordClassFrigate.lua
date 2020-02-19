--[[----------------------Sword Class Cruiser----------------------]]

template = ShipTemplate():setName("Sword"):setClass("Escort", "Frigate"):setModel("swordClassFrigate")
template:setDescription([[A staple design of the Imperial Navy, the Sword-class frigate has a reputation as a dependable escort vessel.]])
template:setRadarTrace("radar_dauntless.png")
template:setHull(200)
template:setShields(100)
template:setSpeed(25, 3, 5)


template:setTubes(3, 14.0)
template:setWeaponStorage("HVLI", 100)
template:setTubeDirection(1, 0)
template:setTubeDirection(2, 90)
template:setTubeDirection(3, -90)
template:setWeaponTubeExclusiveFor(1, "HVLI"):setTubeSalvoSpread(1, 5):setTubeBatterySize(1, 4):setTubeTurretArc(1, 90):setTubeTurretRotationSpeed(1, 0.3)
template:setWeaponTubeExclusiveFor(2, "HVLI"):setTubeSalvoSpread(2, 5):setTubeBatterySize(2, 4):setTubeTurretArc(2, 90):setTubeTurretRotationSpeed(2, 0.3)
template:setWeaponTubeExclusiveFor(3, "HVLI"):setTubeSalvoSpread(3, 5):setTubeBatterySize(3, 4):setTubeTurretArc(3, 90):setTubeTurretRotationSpeed(3, 0.3)


