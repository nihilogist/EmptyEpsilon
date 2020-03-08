--[[----------------------Firestorm Class Frigate----------------------]]

template = ShipTemplate():setName("Firestorm"):setClass("Escort", "Frigate"):setModel("swordClassFrigate")
template:setDescription([[A staple design of the Imperial Navy, the Sword-class frigate has a reputation as a dependable escort vessel.]])
template:setRadarTrace("radar_sword.png")
template:setHull(200)
template:setArmour(3.0)
template:setShields(100)
template:setSpeed(25, 3, 5)
template:setRepairCrewCount(2)

template:setBeam(0, 2, 0, 5000.0, 20.0, 20)
template:setBeamWeaponTurret(0, 90, 0, 0.1)
template:setBeamWeaponTargetingDetails(0, 60, 20)
template:setBeamWeaponEnergyPerFire(0, 5)
template:setBeamWeaponHeatPerFire(0, 0.02)



template:setTubes(1, 18.0)
template:setWeaponStorage("HVLI", 100)
template:setTubeDirection(0, 0)
--template:setTubeDirection(1, 90)
--template:setTubeDirection(2, -90)
template:setWeaponTubeExclusiveFor(0, "HVLI"):setTubeSalvoSpread(0, 8):setTubeBatterySize(0, 3):setTubeTurretArc(0, 270):setTubeTurretRotationSpeed(0, 0.3)
--template:setWeaponTubeExclusiveFor(1, "HVLI"):setTubeSalvoSpread(1, 8):setTubeBatterySize(1, 4):setTubeTurretArc(1, 90):setTubeTurretRotationSpeed(1, 0.3)
--template:setWeaponTubeExclusiveFor(2, "HVLI"):setTubeSalvoSpread(2, 8):setTubeBatterySize(2, 4):setTubeTurretArc(2, 90):setTubeTurretRotationSpeed(2, 0.3)


