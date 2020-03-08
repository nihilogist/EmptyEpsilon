-- Name: Navigation Online
-- Description: Saturday - 1000 till 1300
-- Type: A small zone of wrecks and no enemies.


require("utils.lua")
require("manageWrecks.lua")
require("manageNPCShips.lua")
-- For this scenario, utils.lua provides:
--   vectorFromAngle(angle, length)
--      Returns a relative vector (x, y coordinates)
--   setCirclePos(obj, x, y, angle, distance)
--      Returns the object with its position set to the resulting coordinates.

function init()
	-- Spawn a player Dauntless.
    lexTalionis = PlayerSpaceship():setFaction("Imperial Navy"):setTemplate("Regency Pattern Dauntless"):setPosition(-15473, 6756):setHeading(30)
    
    
	lexTalionis:setCallSign("Lex Talionis")

    createPlanet()
	setupBoundaries()
	setupBigAsteroids()
    setupSmallerAsteroids()
    createRingSystem()
    
    createAuxiliaryShips()

    --Create all necessary shipwrecks for the area.
    createWreckConfig()
    createWreckedShips(shipwreckDetails)

    -- Create all necessary NPC ships for the area.
    createNPCShipConfig()
    createNPCShips(npcConfiguration)

    -- Create Pike Salvage area
    createPikeSalvageArea()

    -- start initial NPC orders
    startInitialOrders()



    -- Add other useful buttons
    addGMFunction("Next Scene", gotoPsykerfest)
    lexTalionis:addCustomButton("fighterBay","LaunchFury1","Launch Fury 1",launchInterceptorOne)
    lexTalionis:addCustomButton("fighterBay","LaunchFury2","Launch Fury 2",launchInterceptorTwo)
	lexTalionis:addCustomButton("fighterBay","LaunchStarhawk1","Launch Starhawk 1",launchBomberOne)


	
end

function createWreckConfig()
    shipwreckDetails = {
        --{Callsign, posX, posY, template, unscannedAuspex, scannedAuspex, deepscannedAuspex}
        {"Name", -800, -39344, "Small Wreckage", "Unscanned.", "Scanned", "Deepscanned"},
        {"Name", -487, -39364, "Wrecked Freighter", "Unscanned.", "Scanned", "Deepscanned"},
        {"Name", -133, -39253, "Small Wreckage", "Unscanned.", "Scanned", "Deepscanned"},
        {"Name", -300, -39871, "Small Wreckage", "Unscanned.", "Scanned", "Deepscanned"},
        {"Name", 131, -38677, "Small Wreckage", "Unscanned.", "Scanned", "Deepscanned"},
    }


end

function createNPCShipConfig()
    npcConfiguration = {
        --{Callsign, posX, posY, heading, template, faction, unscannedAuspex, scannedAuspex, deepscannedAuspex}
        --{"Callsign", 0, 0, 0, "Template", "Faction", "Unscanned", "Scanned", "Deepscanned"}
        
        {"Name", -1686, -41893, 270, "Armed Merchantman", "Pikes", "Unscanned", "Scanned", "Deepscanned"},
        {"Name", -1021, -42888, 270, "Armed Merchantman", "Pikes", "Unscanned", "Scanned", "Deepscanned"},
        {"Name", -2098, -42689, 270, "Hauler", "Pikes", "Unscanned", "Scanned", "Deepscanned"},
        {"Name", -945, -42175, 270, "Hauler", "Pikes", "Unscanned", "Scanned", "Deepscanned"},
        {"Name", -293, -42418, 270, "Hauler", "Pikes", "Unscanned", "Scanned", "Deepscanned"},
        {"Name", -1605, -37935, 270, "Defensive Turret", "Pikes", "Unscanned", "Scanned", "Deepscanned"},
        {"Name", -1300, -39303, 270, "Defensive Turret", "Pikes", "Unscanned", "Scanned", "Deepscanned"},
        {"Name", 396, -39075, 270, "Defensive Turret", "Pikes", "Unscanned", "Scanned", "Deepscanned"},
        {"Name", 728, -37998, 270, "Defensive Turret", "Pikes", "Unscanned", "Scanned", "Deepscanned"},
        {"Name", -77, -37526, 270, "Defensive Turret", "Pikes", "Unscanned", "Scanned", "Deepscanned"},
        {"Golden Grox", 57155, -9622, 270, "Q Ship", "Wreckage", "Unscanned", "Scanned", "Deepscanned"},
        

    }


end


function createAuxiliaryShips()
    

end

function gotoPsykerfest()
    setScenario("scenario_05_psykerfest.lua", nil)
end

function update(delta)
    updateWreckedShipsCallsigns(shipwreckDetails)
    updateNPCShipCallsigns(npcConfiguration)

end

