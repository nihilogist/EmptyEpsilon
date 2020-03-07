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