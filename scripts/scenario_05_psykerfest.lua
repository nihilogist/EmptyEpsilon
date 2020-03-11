-- Name: Psykerfest
-- Description: Saturday: 1300-1600
-- Type: A small zone of wrecks and no enemies.


require("utils.lua")
require("manageNPCShips.lua")
require("manageWrecks.lua")
-- For this scenario, utils.lua provides:
--   vectorFromAngle(angle, length)
--      Returns a relative vector (x, y coordinates)
--   setCirclePos(obj, x, y, angle, distance)
--      Returns the object with its position set to the resulting coordinates.

function init()
	-- Spawn a player Dauntless.
	lexTalionis = PlayerSpaceship():setFaction("Imperial Navy"):setTemplate("Regency Pattern Dauntless")
    lexTalionis:setCallSign("Lex Talionis")
    addGMFunction("Next Scene", gotoObjectiveSighted)
    lexTalionis:addCustomButton("fighterBay","LaunchFury1","Launch Fury 1",launchInterceptorOne)
    lexTalionis:addCustomButton("fighterBay","LaunchFury2","Launch Fury 2",launchInterceptorTwo)
	lexTalionis:addCustomButton("fighterBay","LaunchStarhawk1","Launch Starhawk 1",launchBomberOne)

    -- Create all the NPC ships.
    createNPCShipConfig()
    createNPCShips(npcConfiguration)

    -- Create the wrecks
    createWreckConfig()
    createWreckedShips(shipwreckDetails)

    
    createCultBase()
    createAsteroids()
    createNebulas()
    createMines()

    initialiseNPCShipOrders()




	
end


function update(delta)
    updateWreckedShipsCallsigns(shipwreckDetails)
    updateNPCShipCallsigns(npcConfiguration)

end

