-- Name: The Warmaster
-- Description: Saturday 1900-2100
-- Type: A small zone of wrecks and no enemies.


require("utils.lua")
require("manageWrecks.lua")
require("manageHauntedWrecks.lua")

-- For this scenario, utils.lua provides:
--   vectorFromAngle(angle, length)
--      Returns a relative vector (x, y coordinates)
--   setCirclePos(obj, x, y, angle, distance)
--      Returns the object with its position set to the resulting coordinates.

function init()
	-- Spawn a player Dauntless.
	lexTalionis = PlayerSpaceship():setFaction("Imperial Navy"):setTemplate("Regency Pattern Dauntless"):setPosition(0, 0):setHeading(0)
    lexTalionis:setCallSign("Lex Talionis")
    addGMFunction("Next Scene", gotoWrathOfTheWake)
    lexTalionis:addCustomButton("fighterBay","LaunchFury1","Launch Fury 1",launchInterceptorOne)
    lexTalionis:addCustomButton("fighterBay","LaunchFury2","Launch Fury 2",launchInterceptorTwo)
	lexTalionis:addCustomButton("fighterBay","LaunchStarhawk1","Launch Starhawk 1",launchBomberOne)

    createScenario()

    -- Create the regular wrecked ships that are part of the scenery
    createWreckConfig()
    createWreckedShips(shipwreckDetails)

    -- create the specifically haunted wrecks
    createHauntedWreckConfig()
    createWreckedShipsForHaunts(hauntedWrecksPhaseOneDetails)

    addGMFunction("Ghost Ships Phase One", activateGhostsPhaseOne)





	
end


function update(delta)
    -- Update the callsigns and descriptions of the regular wrecks.
    updateWreckedShipsCallsigns(shipwreckDetails)
    -- Update the callsigns and descriptions of the haunted wrecks.
    updateHauntedWreckedShipsCallsigns(hauntedWrecksPhaseOneDetails)
    -- Update the callsigns and descriptions of the ghost ships
    updateGhostShipsCallsigns(hauntedWrecksPhaseOneDetails)
    -- Heal all damage to any ghost ships
    healAllDamageToGhostShips(hauntedWrecksPhaseOneDetails)
    -- Check to see if any ghost ships need to be destroyed
    checkForExorcism(hauntedWrecksPhaseOneDetails)

end

function createHauntedWreckConfig()
    hauntedWrecksPhaseOneDetails = {
        --{Callsign, posX, posY, template, ghostTemplate, unscannedAuspex, scannedAuspex, deepscannedAuspex, unscannedAuspex, scannedAuspex, deepscannedAuspex}
        {"Haunted Wreck 01", 4835, 53103, "Wrecked Freighter", "Ghost Merchantman", "Unscanned", "Scanned", "Deepscan", "Unscanned", "Scanned", "Deepscan"},
        {"Haunted Wreck 02", -7127, 51203, "Wrecked Frigate", "Sword", "Unscanned", "Scanned", "Deepscan", "Unscanned", "Scanned", "Deepscan"},
    }
end

function activateGhostsPhaseOne() 
    createGhostShipsForHaunts(hauntedWrecksPhaseOneDetails)
end

