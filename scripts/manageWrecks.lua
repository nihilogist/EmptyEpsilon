-- Script to create a set of wrecked ships.
function createWreckedShips()
    nonHauntedWreckConfig = {
        {"Spiteful", "Wrecked Destroyer", "Auspex return suggests a wrecked ship", "The wreck of a once-proud Cobra Destroyer, now darkened forever in the void of the Wake.", "The wreckage of the HIMVS Spiteful, a Cobra Destroyer listed as Still On Patrol."},
        {"Dux Cornovi", "Wrecked Destroyer", "Auspex return suggests a wrecked ship", "The wreck of a once-proud Cobra Destroyer, now darkened forever in the void of the Wake.", "The wreckage of the HIMVS Dux Cornovi, a Cobra Destroyer listed as Still On Patrol."},
        {"Golden Farrel", "Wrecked Destroyer", "Auspex return suggests a wrecked ship", "The wreck of a once-proud Cobra Destroyer, now darkened forever in the void of the Wake.", "The wreckage of the HIMVS Golden Farrel, a Cobra Destroyer listed as Still On Patrol."}
    }
    
    -- Create the wrecks from the config data
    for i, wreckConfig in ipairs(nonHauntedWreckConfig) do
        local wreckClass = getWreckClass(wreckConfig)
        local wreckBaseDescription = getWreckUnscannedDescription(wreckConfig)
        table.insert(wreckConfig, setCirclePos(CpuShip():setTemplate(wreckClass):setDescription(wreckBaseDescription):setFaction("Wreckage"):setCallSign("Unknown Contact"):setRotation(random(0, 360)):orderIdle(), 0, 0, random(0, 360), random(10000, 20000)))
    end
    
end

function updateWreckedShipsCallsigns()
    -- Check over the wreck configuration to see if any of them need to have their descriptions updated
    for i,wreckConfig in ipairs(nonHauntedWreckConfig) do
        -- get the wrecked ship
        local wreckedShip = getWreckShip(wreckConfig)
        -- check if it is valid (not detonated)
        if wreckedShip:isValid() then
            -- Check to see if it's fully scanned
            if wreckedShip:isFullyScannedByFaction(1) then
                wreckedShip:setCallSign(getWreckName(wreckConfig))
                wreckedShip:setDescription(getWreckFullyScannedDescription(wreckConfig))
                -- or if it's partially scanned
            else if wreckedShip:isScannedByFaction("Imperial Navy") then
                wreckedShip:setCallSign(getWreckClass(wreckConfig))
                wreckedShip:setDescription(getWreckScannedDescription(wreckConfig))
            end
        end
    end
end
end

function getWreckName(wreckConfig)
    return wreckConfig[1]
end

function getWreckClass(wreckConfig)
    return wreckConfig[2]
end

function getWreckUnscannedDescription(wreckConfig)
    return wreckConfig[3]
end

function getWreckScannedDescription(wreckConfig)
    return wreckConfig[4]
end

function getWreckFullyScannedDescription(wreckConfig)
    return wreckConfig[5]
end

function getWreckShip(wreckConfig)
    return wreckConfig[6]
end


-- What do we need in terms of stuff to define a ship?
-- Name
-- Class
-- Description (unscanned)
-- Description (scanned)
-- Actual game object
