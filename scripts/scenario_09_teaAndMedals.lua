-- Name: Tea and Medals
-- Description: Saturday till Time Out
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
    
    CpuShip():setFaction("Wreckage"):setTemplate("Lunar"):setCallSign("VS3"):setPosition(15236, 73):orderRoaming():setWeaponStorage("Macro", 96)
    CpuShip():setFaction("Wreckage"):setTemplate("Lunar"):setCallSign("BR2"):setPosition(14726, -2661):orderRoaming():setWeaponStorage("Macro", 96)





	
end


function update(delta)


end
