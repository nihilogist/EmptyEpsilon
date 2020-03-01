-- Name: Naptime
-- Description: Friday night, 0000-1000 Saturday
-- Type: 


require("utils.lua")
-- For this scenario, utils.lua provides:
--   vectorFromAngle(angle, length)
--      Returns a relative vector (x, y coordinates)
--   setCirclePos(obj, x, y, angle, distance)
--      Returns the object with its position set to the resulting coordinates.

function init()
	-- Spawn a player Dauntless.
	lexTalionis = PlayerSpaceship():setFaction("Imperial Navy"):setTemplate("LexTalionisInitial")
	lexTalionis:setCallSign("Lex Talionis")
	furyOne = nil
	furyOneButton = false
	furyTwo = nil
	furyTwoButton = false
	starhawkOne = nil
    starhawkOneButton = false

    createBoundaries()
    
    addGMFunction("Next Scene", gotoNavigationOnline)


    
    

	lexTalionis:addCustomButton("fighterBay","LaunchFury1","Launch Fury 1",launchInterceptorOne)
	lexTalionis:addCustomButton("fighterBay","LaunchFury2","Launch Fury 2",launchInterceptorTwo)
	lexTalionis:addCustomButton("fighterBay","LaunchStarhawk1","Launch Starhawk 1",launchBomberOne)
end

function gotoNavigationOnline()
    setScenario("scenario_04_navigationOnline.lua", nil)
end

function launchInterceptorOne()
	--lexTalionis:removeCustom("LaunchFury1")
	furyOneButton = false
	furyOne = launchFuryFromWake("Fury 1")
	furyOne:setAutoCoolant(true)
    return furyOne
end

function launchInterceptorTwo()
	--lexTalionis:removeCustom("LaunchFury2")
	furyTwoButton = false
	furyTwo = launchFuryFromWake("Fury 2")
	furyTwo:setAutoCoolant(true)
    return furyTwo
end

function launchBomberOne()
	--lexTalionis:removeCustom("LaunchStarhawk1")
	starhawkOneButton = false
	starhawkOne = launchStarhawkFromWake("Starhawk 1")
	starhawkOne:setAutoCoolant(true)
	return starhawkOne
end

function launchFuryFromWake(callsign)
	launchedFighter = launchVehicleFromWake("Mars-Pattern Fury Interceptor", callsign)
	return launchedFighter
end

function launchStarhawkFromWake(callsign)
	launchedFighter = launchVehicleFromWake("Calixis-Pattern Starhawk Bomber", callsign)
	return launchedFighter
end

function launchVehicleFromWake(vehicleClass, callsign)
	launchedVehicle = PlayerSpaceship():setFaction("Imperial Navy"):setTemplate(vehicleClass):setCallSign(callsign)
	local x, y = lexTalionis:getPosition()
    local direction = lexTalionis:getHeading()
    setCirclePos(launchedVehicle, x, y, direction - 270, 310)
    launchedVehicle:setHeading(direction - 180)
    launchedVehicle:commandTargetRotation(direction - 270)
    launchedVehicle:commandImpulse(0.5)
    return launchedVehicle
end


function update(delta)

end

function createBoundaries()
    Nebula():setPosition(-1683, -531)
    Nebula():setPosition(3841, -3717)
    Nebula():setPosition(6877, 2875)
    Nebula():setPosition(-146, 6786)
    Nebula():setPosition(-8115, 2638)
    Nebula():setPosition(-6241, -6040)
    Nebula():setPosition(-273, -9679)
    BlackHole():setPosition(-8026, -12474)
    BlackHole():setPosition(-1322, -16213)
    BlackHole():setPosition(4577, -13989)
    BlackHole():setPosition(9702, -9573)
    BlackHole():setPosition(12603, -3546)
    BlackHole():setPosition(13538, 3674)
    BlackHole():setPosition(11249, 9766)
    BlackHole():setPosition(4351, 12699)
    BlackHole():setPosition(-2708, 13538)
    BlackHole():setPosition(-9057, 10894)
    BlackHole():setPosition(-13634, 5318)
    BlackHole():setPosition(-14408, -1031)
    BlackHole():setPosition(-12152, -8123)

end
