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

	-- Create the wrecks in The Wake
	nonHauntedWreckNames, nonHauntedWrecks = createWreckedShips()

	-- Create the haunted wrecks in The Wake
	hauntedWreckNames, hauntedWrecks = createHauntedWrecks()

	-- Create the ghost ships
	ghostShips = createAllGhostShips(hauntedWrecks)


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

	updateWreckedShipsCallsigns()

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
