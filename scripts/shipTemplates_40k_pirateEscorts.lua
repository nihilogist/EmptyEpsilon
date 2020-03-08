--
-- This armed merchantman is a standard merchant vessel, with some light armament to offer some defence against pirates.
template = ShipTemplate():setName("Armed Merchantman"):setClass("Escort", "Destroyer"):setModel("mediumFreighter")
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

--
-- The merchant raider is more heavily armed than the armed merchantman, with weapons designed more for attack than defence.
template = ShipTemplate():setName("Merchant Raider"):setClass("Escort", "Destroyer"):setModel("mediumFreighter")
template:setDescription([[This ship appears to be based on the Cobra Class destroyer. Its armament has been heavily altered from the standard pattern.]])
template:setRadarTrace("radar_medium_freighter.png")
template:setHull(150)
template:setShields(30)
template:setSpeed(20, 2, 1)
template:setRepairCrewCount(1)

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

--
-- The Q ship is an active warship that just looks like a merchant vessel
template = ShipTemplate():setName("Q Ship"):setClass("Escort", "Destroyer"):setModel("mediumFreighter")
template:setDescription([[This ship appears to be based on the Cobra Class destroyer. Its armament has been heavily altered from the standard pattern.]])
template:setRadarTrace("radar_medium_freighter.png")
template:setHull(150)
template:setArmour(2.0)
template:setShields(60)
template:setSpeed(25, 3, 10)
template:setRepairCrewCount(1)

-- Three weapons batteries
template:setTubes(4, 20.0)
-- Battery 1: port macrocannon
template:setTubeDirection(0, -90)
template:weaponTubeDisallowMissle(0, "Homing")
template:setTubeBatterySize(0, 1)
template:setTubeSalvoSpread(0, 4)
template:setTubeTurretArc(0, 60)
-- Battery 2: dorsal macrocannon
template:weaponTubeDisallowMissle(1, "Homing")
template:setTubeBatterySize(1, 4)
template:setTubeSalvoSpread(1, 8)
template:setTubeTurretArc(1, 270)
template:setTubeTurretRotationSpeed(1, 0.6)
-- Battery 3: starbaord macrocannon
template:setTubeDirection(2, 90)
template:weaponTubeDisallowMissle(2, "Homing")
template:setTubeBatterySize(2, 1)
template:setTubeSalvoSpread(2, 4)
template:setTubeTurretArc(2, 60)
-- Battery 4: single front facing torpedo tube
template:weaponTubeDisallowMissle(3, "HVLI")
-- Ammunition
template:setWeaponStorage("HVLI", 100)
template:setWeaponStorage("Homing", 1)