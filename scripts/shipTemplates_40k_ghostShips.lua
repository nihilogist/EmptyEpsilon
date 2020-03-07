--
-- This armed merchantman is a standard merchant vessel, with some light armament to offer some defence against pirates.
template = ShipTemplate():setName("Ghost Merchantman"):setClass("Escort", "Destroyer"):setModel("furyInterceptor")
template:setDescription([[This ship appears to be based on the Cobra Class destroyer. Its armament has been heavily altered from the standard pattern.]])
template:setRadarTrace("radar_medium_freighter.png")
template:setHull(150)
template:setShields(30)
template:setSpeed(20, 2, 1)

-- Single weapons battery
template:setTubes(1, 20.0)
-- Battery 2: dorsal macrocannon
template:setWeaponTubeExclusiveFor(0, "HVLI")
template:setTubeBatterySize(0, 2)
template:setTubeSalvoSpread(0, 8)
template:setTubeTurretArc(0, 270)
template:setTubeTurretRotationSpeed(0, 0.6)
-- Ammunition
template:setWeaponStorage("HVLI", 100)



-- The merchant raider is more heavily armed than the armed merchantman, with weapons designed more for attack than defence.
template = ShipTemplate():setName("Ghost Raider"):setClass("Escort", "Destroyer"):setModel("furyInterceptor")
template:setDescription([[This ship appears to be based on the Cobra Class destroyer. Its armament has been heavily altered from the standard pattern.]])
template:setRadarTrace("radar_medium_freighter.png")
template:setHull(150)
template:setShields(30)
template:setSpeed(20, 2, 1)

-- Three weapons batteries
template:setTubes(1, 20.0)
-- Battery 1: dorsal macrocannon
template:weaponTubeDisallowMissle(0, "Homing")
template:setTubeBatterySize(0, 3)
template:setTubeSalvoSpread(0, 8)
template:setTubeTurretArc(0, 270)
template:setTubeTurretRotationSpeed(0, 0.6)
-- Ammunition
template:setWeaponStorage("HVLI", 100)

--[[----------------------Sword Class Cruiser----------------------]]

template = ShipTemplate():setName("Ghost Sword"):setClass("Escort", "Frigate"):setModel("furyInterceptor")
template:setDescription([[A staple design of the Imperial Navy, the Sword-class frigate has a reputation as a dependable escort vessel.]])
template:setRadarTrace("radar_sword.png")
template:setHull(200)
template:setArmour(3.0)
template:setShields(100)
template:setSpeed(25, 3, 5)


template:setTubes(1, 18.0)
template:setWeaponStorage("HVLI", 100)
template:setTubeDirection(0, 0)
template:setWeaponTubeExclusiveFor(0, "HVLI"):setTubeSalvoSpread(0, 8):setTubeBatterySize(0, 5):setTubeTurretArc(0, 270):setTubeTurretRotationSpeed(0, 0.3)

--[[----------------------Firestorm Class Frigate----------------------]]

template = ShipTemplate():setName("Ghost Firestorm"):setClass("Escort", "Frigate"):setModel("furyInterceptor")
template:setDescription([[A staple design of the Imperial Navy, the Sword-class frigate has a reputation as a dependable escort vessel.]])
template:setRadarTrace("radar_sword.png")
template:setHull(200)
template:setArmour(3.0)
template:setShields(100)
template:setSpeed(25, 3, 5)


template:setTubes(1, 18.0)
template:setWeaponStorage("HVLI", 100)
template:setTubeDirection(0, 0)
template:setWeaponTubeExclusiveFor(0, "HVLI"):setTubeSalvoSpread(0, 8):setTubeBatterySize(0, 3):setTubeTurretArc(0, 270):setTubeTurretRotationSpeed(0, 0.3)
template:setBeam(0, 2, 0, 3000.0, 25.0, 30)
template:setBeamWeaponTurret(0, 270, 0, 0.1)
template:setBeamWeaponTargetingDetails(0, 60, 20)


