-- Name: The Wake Testing
-- Description: Basic scenario to test-drive aspects of play for The Wake.
-- Type: Basic
-- Variation[Empty]: Places no enemies. GM-placed enemies only.
-- Variation[Easy]: Places fewer enemies. Recommended for inexperienced crews.
-- Variation[Hard]: Places more enemies. Recommended if you have multiple player-controlled ships.
-- Variation[Extreme]: Places many enemies. You're pretty surely overwhelmed.

require("utils.lua")
-- For this scenario, utils.lua provides:
--   vectorFromAngle(angle, length)
--      Returns a relative vector (x, y coordinates)
--   setCirclePos(obj, x, y, angle, distance)
--      Returns the object with its position set to the resulting coordinates.

-- Add an enemy wave.
-- enemyList: A table containing enemy ship objects.
-- type: A number; at each integer, determines a different wave of ships to add
--       to the enemyList. Any number is valid, but only 0.99-9.0 are meaningful.
-- a: The spawned wave's heading relative to the players' spawn point.
-- d: The spawned wave's distance from the players' spawn point.
function addWave(enemyList,type,a,d)
	if type < 1.0 then
		table.insert(enemyList, setCirclePos(CpuShip():setTemplate('Pirate Destroyer'):setRotation(a + 180):orderRoaming(), 0, 0, a, d))
	elseif type < 2.0 then
		leader = setCirclePos(CpuShip():setTemplate('Pirate Destroyer'):setRotation(a + 180):orderRoaming(), 0, 0, a + random(-1, 1), d + random(-100, 100))
		table.insert(enemyList, leader)
		table.insert(enemyList, setCirclePos(CpuShip():setFaction("Rising Flame"):setTemplate('Fury Interceptor'):setRotation(a + 180):orderFlyFormation(leader,-400, 0), 0, 0, a + random(-1, 1), d + random(-100, 100)))
		table.insert(enemyList, setCirclePos(CpuShip():setFaction("Rising Flame"):setTemplate('Fury Interceptor'):setRotation(a + 180):orderFlyFormation(leader, 400, 0), 0, 0, a + random(-1, 1), d + random(-100, 100)))
		table.insert(enemyList, setCirclePos(CpuShip():setFaction("Rising Flame"):setTemplate('Fury Interceptor'):setRotation(a + 180):orderFlyFormation(leader,-400, 400), 0, 0, a + random(-1, 1), d + random(-100, 100)))
		table.insert(enemyList, setCirclePos(CpuShip():setFaction("Rising Flame"):setTemplate('Fury Interceptor'):setRotation(a + 180):orderFlyFormation(leader, 400, 400), 0, 0, a + random(-1, 1), d + random(-100, 100)))
	elseif type < 3.0 then
		table.insert(enemyList, setCirclePos(CpuShip():setFaction("Rising Flame"):setTemplate('Fury Interceptor'):setRotation(a + 180):orderRoaming(), 0, 0, a + random(-5, 5), d + random(-100, 100)))
		table.insert(enemyList, setCirclePos(CpuShip():setFaction("Rising Flame"):setTemplate('Fury Interceptor'):setRotation(a + 180):orderRoaming(), 0, 0, a + random(-5, 5), d + random(-100, 100)))
	elseif type < 4.0 then
		table.insert(enemyList, setCirclePos(CpuShip():setFaction("Rising Flame"):setTemplate('Pirate Destroyer'):setRotation(a + 180):orderRoaming(), 0, 0, a + random(-5, 5), d + random(-100, 100)))
		table.insert(enemyList, setCirclePos(CpuShip():setFaction("Rising Flame"):setTemplate('Pirate Destroyer'):setRotation(a + 180):orderRoaming(), 0, 0, a + random(-5, 5), d + random(-100, 100)))
		table.insert(enemyList, setCirclePos(CpuShip():setFaction("Rising Flame"):setTemplate('Pirate Destroyer'):setRotation(a + 180):orderRoaming(), 0, 0, a + random(-5, 5), d + random(-100, 100)))
	else
		table.insert(enemyList, setCirclePos(CpuShip():setFaction("Rising Flame"):setTemplate('Pirate Destroyer'):setRotation(a + 180):orderRoaming(), 0, 0, a + random(-5, 5), d + random(-100, 100)))
		table.insert(enemyList, setCirclePos(CpuShip():setFaction("Rising Flame"):setTemplate('Fury Interceptor'):setRotation(a + 180):orderRoaming(), 0, 0, a + random(-5, 5), d + random(-100, 100)))
	end
end

-- Returns a semi-random heading.
-- cnt: A counter, generally between 1 and the number of enemy groups.
-- enemy_group_count: A number of enemy groups, generally set by the scenario type.
function setWaveAngle(cnt,enemy_group_count)
	return cnt * 360/enemy_group_count + random(-60, 60)
end

-- Returns a semi-random distance.
-- enemy_group_count: A number of enemy groups, generally set by the scenario type.
function setWaveDistance(enemy_group_count)
	return random(35000, 40000 + enemy_group_count * 3000)
end

