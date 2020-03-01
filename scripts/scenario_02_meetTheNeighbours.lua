-- Name: Meet the Neighbours
-- Description: Friday night, 2300-0000
-- Type: Pirate Space Station and environs.


require("utils.lua")
require("manageNPCShips.lua")
-- require("launchBayControls.lua")


function init()
	-- Spawn a player Dauntless.
    lexTalionis = PlayerSpaceship():setFaction("Imperial Navy"):setTemplate("LexTalionisInitial"):setPosition(-8000, -2000)
    lexTalionis:setCallSign("Lex Talionis")
    -- spawn the station
    kharaStation = SpaceStation():setTemplate("Khara Station"):setFaction("Kirill"):setCallSign("Khara Station"):setPosition(12816, -6912)

	furyOne = nil
	furyOneButton = false
	furyTwo = nil
	furyTwoButton = false
	starhawkOne = nil
    starhawkOneButton = false
    
    createSmallAsteroids()
    createBoundaries()

    createNPCShipConfig()

    createNPCShips(npcConfiguration)

    addGMFunction("Next Scene", gotoMeetTheNeighbours)

    

    startInitialOrders()

	lexTalionis:addCustomButton("fighterBay","LaunchFury1","Launch Fury 1",launchInterceptorOne)
	lexTalionis:addCustomButton("fighterBay","LaunchStarhawk1","Launch Starhawk 1",launchBomberOne)
end

function createNPCShipConfig()
    npcConfiguration = {
        --{Callsign, posX, posY, heading, template, faction, unscannedAuspex, scannedAuspex, deepscannedAuspex}
        --{"Callsign", 0, 0, 0, "Template", "Faction", "Unscanned", "Scanned", "Deepscanned"}
        {"Malevolence", -451, 2942, 270, "Merchant Raider", "The Pikes", "Unscanned", "Scanned", "Deepscanned"},
        {"Stormspike", -1176, 3451, 270, "Armed Merchantman", "The Pikes", "Unscanned", "Scanned", "Deepscanned"},
        {"Khara-Lighter 001", 8014, -4135, 0, "Tug Ship", "Kirill", "Unscanned", "Scanned", "Deepscanned"},
        {"Khara-Lighter 009", 6920, -5261, 0, "Tug Ship", "Kirill", "Unscanned", "Scanned", "Deepscanned"},
        {"Khara-Lighter 0A1", 5827, -6625, 0, "Tug Ship", "Kirill", "Unscanned", "Scanned", "Deepscanned"},
        {"Khara-Lighter 00F", 13926, -2522, 0, "Tug Ship", "Kirill", "Unscanned", "Scanned", "Deepscanned"},
        {"Khara-Lighter 01A", 9876, -2749, 0, "Tug Ship", "Kirill", "Unscanned", "Scanned", "Deepscanned"},
        {"Ark of Plenty", 11590, -4650, 0, "Q Ship", "Kirill", "Unscanned", "Scanned", "Deepscanned"},
        {"St Sebastian's Properity", 10027, -4495, 0, "Q Ship", "Kirill", "Unscanned", "Scanned", "Deepscanned"},
        {"Cornucopia", 12561, -3486, 0, "Armed Merchantman", "Kirill", "Unscanned", "Scanned", "Deepscanned"},
        {"Bearclaw", 16132, -3974, 0, "Armed Merchantman", "Kirill", "Unscanned", "Scanned", "Deepscanned"},
        {"Mazar's Revenge", 8640, -7610, 0, "Pirate Destroyer", "Kirill", "Unscanned", "Scanned", "Deepscanned"},
        {"Sabre's Point", 7492, -9318, 0, "Sword", "Kirill", "Unscanned", "Scanned", "Deepscanned"},
        {"Flamberge", 10638, -10477, 0, "Sword", "Kirill", "Unscanned", "Scanned", "Deepscanned"}
    }
end

function startInitialOrders()
    getShip(npcConfiguration[1]):orderAttack(lexTalionis)
    getShip(npcConfiguration[2]):orderAttack(lexTalionis)
    getShip(npcConfiguration[3]):orderIdle()
    getShip(npcConfiguration[4]):orderIdle()
    getShip(npcConfiguration[5]):orderIdle()
    getShip(npcConfiguration[6]):orderIdle()
    getShip(npcConfiguration[7]):orderIdle()
    getShip(npcConfiguration[8]):orderDefendTarget(kharaStation)
    getShip(npcConfiguration[9]):orderDefendTarget(kharaStation)
    getShip(npcConfiguration[10]):orderDefendTarget(kharaStation)
    getShip(npcConfiguration[11]):orderDefendTarget(kharaStation)
    getShip(npcConfiguration[12]):orderDefendTarget(kharaStation)
    getShip(npcConfiguration[13]):orderDefendTarget(kharaStation)
    getShip(npcConfiguration[14]):orderDefendTarget(kharaStation)
end


function gotoMeetTheNeighbours()
    setScenario("scenario_03_Naptime.lua", nil)
