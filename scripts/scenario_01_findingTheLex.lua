-- Name: Finding the Lex Talionis
-- Description: Friday Night - 2000 till 2300
-- Type: A small zone of wrecks and no enemies.


require("utils.lua")
require("manageWrecks.lua")
-- For this scenario, utils.lua provides:
--   vectorFromAngle(angle, length)
--      Returns a relative vector (x, y coordinates)
--   setCirclePos(obj, x, y, angle, distance)
--      Returns the object with its position set to the resulting coordinates.

function init()
	-- Spawn a player Dauntless.
    lexTalionis = PlayerSpaceship():setFaction("Imperial Navy"):setTemplate("LexTalionisInitial")
    --lexTalionis = PlayerSpaceship():setFaction("Imperial Navy"):setTemplate("Regency Pattern Dauntless")
	lexTalionis:setCallSign("Lex Talionis")

    
	setupBoundaries()
    setupAsteroids()
    createAuxiliaryShips()
    createWreckConfig()

    createWreckedShips(shipwreckDetails)

    addGMFunction("Next Scene", gotoMeetTheNeighbours)
    lexTalionis:addCustomButton("fighterBay","LaunchFury1","Launch Fury 1",launchInterceptorOne)
    lexTalionis:addCustomButton("fighterBay","LaunchFury2","Launch Fury 2",launchInterceptorTwo)
	lexTalionis:addCustomButton("fighterBay","LaunchStarhawk1","Launch Starhawk 1",launchBomberOne)


	
end

function createWreckConfig()
    shipwreckDetails = {
        --{Callsign, posX, posY, template, unscannedAuspex, scannedAuspex, deepscannedAuspex}
        {"Lawhill", -3568, 3455, "Wrecked Light Freighter", "Metallic object. Mass reading 20.000IT. Thermal signature consistent with background radiation.", "Voidship. Novus-Pattern Imperial Freighter. Negative biosignature. Negative power.", "Cogitator bank pattern-match complete: Lawhill. Trade licence Carthusia-Castellum. Expired. No significant void-armament. Status: all systems offline."},
        {"Palinuro", 2051, -2127, "Wrecked Light Freighter", "Metallic object. Mass reading 24.500IT. Thermal signature consistent with background radiation.", "Voidship. Novus-Pattern Imperial Freighter. Negative biosignature. Negative power.", "Cogitator bank pattern-match complete. Palinuro. Trade licence Korimestra-Castellum (subset munitions). No significant void-armament. Status: all systems offline."},
        {"Saint Aglaia", 2788, 1150, "Wrecked Bulk Carrier", "Metallic object. Mass reading 4.460.000IT. Thermal signature consistent with background radiation.", "Voidship. Ursifex-AA3-Pattern Imperial Bulk Freighter. Negative biosignature. Negative power.", "Cogitator bank pattern-match complete. Saint Aglaia. Sector bulktrade licence Bachian IV-Castellum. Single dorsal cannon. Status: all systems offline."},
        {"Hetairos", 8731, 1297, "Wrecked Light Freighter", "Metallic object. Mass reading 20.000IT. Thermal signature consistent with background radiation.", "Voidship. Novus-Pattern Imperial Freighter. Negative biosignature. Negative power.", "Cogitator bank pattern-match complete: Hetairos. Trade licence Carthusia-Castellum (subset alchemicals). No significant void-armament. Status: all systems offline."},
        {"Adix Rossi", 17858, 947, "Wrecked Light Freighter", "Metallic object. Mass reading 20.000IT. Thermal signature consistent with background radiation.", "Voidship. Novus-IV-Pattern Imperial Freighter. Negative biosignature. Negative power.", "Cogitator bank pattern-match complete: Adix Rossi. Trade licence Carthusia-Castellum. REVOKED: Impound ship; arrest crew. Prow lance array. Dorsal cannon. Status: all systems offline."},
        {"Atyla", 29132, -1886, "Wrecked Light Freighter", "Metallic object. Mass reading 20.000IT. Thermal signature consistent with background radiation.", "Voidship. Lampyridae-Pattern Imperial Freighter. Negative biosignature. Negative power.", "Cogitator bank pattern-match complete: Atyla. Trade licence Mazar-63-Kydos (subset alchemicals). No significant void-armament. Status: all systems offline."},
        {"St Ignace's Mercy", 35821, -3046, "Wrecked Bulk Carrier", "Metallic object. Mass reading 4.224.000IT. Thermal signature consistent with background radiation.", "Voidship. Ursifex-AA4-Pattern Imperial Bulk Freighter. Negative biosignature. Negative power.", "Cogitator bank pattern-match complete. St Ignace's Mercy. Sector bulktrade licence Mazar-63-Kydos. Single dorsal cannon. Status: all systems offline."},
        {"Wreckage", 6854, 4666, "General Wreckage", "Metallic object. Mass reading 187.000IT. Thermal signature consistent with background radiation.", "No match to cogitator arrays. Likely voidship.", "Cogitator bank analysis: wreckage. Naval vessel--type cannot be determined."},
        {"Wreckage", 21181, -345, "General Wreckage", "Metallic object. Mass reading 301.000IT. Thermal signature consistent with background radiation.", "No match to cogitator arrays. Likely voidship.", "Cogitator bank analysis: wreckage. Naval vessel--type cannot be determined."},
        {"Wreckage", 12681, -2175, "General Wreckage", "Metallic object. Mass reading 246.000IT. Thermal signature consistent with background radiation.", "No match to cogitator arrays. Likely voidship.", "Cogitator bank analysis: wreckage. Naval vessel--type cannot be determined."},
        {"Wreckage", 11615, 2111, "Small Wreckage", "Metallic object. Mass reading 5.654IT. Thermal signature consistent with background radiation.", "Metallic residue. Ceramite-composite.", "Cogitator bank analysis: Voidship plating, heavy degradation, originally Naval grade. Composition trace ident: XVII Legion strike cruiser remnant."},
        {"Wreckage", 15934, -1023, "Small Wreckage", "Metallic object. Mass reading 246.000IT. Thermal signature consistent with background radiation.", "No match to cogitator arrays. Likely voidship.", "Cogitator bank analysis: wreckage. Naval vessel--type cannot be determined."},
    }