function createWreckConfig()
    shipwreckDetails = {
        --{Callsign, posX, posY, template, unscannedAuspex, scannedAuspex, deepscannedAuspex}
        {"Lion Of Terra", 2, 60267, "Wrecked Battleship", "Metallic object. Mass reading 500.000.000IT. Thermal signature variable.", "Voidship. Mars-pattern Emperor class Imperial Battleship. Biosignatures present. Reactor active::inactive::errorerror.", "Cogitator Pattern match. Broadcast Ident confirmed. CallsignDesignate \"Lion Of Terra\", Assignation: Flagship of the Admiralty (Crusade Fleet Prosperitas). Weapon Batteries detected."},
        {"Name", 6399, 38286, "Wrecked Bulk Carrier", "Unscanned", "Scanned", "Deepscan"},
        {"Name", 8283, 51017, "Wrecked Bulk Carrier", "Unscanned", "Scanned", "Deepscan"},
        {"Name", -11062, 60078, "Wrecked Bulk Carrier", "Unscanned", "Scanned", "Deepscan"},
        {"Name", 10225, 54628, "Wrecked Bulk Carrier", "Unscanned", "Scanned", "Deepscan"},
        {"Name", -8408, 53048, "Wrecked Freighter", "Unscanned", "Scanned", "Deepscan"},
        {"Name", -2196, 48587, "Wrecked Freighter", "Unscanned", "Scanned", "Deepscan"},
        {"Name", 6082, 49429, "Wrecked Freighter", "Unscanned", "Scanned", "Deepscan"},
        {"Name", 5639, 69131, "Wrecked Freighter", "Unscanned", "Scanned", "Deepscan"},
        {"Name", 118, 71498, "Wrecked Freighter", "Unscanned", "Scanned", "Deepscan"},
        {"Name", -9082, 66895, "Wrecked Freighter", "Unscanned", "Scanned", "Deepscan"},
        {"Name", -5491, 38467, "Wrecked Freighter", "Unscanned", "Scanned", "Deepscan"},
        {"Name", -4249, 70104, "Wrecked Frigate", "Unscanned", "Scanned", "Deepscan"},
        {"Name", 2543, 48144, "Wrecked Frigate", "Unscanned", "Scanned", "Deepscan"},
        {"Name", -6077, 49746, "Wrecked Destroyer", "Unscanned", "Scanned", "Deepscan"},
        {"Name", 9994, 66919, "Wrecked Destroyer", "Unscanned", "Scanned", "Deepscan"},
        {"Name", 11927, 60001, "Wrecked Cruiser", "Unscanned", "Scanned", "Deepscan"},
    }

end

function gotoWrathOfTheWake()
    setScenario("scenario_08_wrathOfTheWake.lua", nil)
end

