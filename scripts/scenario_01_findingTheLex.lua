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
	setupBigAsteroids()
    setupSmallerAsteroids()
    createAuxiliaryShips()
    createWreckConfig()

    createWreckedShips(shipwreckDetails)

    addGMFunction("Next Scene", gotoMeetTheNeighbours)


	
end

function createWreckConfig()
    shipwreckDetails = {
        --{Callsign, posX, posY, template, unscannedAuspex, scannedAuspex, deepscannedAuspex}
        {"Lawhill", -3568, 3455, "Wrecked Freighter", "Metallic object. Mass reading 20.000IT. Thermal signature consistent with background radiation.", "Voidship. Novus-Pattern Imperial Freighter. Negative biosignature. Negative power.", "Cogitator bank pattern-match complete: Lawhill. Trade licence Carthusia-Castellum. Expired. No significant void-armament. Status: all systems offline."},
        {"Palinuro", 2051, -2127, "Wrecked Freighter", "Metallic object. Mass reading 24.500IT. Thermal signature consistent with background radiation.", "Voidship. Novus-Pattern Imperial Freighter. Negative biosignature. Negative power.", "Cogitator bank pattern-match complete. Palinuro. Trade licence Korimestra-Castellum (subset munitions). No significant void-armament. Status: all systems offline."},
        {"Saint Aglaia", 2788, 1150, "Wrecked Bulk Carrier", "Metallic object. Mass reading 24.460.000IT. Thermal signature consistent with background radiation.", "Voidship. Ursifex-AA3-Pattern Imperial Bulk Freighter. Negative biosignature. Negative power.", "Cogitator bank pattern-match complete. Saint Aglaia. Sector bulktrade licence Bachian IV-Castellum. Single dorsal cannon. Status: all systems offline."},
        {"Hetairos", 8731, 1297, "Wrecked Freighter", "Metallic object. Mass reading 20.000IT. Thermal signature consistent with background radiation.", "Voidship. Novus-Pattern Imperial Freighter. Negative biosignature. Negative power.", "Cogitator bank pattern-match complete: Hetairos. Trade licence Carthusia-Castellum (subset alchemicals). No significant void-armament. Status: all systems offline."},
        {"Adix Rossi", 17858, 947, "Wrecked Freighter", "Metallic object. Mass reading 20.000IT. Thermal signature consistent with background radiation.", "Voidship. Novus-IV-Pattern Imperial Freighter. Negative biosignature. Negative power.", "Cogitator bank pattern-match complete: Adix Rossi. Trade licence Carthusia-Castellum. REVOKED: Impound ship; arrest crew. Prow lance array. Dorsal cannon. Status: all systems offline."},
        {"Atyla", 29132, -1886, "Wrecked Freighter", "Metallic object. Mass reading 20.000IT. Thermal signature consistent with background radiation.", "Voidship. Lampyridae-Pattern Imperial Freighter. Negative biosignature. Negative power.", "Cogitator bank pattern-match complete: Atyla. Trade licence Mazar-63-Kydos (subset alchemicals). No significant void-armament. Status: all systems offline."},
        {"St Ignace's Mercy", 35821, -3046, "Wrecked Bulk Carrier", "Metallic object. Mass reading 24.460.000IT. Thermal signature consistent with background radiation.", "Voidship. Ursifex-AA4-Pattern Imperial Bulk Freighter. Negative biosignature. Negative power.", "Cogitator bank pattern-match complete. St Ignace's Mercy. Sector bulktrade licence Mazar-63-Kydos. Single dorsal cannon. Status: all systems offline."}
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

function setupBigAsteroids()
    Asteroid():setPosition(9815, 1775):setSize(400)
    Asteroid():setPosition(18747, 465):setSize(400)
    Asteroid():setPosition(11141, -2527):setSize(400)
    Asteroid():setPosition(24535, -4064):setSize(400)
    Asteroid():setPosition(33268, -3446):setSize(400)
    Asteroid():setPosition(36486, 263):setSize(400)
    Asteroid():setPosition(17560, 2561):setSize(400)
    Asteroid():setPosition(10983, -593):setSize(300)
    Asteroid():setPosition(22629, -453):setSize(300)
    Asteroid():setPosition(26151, -3888):setSize(300)
    Asteroid():setPosition(27476, -4303):setSize(300)
    Asteroid():setPosition(34816, -1691):setSize(300)
    Asteroid():setPosition(33577, -8596):setSize(300)

end


function setupSmallerAsteroids()
    Asteroid():setPosition(36733, -2108)
    Asteroid():setPosition(35020, -2894)
    Asteroid():setPosition(33272, -1845)
    Asteroid():setPosition(37711, -884)
    Asteroid():setPosition(37449, -2702)
    Asteroid():setPosition(28482, -5004)
    Asteroid():setPosition(28482, -5729)
    Asteroid():setPosition(37904, -1706)
    Asteroid():setPosition(37991, -3244)
    Asteroid():setPosition(36121, -1810)
    Asteroid():setPosition(36540, -3698)
    Asteroid():setPosition(31437, -2684)
    Asteroid():setPosition(31350, -1741)
    Asteroid():setPosition(31944, -5970)
    Asteroid():setPosition(30021, -4956)
    Asteroid():setPosition(40945, -1391)
    Asteroid():setPosition(40001, -482)
    Asteroid():setPosition(39075, -2632)
    Asteroid():setPosition(34338, -2894)
    Asteroid():setPosition(34982, -7460)
    Asteroid():setPosition(34094, -552)
    Asteroid():setPosition(35265, -570)
    Asteroid():setPosition(33954, 916)
    Asteroid():setPosition(32031, -3506)
    Asteroid():setPosition(35590, -3882)
    Asteroid():setPosition(37976, -5425)
    Asteroid():setPosition(33205, -6548)
    Asteroid():setPosition(30422, -3204)
    Asteroid():setPosition(30025, -7436)
    Asteroid():setPosition(30284, -1915)
    Asteroid():setPosition(28064, -2090)
    Asteroid():setPosition(27476, -4303)
    Asteroid():setPosition(27452, -7106)
    Asteroid():setPosition(26237, -6735)
    Asteroid():setPosition(17210, 1356)
    Asteroid():setPosition(17865, 1473)
    Asteroid():setPosition(16509, 935)
    Asteroid():setPosition(17467, 164)
    Asteroid():setPosition(13866, 1426)
    Asteroid():setPosition(19502, -585)
    Asteroid():setPosition(18941, -1356)
    Asteroid():setPosition(20063, 1801)
    Asteroid():setPosition(20390, -1801)
    Asteroid():setPosition(12463, 1310)
    Asteroid():setPosition(11878, 1941)
    Asteroid():setPosition(11528, 1801)
    Asteroid():setPosition(15176, 1871)
    Asteroid():setPosition(25163, -4642)
    Asteroid():setPosition(23310, -5725)
    Asteroid():setPosition(18574, -5201)
    Asteroid():setPosition(19315, -5145)
    Asteroid():setPosition(22174, 1790)
    Asteroid():setPosition(23590, -500)
    Asteroid():setPosition(21092, -4911)
    Asteroid():setPosition(22963, -3788)
    Asteroid():setPosition(23922, -3578)
    Asteroid():setPosition(21790, -2265)
    Asteroid():setPosition(20741, -674)
    Asteroid():setPosition(16438, -2175)
    Asteroid():setPosition(16532, 2315)
    Asteroid():setPosition(15106, 2806)
    Asteroid():setPosition(13726, 2830)
    Asteroid():setPosition(17560, -3453)
    Asteroid():setPosition(12112, -2830)
    Asteroid():setPosition(33322, -4583)
    Asteroid():setPosition(10054, 3531)
    Asteroid():setPosition(10966, 3765)
    Asteroid():setPosition(8932, 3040)
    Asteroid():setPosition(46394, 912)
    Asteroid():setPosition(46979, 3040)
    Asteroid():setPosition(49972, 6992)
    Asteroid():setPosition(44336, 3484)
    Asteroid():setPosition(48125, 7319)
    Asteroid():setPosition(47657, 8535)
    Asteroid():setPosition(38560, 585)
    Asteroid():setPosition(38958, -1684)
    Asteroid():setPosition(32293, -1637)
    Asteroid():setPosition(33603, -1193)
    Asteroid():setPosition(32878, -47)
    Asteroid():setPosition(35848, -818)
    Asteroid():setPosition(48616, 3601)
    Asteroid():setPosition(49878, 2455)
    Asteroid():setPosition(50486, 5285)
    Asteroid():setPosition(45365, 5542)
    Asteroid():setPosition(42185, 8465)
    Asteroid():setPosition(20975, 1239)
    Asteroid():setPosition(21794, 281)
    Asteroid():setPosition(23267, -2151)
    Asteroid():setPosition(25301, -1006)
    Asteroid():setPosition(32457, -2549)
    Asteroid():setPosition(26891, -1777)
    Asteroid():setPosition(41834, -210)
    Asteroid():setPosition(43705, 1497)
    Asteroid():setPosition(41647, -2783)
    Asteroid():setPosition(39542, -2479)
    Asteroid():setPosition(42840, 3975)
    Asteroid():setPosition(14848, 3999)
    Asteroid():setPosition(16555, 3531)
    Asteroid():setPosition(18917, 2128)
    Asteroid():setPosition(15597, -2572)
    Asteroid():setPosition(17842, -2946)
    Asteroid():setPosition(10429, 327)
    Asteroid():setPosition(10616, 3882)
    Asteroid():setPosition(11294, 3858)
    Asteroid():setPosition(13094, 3157)
    Asteroid():setPosition(11364, -1590)
    Asteroid():setPosition(10195, -2806)
    Asteroid():setPosition(8511, -3180)
    Asteroid():setPosition(33369, -10102)
    Asteroid():setPosition(28107, -4981)
    Asteroid():setPosition(2852, 6431)
    Asteroid():setPosition(6313, 6571)
    Asteroid():setPosition(7622, 5168)
    Asteroid():setPosition(7856, -1263)
    Asteroid():setPosition(8207, 5004)
    Asteroid():setPosition(8160, 725)
    Asteroid():setPosition(8277, 2175)
    Asteroid():setPosition(7880, 1567)

end




