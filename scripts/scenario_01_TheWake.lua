-- Name: Finding the Lex Talionis
-- Description: Friday Night - 2000 till 2300
-- Type: A small zone of wrecks and no enemies.


require("utils.lua")
-- For this scenario, utils.lua provides:
--   vectorFromAngle(angle, length)
--      Returns a relative vector (x, y coordinates)
--   setCirclePos(obj, x, y, angle, distance)
--      Returns the object with its position set to the resulting coordinates.

function init()
	-- Spawn a player Dauntless.
	lexTalionis = PlayerSpaceship():setFaction("Imperial Navy"):setTemplate("LexTalionisInitial")
	lexTalionis:setCallSign("Lex Talionis")

    
	setupBoundaries()
	setupBigAsteroids()
	setupSmallerAsteroids()


	
end


function update(delta)


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
    Asteroid():setPosition(2569, -396):setSize(450)
    Asteroid():setPosition(2913, 3167):setSize(350)
    Asteroid():setPosition(6986, 2044):setSize(450)
    Asteroid():setPosition(8610, -649):setSize(250)
    Asteroid():setPosition(10424, 1922):setSize(450)
    Asteroid():setPosition(14605, -1420):setSize(350)
    Asteroid():setPosition(16595, 840):setSize(450)
    Asteroid():setPosition(18238, 1434):setSize(250)
    Asteroid():setPosition(20280, 1558):setSize(450)
    Asteroid():setPosition(23966, -224):setSize(350)
    Asteroid():setPosition(25953, -2074):setSize(450)
    Asteroid():setPosition(26748, -4047):setSize(250)
    Asteroid():setPosition(27351, -5417):setSize(450)
    Asteroid():setPosition(28845, -6610):setSize(350)
    Asteroid():setPosition(30763, -6075):setSize(450)
    Asteroid():setPosition(32092, -4431):setSize(250)
    Asteroid():setPosition(33134, -2499):setSize(450)
    Asteroid():setPosition(34161, -251):setSize(350)
    Asteroid():setPosition(34367, 927):setSize(450)
    Asteroid():setPosition(26241, -8789):setSize(250)
    Asteroid():setPosition(34751, -8967):setSize(450)
    Asteroid():setPosition(40794, -2732):setSize(350)
    Asteroid():setPosition(37998, 927):setSize(450)
    Asteroid():setPosition(41616, 2051):setSize(250)
    Asteroid():setPosition(43261, 187):setSize(450)
    Asteroid():setPosition(44096, 5723):setSize(350)
    Asteroid():setPosition(47056, 2859):setSize(450)
    Asteroid():setPosition(19879, -4156):setSize(250)
    Asteroid():setPosition(23594, -6541):setSize(450)
    Asteroid():setPosition(-3188, 692):setSize(350)
    Asteroid():setPosition(-803, 3898):setSize(450)
	Asteroid():setPosition(1191, -4078):setSize(250)
	Asteroid():setPosition(28358, -3151):setSize(200)
    Asteroid():setPosition(28535, -5327):setSize(250)
    Asteroid():setPosition(29659, -3837):setSize(180)
    Asteroid():setPosition(30061, -5067):setSize(270)
    Asteroid():setPosition(30889, -2323):setSize(190)
    Asteroid():setPosition(31504, -3553):setSize(220)
    Asteroid():setPosition(27388, -2028):setSize(250)

end


function setupSmallerAsteroids()
	Asteroid():setPosition(8454, 4556):setSize(180)
    Asteroid():setPosition(3371, 5923)
    Asteroid():setPosition(5771, 4710):setSize(140)
	Asteroid():setPosition(-3685, 2749)
    Asteroid():setPosition(-2008, 2530):setSize(180)
    Asteroid():setPosition(6622, 92)
    Asteroid():setPosition(3500, -2449):setSize(140)
    Asteroid():setPosition(6790, -2578)
    Asteroid():setPosition(4906, -901)
    Asteroid():setPosition(8441, 1730):setSize(180)
    Asteroid():setPosition(8454, 4556)
    Asteroid():setPosition(15102, 896)
    Asteroid():setPosition(11938, -629):setSize(140)
    Asteroid():setPosition(15459, 3476)
    Asteroid():setPosition(12214, 4141)
    Asteroid():setPosition(35585, -6416):setSize(180)
    Asteroid():setPosition(38961, -1394)
    Asteroid():setPosition(39169, -3732)
    Asteroid():setPosition(37489, -4719):setSize(180)
    Asteroid():setPosition(36139, -2849):setSize(140)
    Asteroid():setPosition(33091, -6312)
    Asteroid():setPosition(32935, -8460):setSize(180)

end

function createWrecks()
    CpuShip():setFaction("Wreckage"):setTemplate("Wrecked Bulk Carrier"):setCallSign("BR2"):setPosition(12840, 2246):orderIdle()
    CpuShip():setFaction("Wreckage"):setTemplate("Wrecked Freighter"):setCallSign("CV3"):setPosition(9119, 527):orderIdle()
    CpuShip():setFaction("Wreckage"):setTemplate("Wrecked Destroyer"):setCallSign("CCN5"):setPosition(21791, -2593):orderIdle()
    CpuShip():setFaction("Wreckage"):setTemplate("Wrecked Freighter"):setCallSign("CSS4"):setPosition(28095, -6087):orderIdle()
    CpuShip():setFaction("Wreckage"):setTemplate("Wrecked Bulk Carrier"):setCallSign("NC6"):setPosition(32039, -6303):orderIdle()

end