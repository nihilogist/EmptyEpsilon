-- Script to create a set of wrecked ships.
function createWreckedShips(shipwrecks)
    
    -- Create the wrecks from the config data
    for i, wreckConfig in ipairs(shipwrecks) do
        local wreckClass = getWreckClass(wreckConfig)
        local wreckBaseDescription = getWreckUnscannedDescription(wreckConfig)
        local wreckXPosition = getWreckXPosition(wreckConfig)
        local wreckYPosition = getWreckYPosition(wreckConfig)
        table.insert(wreckConfig, CpuShip():setTemplate(wreckClass):setDescription(wreckBaseDescription):setFaction("Wreckage"):setCallSign("Unknown Contact"):setRotation(random(0, 360)):orderIdle():setPosition(wreckXPosition, wreckYPosition):setSystemHealth("reactor", 0.0):setSystemHealth("beamweapons", 0.0):setSystemHealth("maneuver", 0.0):setSystemHealth("missilesystem", 0.0):setSystemHealth("frontshield", 0.0):setSystemHealth("impulse", 0.0))

    end
    
end

function updateWreckedShipsCallsigns(shipwreckDetails)
    -- Check over the wreck configuration to see if any of them need to have their descriptions updated
    for i,wreckConfig in ipairs(shipwreckDetails) do
        -- get the wrecked ship
        local wreckedShip = getWreckShip(wreckConfig)
        -- check if it is valid (not detonated)
        if wreckedShip:isValid() then
            -- Check to see if it's fully scanned
            if wreckedShip:isFullyScannedByFaction(1) then
                wreckedShip:setCallSign(getWreckName(wreckConfig))
                wreckedShip:setDescription(getWreckFullyScannedDescription(wreckConfig) .. "\n\n" .. getWreckScannedDescription(wreckConfig) .. "\n\n" .. getWreckUnscannedDescription(wreckConfig))
                -- or if it's partially scanned
            else if wreckedShip:isScannedByFaction("Imperial Navy") then
                wreckedShip:setCallSign(getWreckClass(wreckConfig))
                wreckedShip:setDescription(getWreckScannedDescription(wreckConfig) .. "\n\n" .. getWreckUnscannedDescription(wreckConfig))
            end
        end
    end
end
end

function getWreckName(wreckConfig)
    return wreckConfig[1]
end

function getWreckXPosition(wreckConfig)
    return wreckConfig[2]
end

function getWreckYPosition(wreckConfig)
    return wreckConfig[3]
end

function getWreckClass(wreckConfig)
    return wreckConfig[4]
end

function getWreckUnscannedDescription(wreckConfig)
    return "+++ AUSPEX_RETURN +++\n\n" .. wreckConfig[5]
end

function getWreckScannedDescription(wreckConfig)
    return "+++ AUSPEX_ANALYSE +++\n\n" .. wreckConfig[6]
end

function getWreckFullyScannedDescription(wreckConfig)
    return "+++ COGITATOR_CALIBRATION +++\n\n" .. wreckConfig[7]
end

function getWreckShip(wreckConfig)
    return wreckConfig[8]
end


-- What do we need in terms of stuff to define a ship?
-- Name
-- PositionX
-- PositionY
-- Rotation
-- Class
-- Description (unscanned)
-- Description (scanned)
-- Actual game object
