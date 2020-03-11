-- Name: Wrath of the Wake
-- Description: Saturday 2100-0000
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
	lexTalionis = PlayerSpaceship():setFaction("Imperial Navy"):setTemplate("Regency Pattern Dauntless"):setPosition(34118, 926):setHeading(0)
    lexTalionis:setCallSign("Lex Talionis")
    addGMFunction("Next Scene", gotoTeaAndMedals)
    lexTalionis:addCustomButton("fighterBay","LaunchFury1","Launch Fury 1",launchInterceptorOne)
    lexTalionis:addCustomButton("fighterBay","LaunchFury2","Launch Fury 2",launchInterceptorTwo)
	lexTalionis:addCustomButton("fighterBay","LaunchStarhawk1","Launch Starhawk 1",launchBomberOne)
    createScenario()

    -- Create all the NPC ships.
    createNPCShipConfig()
    createNPCShips(npcConfiguration)

    -- Create the wrecks
    createWreckConfig()
    createWreckedShips(shipwreckDetails)

    -- Set the initial orders going
    startInitialOrders()

end


function update(delta)
    updateWreckedShipsCallsigns(shipwreckDetails)
    updateNPCShipCallsigns(npcConfiguration)

end

function createNPCShipConfig() 
    npcConfiguration = {
        --{Callsign, posX, posY, heading, template, faction, unscannedAuspex, scannedAuspex, deepscannedAuspex}
        --{"Callsign", 0, 0, 0, "Template", "Wake Cult", "Unscanned", "Scanned", "Deepscanned"}
        {"Sola Fidei", 97282, 98551, 0, "Lunar", "Imperial Navy", "", "", "HIMVS Sola Fidei. Lead ship, CG Hydros Salient."},
        {"Salvation's Fire", 98282, 96551, 0, "Lunar", "Imperial Navy", "", "", "HIMVS Salvation's Fire. Second ship, CG Hydros Salient."},
        {"St Jaghatai's Arrow", 99579, 98038, 0, "Lunar", "Imperial Navy", "", "", "IFF Broadcast Ident: St Jaghatai's Arrow. Escort attached with REDACTED."},
        {"Seeker After Truth", 101426, 97966, 0, "Lunar", "Imperial Navy", "", "", "IFF Broadcast Ident: Seeker After Truth. Negative STC patternmatch."},
        {"Ark of Plenty", 76158, -3284, 270, "Q Ship", "Clan Kirill", "Metallic object. Mass reading 711.478IT. Thermal signature variable, consistent with plasma reactor.", "Voidship. Caballus-pattern Imperial Freightship. Biosignatures present. Reactor active.", "MISMATCH__MISMATCH. Broadcast Ident Ark Of Plenty. Armament classification exceeds Caballus-pattern Freightship. DETECTED: Multiple primary battery targeting matrices. Plasma torpedo launch signature."},
        {"St Sebastian's Properity", 76251, 5960, 270, "Q Ship", "Clan Kirill", "Metallic object. Mass reading 708.953IT. Thermal signature variable, consistent with plasma reactor.", "Voidship. Caballus-pattern Imperial Freightship. Biosignatures present. Reactor active.", "MISMATCH__MISMATCH. Broadcast Ident St Sebastians Prosperity. Armament classification exceeds Caballus-pattern Freightship. DETECTED: Multiple primary battery targeting matrices. Plasma torpedo launch signature."},
        {"Cornucopia", 72203, -3224, 270, "Armed Merchantman", "Clan Kirill", "Metallic object. Mass reading 549.100IT. Thermal signature variable, consistent with plasma reactor.", "Voidship. Asinus-pattern Imperial Freightship. Biosignatures present. Reactor Active.", "Pattern match CallsignDesignate \"Cornucopia\". Weapon batteries detected."},
        {"Bearclaw", 72302, 5974, 270, "Armed Merchantman", "Clan Kirill", "Metallic object. Mass reading 550.300IT. Thermal signature variable, consistent with plasma reactor.", "Voidship. Asinus-pattern Imperial Freightship. Biosignatures present. Reactor Active.", "Pattern match CallsignDesignate \"Bearclaw\". Sector trade license detected (expired). Weapon batteries detected."},
        {"Maw's Revenge", 77945, 1360, 270, "Falchion", "Clan Kirill", "Metallic object. Mass reading 895,000IT. Thermal signature variable, consistent with Naval plasma reactor.", "Voidship. Sword-pattern Frigate class. Biosignatures present. Reactor active.", "Cogitator Pattern mismatch error. Pattern match CallsignDesignate \"Anguine Moros\" att. Battlefleet Prosperitas. Broadcast Ident \"Maw's Revenge\". Weapon batteries detected."},
        {"Sabre's Point", 79206, 1345, 270, "Sword", "Clan Kirill", "Metallic object. Mass reading 895,000IT. Thermal signature variable, consistent with Naval plasma reactor.", "Voidship. Sword-pattern Frigate class. Biosignatures present. Reactor active.", "Pattern match CallsignDesignate \"Sabre's Point\" att. Battlefleet Prosperitas. Weapon batteries detected."},
        {"Flamberge", 80761, 1247, 270, "Sword", "Clan Kirill", "Metallic object. Mass reading 848,000IT. Thermal signature variable, consistent with Naval plasma reactor.", "Voidship. Sword-pattern Frigate class. Biosignatures present. Reactor active.", "Pattern match CallsignDesignate \"Flamberge\" att. Battlefleet Prosperitas. Weapon batteries detected."},
        {"Gambler One", 68931, 6297, 270, "Hauler", "Clan Kirill", "Metallic object. Mass reading 20,000IT. Thermal signature variable, consistent with plasma reactor.", "Voidship. Orbital Hauler. Biosignatures present. Reactor active.", "Broadcast Ident: Gambler One. Short range Orbital Hauler. Unlicensed lasweapon charging frequencies detected."},
        {"Gambler Two", 68195, 4143, 270, "Hauler", "Clan Kirill", "Metallic object. Mass reading 20,000IT. Thermal signature variable, consistent with plasma reactor.", "Voidship. Orbital Hauler. Biosignatures present. Reactor active.", "Broadcast Ident: Gambler Two. Short range Orbital Hauler. Unlicensed lasweapon charging frequencies detected."},
        {"Gambler Three", 67568, 1757, 270, "Hauler", "Clan Kirill", "Metallic object. Mass reading 20,000IT. Thermal signature variable, consistent with plasma reactor.", "Voidship. Orbital Hauler. Biosignatures present. Reactor active.", "Broadcast Ident: Gambler Three. Short range Orbital Hauler. Unlicensed lasweapon charging frequencies detected."},
        {"Gambler Four", 68004, -1148, 270, "Hauler", "Clan Kirill", "Metallic object. Mass reading 20,000IT. Thermal signature variable, consistent with plasma reactor.", "Voidship. Orbital Hauler. Biosignatures present. Reactor active.", "Broadcast Ident: Gambler Four. Short range Orbital Hauler. Unlicensed lasweapon charging frequencies detected."},
        {"Bonehead One", 70227, 2166, 270, "WakeBomber", "Clan Kirill", "Metallic object. Mass reading 24,000IT. Thermal signature variable, consistent with plasma reactor.", "Voidship. Orbital Hauler. Biosignatures present. Reactor active.", "Broadcast Ident: Bonehead One. Short range Orbital Hauler. CAUTION: Unlicensed plasma-warhead emissions detected."},
        {"Bonehead Two", 70117, 1143, 270, "WakeBomber", "Clan Kirill", "Metallic object. Mass reading 24,000IT. Thermal signature variable, consistent with plasma reactor.", "Voidship. Orbital Hauler. Biosignatures present. Reactor active.", "Broadcast Ident: Bonehead Two. Short range Orbital Hauler. CAUTION: Unlicensed plasma-warhead emissions detected."},
        {"Bonehead Three", 70049, -125, 270, "WakeBomber", "Clan Kirill", "Metallic object. Mass reading 24,000IT. Thermal signature variable, consistent with plasma reactor.", "Voidship. Orbital Hauler. Biosignatures present. Reactor active.", "Broadcast Ident: Bonehead Three. Short range Orbital Hauler. CAUTION: Unlicensed plasma-warhead emissions detected."},
        {"Venit Hora One", 29402, 17264, 0, "WakeBomber", "The Pikes", "Metallic object. Mass reading 24,000IT. Thermal signature variable, consistent with plasma reactor.", "Voidship. Orbital Hauler. Biosignatures present. Reactor active.", "Broadcast Ident: Venit Hora One. Short range Orbital Hauler. CAUTION: Unlicensed plasma-warhead emissions detected."},
        {"Venit Hora Two", 27474, 16421, 0, "WakeBomber", "The Pikes", "Metallic object. Mass reading 24,000IT. Thermal signature variable, consistent with plasma reactor.", "Voidship. Orbital Hauler. Biosignatures present. Reactor active.", "Broadcast Ident: Venit Hora Two. Short range Orbital Hauler. CAUTION: Unlicensed plasma-warhead emissions detected."},
        {"Venit Hora Three", 30318, 16831, 0, "Hauler", "The Pikes", "Metallic object. Mass reading 20,000IT. Thermal signature variable, consistent with plasma reactor.", "Voidship. Orbital Hauler. Biosignatures present. Reactor active.", "Broadcast Ident: Venit Hora Three. Short range Orbital Hauler. Unlicensed lasweapon charging frequencies detected."},
        {"Venit Hora Four", 27161, 15602, 0, "Hauler", "The Pikes", "Metallic object. Mass reading 20,000IT. Thermal signature variable, consistent with plasma reactor.", "Voidship. Orbital Hauler. Biosignatures present. Reactor active.", "Broadcast Ident: Venit Hora Four. Short range Orbital Hauler. Unlicensed lasweapon charging frequencies detected."},
        {"Venit Hora Five", 28414, 16036, 0, "Hauler", "The Pikes", "Metallic object. Mass reading 20,000IT. Thermal signature variable, consistent with plasma reactor.", "Voidship. Orbital Hauler. Biosignatures present. Reactor active.", "Broadcast Ident: Venit Hora Five. Short range Orbital Hauler. Unlicensed lasweapon charging frequencies detected."},
        {"Venit Hora Six", 29330, 16493, 0, "Hauler", "The Pikes", "Metallic object. Mass reading 20,000IT. Thermal signature variable, consistent with plasma reactor.", "Voidship. Orbital Hauler. Biosignatures present. Reactor active.", "Broadcast Ident: Venit Hora Six. Short range Orbital Hauler. Unlicensed lasweapon charging frequencies detected."},
        {"Firebolt", 28405, 17278, 0, "Pirate Destroyer", "The Pikes", "Metallic object. Mass reading 845,000IT. Thermal signature variable, consistent with Naval plasma reactor.", "Voidship. Cobra-pattern Destroyer class. Biosignatures present. Reactor active.", "Cogitator Pattern mismatch error. Pattern match CallsignDesignate \"Caladium\" att. Battlefleet Prosperitas. Broadcast Ident \"Firebolt\". Weapon batteries detected."},
        {"Hope Unchained", 9457, -9329, 340, "Sword", "Rising Flame", "Metallic object. Mass reading 853,000IT. Thermal signature variable, consistent with Naval plasma reactor.", "Voidship. Sword-pattern Frigate class. Biosignatures present. Reactor active.", "Pattern match CallsignDesignate Hope Unchained. Cannot reconcile with naval records. Weapon batteries detected."},
        {"Profit Margin", 26986, 17268, 0, "Q Ship", "Pikes", "Metallic object. Mass reading 708.953IT. Thermal signature variable, consistent with plasma reactor.", "Voidship. Caballus-pattern Imperial Freightship. Biosignatures present. Reactor active.", "MISMATCH__MISMATCH. Broadcast Ident Profit Margin. Armament classification exceeds Caballus-pattern Freightship. DETECTED: Multiple primary battery targeting matrices. Plasma torpedo launch signature."}

    }
    

