-- Name: Psykerfest
-- Description: Saturday: 1300-1600
-- Type: A small zone of wrecks and no enemies.


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
    addGMFunction("Next Scene", gotoObjectiveSighted)

    
    createCultShips()
    createAsteroids()
    createNebulas()





	
end


function update(delta)


end

function gotoObjectiveSighted()
    setScenario("scenario_06_objectiveSighted.lua", nil)
end

function createCultShips()
    -- Cult's primary attack vessels
    CpuShip():setFaction("Wreckage"):setTemplate("Sabre"):setCallSign("CCN3"):setPosition(5197, -8369):setHeading(202)
    CpuShip():setFaction("Wreckage"):setTemplate("Falchion"):setCallSign("CSS5"):setPosition(6963, -7300):setHeading(202)


    CpuShip():setFaction("Wreckage"):setTemplate("Q Ship"):setCallSign("VS6"):setPosition(37514, -8558):orderRoaming():setWeaponStorage("Torpedo", 0):setWeaponStorage("Macro", 97)
    CpuShip():setFaction("Wreckage"):setTemplate("Q Ship"):setCallSign("UTI7"):setPosition(39088, -7513):orderRoaming():setWeaponStorage("Torpedo", 0):setWeaponStorage("Macro", 97)
    CpuShip():setFaction("Wreckage"):setTemplate("Sabre"):setCallSign("NC2"):setPosition(40398, -6309):orderRoaming():setWeaponStorage("Macro", 99)
    Planet():setPosition(45584, -14413)


    cultPlanet = Planet()
    cultPlanet:setPosition(45584, -14413)

    Mine():setPosition(5910, -3278)
    Mine():setPosition(7075, 5187)
    -- Hidden forces in nebula
    CpuShip():setFaction("Wreckage"):setTemplate("Sabre"):setCallSign("CV4"):setPosition(283, 6844):setHeading(0)
    CpuShip():setFaction("Wreckage"):setTemplate("Sabre"):setCallSign("VS8"):setPosition(-604, 6567):setHeading(0)
    CpuShip():setFaction("Wreckage"):setTemplate("Merchant Raider"):setCallSign("CCN9"):setPosition(4401, -2396):setHeading(230)
    -- Ambush from read
    CpuShip():setFaction("Wreckage"):setTemplate("Armed Merchantman"):setCallSign("CV10"):setPosition(-4525, -568):setHeading(90)
    CpuShip():setFaction("Wreckage"):setTemplate("Armed Merchantman"):setCallSign("CV11"):setPosition(-4548, 731):setHeading(90)

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
