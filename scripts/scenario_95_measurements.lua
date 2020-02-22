-- Name: Config and measure
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
    
    Asteroid():setPosition(-300, -300)
    Asteroid():setPosition(300, -300)
    Asteroid():setPosition(0, -300)





	
end


function update(delta)


end