end

function createWreckConfig()
    shipwreckDetails = {
        --{Callsign, posX, posY, template, unscannedAuspex, scannedAuspex, deepscannedAuspex}
        {"Name", 1460, 3568, "Wrecked Light Freighter", "Unscanned", "Scanned", "Deepscanned"},

    }

end

function startInitialOrders()
    getShip(npcConfiguration[1]):orderIdle():setScanned(true)
    getShip(npcConfiguration[2]):orderIdle():setScanned(true)
    getShip(npcConfiguration[3]):orderIdle():setScanned(true)

end



function gotoTeaAndMedals()
    setScenario("scenario_09_teaAndMedals.lua", nil)
end

function createScenario()
    Nebula():setPosition(83211, -27825)
    Nebula():setPosition(73628, -35603)
    Nebula():setPosition(35989, -26020)
    Nebula():setPosition(79878, 21897)
    Nebula():setPosition(46822, 11480)
    Nebula():setPosition(-18733, -1436)
    Nebula():setPosition(-10539, 34258)
    Nebula():setPosition(21406, 82730)
    Nebula():setPosition(67239, 73008)
    Nebula():setPosition(23106, 7172)
    Nebula():setPosition(40956, 23368)
    Nebula():setPosition(52510, 43199)
    Nebula():setPosition(18586, 47542)



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