function startInitialOrders()
    getShip(npcConfiguration[1]):orderIdle()
    getShip(npcConfiguration[2]):orderIdle()
    getShip(npcConfiguration[3]):orderIdle()
    getShip(npcConfiguration[4]):orderIdle()
    getShip(npcConfiguration[5]):orderIdle()
    getShip(npcConfiguration[6]):orderIdle()
end

function createPikeSalvageArea()
    
    Asteroid():setPosition(1421, -41063)
    Asteroid():setPosition(1810, -39721)
    
    Asteroid():setPosition(-1509, -40816)
    Asteroid():setPosition(150, -40145)
    Asteroid():setPosition(927, -38486)
    Asteroid():setPosition(-520, -38768):setSize(320)
    Asteroid():setPosition(-2639, -39298):setSize(240)
    
    Asteroid():setPosition(-697, -39757)
    Asteroid():setPosition(6187, -39227):setSize(402)
    Asteroid():setPosition(2480, -39015)
    Asteroid():setPosition(2904, -44523)
    Asteroid():setPosition(2657, -40745)
    
    Asteroid():setPosition(-4721, -39368)
    Asteroid():setPosition(-6875, -40957)
    Asteroid():setPosition(-5533, -36403)
    Asteroid():setPosition(-2462, -38415)
    Asteroid():setPosition(-3027, -34814)
    Asteroid():setPosition(-2533, -36791)
    Asteroid():setPosition(398, -37568)
    Asteroid():setPosition(-732, -37215)
    Asteroid():setPosition(751, -34285)
    Asteroid():setPosition(2198, -37568)

end


function setupBoundaries() 
    BlackHole():setPosition(-90134, 17170)
    Nebula():setPosition(-94992, 12311)
    BlackHole():setPosition(-86043, 15124)
    BlackHole():setPosition(-78627, 10266)
    Nebula():setPosition(-87705, 9115)
    Nebula():setPosition(-86554, 6941)
    BlackHole():setPosition(-81823, 11928)
    Nebula():setPosition(-78115, 2466)
    Nebula():setPosition(-71595, 165)
    Nebula():setPosition(-65330, -4438)
    Nebula():setPosition(-57786, -8273)
    Nebula():setPosition(-49732, -9936)
    BlackHole():setPosition(-73513, 8092)
    BlackHole():setPosition(-67887, 4640)
    BlackHole():setPosition(-62517, 1955)
    BlackHole():setPosition(-48964, -2903)
    BlackHole():setPosition(-56892, -602)
    Nebula():setPosition(-42444, -11342)
    Nebula():setPosition(-34645, -11086)
    BlackHole():setPosition(-42188, -4566)
    BlackHole():setPosition(-36029, -6132)
    BlackHole():setPosition(-35636, 626)
    BlackHole():setPosition(-33864, 13223)
    BlackHole():setPosition(-31174, 20965)
    BlackHole():setPosition(-35045, 7187)
    Nebula():setPosition(-40910, 73938)
    Nebula():setPosition(-35668, 69974)
    BlackHole():setPosition(-49348, 73426)
    BlackHole():setPosition(-43339, 68312)
    Nebula():setPosition(-31065, 65371)
    Nebula():setPosition(-27485, 59106)
    Nebula():setPosition(-26206, 50029)
    BlackHole():setPosition(-33110, 52074)
    BlackHole():setPosition(-37969, 62558)
    BlackHole():setPosition(-35540, 58339)
    BlackHole():setPosition(-31448, 46577)
    BlackHole():setPosition(-30042, 39544)
    BlackHole():setPosition(-30042, 34814)
    Nebula():setPosition(-23266, 43508)
    Nebula():setPosition(-21603, 37627)
    BlackHole():setPosition(-28353, 29101)
    Nebula():setPosition(-22115, 28805)
    Nebula():setPosition(-25335, 23661)
    Nebula():setPosition(-30335, -6894)
    Nebula():setPosition(-17396, 4727)
    Nebula():setPosition(-13698, 9040)
    Nebula():setPosition(-22886, 7640)
    Nebula():setPosition(-19973, 13298)
    Nebula():setPosition(-26415, 15483)
    Nebula():setPosition(-29779, 467)
    Nebula():setPosition(-29609, 7696)

end

function setupBigAsteroids()
    Asteroid():setPosition(40023, 48041):setSize(423)


end


function setupSmallerAsteroids()


end

function createPlanet()
    navigatorPlanet = Planet()
    navigatorPlanet:setPosition(40070, -20034)
    navigatorPlanet:setScanningParameters(1, 2)
    navigatorPlanet:setDescriptions("Unscanned Planet", "Scanned Planet")
end