function createNPCShipConfig() 
    npcConfiguration = {
        --{Callsign, posX, posY, heading, template, faction, unscannedAuspex, scannedAuspex, deepscannedAuspex}
        --{"Callsign", 0, 0, 0, "Template", "Wake Cult", "Unscanned", "Scanned", "Deepscanned"}
        {"Rebirth", 67343, 47210, 30, "Falchion", "Wake Cult", "Metallic object. Mass reading 910,000IT. Thermal signature variable, consistent with Naval plasma reactor.", "Voidship. Sworrrrd-patt-patt Sword-pattern Frigate class. Biosignatures present. Reactor active.", "Error-errormatch. ??? ??@Template mismatch. EmissionSig mismatch. DataCorruption??? Weapon batteries detected."},
        {"Feathered Glass", 66497, 490651, 30, "Sabre", "Wake Cult", "Metallic object. Mass reading 891,000IT. Thermal signature variable, consistent with Naval plasma reactor.", "Voidship. 96% probability match Sword-pattern Frigate class. Biosignatures present. Reactor active.", "Standard Template Construct mismatch. Variations in hull plating %% Turret config. Weapons batteries detected."},
        {"Tears of Change", 87755, 31092, 270, "Q Ship", "Wake Cult", "Metallic object. Mass reading 711.500IT. Thermal signature variable, consistent with plasma reactor.", "Voidship. Caballus-pattern Imperial Freightship. Biosignatures present. Reactor active.", "MISMATCH Cogitation projection designate ident Son Of Holub. Broadcast ident Tears Of Change. MISMATCH. Turret configuration mistmatch detected. Multiple primary battery targeting matrices. Plasma warhead emissions."},
        {"Everpromise", 90743, 35741, 270, "Sabre", "Wake Cult", "Metallic object. Mass reading 891,000IT. Thermal signature variable, consistent with Naval plasma reactor.", "Voidship. 92% probability match Sword-pattern Frigate class. Biosignatures present. Reactor active.", "Standard Template Construct mismatch. Variations in hull plating %% Turret config. Weapons batteries detected."},
        {"Fate's Warning", 87816, 29059, 270, "Q Ship", "Wake Cult", "Metallic object. Mass reading 713.300IT. Thermal signature variable, consistent with naval plasma reactor.", "Voidship. Caballus-pattern Imperial Freightship. Biosignatures present. Reactor active.", "Broadcast Ident Fate's Warning. Mismatch in mass:dimension ratio. Query: additional plating. Weapons batteries detected."},
        {"Architect's Blade", 68890, -794, 180, "Sabre", "Wake Cult", "Metallic object. Mass reading 891,000IT. Thermal signature variable, consistent with Naval plasma reactor.", "Voidship. 92% probability match Sword-pattern Frigate class. Biosignatures present. Reactor active.", "Standard Template Construct mismatch. Varrrriations in data hull corruption plate turret config. Weapon batteries detected."},
        {"Scythe", 68926, -2262, 180, "Sabre", "Wake Cult", "Metallic object. Mass reading 891,000IT. Thermal signature variable, consistent with Naval plasma reactor.", "Voidship. 92% probability match Sword-pattern Frigate class. Biosignatures present. Reactor active.", "Standard Template Construct mismatch. Weapon batteries detected."},
        {"Freedom of Thought", 43958, 31566, 0, "Merchant Raider", "Wake Cult", "Metallic object. Mass reading 700.500IT. Thermal signature variable, consistent with plasma reactor.", "Voidship. Caballus-pattern Imperial Freightship. Biosignatures present. Reactor active.", "Negative Ident Patternmatch. IFF broadcast callsign FREEDOM OF THOUGHT. Weapons batteries detected."},
        {"Clarity of Angels", 42607, 34030, 0, "Armed Merchantman", "Wake Cult", "Metallic object. Mass reading 551.100IT. Thermal signature variable, consistent with plasma reactor.", "Voidship. Asinus-pattern Imperial Freightship. Biosignatures present. Reactor Active.", "Negative Ident Patternmatch. IFF broadcast callsign CLARITY OF ANGELS. Weapon batteries detected."},
        {"Suffering's End", 42636, 31600, 0, "Armed Merchantman", "Wake Cult", "Metallic object. Mass reading 549.100IT. Thermal signature variable, consistent with plasma reactor.", "Voidship. Asinus-pattern Imperial Freightship. Biosignatures present. Reactor Active.", "Negative Ident Patternmatch. IFF broadcast callsign SUFFERING'S END. Weapon batteries detected."},        
        {"Cyclops 1", 84110, 36334, 200, "Hauler", "Wake Cult", "Metallic object. Mass reading 6.341IT. Thermal signature variable, consistent with low-power plasma reactor.", "Voidship. Orbital lifter. Biosignatures present. Reactor active.", "PatternMatch: Modified Orbital lifter. Lascannon array detected."},
        {"Cyclops 2", 85072, 36718, 200, "Hauler", "Wake Cult", "Metallic object. Mass reading 6.341IT. Thermal signature variable, consistent with low-power plasma reactor.", "Voidship. Orbital lifter. Biosignatures present. Reactor active.", "PatternMatch: Modified Orbital lifter. Lascannon array detected."},
        {"Cyclops 3", 86065, 37069, 200, "Hauler", "Wake Cult", "Metallic object. Mass reading 6.341IT. Thermal signature variable, consistent with low-power plasma reactor.", "Voidship. Orbital lifter. Biosignatures present. Reactor active.", "PatternMatch: Modified Orbital lifter. Lascannon array detected."},
        {"Scourge 1", 87602, 34676, 200, "WakeBomber", "Wake Cult", "Metallic object. Mass reading 6.341IT. Thermal signature variable, consistent with low-power plasma reactor.", "Voidship. Orbital lifter. Biosignatures present. Reactor active.", "PatternMatch: Modified Orbital lifter. Plasma munitions detected."},
        {"Scourge 2", 86859, 38763, 200, "WakeBomber", "Wake Cult", "Metallic object. Mass reading 6.341IT. Thermal signature variable, consistent with low-power plasma reactor.", "Voidship. Orbital lifter. Biosignatures present. Reactor active.", "PatternMatch: Modified Orbital lifter. Plasma munitions detected."},
        {"Scourge 3", 87425, 37471, 200, "WakeBomber", "Wake Cult", "Metallic object. Mass reading 6.341IT. Thermal signature variable, consistent with low-power plasma reactor.", "Voidship. Orbital lifter. Biosignatures present. Reactor active.", "PatternMatch: Modified Orbital lifter. Plasma munitions detected."},
        {"Scourge 4", 87524, 36106, 200, "WakeBomber", "Wake Cult", "Metallic object. Mass reading 6.341IT. Thermal signature variable, consistent with low-power plasma reactor.", "Voidship. Orbital lifter. Biosignatures present. Reactor active.", "PatternMatch: Modified Orbital lifter. Plasma munitions detected."}
    }

end

