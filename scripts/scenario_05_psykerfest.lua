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
        {"Hallowed Mirror", 12282, -10060, 202, "Falchion", "Wake Cult", "Metallic object. Mass reading 910,000IT. Thermal signature variable, consistent with Naval plasma reactor.", "Voidship. Sworrrrd-patt-patt Sword-pattern Frigate class. Biosignatures present. Reactor active.", "Error-errormatch. ??? ??@Template mismatch. EmissionSig mismatch. DataCorruption??? Weapon batteries detected."},
        {"Feathered Glass", 11874, -10671, 202, "Sabre", "Wake Cult", "Metallic object. Mass reading 891,000IT. Thermal signature variable, consistent with Naval plasma reactor.", "Voidship. 96% probability match Sword-pattern Frigate class. Biosignatures present. Reactor active.", "Standard Template Construct mismatch. Variations in hull plating %% Turret config. Weapons batteries detected."},
        {"Tears of Change", 37514, -8558, 0, "Q Ship", "Wake Cult", "Metallic object. Mass reading 711.500IT. Thermal signature variable, consistent with plasma reactor.", "Voidship. Caballus-pattern Imperial Freightship. Biosignatures present. Reactor active.", "MISMATCH Cogitation projection designate ident Son Of Holub. Broadcast ident Tears Of Change. MISMATCH. Turret configuration mistmatch detected. Multiple primary battery targeting matrices. Plasma warhead emissions."},
        {"Everpromise", 40398, -6309, 0, "Sabre", "Wake Cult", "Metallic object. Mass reading 891,000IT. Thermal signature variable, consistent with Naval plasma reactor.", "Voidship. 92% probability match Sword-pattern Frigate class. Biosignatures present. Reactor active.", "Standard Template Construct mismatch. Variations in hull plating %% Turret config. Weapons batteries detected."},
        {"Fate's Warning", 39088, -7513, 0, "Q Ship", "Wake Cult", "Metallic object. Mass reading 713.300IT. Thermal signature variable, consistent with naval plasma reactor.", "Voidship. Caballus-pattern Imperial Freightship. Biosignatures present. Reactor active.", "Broadcast Ident Fate's Warning. Mismatch in mass:dimension ratio. Query: additional plating. Weapons batteries detected."},
        {"Architect's Blade", 5014, 8686, 0, "Sabre", "Wake Cult", "Metallic object. Mass reading 891,000IT. Thermal signature variable, consistent with Naval plasma reactor.", "Voidship. 92% probability match Sword-pattern Frigate class. Biosignatures present. Reactor active.", "Standard Template Construct mismatch. Varrrriations in data hull corruption plate turret config. Weapon batteries detected."},
        {"Scythe", 4629, 9665, 0, "Sabre", "Wake Cult", "Metallic object. Mass reading 891,000IT. Thermal signature variable, consistent with Naval plasma reactor.", "Voidship. 92% probability match Sword-pattern Frigate class. Biosignatures present. Reactor active.", "Standard Template Construct mismatch. Weapon batteries detected."},
        {"Freedom of Thought", 6776, -114, 230, "Merchant Raider", "Wake Cult", "Metallic object. Mass reading 700.500IT. Thermal signature variable, consistent with plasma reactor.", "Voidship. Caballus-pattern Imperial Freightship. Biosignatures present. Reactor active.", "Negative Ident Patternmatch. IFF broadcast callsign FREEDOM OF THOUGHT. Weapons batteries detected."},
        {"Clarity of Angels", -4525, -568, 90, "Armed Merchantman", "Wake Cult", "Metallic object. Mass reading 551.100IT. Thermal signature variable, consistent with plasma reactor.", "Voidship. Asinus-pattern Imperial Freightship. Biosignatures present. Reactor Active.", "Negative Ident Patternmatch. IFF broadcast callsign CLARITY OF ANGELS. Weapon batteries detected."},
        {"Suffering's End", -4548, 731, 90, "Armed Merchantman", "Wake Cult", "Metallic object. Mass reading 549.100IT. Thermal signature variable, consistent with plasma reactor.", "Voidship. Asinus-pattern Imperial Freightship. Biosignatures present. Reactor Active.", "Negative Ident Patternmatch. IFF broadcast callsign SUFFERING'S END. Weapon batteries detected."},        
        {"Cyclops 1", 10194, -11343, 200, "Hauler", "Wake Cult", "Metallic object. Mass reading 6.341IT. Thermal signature variable, consistent with low-power plasma reactor.", "Voidship. Orbital lifter. Biosignatures present. Reactor active.", "PatternMatch: Modified Orbital lifter. Lascannon array detected."},
        {"Cyclops 2", 9888, -11672, 200, "Hauler", "Wake Cult", "Metallic object. Mass reading 6.341IT. Thermal signature variable, consistent with low-power plasma reactor.", "Voidship. Orbital lifter. Biosignatures present. Reactor active.", "PatternMatch: Modified Orbital lifter. Lascannon array detected."},
        {"Cyclops 3", 10476, -11038, 200, "Hauler", "Wake Cult", "Metallic object. Mass reading 6.341IT. Thermal signature variable, consistent with low-power plasma reactor.", "Voidship. Orbital lifter. Biosignatures present. Reactor active.", "PatternMatch: Modified Orbital lifter. Lascannon array detected."},
        {"Scourge 1", 10094, -11908, 200, "WakeBomber", "Wake Cult", "Metallic object. Mass reading 6.341IT. Thermal signature variable, consistent with low-power plasma reactor.", "Voidship. Orbital lifter. Biosignatures present. Reactor active.", "PatternMatch: Modified Orbital lifter. Plasma munitions detected."},
        {"Scourge 2", 10629, -11511, 200, "WakeBomber", "Wake Cult", "Metallic object. Mass reading 6.341IT. Thermal signature variable, consistent with low-power plasma reactor.", "Voidship. Orbital lifter. Biosignatures present. Reactor active.", "PatternMatch: Modified Orbital lifter. Plasma munitions detected."},
        {"Scourge 3", 10881, -11328, 200, "WakeBomber", "Wake Cult", "Metallic object. Mass reading 6.341IT. Thermal signature variable, consistent with low-power plasma reactor.", "Voidship. Orbital lifter. Biosignatures present. Reactor active.", "PatternMatch: Modified Orbital lifter. Plasma munitions detected."},
        {"Scourge 4", 10347, -11702, 200, "WakeBomber", "Wake Cult", "Metallic object. Mass reading 6.341IT. Thermal signature variable, consistent with low-power plasma reactor.", "Voidship. Orbital lifter. Biosignatures present. Reactor active.", "PatternMatch: Modified Orbital lifter. Plasma munitions detected."}
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
        {"Name", 11077, -5611, "Wrecked Frigate", "Unscanned", "Scanned", "Deepscanned"},
        {"Name", 12609, -8468, "General Wreckage", "Unscanned", "Scanned", "Deepscanned"},
        {"Name", 34684, -11238, "General Wreckage", "Unscanned", "Scanned", "Deepscanned"},
    }

end

function initialiseNPCShipOrders()
    getShip(npcConfiguration[1]):orderIdle()
    getShip(npcConfiguration[2]):orderIdle()
    getShip(npcConfiguration[3]):orderIdle()
    getShip(npcConfiguration[4]):orderIdle()
    getShip(npcConfiguration[5]):orderIdle()
    getShip(npcConfiguration[6]):orderDefendTarget(getShip(npcConfiguration[8]))
    getShip(npcConfiguration[7]):orderDefendTarget(getShip(npcConfiguration[8]))
    getShip(npcConfiguration[8]):orderAttack(lexTalionis)
    getShip(npcConfiguration[9]):orderAttack(lexTalionis)
    getShip(npcConfiguration[10]):orderAttack(lexTalionis)
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
    cultPlanet:setPosition(45584, -14413)

    Mine():setPosition(5910, -3278)
    Mine():setPosition(7075, 5187)

end

function createNebulas()
    Nebula():setPosition(-17229, -5707)
    Nebula():setPosition(-17103, 5806)
    Nebula():setPosition(-10137, 15401)
    Nebula():setPosition(12557, 11021)
    Nebula():setPosition(-8879, -11726)
    Nebula():setPosition(11963, 392)
    Nebula():setPosition(722, 8647)
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