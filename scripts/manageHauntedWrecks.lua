-- Function to create the ghost ships for a set of ghost ship configurations
function createGhostShipsForHaunts(hauntedWreckConfiguration)
    -- iterate over the list of haunted wrecks
    for i, hauntedWreckConfig in ipairs(hauntedWreckConfiguration) do
        local ghostShipClass = getHauntedWreckGhostClass(hauntedWreckConfig)
        local ghostBaseDescription = getGhostShipUnscannedDescription(hauntedWreckConfig)
        local originalWreckXPos = getHauntedWreckXPosition(hauntedWreckConfig)
        local originalWreckYPos = getHauntedWreckYPosition(hauntedWreckConfig)
        --                   setCirclePos(CpuShip():setTemplate('Unknown Destroyer'):setFaction("Unknown Ship"):setCallSign("Unknown Contact"):setRotation(180):orderDefendTarget(hauntedWrecks[i]), posX, posY, random(0, 360), random(1000, 2000))
        local newGhostShip = CpuShip():setTemplate(ghostShipClass):setFaction("Unknown Ship"):setCallSign("Unknown Contact")
        setCirclePos(newGhostShip, originalWreckXPos, originalWreckYPos, random(0, 360), 500)
        table.insert(hauntedWreckConfig, newGhostShip)
    end
end

-- Function to create the wrecked ships for the haunts to spawn near.
function createWreckedShipsForHaunts(hauntedWreckConfiguration)
    for i, hauntedWreckConfig in ipairs(hauntedWreckConfiguration) do
        local wreckClass = getHauntedWreckClass(hauntedWreckConfig)
        local wreckBaseDescription = getHauntedWreckUnscannedDescription(hauntedWreckConfig)
        local wreckXPosition = getHauntedWreckXPosition(hauntedWreckConfig)
        local wreckYPosition = getHauntedWreckYPosition(hauntedWreckConfig)
        table.insert(hauntedWreckConfig, CpuShip():setTemplate(wreckClass):setDescription(wreckBaseDescription):setFaction("Wreckage"):setCallSign("Unknown Contact"):setRotation(random(0, 360)):orderIdle():setPosition(wreckXPosition, wreckYPosition):setSystemHealth("reactor", 0.0):setSystemHealth("beamweapons", 0.0):setSystemHealth("maneuver", 0.0):setSystemHealth("missilesystem", 0.0):setSystemHealth("frontshield", 0.0):setSystemHealth("impulse", 0.0))
    end
end

-- Function to update the callsigns and descriptions of the haunted wrecks.
function updateHauntedWreckedShipsCallsigns(hauntedWreckConfiguration)
    -- Check over the wreck configuration to see if any of them need to have their descriptions updated
    for i,wreckConfig in ipairs(hauntedWreckConfiguration) do
        -- get the wrecked ship
        local wreckedShip = getHauntedWreckShip(wreckConfig)
        -- check if it is valid (not detonated)
        if wreckedShip:isValid() then
            -- Check to see if it's fully scanned
            if wreckedShip:isFullyScannedByFaction(1) then
                wreckedShip:setCallSign(getHauntedWreckName(wreckConfig))
                wreckedShip:setDescription(getHauntedWreckFullyScannedDescription(wreckConfig) .. "\n\n" .. getHauntedWreckScannedDescription(wreckConfig) .. "\n\n" .. getHauntedWreckUnscannedDescription(wreckConfig))
                -- or if it's partially scanned
            else if wreckedShip:isScannedByFaction("Imperial Navy") then
                wreckedShip:setCallSign(getHauntedWreckClass(wreckConfig))
                wreckedShip:setDescription(getHauntedWreckScannedDescription(wreckConfig) .. "\n\n" .. getHauntedWreckUnscannedDescription(wreckConfig))
            end
        end
    end
end
end