function createWreckConfig()
    shipwreckDetails = {
        --{Callsign, posX, posY, template, unscannedAuspex, scannedAuspex, deepscannedAuspex}
        {"Name", 1460, 3568, "Wrecked Light Freighter", "Unscanned", "Scanned", "Deepscanned"},
        {"Name", -4808, 4374, "Small Wreckage", "Unscanned", "Scanned", "Deepscanned"},
        {"Name", -3568, 3455, "Wrecked Light Freighter", "Unscanned", "Scanned", "Deepscanned"},
        {"Name", -6936, 769, "Small Wreckage", "Unscanned", "Scanned", "Deepscanned"},
        {"Name", -665, -2515, "Wrecked Freighter", "Unscanned", "Scanned", "Deepscanned"},
        {"Name", 6309, -2141, "Wrecked Frigate", "Unscanned", "Scanned", "Deepscanned"},
        {"Name", 6258, -4099, "Small Wreckage", "Unscanned", "Scanned", "Deepscanned"},
        {"Name", 11151, 6835, "Wrecked Frigate", "Unscanned", "Scanned", "Deepscanned"},
        {"Name", 19090, 13515, "General Wreckage", "Unscanned", "Scanned", "Deepscanned"},
        {"Name", 3885, -5262, "General Wreckage", "Unscanned", "Scanned", "Deepscanned"},
    }

end

function initialiseNPCShipOrders()
    getShip(npcConfiguration[1]):orderIdle()
    getShip(npcConfiguration[2]):orderIdle()
    getShip(npcConfiguration[3]):orderIdle()
    getShip(npcConfiguration[4]):orderIdle()
    getShip(npcConfiguration[5]):orderIdle()
    getShip(npcConfiguration[6]):orderIdle()
    getShip(npcConfiguration[7]):orderIdle()
    getShip(npcConfiguration[8]):orderIdle()
    getShip(npcConfiguration[9]):orderIdle()
    getShip(npcConfiguration[10]):orderIdle()
    getShip(npcConfiguration[11]):orderIdle()
    getShip(npcConfiguration[12]):orderIdle()
    getShip(npcConfiguration[13]):orderIdle()
    getShip(npcConfiguration[14]):orderIdle()
    getShip(npcConfiguration[15]):orderIdle()
    getShip(npcConfiguration[16]):orderIdle()
    getShip(npcConfiguration[17]):orderIdle()
end

function gotoObjectiveSighted()
    setScenario("scenario_06_objectiveSighted.lua", nil)
end

function createCultBase()
    cultPlanet = Planet()
    cultPlanet:setPosition(49472, 53355)



end

function createNebulas()
    Nebula():setPosition(-17229, -5707)
    Nebula():setPosition(-17103, 5806)
    Nebula():setPosition(-10137, 15401)
    Nebula():setPosition(-8879, -11726)
    Nebula():setPosition(11963, 392)
    Nebula():setPosition(722, 8647)
    Nebula():setPosition(6749, 12906)
    Nebula():setPosition(35779, 29717)
    Nebula():setPosition(42185, 24734)
    Nebula():setPosition(34755, 21619)
    Nebula():setPosition(27503, 2266)
    Nebula():setPosition(19521, 5285)
    Nebula():setPosition(36414, 3447)
    Nebula():setPosition(62438, 1266)
    Nebula():setPosition(55250, 6173)
    Nebula():setPosition(45336, 4984)
    Nebula():setPosition(16933, 32990)
    Nebula():setPosition(26004, 32842)
    Nebula():setPosition(21493, 19954)
    Nebula():setPosition(-16373, 12397)
    Nebula():setPosition(-3289, 15237)
    Nebula():setPosition(13725, 17146)
    Nebula():setPosition(27261, 21048)
    Nebula():setPosition(65486, 39514)
    Nebula():setPosition(57847, 35347)
    Nebula():setPosition(49722, 30764)
    Nebula():setPosition(89381, 51126)
    Nebula():setPosition(88822, 59962)
    Nebula():setPosition(85355, 69133)
    Nebula():setPosition(81552, 77297)
    Nebula():setPosition(75960, 81883)
    Nebula():setPosition(67684, 82442)
    Nebula():setPosition(59072, 83113)
    Nebula():setPosition(50349, 81995)
    Nebula():setPosition(40283, 80876)
    Nebula():setPosition(32007, 79534)
    Nebula():setPosition(22388, 73942)
    Nebula():setPosition(17244, 66561)
    Nebula():setPosition(7072, -13446)
    Nebula():setPosition(16192, -5201)
    Nebula():setPosition(14665, -10975)
    Nebula():setPosition(-679, -11896)
    Nebula():setPosition(-23885, -1144)


end

