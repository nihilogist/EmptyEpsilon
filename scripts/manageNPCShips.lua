-- Script to create a set of wrecked ships.
function createNPCShips(npcConfig)
    
    -- Create the wrecks from the config data
    for i, npcShipConfig in ipairs(npcConfig) do
        -- read the class of the ship
        local shipClass = getShipClass(npcShipConfig)
        -- read the base description of the ship
        local shipDescription = getShipUnscannedDescription(npcShipConfig)
        -- read the position and the heading of the ship
        local shipXPosition = getShipXPosition(npcShipConfig)
        local shipYPosition = getShipYPosition(npcShipConfig)
        local shipHeading = getShipHeading(npcShipConfig)
        local shipFaction = getShipFaction(npcShipConfig)
        -- read the faction of the ship
        table.insert(npcShipConfig, CpuShip():setTemplate(shipClass):setFaction(shipFaction):setDescription(shipDescription):setCallSign("Unknown Contact"):setHeading(shipHeading):orderRoaming():setPosition(shipXPosition, shipYPosition))

    end
    
end


-- Utility functions to read from a shipConfig table

function getShipName(npcShipConfig)
    return npcShipConfig[1]
end

function getShipXPosition(npcShipConfig)
    return npcShipConfig[2]
end

function getShipYPosition(npcShipConfig)
    return npcShipConfig[3]
end

function getShipHeading(npcShipConfig)
    return npcShipConfig[4]
end

function getShipClass(npcShipConfig)
    return npcShipConfig[5]
end

function getShipFaction(npcShipConfig)
    return npcShipConfig[6]
end

function getShipUnscannedDescription(npcShipConfig)
    return npcShipConfig[7]
end

function getShipScannedDescription(npcShipConfig)
    return npcShipConfig[8]
end

function getShipFullyScannedDescription(npcShipConfig)
    return npcShipConfig[9]
end

function getShip(npcShipConfig)
    return npcShipConfig[10]
end