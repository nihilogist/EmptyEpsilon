-- Script to create a set of wrecked ships.
function createWreckedShips() 
    nonHauntedWreckNames = {"Spiteful", "Dux Cornovi", "Golden Farrel"}
    nonHauntedWrecks = {}
    for i,v in ipairs(nonHauntedWreckNames) do
        table.insert(nonHauntedWrecks, setCirclePos(CpuShip():setTemplate('Wrecked Destroyer'):setFaction("Wreckage"):setCallSign("Unknown Contact"):setRotation(random(0, 360)):orderIdle(), 0, 0, random(0, 360), random(10000, 20000)))
    end
    return nonHauntedWreckNames, nonHauntedWrecks
end