-- Function to update the callsigns for any spawned ghost ships of a given configuration
function updateGhostShipsCallsigns(hauntedWreckConfiguration)
    -- Check over the wreck configuration to see if any of them need to have their descriptions updated
    for i,wreckConfig in ipairs(hauntedWreckConfiguration) do
        -- get the wrecked ship
        local ghostShip = getGhostShip(wreckConfig)
        -- check if it is valid (not detonated)
        if ghostShip:isValid() then
            -- Check to see if it's fully scanned
            if ghostShip:isFullyScannedByFaction(1) then
                ghostShip:setCallSign(getHauntedWreckName(wreckConfig))
                ghostShip:setDescription(getGhostShipFullyScannedDescription(wreckConfig) .. "\n\n" .. getGhostShipScannedDescription(wreckConfig) .. "\n\n" .. getGhostShipUnscannedDescription(wreckConfig))
                -- or if it's partially scanned
            else if ghostShip:isScannedByFaction("Imperial Navy") then
                ghostShip:setCallSign(getHauntedWreckClass(wreckConfig))
                ghostShip:setDescription(getGhostShipScannedDescription(wreckConfig) .. "\n\n" .. getGhostShipUnscannedDescription(wreckConfig))
            end
        end
    end
end
end

-- Function to massheal all the ghost ships
function healAllDamageToGhostShips(hauntedWreckConfiguration)
    -- Check over the ghost ships to see if any of them need to be healed
    for i,wreckConfig in ipairs(hauntedWreckConfiguration) do
        -- get the ghost ship
        local ghostShip = getGhostShip(wreckConfig)
        -- check if it is valid (not detonated)
        if ghostShip:isValid() then
            -- Heal all damage
            local hullMax = ghostShip:getHullMax()
            ghostShip:setHull(hullMax)
            -- Heal all system damage
            ghostShip:setSystemHealth("reactor", 1.0):setSystemHealth("beamweapons", 1.0):setSystemHealth("maneuver", 1.0):setSystemHealth("missilesystem", 1.0):setSystemHealth("frontshield", 1.0):setSystemHealth("impulse", 1.0)        
        end
    end
end

-- Function to check damage on the haunted wrecks and nuke the ghost ships if they have take a bunch
function checkForExorcism(hauntedWreckConfiguration)
    -- Check over the wreck configuration to see if any of them need to have their ghosts detonated
    for i,wreckConfig in ipairs(hauntedWreckConfiguration) do
        -- get the wrecked ship
        local hauntedWreck = getHauntedWreckShip(wreckConfig)
        -- check if it is valid (not detonated)
        if not hauntedWreck:isValid() then
            -- the wreck is blown up --> if there is a ghost ship then blow it up.
            local ghostShip = getGhostShip(wreckConfig)
            ghostShip:destroy()
        end
        -- check if the wreck has extensive damage
        if (hauntedWreck:getSystemHealth("impulse") < -0.5 or hauntedWreck:getSystemHealth("beamweapons") < -0.5 or hauntedWreck:getSystemHealth("missilesystem") < -0.5) then
            -- if so then destroy the wreck and the ghost
            hauntedWreck:destroy()
            local ghostShip = getGhostShip(wreckConfig)
            ghostShip:destroy()
        end
    end
end




-- Utility functions
function getHauntedWreckName(wreckConfig)
    return wreckConfig[1]
end

function getHauntedWreckXPosition(wreckConfig)
    return wreckConfig[2]
end

function getHauntedWreckYPosition(wreckConfig)
    return wreckConfig[3]
end

function getHauntedWreckClass(wreckConfig)
    return wreckConfig[4]
end

function getHauntedWreckGhostClass(wreckConfig)
    return wreckConfig[5]
end

function getHauntedWreckUnscannedDescription(wreckConfig)
    return "+++ AUSPEX_RETURN +++\n\n" .. wreckConfig[6]
end

function getHauntedWreckScannedDescription(wreckConfig)
    return "+++ AUSPEX_ANALYSE +++\n\n" .. wreckConfig[7]
end

function getHauntedWreckFullyScannedDescription(wreckConfig)
    return "+++ COGITATOR_CALIBRATION +++\n\n" .. wreckConfig[8]
end

function getGhostShipUnscannedDescription(wreckConfig)
    return "+++ AUSPEX_RETURN +++\n\n" .. wreckConfig[9]
end

function getGhostShipScannedDescription(wreckConfig)
    return "+++ AUSPEX_ANALYSE +++\n\n" .. wreckConfig[10]
end

function getGhostShipFullyScannedDescription(wreckConfig)
    return "+++ COGITATOR_CALIBRATION +++\n\n" .. wreckConfig[11]
end

function getHauntedWreckShip(wreckConfig)
    return wreckConfig[12]
end

function getGhostShip(wreckConfig)
    return wreckConfig[13]
end