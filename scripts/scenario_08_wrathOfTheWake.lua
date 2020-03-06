-- Name: Wrath of the Wake
-- Description: Saturday 2100-0000
-- Type: A small zone of wrecks and no enemies.


require("utils.lua")
-- For this scenario, utils.lua provides:
--   vectorFromAngle(angle, length)
--      Returns a relative vector (x, y coordinates)
--   setCirclePos(obj, x, y, angle, distance)
--      Returns the object with its position set to the resulting coordinates.

function init()
	-- Spawn a player Dauntless.
	lexTalionis = PlayerSpaceship():setFaction("Imperial Navy"):setTemplate("Regency Pattern Dauntless"):setPosition(34118, 926)
    lexTalionis:setCallSign("Lex Talionis")
    addGMFunction("Next Scene", gotoTeaAndMedals)
    lexTalionis:addCustomButton("fighterBay","LaunchFury1","Launch Fury 1",launchInterceptorOne)
    lexTalionis:addCustomButton("fighterBay","LaunchFury2","Launch Fury 2",launchInterceptorTwo)
	lexTalionis:addCustomButton("fighterBay","LaunchStarhawk1","Launch Starhawk 1",launchBomberOne)
    createScenario()







	
end


function update(delta)


end

function gotoTeaAndMedals()
    setScenario("scenario_09_teaAndMedals.lua", nil)
end

