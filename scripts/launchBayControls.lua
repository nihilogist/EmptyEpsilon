-- Launch Bay Controls provides a set of utility scripts for launching fighters from larger ships.

require("utils.lua")

-- 
function launchVehicleFromShip(carrierVehicle, vehicleClass, callsign)
	launchedVehicle = PlayerSpaceship():setFaction("Imperial Navy"):setTemplate(vehicleClass):setCallSign(callsign)
	local x, y = carrierVehicle:getPosition()
    local direction = carrierVehicle:getHeading()
    setCirclePos(launchedVehicle, x, y, direction - 270, 310)
    launchedVehicle:setHeading(direction - 180)
    launchedVehicle:commandTargetRotation(direction - 270)
    launchedVehicle:commandImpulse(0.5)
    return launchedVehicle
end

function launchVehicleFromLex(vehicleClass, callsign)
    return launchVehicleFromShip(lexTalionis, vehicleClass, callsign)
end

function launchFuryFromLex(callsign)
	launchedFighter = launchVehicleFromLex("Mars-Pattern Fury Interceptor", callsign)
	return launchedFighter
end

function launchStarhawkFromLex(callsign)
	launchedFighter = launchVehicleFromLex("Calixis-Pattern Starhawk Bomber", callsign)
	return launchedFighter
end

function launchInterceptorOne()
	furyOne = launchFuryFromLex("Fury 1")
	furyOne:setAutoCoolant(true)
    return furyOne
end

function launchBomberOne()
	starhawkOne = launchStarhawkFromLex("Starhawk 1")
	starhawkOne:setAutoCoolant(true)
	return starhawkOne
end