--[[----------------------Sabre Class Cruiser----------------------]]

template = ShipTemplate():setName("Sabre"):setClass("Escort", "Frigate"):setModel("swordClassFrigate")
template:setDescription([[A staple design of the Imperial Navy, the Sword-class frigate has a reputation as a dependable escort vessel.]])
template:setRadarTrace("radar_sword.png")
template:setHull(200)
template:setShields(100)
template:setSpeed(25, 3, 5)


template:setTubes(1, 18.0)
template:setWeaponStorage("HVLI", 100)
template:setTubeDirection(0, 0)
--template:setTubeDirection(1, 90)
--template:setTubeDirection(2, -90)
template:setWeaponTubeExclusiveFor(0, "HVLI"):setTubeSalvoSpread(0, 8):setTubeBatterySize(0, 4):setTubeTurretArc(0, 270):setTubeTurretRotationSpeed(0, 0.3)
--template:setWeaponTubeExclusiveFor(1, "HVLI"):setTubeSalvoSpread(1, 8):setTubeBatterySize(1, 4):setTubeTurretArc(1, 90):setTubeTurretRotationSpeed(1, 0.3)
--template:setWeaponTubeExclusiveFor(2, "HVLI"):setTubeSalvoSpread(2, 8):setTubeBatterySize(2, 4):setTubeTurretArc(2, 90):setTubeTurretRotationSpeed(2, 0.3)

--[[----------------------Falchion Class Cruiser----------------------]]

template = ShipTemplate():setName("Falchion"):setClass("Escort", "Frigate"):setModel("swordClassFrigate")
template:setDescription([[A staple design of the Imperial Navy, the Sword-class frigate has a reputation as a dependable escort vessel.]])
template:setRadarTrace("radar_sword.png")
template:setHull(400)
template:setShields(200)
template:setSpeed(20, 2, 2)
template:setArmour(2.0)


template:setTubes(1, 18.0)
template:setWeaponStorage("HVLI", 300)
template:setTubeDirection(0, 0)
--template:setTubeDirection(1, 90)
--template:setTubeDirection(2, -90)
template:setWeaponTubeExclusiveFor(0, "HVLI"):setTubeSalvoSpread(0, 10):setTubeBatterySize(0, 6):setTubeTurretArc(0, 270):setTubeTurretRotationSpeed(0, 0.3)
--template:setWeaponTubeExclusiveFor(1, "HVLI"):setTubeSalvoSpread(1, 8):setTubeBatterySize(1, 4):setTubeTurretArc(1, 90):setTubeTurretRotationSpeed(1, 0.3)
--template:setWeaponTubeExclusiveFor(2, "HVLI"):setTubeSalvoSpread(2, 8):setTubeBatterySize(2, 4):setTubeTurretArc(2, 90):setTubeTurretRotationSpeed(2, 0.3)