function init()
	-- Spawn a player Dauntless.
	lexTalionis = PlayerSpaceship():setFaction("Imperial Navy"):setTemplate("Regency Pattern Dauntless Light Cruiser"):setCallSign("The Wake")
	lexTalionis:setCallSign("Lex Talionis")
	-- Currently testing with auto-coolant on. Remove.
	lexTalionis:setAutoCoolant(true)
	furyOne = nil
	furyOneButton = false
	furyTwo = nil
	furyTwoButton = false
	starhawkOne = nil
	starhawkOneButton = false

	enemyList = {}
	friendlyList = {}

	-- spawn one wreck
	spitefulWreck = setCirclePos(CpuShip():setTemplate('Wrecked Destroyer'):setFaction("Wreckage"):setRotation(180):orderIdle(), 0, 0, 90, 6000)
	-- and a corresponding ghost ship
	spitefulGhost = setCirclePos(CpuShip():setTemplate('Unknown Destroyer'):setFaction("Unknown Ship"):setRotation(180):orderRoaming(), 0, 0, 90, 20000)

	-- Randomly scatter nebulae near the players' spawn point.
	local x, y = lexTalionis:getPosition()
	setCirclePos(Nebula(), x, y, random(0, 360), 10000)

	for n=1, 5 do
		setCirclePos(Nebula(), 0, 0, random(0, 360), random(20000, 45000))
	end

	-- GM functions to manually trigger enemy waves.
	addGMFunction("Cobra Destroyer", function()
		addWave(enemyList,0,setWaveAngle(math.random(20), math.random(20)),setWaveDistance(math.random(5)))
	end)

	addGMFunction("Cobra plus Fighters", function()
		addWave(enemyList,1,setWaveAngle(math.random(20), math.random(20)),setWaveDistance(math.random(5)))
	end)

	addGMFunction("Fighter wave", function()
		addWave(enemyList,2,setWaveAngle(math.random(20), math.random(20)),setWaveDistance(math.random(5)))
	end)

	addGMFunction("Three Cobras", function()
		addWave(enemyList,3,setWaveAngle(math.random(20), math.random(20)),setWaveDistance(math.random(5)))
	end)

	-- Let the GM declare the Humans (players) victorious.
	addGMFunction("Win", function()
		victory("Imperial Navy");
	end)

	-- Set the number of enemy waves based on the scenario variation.
	if getScenarioVariation() == "Extreme" then
		enemy_group_count = 20
	elseif getScenarioVariation() == "Hard" then
		enemy_group_count = 8
	elseif getScenarioVariation() == "Easy" then
		enemy_group_count = 3
	elseif getScenarioVariation() == "Empty" then
		enemy_group_count = 0
	else
		enemy_group_count = 5
	end

	-- If not in the Empty variation, spawn the corresponding number of random
	-- enemy waves at distributed random headings and semi-random distances
	-- relative to the players' spawn point.
	if enemy_group_count > 0 then
		for cnt=1,enemy_group_count do
			a = setWaveAngle(cnt, enemy_group_count)
			d = setWaveDistance(enemy_group_count)
			type = random(0, 4)
			addWave(enemyList, type, a, d)
		end
	end

	-- Spawn 2-5 random asteroid belts.
	for cnt=1,random(2, 5) do
		a = random(0, 360)
		a2 = random(0, 360)
		adiff = math.abs(a2 - a)
		d = random(3000, 40000)
		x, y = vectorFromAngle(a, d)

		for acnt=1,50 do
			dx1, dy1 = vectorFromAngle(a2, random(-1000, 1000))
			dx2, dy2 = vectorFromAngle(a2 + 90, random(-20000, 20000))
			posx = x + dx1 + dx2
			posy = x + dy1 + dy2
		end

		for acnt=1,100 do
			dx1, dy1 = vectorFromAngle(a2, random(-1500, 1500))
			dx2, dy2 = vectorFromAngle(a2 + 90, random(-20000, 20000))
			VisualAsteroid():setPosition(x + dx1 + dx2, y + dy1 + dy2)
		end
	end


	-- Spawn random neutral transports.
    Script():run("util_random_transports.lua")
    
    
	lexTalionis:addCustomButton("fighterBay","LaunchFury1","Launch Fury 1",launchInterceptorOne)
	lexTalionis:addCustomButton("fighterBay","LaunchFury2","Launch Fury 2",launchInterceptorTwo)
	lexTalionis:addCustomButton("fighterBay","LaunchStarhawk1","Launch Starhawk 1",launchBomberOne)
end

function launchInterceptorOne()
	--lexTalionis:removeCustom("LaunchFury1")
	furyOneButton = false
	furyOne = launchFuryFromWake("Fury 1")
	furyOne:setAutoCoolant(true)
    return furyOne
end

function launchInterceptorTwo()
	--lexTalionis:removeCustom("LaunchFury2")
	furyTwoButton = false
	furyTwo = launchFuryFromWake("Fury 2")
	furyTwo:setAutoCoolant(true)
    return furyTwo
end

function launchBomberOne()
	--lexTalionis:removeCustom("LaunchStarhawk1")
	starhawkOneButton = false
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
    setCirclePos(launchedVehicle, x, y, direction - 270, 100)
    launchedVehicle:setHeading(direction - 180)
    launchedVehicle:commandTargetRotation(direction - 270)
    launchedVehicle:commandImpulse(0.5)
    return launchedVehicle
end


function update(delta)

	if (not spitefulWreck:isValid()) then
		spitefulGhost:destroy()
	end

end