function createScenario()
    warpAnomaly = WarpAnomaly()
    warpAnomaly:setPosition(3, 60267)
    Asteroid():setPosition(5402, 34315)
    Asteroid():setPosition(17940, 16416)
    Asteroid():setPosition(-19055, 21888)
    Asteroid():setPosition(13479, 22602)
    Asteroid():setPosition(22487, 27226)
    Asteroid():setPosition(-21215, 39627)
    Asteroid():setPosition(-31539, 36878)
    Asteroid():setPosition(-31435, 25064)
    Asteroid():setPosition(-26388, 31734)
    Asteroid():setPosition(-7667, 34397)
    Asteroid():setPosition(17306, 30920)
    Asteroid():setPosition(32570, 24625)
    Asteroid():setPosition(29917, 35375)
    Asteroid():setPosition(38684, 46072)
    Asteroid():setPosition(29440, 32035)
    Asteroid():setPosition(32151, 45334)
    Asteroid():setPosition(39843, 58084)
    Asteroid():setPosition(42496, 75739)
    Asteroid():setPosition(36939, 77063)
    Asteroid():setPosition(25769, 84544)
    Asteroid():setPosition(23525, 95784)
    Asteroid():setPosition(7826, 98207)
    Asteroid():setPosition(-5767, 98207)
    Asteroid():setPosition(-19465, 96311)
    Asteroid():setPosition(-21724, 90638)
    Asteroid():setPosition(-30481, 80555)
    Asteroid():setPosition(-36724, 79758)
    Asteroid():setPosition(-40485, 71618)
    Asteroid():setPosition(-42803, 51387)
    Asteroid():setPosition(-36271, 37900)
    Asteroid():setPosition(-33226, 33282)
    Asteroid():setPosition(-22057, 23694)
    Asteroid():setPosition(7071, 18092)
    Asteroid():setPosition(25616, 20515)
    Asteroid():setPosition(-35744, 50439)
    Asteroid():setPosition(-43646, 60659)
    Asteroid():setPosition(-32978, 73151)
    Asteroid():setPosition(-26571, 84000)
    Asteroid():setPosition(-9455, 97891)
    Asteroid():setPosition(10144, 97575)
    Asteroid():setPosition(24052, 95573)
    Asteroid():setPosition(33672, 78644)
    Asteroid():setPosition(42976, 73558)
    Asteroid():setPosition(36892, 66302)
    Asteroid():setPosition(37630, 52815)
    Asteroid():setPosition(34920, 31508)
    Asteroid():setPosition(33940, 25257)
    Asteroid():setPosition(-13265, 18513)
    Asteroid():setPosition(-23637, 29384)
    Asteroid():setPosition(-32477, 34844)
    Asteroid():setPosition(-48704, 50544)
    Asteroid():setPosition(-10433, 14876)
    Asteroid():setPosition(-2911, 17807)
    Asteroid():setPosition(12519, 16701)
    Asteroid():setPosition(1237, 17033)
    Asteroid():setPosition(-13917, 23282)
    Asteroid():setPosition(6159, 24333)
    Asteroid():setPosition(18529, 31108)
    Asteroid():setPosition(-13751, 29255)
    Asteroid():setPosition(-22212, 32128)
    Asteroid():setPosition(-25345, 34553)
    Asteroid():setPosition(-32921, 43623)
    Asteroid():setPosition(-39724, 45503)
    Asteroid():setPosition(-30765, 58777)
    Asteroid():setPosition(-37788, 60602)
    Asteroid():setPosition(-33364, 68345)
    Asteroid():setPosition(-32140, 73634)
    Asteroid():setPosition(-22254, 77469)
    Asteroid():setPosition(-17927, 88046)
    Asteroid():setPosition(-4994, 88370)
    Asteroid():setPosition(17854, 90417)
    Asteroid():setPosition(17039, 78531)
    Asteroid():setPosition(25553, 73681)
    Asteroid():setPosition(30062, 75919)
    Asteroid():setPosition(25735, 70030)
    Asteroid():setPosition(30262, 63241)
    Asteroid():setPosition(24011, 46967)
    Asteroid():setPosition(22610, 41255)
    Asteroid():setPosition(35435, 58930)
    Asteroid():setPosition(22672, 67597)
    Asteroid():setPosition(46921, 73848)
    Asteroid():setPosition(20441, 82011)
    Asteroid():setPosition(40318, 77992)
    Asteroid():setPosition(2011, 87184)
    Asteroid():setPosition(22796, 73549)
    Asteroid():setPosition(1257, 90202)
    Asteroid():setPosition(9448, 74574)
    Asteroid():setPosition(-20514, 85136)
    Asteroid():setPosition(-11461, 90848)
    Asteroid():setPosition(-22640, 70548)
    Asteroid():setPosition(-2084, 79101)
    Asteroid():setPosition(16176, 81009)
    Asteroid():setPosition(23749, 65873)
    Asteroid():setPosition(-24625, 85767)
    Asteroid():setPosition(-12816, 76384)
    Asteroid():setPosition(-19975, 82334)
    Asteroid():setPosition(-29105, 73335)
    Asteroid():setPosition(-25566, 63072)
    Asteroid():setPosition(-21024, 74727)
    Asteroid():setPosition(-24165, 57360)
    Asteroid():setPosition(-22641, 45751)
    Asteroid():setPosition(-22440, 47660)
    Asteroid():setPosition(-19316, 35928)
    Asteroid():setPosition(3575, 39950)
    Asteroid():setPosition(11874, 33053)
    Asteroid():setPosition(-9681, 34885)
    Asteroid():setPosition(-20889, 36271)
    Asteroid():setPosition(-30281, 37656)
    Asteroid():setPosition(-6815, 25571)
    Asteroid():setPosition(4701, 30346)
    Asteroid():setPosition(17439, 25744)
    Asteroid():setPosition(-19244, 32733)
    Asteroid():setPosition(-16155, 39264)
    Asteroid():setPosition(4772, 34208)
    Asteroid():setPosition(23689, 34311)
    Asteroid():setPosition(32049, 43215)
    Asteroid():setPosition(24273, 46546)
    Asteroid():setPosition(29943, 48200)
    Asteroid():setPosition(23623, 55925)
    Asteroid():setPosition(35982, 59155)
    Asteroid():setPosition(-33916, 51337)
    Asteroid():setPosition(-19170, 41225)
    Asteroid():setPosition(-20925, 34554)
    Asteroid():setPosition(-19051, 31728)
    Asteroid():setPosition(-32815, 36081)
    Asteroid():setPosition(-23405, 36152)
    Asteroid():setPosition(-26547, 30276)
    Asteroid():setPosition(-17419, 17214)
    Asteroid():setPosition(-24160, 20304)
    Asteroid():setPosition(-37721, 25341)
    Asteroid():setPosition(-13092, 30895)
    Asteroid():setPosition(5036, 31099)
    Asteroid():setPosition(-6424, 39281)
    Asteroid():setPosition(3506, 31916)
    Asteroid():setPosition(-7889, 29841)
    Asteroid():setPosition(581, 25147)
    Asteroid():setPosition(-7187, 28009)
    Asteroid():setPosition(-3046, 30241)
    Asteroid():setPosition(2078, 30419)
    Asteroid():setPosition(-6348, 30848)
    Asteroid():setPosition(-635, 29562)
    Asteroid():setPosition(-1117, 24831)
    Asteroid():setPosition(-8794, 24706)
    Asteroid():setPosition(-11508, 26349)
    Asteroid():setPosition(-3153, 24956)
    Asteroid():setPosition(2864, 26849)
    Asteroid():setPosition(-6420, 26135)
    Asteroid():setPosition(-11615, 33186)
    Asteroid():setPosition(1917, 33365)
    Asteroid():setPosition(9344, 32811)
    Asteroid():setPosition(9041, 28616)
    Asteroid():setPosition(5613, 28420)
    Asteroid():setPosition(8005, 25546)
    Asteroid():setPosition(12986, 28955)
    Asteroid():setPosition(-10936, 32883)
    Asteroid():setPosition(-15400, 15771)
    Asteroid():setPosition(-5974, 16503)
    Asteroid():setPosition(4880, 16128)
    Asteroid():setPosition(-11, 14735)
    Asteroid():setPosition(-6812, 35382)
    Asteroid():setPosition(-19701, 31737)
    Asteroid():setPosition(-16790, 32748)
    Asteroid():setPosition(-24602, 17881)
    Asteroid():setPosition(-11473, 18835)
    Asteroid():setPosition(-1791, 20302)
    Asteroid():setPosition(19186, 21109)
    Asteroid():setPosition(-4285, 20228)
    Asteroid():setPosition(-13307, 20889)
    Asteroid():setPosition(7670, 20228)
    Asteroid():setPosition(15518, 19788)
    Asteroid():setPosition(15703, 33995)
    Asteroid():setPosition(9871, 15094)
    Asteroid():setPosition(-22036, 16906)
    Asteroid():setPosition(-13820, 28810)
    Asteroid():setPosition(-1278, 29323)
    Asteroid():setPosition(23000, 29177)
    Asteroid():setPosition(-17341, 31377)
    Asteroid():setPosition(-6412, 32184)
    Asteroid():setPosition(15812, 38345)
    Asteroid():setPosition(5665, 20043)
    Asteroid():setPosition(-12099, 22455)
    Asteroid():setPosition(2319, 18420)
    Asteroid():setPosition(-7129, 18370)
    Asteroid():setPosition(-10524, 16845)
    Asteroid():setPosition(-5286, 35459)
    Asteroid():setPosition(1209, 33048)
    


end


function launchInterceptorOne()
	furyOne = launchFuryFromWake("Fury 1")
	furyOne:setAutoCoolant(true)
    return furyOne
end

function launchInterceptorTwo()
	furyTwo = launchFuryFromWake("Fury 2")
	furyTwo:setAutoCoolant(true)
    return furyTwo
end

function launchBomberOne()
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