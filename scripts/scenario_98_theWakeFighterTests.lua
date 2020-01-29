-- Name: Player Fighter Wings
-- Description: A squadron of two fighters must engage a series of enemy fighter wings.
-- Type: Basic


require("utils.lua")
-- For this scenario, utils.lua provides:
--   vectorFromAngle(angle, length)
--      Returns a relative vector (x, y coordinates)
--   setCirclePos(obj, x, y, angle, distance)
--      Returns the object with its position set to the resulting coordinates.

function init()
    -- Spawn two player Furies
    angelOne = PlayerSpaceship():setFaction("Imperial Navy"):setTemplate("Mars-Pattern Fury Interceptor"):setCallSign("Angel One")
    angelTwo = PlayerSpaceship():setFaction("Imperial Navy"):setTemplate("Mars-Pattern Fury Interceptor"):setCallSign("Angel Two")
	

	enemyList = {}
	friendlyList = {}

	
	

	pirateFighterNames = {"Talon One", "Talon Two", "Talon Three", "Talon Four"}
	for i,name in ipairs(pirateFighterNames) do
		table.insert(enemyList, setCirclePos(CpuShip():setTemplate('Hauler'):setFaction("Rising Flame"):setCallSign(name):setAI("fighter"):setRotation(180):orderRoaming(), 0, 0, random(0, 30), random(8000, 10000)))
    end
    
    pirateFighterNames = {"Razor One", "Razor Two", "Razor Three", "Razor Four"}
	for i,name in ipairs(pirateFighterNames) do
		table.insert(enemyList, setCirclePos(CpuShip():setTemplate('Hauler'):setFaction("Rising Flame"):setCallSign(name):setAI("fighter"):setRotation(180):orderRoaming(), 0, 0, random(60, 90), random(10000, 12000)))
	end

    pirateFighterNames = {"Wraith One", "Wraith Two", "Wraith Three", "Wraith Four", "Wraith Five", "Wraith Six", "Wraith Seven", "Wraith Eight"}
	for i,name in ipairs(pirateFighterNames) do
		table.insert(enemyList, setCirclePos(CpuShip():setTemplate('Hauler'):setFaction("Rising Flame"):setCallSign(name):setAI("fighter"):setRotation(180):orderRoaming(), 0, 0, random(120, 150), random(10000, 12000)))
	end
	
end



function update(delta)

	



end