function createAsteroids()
    Asteroid():setPosition(-2244, -1867)
    Asteroid():setPosition(-244, -2749)
    Asteroid():setPosition(2593, -5521)
    Asteroid():setPosition(5124, -5156)
    Asteroid():setPosition(7776, 1448)
    Asteroid():setPosition(12364, -690)
    Asteroid():setPosition(6860, 6704)
    Asteroid():setPosition(610, 10950)
    Asteroid():setPosition(-8462, 10633)
    Asteroid():setPosition(-14738, -100)
    Asteroid():setPosition(-7381, -5612)
    Asteroid():setPosition(-9833, 1746)
    Asteroid():setPosition(-1473, 6678)
    Asteroid():setPosition(15167, 5042)
    Asteroid():setPosition(11897, -6904)
    Asteroid():setPosition(4460, -11466)
    Asteroid():setPosition(-3900, -9963)
    Asteroid():setPosition(11528, -14446)
    Asteroid():setPosition(20072, -364)
    Asteroid():setPosition(11319, 14529)
    Asteroid():setPosition(-1295, 17927)
    Asteroid():setPosition(-10893, 16695)
    Asteroid():setPosition(-15395, 8498)
    Asteroid():setPosition(-7878, 7224)
    Asteroid():setPosition(-23635, -7726)
    Asteroid():setPosition(-11063, -3606)
    Asteroid():setPosition(-16245, -11208)
    Asteroid():setPosition(-148, -21147)
    Asteroid():setPosition(23679, -8490)
    Asteroid():setPosition(50965, 24261):setSize(122)
    Asteroid():setPosition(49149, 22460):setSize(123)
    Asteroid():setPosition(54313, 22099):setSize(121)
    Asteroid():setPosition(56130, 29276):setSize(113)
    Asteroid():setPosition(55485, 27940):setSize(127)
    Asteroid():setPosition(53232, 26213):setSize(118)
    Asteroid():setPosition(58412, 29741):setSize(129)
    Asteroid():setPosition(63442, 29861):setSize(124)
    Asteroid():setPosition(56100, 26078):setSize(122)
    Asteroid():setPosition(56686, 21754):setSize(116)
    Asteroid():setPosition(58007, 24952):setSize(115)
    Asteroid():setPosition(57617, 25883):setSize(125)
    Asteroid():setPosition(58247, 28045):setSize(118)
    Asteroid():setPosition(56611, 23376):setSize(113)
    Asteroid():setPosition(62181, 28585):setSize(116)
    Asteroid():setPosition(52234, 24766):setSize(112)
    Asteroid():setPosition(54481, 25241):setSize(110)
    Asteroid():setPosition(62284, 25362):setSize(115)
    Asteroid():setPosition(56672, 24756):setSize(118)
    Asteroid():setPosition(60783, 26686):setSize(121)
    Asteroid():setPosition(58834, 27264):setSize(111)
    Asteroid():setPosition(57128, 27357):setSize(125)
    Asteroid():setPosition(65304, 29726):setSize(113)
    Asteroid():setPosition(50290, 21709):setSize(125)
    Asteroid():setPosition(66264, 25793):setSize(129)
    Asteroid():setPosition(65919, 27534):setSize(126)
    Asteroid():setPosition(65604, 30957):setSize(123)
    Asteroid():setPosition(66940, 30612):setSize(126)
    Asteroid():setPosition(57527, 28608):setSize(123)
    Asteroid():setPosition(68306, 25042):setSize(122)
    Asteroid():setPosition(68592, 29261):setSize(126)
    Asteroid():setPosition(68351, 32279):setSize(114)
    Asteroid():setPosition(70378, 23345):setSize(114)
    Asteroid():setPosition(70784, 24832):setSize(118)
    Asteroid():setPosition(69763, 29606):setSize(114)
    Asteroid():setPosition(72240, 30462):setSize(121)
    Asteroid():setPosition(70979, 32669):setSize(127)

end

function createMines()
    Mine():setPosition(48774, 24517)
    Mine():setPosition(53826, 23363)
    Mine():setPosition(59396, 25835)
    Mine():setPosition(64285, 30780)
    Mine():setPosition(64316, 28651)
    Mine():setPosition(64238, 26241)
    Mine():setPosition(62031, 29950)
    Mine():setPosition(61937, 27477)
    Mine():setPosition(66523, 29293)
    Mine():setPosition(59636, 28823)
    Mine():setPosition(68855, 30748)
    Mine():setPosition(68417, 27994)
    Mine():setPosition(63659, 33440)
    Mine():setPosition(66367, 31907)

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