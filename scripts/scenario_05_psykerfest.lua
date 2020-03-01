-- Name: Psykerfest
-- Description: Saturday: 1300-1600
-- Type: A small zone of wrecks and no enemies.


require("utils.lua")
require("manageNPCShips.lua")
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


    createNPCShipConfig()

    createNPCShips(npcConfiguration)

    
    createCultShips()
    createAsteroids()
    createNebulas()





	
end


function update(delta)


end

function createNPCShipConfig() 
    npcConfiguration = {
        --{Callsign, posX, posY, heading, template, faction, unscannedAuspex, scannedAuspex, deepscannedAuspex}
        --{"Callsign", 0, 0, 0, "Template", "Wake Cult", "Unscanned", "Scanned", "Deepscanned"}
        {"Hallowed Mirror", 12282, -10060, 202, "Falchion", "Wake Cult", "Unscanned", "Scanned", "Deepscanned"},
        {"Feathered Glass", 11874, -10671, 202, "Sabre", "Wake Cult", "Unscanned", "Scanned", "Deepscanned"},
        {"Tears of Change", 37514, -8558, 0, "Q Ship", "Wake Cult", "Unscanned", "Scanned", "Deepscanned"},
        {"Everpromise", 40398, -6309, 0, "Sabre", "Wake Cult", "Unscanned", "Scanned", "Deepscanned"},
        {"Fate's Warning", 39088, -7513, 0, "Q Ship", "Wake Cult", "Unscanned", "Scanned", "Deepscanned"},
        {"Architect's Blade", 5014, 8686, 0, "Sabre", "Wake Cult", "Unscanned", "Scanned", "Deepscanned"},
        {"Scythe", 4629, 9665, 0, "Sabre", "Wake Cult", "Unscanned", "Scanned", "Deepscanned"},
        {"Freedom of Thought", 6776, -114, 230, "Merchant Raider", "Wake Cult", "Unscanned", "Scanned", "Deepscanned"},
        {"Clarity of Angels", -4525, -568, 90, "Armed Merchantman", "Wake Cult", "Unscanned", "Scanned", "Deepscanned"},
        {"Suffering's End", -4548, 731, 90, "Armed Merchantman", "Wake Cult", "Unscanned", "Scanned", "Deepscanned"}
    }
end

function gotoObjectiveSighted()
    setScenario("scenario_06_objectiveSighted.lua", nil)
end

function createCultShips()
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
