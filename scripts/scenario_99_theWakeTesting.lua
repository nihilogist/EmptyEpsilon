-- Name: The Wake Testing
-- Description: Basic scenario to test-drive aspects of play for The Wake.
-- Type: Basic


require("utils.lua")
require("launchBayControls.lua")
require("manageWrecks.lua")
require("manageHauntedWrecks.lua")
-- For this scenario, utils.lua provides:
--   vectorFromAngle(angle, length)
--      Returns a relative vector (x, y coordinates)
--   setCirclePos(obj, x, y, angle, distance)
--      Returns the object with its position set to the resulting coordinates.

function init()
	imperialNavy = "Imperial Navy"
	-- Spawn a player Dauntless.
	lexTalionis = PlayerSpaceship():setFaction(imperialNavy):setTemplate("Regency Pattern Dauntless")
	lexTalionis:setCallSign("Lex Talionis")
	furyOne = nil
	furyOneButton = false
	furyTwo = nil
	furyTwoButton = false
	starhawkOne = nil
	starhawkOneButton = false

	imperialNavyFactionId = 1
	

	enemyList = {}
	friendlyList = {}

	-- Create the wrecks in The Wake
	nonHauntedWreckNames, nonHauntedWrecks = createWreckedShips()

	-- Create the haunted wrecks in The Wake
	hauntedWreckNames, hauntedWrecks = createHauntedWrecks()

	-- Add a GM Function to create all the haunted ships
	addGMFunction("Create Ghosts", createAllGhostShips)

	BlackHole():setPosition(4500,4500)
	BlackHole():setPosition(0,6000)
	BlackHole():setPosition(-4500,4500)



	lexTalionis:addCustomButton("fighterBay","LaunchFury1","Launch Fury 1",launchInterceptorOne)
	lexTalionis:addCustomButton("fighterBay","LaunchFury2","Launch Fury 2",launchInterceptorTwo)
	lexTalionis:addCustomButton("fighterBay","LaunchStarhawk1","Launch Starhawk 1",launchBomberOne)
end

function launchInterceptorOne()
	furyOne = launchVehicleFromShip(lexTalionis, "Mars-Pattern Fury Interceptor", "Fury-1")
	furyOne:setAutoCoolant(true)
    return furyOne
end

function launchInterceptorTwo()
	furyTwo = launchVehicleFromShip(lexTalionis, "Mars-Pattern Fury Interceptor", "Fury-2")
	furyTwo:setAutoCoolant(true)
    return furyTwo
end

function launchBomberOne()
	starhawkOne = launchVehicleFromShip(lexTalionis, "Calixis-Pattern Starhawk Bomber", "Starhawk-1")
	starhawkOne:setAutoCoolant(true)
	return starhawkOne
end


function update(delta)

	-- Check over all the various unknown ships to see if they need to have their callsigns updated.
	updateWreckedShipsCallsigns()
	updateHauntedWreckCallsigns()
	updateGhostShipCallsigns()

end