function createScenario()
    Nebula():setPosition(38016, -22307)
    Nebula():setPosition(31417, -16379)
    Nebula():setPosition(22135, -12017)
    Nebula():setPosition(21687, -4748)
    Nebula():setPosition(22135, 2857)
    Nebula():setPosition(23141, 13147)
    Nebula():setPosition(28510, 19522)
    Nebula():setPosition(34102, 25337)
    Nebula():setPosition(41930, 28133)
    Nebula():setPosition(50430, 29028)
    Nebula():setPosition(44503, -23313)
    Nebula():setPosition(53674, -23425)
    Nebula():setPosition(64858, -24096)
    Nebula():setPosition(71904, -24208)
    Nebula():setPosition(59378, -23313)
    Nebula():setPosition(79733, -23425)
    Nebula():setPosition(87562, -24208)
    Nebula():setPosition(97515, -24432)
    Nebula():setPosition(105792, -24096)
    Nebula():setPosition(115746, -24320)
    Nebula():setPosition(123463, -24320)
    Nebula():setPosition(132298, -24432)
    Nebula():setPosition(57588, 27239)
    Nebula():setPosition(65082, 27686)
    Nebula():setPosition(73581, 28357)
    Nebula():setPosition(82193, 28022)
    Nebula():setPosition(89687, 28357)
    Nebula():setPosition(98410, 28581)
    Nebula():setPosition(106015, 29140)
    Nebula():setPosition(114292, 29364)
    Nebula():setPosition(122568, 29252)
    Nebula():setPosition(130173, 28916)
    Nebula():setPosition(136660, 25226)
    Nebula():setPosition(141916, 19857)
    Nebula():setPosition(146390, 13147)
    Nebula():setPosition(145719, 4871)
    Nebula():setPosition(146054, -3070)
    Nebula():setPosition(144377, -11123)
    Nebula():setPosition(139344, -18392)
    BlackHole():setPosition(26577, 24968)
    BlackHole():setPosition(32587, 29987)
    BlackHole():setPosition(38861, 32431)
    BlackHole():setPosition(45201, 33686)
    BlackHole():setPosition(52135, 33950)
    BlackHole():setPosition(58938, 33818)
    BlackHole():setPosition(64815, 34214)
    BlackHole():setPosition(72080, 33818)
    BlackHole():setPosition(78155, 33752)
    BlackHole():setPosition(84627, 33884)
    BlackHole():setPosition(93675, 34016)
    BlackHole():setPosition(99949, 34544)
    BlackHole():setPosition(108270, 34016)
    BlackHole():setPosition(116855, 34214)
    BlackHole():setPosition(124780, 34808)
    BlackHole():setPosition(132375, 33620)
    BlackHole():setPosition(139706, 30846)
    BlackHole():setPosition(145253, 26289)
    BlackHole():setPosition(149612, 21138)
    BlackHole():setPosition(152452, 15260)
    BlackHole():setPosition(153640, 9118)
    BlackHole():setPosition(153838, 1920)
    BlackHole():setPosition(152584, -5080)
    BlackHole():setPosition(151263, -12345)
    BlackHole():setPosition(147366, -18751)
    BlackHole():setPosition(141423, -24827)
    BlackHole():setPosition(135413, -29383)
    BlackHole():setPosition(128413, -31563)
    BlackHole():setPosition(121809, -30902)
    BlackHole():setPosition(113818, -31893)
    BlackHole():setPosition(107081, -30242)
    BlackHole():setPosition(99553, -30308)
    BlackHole():setPosition(91760, -30704)
    BlackHole():setPosition(84495, -30110)
    BlackHole():setPosition(78089, -30308)
    BlackHole():setPosition(70495, -30308)
    BlackHole():setPosition(63494, -29449)
    BlackHole():setPosition(55173, -29780)
    BlackHole():setPosition(47975, -29846)
    BlackHole():setPosition(41701, -29912)
    BlackHole():setPosition(34701, -28327)
    BlackHole():setPosition(28955, -24100)
    BlackHole():setPosition(23804, -19213)
    BlackHole():setPosition(15549, -13666)
    BlackHole():setPosition(14756, -5807)
    BlackHole():setPosition(14756, 929)
    BlackHole():setPosition(15417, 7005)
    BlackHole():setPosition(16077, 12949)
    BlackHole():setPosition(18851, 19487)
    Nebula():setPosition(59460, 20642)
    Nebula():setPosition(64863, 15513)
    Nebula():setPosition(70198, 10999)
    Nebula():setPosition(77858, 7784)
    Nebula():setPosition(83466, 12572)
    Nebula():setPosition(88733, 19069)
    Nebula():setPosition(64689, -16686)
    Nebula():setPosition(72494, -14475)
    Nebula():setPosition(74900, -8751)
    BlackHole():setPosition(67190, -21777)
    BlackHole():setPosition(71510, -15402)
    BlackHole():setPosition(66505, 21582)
    BlackHole():setPosition(72459, 16946)
    BlackHole():setPosition(77569, 14522)
    BlackHole():setPosition(82679, 19738)
    BlackHole():setPosition(65821, 28009)
    BlackHole():setPosition(85472, 26534)
    Nebula():setPosition(47873, -15576)
    Nebula():setPosition(63273, 7850)
    Nebula():setPosition(102660, -17910)
    Nebula():setPosition(111339, -16323)
    Nebula():setPosition(52260, 383)
    Nebula():setPosition(97246, -643)
    Nebula():setPosition(102753, 4863)
    CpuShip():setFaction("Wreckage"):setTemplate("Armed Merchantman"):setCallSign("BR2"):setPosition(50340, 17820):orderRoaming():setWeaponStorage("Macro", 99)
    CpuShip():setFaction("Wreckage"):setTemplate("Armed Merchantman"):setCallSign("VK3"):setPosition(50950, 16437):orderRoaming():setWeaponStorage("Macro", 99)
    CpuShip():setFaction("Wreckage"):setTemplate("Armed Merchantman"):setCallSign("VS4"):setPosition(38566, -15245):orderRoaming():setWeaponStorage("Macro", 99)
    CpuShip():setFaction("Wreckage"):setTemplate("Merchant Raider"):setCallSign("CSS5"):setPosition(39745, -14002):orderRoaming():setWeaponStorage("Macro", 97)
    CpuShip():setFaction("Wreckage"):setTemplate("Hauler"):setCallSign("VS6"):setPosition(57392, -11758):orderRoaming()
    CpuShip():setFaction("Wreckage"):setTemplate("Hauler"):setCallSign("BR7"):setPosition(59469, -9528):orderRoaming()
    CpuShip():setFaction("Wreckage"):setTemplate("Hauler"):setCallSign("VK8"):setPosition(62965, -6083):orderRoaming()
    CpuShip():setFaction("Wreckage"):setTemplate("Hauler"):setCallSign("S9"):setPosition(62864, -2650):orderRoaming()
    CpuShip():setFaction("Wreckage"):setTemplate("Hauler"):setCallSign("VS10"):setPosition(58970, 2296):orderRoaming()
    CpuShip():setFaction("Wreckage"):setTemplate("Hauler"):setCallSign("CV11"):setPosition(56316, 5966):orderRoaming()
    CpuShip():setFaction("Wreckage"):setTemplate("Hauler"):setCallSign("NC12"):setPosition(53593, 9861):orderRoaming()
    CpuShip():setFaction("Wreckage"):setTemplate("Hauler"):setCallSign("VK13"):setPosition(51422, 12015):orderRoaming()
    CpuShip():setFaction("Wreckage"):setTemplate("Q Ship"):setCallSign("CSS14"):setPosition(56954, 4381):orderRoaming():setWeaponStorage("Torpedo", 0):setWeaponStorage("Macro", 97)
    CpuShip():setFaction("Wreckage"):setTemplate("Q Ship"):setCallSign("CV15"):setPosition(57402, 4950):orderRoaming():setWeaponStorage("Torpedo", 0):setWeaponStorage("Macro", 97)
    CpuShip():setFaction("Wreckage"):setTemplate("Q Ship"):setCallSign("NC16"):setPosition(57901, 5553):orderRoaming():setWeaponStorage("Torpedo", 0):setWeaponStorage("Macro", 97)
    CpuShip():setFaction("Wreckage"):setTemplate("Sword"):setCallSign("NC17"):setPosition(76326, -2759):orderRoaming():setWeaponStorage("Macro", 99)
    CpuShip():setFaction("Wreckage"):setTemplate("Sword"):setCallSign("SS18"):setPosition(76465, -1275):orderRoaming():setWeaponStorage("Macro", 99)
    CpuShip():setFaction("Wreckage"):setTemplate("Sword"):setCallSign("BR19"):setPosition(76465, -68):orderRoaming():setWeaponStorage("Macro", 99)
    CpuShip():setFaction("Wreckage"):setTemplate("Lunar"):setCallSign("UTI20"):setPosition(41073, 43558):orderRoaming():setWeaponStorage("Macro", 96)
    CpuShip():setFaction("Wreckage"):setTemplate("Lunar"):setCallSign("VK21"):setPosition(44551, 44178):orderRoaming():setWeaponStorage("Macro", 96)



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