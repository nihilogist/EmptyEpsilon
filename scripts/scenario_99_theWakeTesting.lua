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
	lexTalionis = PlayerSpaceship():setFaction("Imperial Navy"):setTemplate("Regency Pattern Dauntless")
	lexTalionis:setCallSign("Lex Talionis")
	furyOne = nil
	furyOneButton = false
	furyTwo = nil
	furyTwoButton = false
	starhawkOne = nil
	starhawkOneButton = false

	enemyList = {}
	friendlyList = {}

	
	nonHauntedWreckNames = {"Spiteful", "Dux Cornovi", "Golden Farrel"}
	nonHauntedWrecks = {}
	for i,v in ipairs(nonHauntedWreckNames) do
		table.insert(nonHauntedWrecks, setCirclePos(CpuShip():setTemplate('Wrecked Destroyer'):setFaction("Wreckage"):setCallSign("Unknown Contact"):setRotation(random(0, 360)):orderIdle(), 0, 0, random(0, 360), random(10000, 20000)))
	end

	hauntedWreckNames = {"Heart of Light", "Rhadamantine"}
	hauntedWrecks = {}
	ghostShips = {}
	for i,name in ipairs(hauntedWreckNames) do
		table.insert(hauntedWrecks, setCirclePos(CpuShip():setTemplate('Wrecked Destroyer'):setFaction("Wreckage"):setCallSign("Unknown Contact"):setRotation(random(0, 360)):orderIdle(), 0, 0, random(0, 360), random(15000, 20000)))
		table.insert(ghostShips, setCirclePos(CpuShip():setTemplate('Unknown Destroyer'):setFaction("Unknown Ship"):setCallSign("Unknown Contact"):setRotation(180):orderDefendTarget(hauntedWrecks[i]), 0, 0, random(0, 360), random(15000, 20000)))
	end

	pirateFighterNames = {"Talon One", "Talon Two", "Talon Three", "Talon Four"}
	for i,name in ipairs(pirateFighterNames) do
		table.insert(enemyList, setCirclePos(CpuShip():setTemplate('Hauler'):setFaction("Rising Flame"):setCallSign(name):setRotation(180):orderRoaming(), 0, 0, random(0, 30), random(8000, 10000)))
	end

	table.insert(enemyList, setCirclePos(CpuShip():setTemplate('Pirate Destroyer'):setFaction("Rising Flame"):setCallSign("Death Incarnate"):setRotation(180):orderRoaming(), 0, 0, random(0, 30), random(5000, 6000)))
	
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

	-- Check over the list of wrecks to see if any of them need to be updated
	for i,name in ipairs(nonHauntedWreckNames) do
		if nonHauntedWrecks[i]:isScannedByFaction("Imperial Navy") then
			nonHauntedWrecks[i]:setCallSign(name)
		end
	end

	-- Check over the list of haunted wrecks to see if any of them need to be updated
	for i,name in ipairs(hauntedWreckNames) do
		-- If they've been scanned, then update their callsign
		if hauntedWrecks[i]:isScannedByFaction("Imperial Navy") then
			hauntedWrecks[i]:setCallSign(name)
		end
		-- If they've been destroyed then also destroy their ghost counterpart
		if not hauntedWrecks[i]:isValid() then
			ghostShips[i]:destroy()
		end
	end

	-- Check over the list of ghost ships to see if any of them need to be updated
	for i,name in ipairs(hauntedWreckNames) do
		-- if they've been scanned then update their callsigns
		if ghostShips[i]:isScannedByFaction("Imperial Navy") then
			ghostShips[i]:setCallSign(name)
		end
		-- reset their health to 100
		if ghostShips[i]:isValid() then
			ghostShips[i]:setHull(100)
		end
	end



end
