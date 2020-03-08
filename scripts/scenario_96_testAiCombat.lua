-- Name: The Arena
-- Description: Friday Night - 2000 till 2300
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
    
    CpuShip():setFaction("Rising Flame"):setTemplate("Wrecked Cruiser"):setCallSign("Sitting Duck"):setPosition(2089, 150):orderRoaming():setWeaponStorage("Macro", 97)




	
end


function update(delta)


end