end

function createAuxiliaryShips()
    CpuShip():setFaction("Kirill"):setTemplate("Tug Ship"):setCallSign("K-AUX Tug Alpha"):setPosition(-2433, 1967):orderIdle():setScanned(true):setDescription("Broadcast Ident matches emission signature. Low orbit Terrier-Pattern maintenance vessel. No void-armament.")
    CpuShip():setFaction("Kirill"):setTemplate("Tug Ship"):setCallSign("K-AUX Tug Delta-07"):setPosition(463, 3223):orderIdle():setScanned(true):setDescription("Broadcast Ident matches emission signature. Low orbit Terrier-Pattern maintenance vessel. No void-armament.")
    CpuShip():setFaction("Kirill"):setTemplate("Tug Ship"):setCallSign("K-AUX Tug Digamma"):setPosition(3790, -305):orderIdle():setScanned(true):setDescription("Broadcast Ident matches emission signature. Low orbit Terrier-Pattern maintenance vessel. No void-armament.")

end

function gotoMeetTheNeighbours()
    setScenario("scenario_02_meetTheNeighbours.lua", nil)
end

function update(delta)
    updateWreckedShipsCallsigns(shipwreckDetails)
end


function setupBoundaries() 
	Nebula():setPosition(-9792, 156)
    Nebula():setPosition(-4155, -6149)
    Nebula():setPosition(5779, -8263)
    Nebula():setPosition(14833, -8228)
    Nebula():setPosition(-5423, 9104)
    Nebula():setPosition(3243, 12134)
    Nebula():setPosition(11909, 10232)
    Nebula():setPosition(20293, 7554)
    Nebula():setPosition(28501, 3609)
    Nebula():setPosition(21103, -11434)
    Nebula():setPosition(31214, -14146)
    Nebula():setPosition(37625, 6638)
    Nebula():setPosition(40443, -10306)
    Nebula():setPosition(47595, -3754)
    Nebula():setPosition(45094, 11535)
    Nebula():setPosition(53619, 755)
    BlackHole():setPosition(-6832, 11007)
    BlackHole():setPosition(-879, 13367)
    BlackHole():setPosition(5955, 15234)
    BlackHole():setPosition(13353, 13543)
    BlackHole():setPosition(19412, 11007)
    BlackHole():setPosition(26669, 7766)
    BlackHole():setPosition(33574, 9175)
    BlackHole():setPosition(40584, 13120)
    BlackHole():setPosition(-13138, 7061)
    BlackHole():setPosition(-13984, -900)
    BlackHole():setPosition(-10919, -6572)
    BlackHole():setPosition(-5353, -10870)
    BlackHole():setPosition(2080, -12878)
    BlackHole():setPosition(9936, -13054)
    BlackHole():setPosition(16770, -14534)
    BlackHole():setPosition(24344, -17387)
    BlackHole():setPosition(32130, -18831)
    BlackHole():setPosition(37660, -17281)
    BlackHole():setPosition(44917, -14076)
    BlackHole():setPosition(49356, -8968)
    BlackHole():setPosition(53337, -4529)
    BlackHole():setPosition(46256, 18545)