function createRingSystem()
    Asteroid():setPosition(21594, -20589):setSize(40)
    Asteroid():setPosition(19426, -21827):setSize(40)
    Asteroid():setPosition(22460, -15945):setSize(40)
    Asteroid():setPosition(19798, -17121):setSize(40)
    Asteroid():setPosition(21284, -24985):setSize(40)
    Asteroid():setPosition(19612, -24427):setSize(40)
    Asteroid():setPosition(22460, -29443):setSize(40)
    Asteroid():setPosition(23141, -31362):setSize(40)
    Asteroid():setPosition(26175, -33839):setSize(40)
    Asteroid():setPosition(20789, -27152):setSize(40)
    Asteroid():setPosition(22894, -27771):setSize(40)
    Asteroid():setPosition(24504, -30805):setSize(40)
    Asteroid():setPosition(26423, -30062):setSize(40)
    Asteroid():setPosition(34287, -35634):setSize(40)
    Asteroid():setPosition(32429, -36749):setSize(40)
    Asteroid():setPosition(32986, -37925):setSize(40)
    Asteroid():setPosition(27476, -33034):setSize(40)
    Asteroid():setPosition(28219, -35387):setSize(40)
    Asteroid():setPosition(30510, -35387):setSize(40)
    Asteroid():setPosition(24008, -5357):setSize(40)
    Asteroid():setPosition(25928, -4366):setSize(40)
    Asteroid():setPosition(23946, -11363):setSize(40)
    Asteroid():setPosition(33729, -2137):setSize(40)
    Asteroid():setPosition(26423, -2633):setSize(40)
    Asteroid():setPosition(27847, -5419):setSize(40)
    Asteroid():setPosition(30386, -465):setSize(40)
    Asteroid():setPosition(29395, -527):setSize(40)
    Asteroid():setPosition(32986, 154):setSize(40)
    Asteroid():setPosition(22089, -9320):setSize(40)
    Asteroid():setPosition(21346, -7462):setSize(40)
    Asteroid():setPosition(19798, -13035):setSize(40)
    Asteroid():setPosition(20665, -14087):setSize(40)
    Asteroid():setPosition(19922, -20031):setSize(40)
    Asteroid():setPosition(43636, -36811):setSize(40)
    Asteroid():setPosition(41345, -36315):setSize(40)
    Asteroid():setPosition(46980, -38854):setSize(40)
    Asteroid():setPosition(48837, -38111):setSize(40)
    Asteroid():setPosition(41469, -38111):setSize(40)
    Asteroid():setPosition(40169, -39969):setSize(40)
    Asteroid():setPosition(45679, -38173):setSize(40)
    Asteroid():setPosition(44317, -37740):setSize(40)
    Asteroid():setPosition(51190, -34582):setSize(40)
    Asteroid():setPosition(47846, -36068):setSize(40)
    Asteroid():setPosition(55896, -31053):setSize(40)
    Asteroid():setPosition(56453, -32167):setSize(40)
    Asteroid():setPosition(54162, -32043):setSize(40)
    Asteroid():setPosition(58310, -28824):setSize(40)
    Asteroid():setPosition(52119, -36625):setSize(40)
    Asteroid():setPosition(53295, -34210):setSize(40)
    Asteroid():setPosition(54472, -35139):setSize(40)
    Asteroid():setPosition(57382, -27771):setSize(40)
    Asteroid():setPosition(38930, -37863):setSize(40)
    Asteroid():setPosition(37692, -36501):setSize(40)
    Asteroid():setPosition(36949, -38421):setSize(40)
    Asteroid():setPosition(57815, -25542):setSize(40)
    Asteroid():setPosition(59858, -25790):setSize(40)
    Asteroid():setPosition(60416, -21641):setSize(40)
    Asteroid():setPosition(58930, -21765):setSize(40)
    Asteroid():setPosition(58125, -18174):setSize(40)
    Asteroid():setPosition(59673, -23065):setSize(40)
    Asteroid():setPosition(58063, -14397):setSize(40)
    Asteroid():setPosition(58930, -11301):setSize(40)
    Asteroid():setPosition(54967, -7772):setSize(40)
    Asteroid():setPosition(60106, -18236):setSize(40)
    Asteroid():setPosition(59982, -20155):setSize(40)
    Asteroid():setPosition(58620, -16130):setSize(40)
    Asteroid():setPosition(57753, -12292):setSize(40)
    Asteroid():setPosition(56143, -10620):setSize(40)
    Asteroid():setPosition(56763, -8081):setSize(40)
    Asteroid():setPosition(52676, -1023):setSize(40)
    Asteroid():setPosition(50261, -2756):setSize(40)
    Asteroid():setPosition(47413, -1951):setSize(40)
    Asteroid():setPosition(51623, -5852):setSize(40)
    Asteroid():setPosition(55338, -5171):setSize(40)
    Asteroid():setPosition(52924, -5109):setSize(40)
    Asteroid():setPosition(49952, 463):setSize(40)
    Asteroid():setPosition(47537, 1268):setSize(40)
    Asteroid():setPosition(37011, 1516):setSize(40)
    Asteroid():setPosition(40169, 2321):setSize(40)
    Asteroid():setPosition(40045, -156):setSize(40)
    Asteroid():setPosition(33729, -2137):setSize(40)
    Asteroid():setPosition(32986, 154):setSize(40)

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