-- Script to create a set of wrecked ships.
function createWreckedShips()
    nonHauntedWreckConfig = {
        {"Spiteful", "Wrecked Destroyer", "The wreck of a once-proud Cobra Destroyer, now darkened forever in the void of the Wake.", "The wreckage of the HIMVS Spiteful, a Cobra Destroyer listed as Still On Patrol."},
        {"Dux Cornovi", "Wrecked Destroyer", "The wreck of a once-proud Cobra Destroyer, now darkened forever in the void of the Wake.", "The wreckage of the HIMVS Dux Cornovi, a Cobra Destroyer listed as Still On Patrol."},
        {"Golden Farrel", "Wrecked Destroyer", "The wreck of a once-proud Cobra Destroyer, now darkened forever in the void of the Wake.", "The wreckage of the HIMVS Golden Farrel, a Cobra Destroyer listed as Still On Patrol."}
    }
    
    -- Create the wrecks from the config data
    for i, wreckConfig in ipairs(nonHauntedWreckConfig) do
        local wreckClass = wreckConfig[2]
        local wreckBaseDescription = wreckConfig[3]
        local wreckAdvancedDescription = wreckConfig[4]
        table.insert(wreckConfig, setCirclePos(CpuShip():setTemplate(wreckClass):setDescription(wreckBaseDescription, wreckAdvancedDescription):setFaction("Wreckage"):setCallSign("Unknown Contact"):setRotation(random(0, 360)):orderIdle(), 0, 0, random(0, 360), random(10000, 20000)))
    end
    
    -- nonHauntedWreckNames = {"Dux Cornovi", "Golden Farrel"}
    -- nonHauntedWrecks = {}
    -- for i,v in ipairs(nonHauntedWreckNames) do
    --     table.insert(nonHauntedWrecks, setCirclePos(CpuShip():setTemplate('Wrecked Destroyer'):setFaction("Wreckage"):setCallSign("Unknown Contact"):setRotation(random(0, 360)):orderIdle(), 0, 0, random(0, 360), random(10000, 20000)))
    -- end
    -- return nonHauntedWreckNames, nonHauntedWrecks
end

function updateWreckedShipsCallsigns()
    -- Check over the wreck configuration to see if any of them need to have their descriptions updated
    for i,wreckConfig in ipairs(nonHauntedWreckConfig) do
        -- get the wrecked ship
        local wreckedShip = wreckConfig[5]
        -- check if it is valid (not detonated)
        if wreckedShip:isValid() then
            if wreckedShip:isScannedByFaction("Imperial Navy") then
                wreckedShip:setCallSign(wreckConfig[1])
                wreckedShip:setDescription(wreckConfig[4])
            end
        end
    end

    -- Check over the list of wrecks to see if any of them need to be updated
	-- for i,name in ipairs(nonHauntedWreckNames) do
	-- 	if nonHauntedWrecks[i]:isScannedByFaction("Imperial Navy") then
	-- 		nonHauntedWrecks[i]:setCallSign(name)
	-- 	end
	-- end
end


-- What do we need in terms of stuff to define a ship?
-- Name
-- Class
-- Description (unscanned)
-- Description (scanned)
-- Actual game object

