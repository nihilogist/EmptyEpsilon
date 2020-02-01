-- Scripts to create and manage the haunted wrecks of The Wake
function createHauntedWrecks()
    hauntedWreckNames = {"Heart of Light", "Rhadamantine"}
    hauntedWrecks = {}
    
    for i,name in ipairs(hauntedWreckNames) do
        table.insert(hauntedWrecks, setCirclePos(CpuShip():setTemplate('Wrecked Destroyer'):setFaction("Wreckage"):setCallSign("Unknown Contact"):setRotation(random(0, 360)):orderIdle(), 0, 0, random(0, 360), random(15000, 20000)))
    end
    
    return hauntedWreckNames, hauntedWrecks
end

function createAllGhostShips()
    ghostShips = {}
    for i,wreck in ipairs(hauntedWrecks) do
        -- check if wreck is still valid
        if (hauntedWrecks[i]:isValid()) then
            -- if so, then get the position of the wreck
            local posX, posY = hauntedWrecks[i]:getPosition()
            -- and create a ghost ship nearby
            table.insert(ghostShips, setCirclePos(CpuShip():setTemplate('Unknown Destroyer'):setFaction("Unknown Ship"):setCallSign("Unknown Contact"):setRotation(180):orderDefendTarget(hauntedWrecks[i]), posX, posY, random(0, 360), random(1000, 2000)))
        end
    end
    return ghostShips
end

function updateHauntedWreckCallsigns()
    -- Check over the list of haunted wrecks to see if any of them need to be updated
	for i,name in ipairs(hauntedWreckNames) do
		if hauntedWrecks[i]:isScannedByFaction("Imperial Navy") then
			hauntedWrecks[i]:setCallSign(name)
		end
	end
end

function updateGhostShipCallsigns()
    -- Check over the list of haunted wrecks to see if any of them need to be updated
	for i,name in ipairs(hauntedWreckNames) do
		if ghostShips[i]:isScannedByFaction("Imperial Navy") then
			ghostShips[i]:setCallSign(name)
		end
	end
end