end




function setupAsteroids()
    Asteroid():setPosition(9815, 1775):setSize(420)
    Asteroid():setPosition(18504, 159):setSize(400)
    Asteroid():setPosition(11141, -2527):setSize(365)
    Asteroid():setPosition(24535, -4064):setSize(400)
    Asteroid():setPosition(14424, -1288):setSize(400)
    Asteroid():setPosition(15746, 2253):setSize(400)
    Asteroid():setPosition(11924, 2997):setSize(400)
    Asteroid():setPosition(10983, -593):setSize(300)
    Asteroid():setPosition(22629, -453):setSize(300)
    Asteroid():setPosition(9252, -1534):setSize(300)
    Asteroid():setPosition(18040, -2101):setSize(300)
    Asteroid():setPosition(15972, 467):setSize(300)
    Asteroid():setPosition(21059, -1481):setSize(300)
    Asteroid():setPosition(17889, 50):setSize(119)
    Asteroid():setPosition(16176, -736):setSize(128)
    Asteroid():setPosition(14428, 313):setSize(119)
    Asteroid():setPosition(18867, 1274):setSize(119)
    Asteroid():setPosition(18605, -544):setSize(128)
    Asteroid():setPosition(28482, -5004):setSize(125)
    Asteroid():setPosition(28482, -5729):setSize(116)
    Asteroid():setPosition(19060, 452):setSize(124)
    Asteroid():setPosition(19147, -1086):setSize(119)
    Asteroid():setPosition(17277, 348):setSize(128)
    Asteroid():setPosition(17696, -1540):setSize(118)
    Asteroid():setPosition(12397, 495):setSize(122)
    Asteroid():setPosition(31350, -1741):setSize(124)
    Asteroid():setPosition(13100, -3812):setSize(115)
    Asteroid():setPosition(30021, -4956):setSize(128)
    Asteroid():setPosition(20845, -2356):setSize(128)
    Asteroid():setPosition(19901, -1447):setSize(120)
    Asteroid():setPosition(20231, -474):setSize(126)
    Asteroid():setPosition(15494, -736):setSize(119)
    Asteroid():setPosition(34982, -7460):setSize(110)
    Asteroid():setPosition(15250, 1606):setSize(115)
    Asteroid():setPosition(16421, 1588):setSize(60)
    Asteroid():setPosition(33954, 916):setSize(117)
    Asteroid():setPosition(13187, -1348):setSize(128)
    Asteroid():setPosition(16746, -1724):setSize(118)
    Asteroid():setPosition(19132, -3267):setSize(125)
    Asteroid():setPosition(14361, -4390):setSize(127)
    Asteroid():setPosition(30422, -3204):setSize(112)
    Asteroid():setPosition(30025, -7436):setSize(113)
    Asteroid():setPosition(30284, -1915):setSize(87)
    Asteroid():setPosition(28064, -2090):setSize(115)
    Asteroid():setPosition(27476, -4303):setSize(117)
    Asteroid():setPosition(27452, -7106):setSize(114)
    Asteroid():setPosition(26237, -6735):setSize(118)
    Asteroid():setPosition(17210, 1356):setSize(115)
    Asteroid():setPosition(17865, 1473):setSize(122)
    Asteroid():setPosition(16509, 935):setSize(128)
    Asteroid():setPosition(17467, 164):setSize(120)
    Asteroid():setPosition(13866, 1426):setSize(113)
    Asteroid():setPosition(19502, -585):setSize(35)
    Asteroid():setPosition(18941, -1356):setSize(120)
    Asteroid():setPosition(20063, 1801):setSize(113)
    Asteroid():setPosition(20390, -1801):setSize(117)
    Asteroid():setPosition(12463, 1310):setSize(111)
    Asteroid():setPosition(11878, 1941):setSize(111)
    Asteroid():setPosition(11528, 1801):setSize(124)
    Asteroid():setPosition(15176, 1871):setSize(120)
    Asteroid():setPosition(25163, -4642):setSize(122)
    Asteroid():setPosition(23310, -5725):setSize(121)
    Asteroid():setPosition(18574, -5201):setSize(35)
    Asteroid():setPosition(19315, -5145):setSize(129)
    Asteroid():setPosition(22174, 1790):setSize(122)
    Asteroid():setPosition(23590, -500):setSize(111)
    Asteroid():setPosition(21092, -4911):setSize(113)
    Asteroid():setPosition(22963, -3788):setSize(76)
    Asteroid():setPosition(23922, -3578):setSize(110)
    Asteroid():setPosition(21790, -2265):setSize(126)
    Asteroid():setPosition(19031, -700):setSize(123)
    Asteroid():setPosition(16438, -2175):setSize(115)
    Asteroid():setPosition(16532, 2315):setSize(123)
    Asteroid():setPosition(15106, 2806):setSize(119)
    Asteroid():setPosition(13726, 2830):setSize(123)
    Asteroid():setPosition(17560, -3453):setSize(129)
    Asteroid():setPosition(12112, -2830):setSize(124)
    Asteroid():setPosition(14478, -2425):setSize(111)
    Asteroid():setPosition(10054, 3531):setSize(123)
    Asteroid():setPosition(10966, 3765):setSize(129)
    Asteroid():setPosition(8932, 3040):setSize(127)
    Asteroid():setPosition(19683, -1948):setSize(14)
    Asteroid():setPosition(19716, 2743):setSize(117)
    Asteroid():setPosition(20114, 474):setSize(125)
    Asteroid():setPosition(13449, 521):setSize(130)
    Asteroid():setPosition(14759, 965):setSize(129)
    Asteroid():setPosition(14034, 2111):setSize(113)
    Asteroid():setPosition(17004, 1340):setSize(128)
    Asteroid():setPosition(20975, 1239):setSize(114)
    Asteroid():setPosition(21794, 281):setSize(128)
    Asteroid():setPosition(23267, -2151):setSize(116)
    Asteroid():setPosition(25301, -1006):setSize(113)
    Asteroid():setPosition(13613, -391):setSize(117)
    Asteroid():setPosition(26891, -1777):setSize(111)
    Asteroid():setPosition(21734, -1175):setSize(121)
    Asteroid():setPosition(19052, -3935):setSize(98)
    Asteroid():setPosition(21547, -3748):setSize(117)
    Asteroid():setPosition(19442, -3444):setSize(113)
    Asteroid():setPosition(14848, 3999):setSize(121)
    Asteroid():setPosition(16555, 3531):setSize(123)
    Asteroid():setPosition(18917, 2128):setSize(118)
    Asteroid():setPosition(15597, -2572):setSize(124)
    Asteroid():setPosition(17842, -2946):setSize(115)
    Asteroid():setPosition(10429, 327):setSize(114)
    Asteroid():setPosition(10616, 3882):setSize(127)
    Asteroid():setPosition(11294, 3858):setSize(114)
    Asteroid():setPosition(13094, 3157):setSize(160)
    Asteroid():setPosition(11364, -1590):setSize(123)
    Asteroid():setPosition(10195, -2806):setSize(126)
    Asteroid():setPosition(8511, -3180):setSize(120)
    Asteroid():setPosition(33369, -10102):setSize(127)
    Asteroid():setPosition(28107, -4981):setSize(127)
    Asteroid():setPosition(2852, 6431):setSize(124)
    Asteroid():setPosition(6313, 6571):setSize(34)
    Asteroid():setPosition(7622, 5168):setSize(129)
    Asteroid():setPosition(7856, -1263):setSize(128)
    Asteroid():setPosition(8207, 5004):setSize(120)
    Asteroid():setPosition(8160, 725):setSize(112)
    Asteroid():setPosition(8277, 2175):setSize(123)
    Asteroid():setPosition(7880, 1567):setSize(78)
    Asteroid():setPosition(10422, 4650):setSize(126)
    Asteroid():setPosition(11958, 4812):setSize(124)
    Asteroid():setPosition(14591, 5382):setSize(113)
    Asteroid():setPosition(15903, 4030):setSize(126)
    Asteroid():setPosition(13544, 4640):setSize(124)
    Asteroid():setPosition(14367, 3440):setSize(111)
    Asteroid():setPosition(12700, 2271):setSize(120)
    Asteroid():setPosition(14581, 1478):setSize(280)
    Asteroid():setPosition(11541, 888):setSize(124)
    Asteroid():setPosition(12852, 369):setSize(115)
    Asteroid():setPosition(15211, -1786):setSize(117)
    Asteroid():setPosition(16818, -1003):setSize(117)
    Asteroid():setPosition(16075, -1471):setSize(180)
    Asteroid():setPosition(17275, -1451):setSize(119)
    Asteroid():setPosition(17224, -2396):setSize(129)
    Asteroid():setPosition(20824, -3718):setSize(111)
    Asteroid():setPosition(18658, -2833):setSize(122)
    Asteroid():setPosition(22806, -1634):setSize(110)
    Asteroid():setPosition(22461, -4125):setSize(119)
    Asteroid():setPosition(19848, -3901):setSize(128)
    Asteroid():setPosition(23711, -4796):setSize(44)
    Asteroid():setPosition(3035, 5094):setSize(117)
    Asteroid():setPosition(5899, 4122):setSize(118)
    Asteroid():setPosition(424, 5257):setSize(129)
    Asteroid():setPosition(-4764, 2104):setSize(112)
    Asteroid():setPosition(7484, -2561):setSize(121)
    Asteroid():setPosition(-2206, -1156):setSize(121)
    Asteroid():setPosition(1162, -4686):setSize(112)
    Asteroid():setPosition(4674, -2705):setSize(119)
    Asteroid():setPosition(8079, 3852):setSize(114)
    Asteroid():setPosition(4837, 5653):setSize(111)
    Asteroid():setPosition(10579, -1570):setSize(111)
    Asteroid():setPosition(6478, -600):setSize(42)
    Asteroid():setPosition(13455, 2165):setSize(111)
    Asteroid():setPosition(6095, 2795):setSize(115)
    Asteroid():setPosition(14485, 4446):setSize(128)
    Asteroid():setPosition(13344, -2140):setSize(120)
    Asteroid():setPosition(10911, -3638):setSize(56)
    Asteroid():setPosition(14927, -2931):setSize(123)
    Asteroid():setPosition(9150, -2421):setSize(126)
    Asteroid():setPosition(6895, -1783):setSize(114)
    Asteroid():setPosition(9711, 4565):setSize(120)
    Asteroid():setPosition(6291, 5680):setSize(115)
    Asteroid():setPosition(12647, 4046):setSize(128)
    Asteroid():setPosition(17471, 2582):setSize(115)
    Asteroid():setPosition(21623, 2123):setSize(112)
    Asteroid():setPosition(16629, 217):setSize(129)
    Asteroid():setPosition(16442, -2812):setSize(125)
    Asteroid():setPosition(18543, -3399):setSize(116)
    Asteroid():setPosition(15472, -1178):setSize(128)
    Asteroid():setPosition(17429, -2029):setSize(119)
    Asteroid():setPosition(12553, -974):setSize(125)
    Asteroid():setPosition(13072, 1383):setSize(126)
    Asteroid():setPosition(10749, 2642):setSize(121)
    Asteroid():setPosition(14161, 898):setSize(122)
    Asteroid():setPosition(15548, 1238):setSize(119)
    Asteroid():setPosition(9243, 277):setSize(118)
    Asteroid():setPosition(10077, 949):setSize(118)
    Asteroid():setPosition(12111, 21):setSize(115)
    Asteroid():setPosition(11592, -260):setSize(123)
    Asteroid():setPosition(10681, 1153):setSize(116)
    Asteroid():setPosition(10741, 157):setSize(126)
    Asteroid():setPosition(7039, 1306):setSize(115)
    Asteroid():setPosition(10086, -311):setSize(125)
    Asteroid():setPosition(9881, 498):setSize(127)
    Asteroid():setPosition(13157, -915):setSize(115)
    Asteroid():setPosition(12298, -1476):setSize(128)
    Asteroid():setPosition(14161, -2166):setSize(43)
    Asteroid():setPosition(13234, -2889):setSize(120)
    Asteroid():setPosition(11906, -2072):setSize(122)
    Asteroid():setPosition(14059, -693):setSize(116)
    Asteroid():setPosition(11489, 166):setSize(23)
    Asteroid():setPosition(10800, 1902):setSize(115)
    Asteroid():setPosition(11430, 2421):setSize(123)
    Asteroid():setPosition(10239, 2753):setSize(130)
    Asteroid():setPosition(11711, 1292):setSize(114)
    Asteroid():setPosition(14530, 2758):setSize(129)
    Asteroid():setPosition(18072, 2098):setSize(78)
    Asteroid():setPosition(8961, 3918):setSize(120)
    Asteroid():setPosition(6850, 3605):setSize(116)
    Asteroid():setPosition(5551, -1694):setSize(125)


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
    setCirclePos(launchedVehicle, x, y, direction - 270, 510)
    launchedVehicle:setHeading(direction - 180)
    launchedVehicle:commandTargetRotation(direction - 270)
    launchedVehicle:commandImpulse(0.5)
    return launchedVehicle
end