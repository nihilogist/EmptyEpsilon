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
		table.insert(enemyList, setCirclePos(CpuShip():setTemplate('Fury Interceptor'):setRotation(a + 180):orderFlyFormation(leader,-400, 0), 0, 0, a + random(-1, 1), d + random(-100, 100)))
		table.insert(enemyList, setCirclePos(CpuShip():setTemplate('Fury Interceptor'):setRotation(a + 180):orderFlyFormation(leader, 400, 0), 0, 0, a + random(-1, 1), d + random(-100, 100)))
		table.insert(enemyList, setCirclePos(CpuShip():setTemplate('Fury Interceptor'):setRotation(a + 180):orderFlyFormation(leader,-400, 400), 0, 0, a + random(-1, 1), d + random(-100, 100)))
		table.insert(enemyList, setCirclePos(CpuShip():setTemplate('Fury Interceptor'):setRotation(a + 180):orderFlyFormation(leader, 400, 400), 0, 0, a + random(-1, 1), d + random(-100, 100)))
	elseif type < 3.0 then
		table.insert(enemyList, setCirclePos(CpuShip():setTemplate('Fury Interceptor'):setRotation(a + 180):orderRoaming(), 0, 0, a + random(-5, 5), d + random(-100, 100)))
		table.insert(enemyList, setCirclePos(CpuShip():setTemplate('Fury Interceptor'):setRotation(a + 180):orderRoaming(), 0, 0, a + random(-5, 5), d + random(-100, 100)))
	elseif type < 4.0 then
		table.insert(enemyList, setCirclePos(CpuShip():setTemplate('Pirate Destroyer'):setRotation(a + 180):orderRoaming(), 0, 0, a + random(-5, 5), d + random(-100, 100)))
		table.insert(enemyList, setCirclePos(CpuShip():setTemplate('Pirate Destroyer'):setRotation(a + 180):orderRoaming(), 0, 0, a + random(-5, 5), d + random(-100, 100)))
		table.insert(enemyList, setCirclePos(CpuShip():setTemplate('Pirate Destroyer'):setRotation(a + 180):orderRoaming(), 0, 0, a + random(-5, 5), d + random(-100, 100)))
	else
		table.insert(enemyList, setCirclePos(CpuShip():setTemplate('Pirate Destroyer'):setRotation(a + 180):orderRoaming(), 0, 0, a + random(-5, 5), d + random(-100, 100)))
		table.insert(enemyList, setCirclePos(CpuShip():setTemplate('Fury Interceptor'):setRotation(a + 180):orderRoaming(), 0, 0, a + random(-5, 5), d + random(-100, 100)))
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
	theWake = PlayerSpaceship():setFaction("Human Navy"):setTemplate("Regency Pattern Dauntless Light Cruiser"):setCallSign("The Wake")
	furyOne = nil
	furyOneButton = false
	furyTwo = nil
	furyTwoButton = false
	starhawkOne = nil
	starhawkOneButton = false

	enemyList = {}
	friendlyList = {}
	stationList = {}

	-- Randomly distribute 3 allied stations throughout the region.
	n = 0
	station_1 = SpaceStation():setTemplate('Small Station'):setRotation(random(0, 360)):setFaction("Human Navy")
	table.insert(stationList, station_1)
	table.insert(friendlyList, setCirclePos(station_1, 0, 0, n * 360 / 3 + random(-30, 30), random(10000, 22000)))
	n = 1
	table.insert(stationList, station_2)
	station_2 = SpaceStation():setTemplate('Medium Station'):setRotation(random(0, 360)):setFaction("Human Navy")
	table.insert(friendlyList, setCirclePos(station_2, 0, 0, n * 360 / 3 + random(-30, 30), random(10000, 22000)))
	n = 2
	table.insert(stationList, station_3)
	station_3 = SpaceStation():setTemplate('Large Station'):setRotation(random(0, 360)):setFaction("Human Navy")
	table.insert(friendlyList, setCirclePos(station_3, 0, 0, n * 360 / 3 + random(-30, 30), random(10000, 22000)))

	-- Start the players with 300 reputation.
	friendlyList[1]:addReputationPoints(300.0)

	-- Randomly scatter nebulae near the players' spawn point.
	local x, y = friendlyList[1]:getPosition()
	setCirclePos(Nebula(), x, y, random(0, 360), 6000)

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


	-- Let the GM spawn a random enemy wave.
	addGMFunction("Random wave", function()
		a = setWaveAngle(math.random(20), math.random(20))
		d = setWaveDistance(math.random(20))
		type = random(0, 4)
		addWave(enemyList,type,a,d)
	end)

	-- Let the GM spawn random reinforcements. Their distance from the
	-- players' spawn point is about half that of enemy waves.
	addGMFunction("Random friendly", function()
		a = setWaveAngle(math.random(20), math.random(20))
		d = random(15000, 20000 + math.random(20) * 1500)
		friendlyShip = {'Phobos T3','MU52 Hornet','Piranha F12'}
		friendlyShipIndex = math.random(#friendlyShip)
		table.insert(friendlyList, setCirclePos(CpuShip():setTemplate(friendlyShip[friendlyShipIndex]):setRotation(a):setFaction("Human Navy"):orderRoaming():setScanned(true), 0, 0, a + random(-5, 5), d + random(-100, 100)))
	end)

	-- Let the GM declare the Humans (players) victorious.
	addGMFunction("Win", function()
		victory("Human Navy");
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
			-- Avoid spawning asteroids within 1U of the player start position or
			-- 2U of any station.
			if math.abs(posx) > 1000 and math.abs(posy) > 1000 then
				for i,station in ipairs(stationList) do
					if distance(station, posx, posy) > 2000 then
						Asteroid():setPosition(posx, posy):setSize(random(100, 500))
					end
				end
			end
		end

		for acnt=1,100 do
			dx1, dy1 = vectorFromAngle(a2, random(-1500, 1500))
			dx2, dy2 = vectorFromAngle(a2 + 90, random(-20000, 20000))
			VisualAsteroid():setPosition(x + dx1 + dx2, y + dy1 + dy2)
		end
	end


	-- Spawn random neutral transports.
    Script():run("util_random_transports.lua")
    
    
	theWake:addCustomButton("fighterBay","LaunchFury1","Launch Fury 1",launchInterceptorOne)
	theWake:addCustomButton("fighterBay","LaunchFury2","Launch Fury 2",launchInterceptorTwo)
	theWake:addCustomButton("fighterBay","LaunchStarhawk1","Launch Starhawk 1",launchBomberOne)
end

function launchInterceptorOne()
	--theWake:removeCustom("LaunchFury1")
	furyOneButton = false
    furyOne = launchFuryFromWake("Fury 1")
    return furyOne
end

function launchInterceptorTwo()
	--theWake:removeCustom("LaunchFury2")
	furyTwoButton = false
    furyTwo = launchFuryFromWake("Fury 2")
    return furyTwo
end

function launchBomberOne()
	--theWake:removeCustom("LaunchStarhawk1")
	starhawkOneButton = false
	starhawkOne = launchStarhawkFromWake("Starhawk 1")
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
	launchedVehicle = PlayerSpaceship():setFaction("Human Navy"):setTemplate(vehicleClass):setCallSign(callsign)
	local x, y = theWake:getPosition()
    local direction = theWake:getHeading()
    setCirclePos(launchedVehicle, x, y, direction - 270, 100)
    launchedVehicle:setHeading(direction - 180)
    launchedVehicle:commandTargetRotation(direction - 270)
    launchedVehicle:commandImpulse(0.5)
    return launchedVehicle
end


function update(delta)

	enemy_count = 0
	friendly_count = 0

	-- Count all surviving enemies and allies.
	for _, enemy in ipairs(enemyList) do
		if enemy:isValid() then
			enemy_count = enemy_count + 1
		end
	end

	for _, friendly in ipairs(friendlyList) do
		if friendly:isValid() then
			friendly_count = friendly_count + 1
		end
	end

	-- If not playing the Empty variation, declare victory for the
	-- Humans (players) once all enemies are destroyed. Note that players can win
	-- even if they destroy the enemies by blowing themselves up.
	--
	-- In the Empty variation, the GM must use the Win button to declare
	-- a Human victory.
	if (enemy_count == 0 and getScenarioVariation() ~= "Empty") then
		victory("Human Navy");
	end

	-- If all allies are destroyed, the Humans (players) lose.
	if friendly_count == 0 then
		victory("Kraylor");
	else
		-- As the battle continues, award reputation based on
		-- the players' progress and number of surviving allies.
		for _, friendly in ipairs(friendlyList) do
			if friendly:isValid() then
				friendly:addReputationPoints(delta * friendly_count * 0.1)
			end
		end
	end
end
