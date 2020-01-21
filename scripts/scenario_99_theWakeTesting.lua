-- Name: The Wake Testing
-- Description: Basic scenario to test-drive aspects of play for The Wake.
-- Type: Basic


require("utils.lua")
-- For this scenario, utils.lua provides:
--   vectorFromAngle(angle, length)
--      Returns a relative vector (x, y coordinates)
--   setCirclePos(obj, x, y, angle, distance)
--      Returns the object with its position set to the resulting coordinates.

function init()
	-- Spawn a player Dauntless.
	lexTalionis = PlayerSpaceship():setFaction("Imperial Navy"):setTemplate("Regency Pattern Dauntless Light Cruiser"):setCallSign("The Wake")
	lexTalionis:setCallSign("Lex Talionis")
	-- Currently testing with auto-coolant on. Remove.
	lexTalionis:setAutoCoolant(true)
	furyOne = nil
	furyOneButton = false
	furyTwo = nil
	furyTwoButton = false
	starhawkOne = nil
	starhawkOneButton = false

	enemyList = {}
	friendlyList = {}

	-- spawn one wreck
	--spitefulWreck = setCirclePos(CpuShip():setTemplate('Wrecked Destroyer'):setFaction("Wreckage"):setCallSign("Unknown Contact"):setRotation(180):orderIdle(), 0, 0, 270, 6000)
	-- and a corresponding ghost ship
	--spitefulGhost = setCirclePos(CpuShip():setTemplate('Unknown Destroyer'):setFaction("Unknown Ship"):setCallSign("Unknown Contact"):setRotation(180):orderRoaming(), 0, 0, 90, 10000)

	nonHauntedWreckNames = {"Spiteful", "Dux Cornovi", "Golden Farrel"}
	nonHauntedWrecks = {}
	for i,v in ipairs(nonHauntedWreckNames) do
		table.insert(nonHauntedWrecks, setCirclePos(CpuShip():setTemplate('Wrecked Destroyer'):setFaction("Wreckage"):setCallSign("Unknown Contact"):setRotation(180):orderIdle(), 0, 0, random(0, 360), random(4000, 8000)))
	end

	
	lexTalionis:addCustomButton("fighterBay","LaunchFury1","Launch Fury 1",launchInterceptorOne)
	lexTalionis:addCustomButton("fighterBay","LaunchFury2","Launch Fury 2",launchInterceptorTwo)
	lexTalionis:addCustomButton("fighterBay","LaunchStarhawk1","Launch Starhawk 1",launchBomberOne)
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
    setCirclePos(launchedVehicle, x, y, direction - 270, 100)
    launchedVehicle:setHeading(direction - 180)
    launchedVehicle:commandTargetRotation(direction - 270)
    launchedVehicle:commandImpulse(0.5)
    return launchedVehicle
end


function update(delta)

	-- Check over the list of wrecks to see if any of them need to have their callsigns updated
	for i,name in ipairs(nonHauntedWreckNames) do
		if nonHauntedWrecks[i]:isScannedByFaction("Imperial Navy") then
			nonHauntedWrecks[i]:setCallSign(name)
		end
	end

end
