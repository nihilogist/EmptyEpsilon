-- Name: Meet the Neighbours
-- Description: Friday night, 2300-0000
-- Type: Pirate Space Station and environs.


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

    BlackHole():setPosition(4500, 4500)
    BlackHole():setPosition(0, 6000)
    BlackHole():setPosition(-4500, 4500)
    BlackHole():setPosition(-12083, 833)
    BlackHole():setPosition(-14792, -6319)
    BlackHole():setPosition(-20278, -13333)
    BlackHole():setPosition(-17708, -21250)
    BlackHole():setPosition(-9514, -25139)
    BlackHole():setPosition(-694, -29931)
    BlackHole():setPosition(3958, -30972)
    BlackHole():setPosition(10278, -32083)
    BlackHole():setPosition(16944, -32500)
    BlackHole():setPosition(23194, -31875)
    BlackHole():setPosition(29792, -31250)
    BlackHole():setPosition(35903, -29861)
    BlackHole():setPosition(42708, -28472)
    BlackHole():setPosition(49028, -25972)
    BlackHole():setPosition(53611, -23403)
    BlackHole():setPosition(59167, -18958)
    BlackHole():setPosition(62986, -12292)
    BlackHole():setPosition(62986, -4444)
    BlackHole():setPosition(62569, 1806)
    BlackHole():setPosition(63889, 8125)
    BlackHole():setPosition(66597, 15347)
    BlackHole():setPosition(63056, 22847)
    BlackHole():setPosition(57847, 28472)
    BlackHole():setPosition(52014, 32014)
    BlackHole():setPosition(49722, 39306)
    BlackHole():setPosition(46736, 46458)
    BlackHole():setPosition(39861, 48958)
    BlackHole():setPosition(33056, 49722)
    BlackHole():setPosition(24861, 49583)
    BlackHole():setPosition(18958, 48333)
    BlackHole():setPosition(12431, 44097)
    BlackHole():setPosition(9861, 38403)
    BlackHole():setPosition(8542, 31458)
    BlackHole():setPosition(8542, 22222)
    BlackHole():setPosition(6806, 15556)
    BlackHole():setPosition(5486, 11250)
    Nebula():setPosition(-1175, 8006)
    Nebula():setPosition(2740, 13710)
    Nebula():setPosition(1733, 19078)
    Nebula():setPosition(3187, 24558)
    Nebula():setPosition(3746, 30262)
    Nebula():setPosition(4977, 36749)
    Nebula():setPosition(5312, 41782)
    Nebula():setPosition(8220, 46591)
    Nebula():setPosition(12135, 51736)
    Nebula():setPosition(20075, 54196)
    Nebula():setPosition(27792, 54755)
    Nebula():setPosition(32601, 54755)
    Nebula():setPosition(40207, 53749)
    Nebula():setPosition(44345, 51624)
    Nebula():setPosition(50943, 47821)
    Nebula():setPosition(52174, 42341)
    Nebula():setPosition(55417, 36414)
    Nebula():setPosition(59555, 32835)
    Nebula():setPosition(64700, 26460)
    Nebula():setPosition(67943, 21427)
    Nebula():setPosition(69621, 15499)
    Nebula():setPosition(68838, 8901)
    Nebula():setPosition(68726, 2078)
    Nebula():setPosition(66042, -5527)
    Nebula():setPosition(66377, -13915)
    Nebula():setPosition(64476, -18948)
    Nebula():setPosition(59667, -26329)
    Nebula():setPosition(53068, -29013)
    Nebula():setPosition(48818, -32369)
    Nebula():setPosition(43450, -33599)
    Nebula():setPosition(39312, -34605)
    Nebula():setPosition(31148, -35500)
    Nebula():setPosition(21417, -35948)
    Nebula():setPosition(11799, -36507)
    Nebula():setPosition(6542, -36619)
    Nebula():setPosition(-1175, -35388)
    Nebula():setPosition(-7214, -33599)
    Nebula():setPosition(-9451, -30244)
    Nebula():setPosition(-16720, -27224)
    Nebula():setPosition(-20411, -22415)
    Nebula():setPosition(-22648, -16040)
    Nebula():setPosition(-23207, -8211)
    Nebula():setPosition(-20188, -5191)
    Nebula():setPosition(-16497, 513)
    Nebula():setPosition(-13813, 4874)
    Nebula():setPosition(-9003, 7447)
    Nebula():setPosition(-5648, 8677)
    CpuShip():setFaction("Rising Flame"):setTemplate("Pirate Destroyer"):setCallSign("CSS2"):setPosition(27500, -4305):orderRoaming():setWeaponStorage("Torpedo", 2):setWeaponStorage("Macro", 99)
    CpuShip():setFaction("Rising Flame"):setTemplate("Pirate Destroyer"):setCallSign("CCN3"):setPosition(29237, -9237):orderRoaming():setWeaponStorage("Torpedo", 2):setWeaponStorage("Macro", 99)
    CpuShip():setFaction("Rising Flame"):setTemplate("Pirate Destroyer"):setCallSign("VK4"):setPosition(17847, -5555):orderRoaming():setWeaponStorage("Torpedo", 2):setWeaponStorage("Macro", 99)

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

end
