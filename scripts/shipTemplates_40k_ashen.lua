--
-- This armed merchantman is a standard merchant vessel, with some light armament to offer some defence against pirates.
template = ShipTemplate():setName("Caballus Merchant"):setClass("Escort", "Destroyer"):setModel("mediumFreighter")
template:setDescription([[This ship appears to be based on the Cobra Class destroyer. Its armament has been heavily altered from the standard pattern.]])
template:setRadarTrace("radar_medium_freighter.png")
template:setHull(150)
template:setSpeed(20, 2, 6)