end

function launchInterceptorOne()
	--lexTalionis:removeCustom("LaunchFury1")
	furyOneButton = false
	furyOne = launchFuryFromWake("Fury 1")
	furyOne:setAutoCoolant(true)
    return furyOne
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


function createSmallAsteroids()

    Asteroid():setPosition(-906, -1487)
    Asteroid():setPosition(-4876, -872)
    Asteroid():setPosition(-1297, 2897)
    Asteroid():setPosition(-6811, 2975)
    Asteroid():setPosition(-3803, 1789)
    Asteroid():setPosition(-7449, -3042)
    Asteroid():setPosition(-2505, -3959)
    Asteroid():setPosition(1486, 2997)
    Asteroid():setPosition(5778, 2349)
    Asteroid():setPosition(12514, 6833)
    Asteroid():setPosition(2103, -3925)
    Asteroid():setPosition(6475, -3414)
    Asteroid():setPosition(5677, -10594)
    Asteroid():setPosition(9819, -7144)
    Asteroid():setPosition(6188, 12062)
    Asteroid():setPosition(18186, 14232)
    Asteroid():setPosition(14644, -8784)
    Asteroid():setPosition(336, 10608)
    Asteroid():setPosition(7242, 241)
    Asteroid():setPosition(11809, -8786)
    Asteroid():setPosition(301, -6926)
    Asteroid():setPosition(2361, 8311)
    Asteroid():setPosition(8371, 10230)
    Asteroid():setPosition(15143, 14236)
    Asteroid():setPosition(23834, 10230)
    Asteroid():setPosition(16031, -8453)
    Asteroid():setPosition(29739, 11695)
    Asteroid():setPosition(16302, -22624)
    Asteroid():setPosition(-2103, -14308)
    Asteroid():setPosition(3760, -7946)
    Asteroid():setPosition(15257, -17943)
    Asteroid():setPosition(5168, -15217)
    Asteroid():setPosition(-8010, -7491)
    Asteroid():setPosition(3714, -21579)
    Asteroid():setPosition(11440, -14126)
    Asteroid():setPosition(-2602, -10172)
    Asteroid():setPosition(17938, 10732)






end

function createBoundaries()
    Nebula():setPosition(-16678, -8399)
    Nebula():setPosition(34397, -9282)
    Nebula():setPosition(37930, -21509)
    Nebula():setPosition(34825, -17205)
    Nebula():setPosition(38358, -27869)
    BlackHole():setPosition(22783, -19942)
    BlackHole():setPosition(29867, -7625)
    BlackHole():setPosition(33377, -700)
    BlackHole():setPosition(31207, 4756)
    BlackHole():setPosition(30888, 11042)
    BlackHole():setPosition(33887, 15861)
    BlackHole():setPosition(36568, -13528)
    BlackHole():setPosition(43013, -17804)
    BlackHole():setPosition(44513, -25718)
    BlackHole():setPosition(-17837, 8446)
    BlackHole():setPosition(-15828, -14165)
    BlackHole():setPosition(-22649, -10755)
    BlackHole():setPosition(-25031, 1205)
    BlackHole():setPosition(-23490, 5970)
    Nebula():setPosition(-11328, 4460)
    Nebula():setPosition(-4262, 9610)
    Nebula():setPosition(1813, 13836)
    Nebula():setPosition(10595, 16478)
    Nebula():setPosition(19246, 16213)
    Nebula():setPosition(26179, 14034)
    Nebula():setPosition(25628, 6038)
    Nebula():setPosition(28407, -1965)
    Nebula():setPosition(22907, -8929)
    Nebula():setPosition(30495, -11026)
    Nebula():setPosition(25271, -16961)
    Nebula():setPosition(24528, -22680)
    Nebula():setPosition(16406, -23803)
    Nebula():setPosition(7954, -23406)
    Nebula():setPosition(1549, -20567)
    Nebula():setPosition(-4262, -15350)
    Nebula():setPosition(-8950, -9605)
    Nebula():setPosition(-18608, 3120)
    Nebula():setPosition(17616, -15315)
    BlackHole():setPosition(29547, -26774)
    BlackHole():setPosition(23076, -29349)
    BlackHole():setPosition(17133, -30934)
    BlackHole():setPosition(11256, -31066)
    BlackHole():setPosition(4850, -30142)
    BlackHole():setPosition(360, -26576)
    BlackHole():setPosition(-5385, -22680)
    BlackHole():setPosition(-10733, -18124)
    BlackHole():setPosition(-12120, 13638)
    BlackHole():setPosition(-6309, 17402)
    BlackHole():setPosition(-1092, 20175)
    BlackHole():setPosition(5313, 21892)
    BlackHole():setPosition(12708, 23213)
    BlackHole():setPosition(20104, 23279)
    BlackHole():setPosition(26509, 21496)
    BlackHole():setPosition(32782, 20902)
    BlackHole():setPosition(39716, 20506)
    BlackHole():setPosition(47112, 18723)
end