--[[                  Cruisers
Corvettes are the common large ships. Larger then a frigate, smaller then a dreadnaught.
They generally have 4 or more shield sections. Run with a crew of 20 to 250.
This class generally has jumpdrives or warpdrives. But lack the maneuverability that is seen in frigates.

They come in 3 different subclasses:
* Destroyer: Combat oriented ships. No science, no transport. Just death in a large package.
* Support: Large scale support roles. Drone carriers fall in this category. As well as mobile repair centers.
* Freighter: Large scale transport ships. Most common here are the jump freighters, using specialized jumpdrives to cross large distances with large amounts of cargo.
----------------------------------------------------------]]

--[[----------------------Destroyers----------------------]]

template = ShipTemplate():setName("Dauntless Class Cruiser"):setClass("Corvette", "Destroyer"):setModel("battleship_destroyer_1_upgraded")
template:setDescription([[This ship was built to address the desperate need for carriers in Battle fleet Gothic, and the Dauntless served its role as a cruiser/light carrier hybrid admirably well.]])
template:setRadarTrace("radar_dauntless.png")
template:setHull(750)
template:setShields(200, 200, 200, 200)
template:setSpeed(30, 3.5, 5)
--                  Arc, Dir, Range, CycleTime, Dmg
template:setBeam(0, 90, 0, 5000.0, 20.0, 30)
template:setTubes(4, 10.0)
template:setWeaponStorage("HVLI", 20)
template:setWeaponStorage("Homing", 4)
template:setTubeDirection(0, -90)
template:setTubeDirection(1, -90)
template:setTubeDirection(2,  90)
template:setTubeDirection(3,  90)
template:setDockClasses("Starfighter")

variation = template:copy("Regency Pattern Dauntless Light Cruiser"):setType("playership")
variation:setDescription([[This ship dates from the Regency era in the Prosperitas sector. It appears to differ slightly from the standard Mars-template Dauntless light cruiser.]])
variation:setShields(200, 200, 200, 200)
variation:setHull(750)
variation:setSpeed(30, 5, 15)
variation:setWeaponStorage("Homing", 12)
variation:setWeaponStorage("HVLI", 100)
variation:setTubes(5, 10.0) -- Amount of torpedo tubes, and loading time of the tubes.
variation:weaponTubeDisallowMissle(0, "Homing"):weaponTubeDisallowMissle(1, "Homing")
variation:weaponTubeDisallowMissle(2, "Homing"):weaponTubeDisallowMissle(3, "Homing")
variation:setTubeDirection(4, 0)
variation:weaponTubeDisallowMissle(4, "HVLI")

variation:addRoomSystem(1, 0, 2, 1, "Maneuver");
variation:addRoomSystem(1, 1, 2, 1, "BeamWeapons");
variation:addRoom(2, 2, 2, 1);

variation:addRoomSystem(0, 3, 1, 2, "RearShield");
variation:addRoomSystem(1, 3, 2, 2, "Reactor");
variation:addRoomSystem(3, 3, 2, 2, "Warp");
variation:addRoomSystem(5, 3, 1, 2, "JumpDrive");
variation:addRoom(6, 3, 2, 1);
variation:addRoom(6, 4, 2, 1);
variation:addRoomSystem(8, 3, 1, 2, "FrontShield");

variation:addRoom(2, 5, 2, 1);
variation:addRoomSystem(1, 6, 2, 1, "MissileSystem");
variation:addRoomSystem(1, 7, 2, 1, "Impulse");

variation:addDoor(1, 1, true);
variation:addDoor(2, 2, true);
variation:addDoor(3, 3, true);
variation:addDoor(1, 3, false);
variation:addDoor(3, 4, false);
variation:addDoor(3, 5, true);
variation:addDoor(2, 6, true);
variation:addDoor(1, 7, true);
variation:addDoor(5, 3, false);
variation:addDoor(6, 3, false);
variation:addDoor(6, 4, false);
variation:addDoor(8, 3, false);
variation:addDoor(8, 4, false);
 
--Airlock doors
--variation:addDoor(2, 2, false);
--variation:addDoor(2, 5, false);

template = ShipTemplate():setName("Pirate Destroyer"):setClass("Corvette", "Destroyer"):setModel("battleship_destroyer_4_upgraded")
template:setDescription([[This ship appears to be based on the Cobra Class destroyer. Its armament has been heavily altered from the standard pattern.]])
template:setRadarTrace("radar_dread.png")
template:setHull(200)
template:setShields(100)
template:setSpeed(40, 6, 5)
template:setJumpDrive(true)
--                  Arc, Dir, Range, CycleTime, Dmg
template:setBeam(0, 270, 0, 2000.0, 10.0, 11)
template:setTubes(2, 10.0)
template:setWeaponStorage("Homing", 4)



variation = template:copy("Pirate Destroyer"):setType("playership")
variation:setDescription([[This ship appears to be based on the Cobra Class destroyer. Its armament has been heavily altered from the standard pattern]])
variation:addRoomSystem(1, 0, 2, 1, "Maneuver");
variation:addRoomSystem(1, 1, 2, 1, "BeamWeapons");
variation:addRoom(2, 2, 2, 1);

variation:addRoomSystem(0, 3, 1, 2, "RearShield");
variation:addRoomSystem(1, 3, 2, 2, "Reactor");
variation:addRoomSystem(3, 3, 2, 2, "Warp");
variation:addRoomSystem(5, 3, 1, 2, "JumpDrive");
variation:addRoom(6, 3, 2, 1);
variation:addRoom(6, 4, 2, 1);
variation:addRoomSystem(8, 3, 1, 2, "FrontShield");

variation:addRoom(2, 5, 2, 1);
variation:addRoomSystem(1, 6, 2, 1, "MissileSystem");
variation:addRoomSystem(1, 7, 2, 1, "Impulse");

variation:addDoor(1, 1, true);
variation:addDoor(2, 2, true);
variation:addDoor(3, 3, true);
variation:addDoor(1, 3, false);
variation:addDoor(3, 4, false);
variation:addDoor(3, 5, true);
variation:addDoor(2, 6, true);
variation:addDoor(1, 7, true);
variation:addDoor(5, 3, false);
variation:addDoor(6, 3, false);
variation:addDoor(6, 4, false);
variation:addDoor(8, 3, false);
variation:addDoor(8, 4, false);



--[[-----------------------Support-----------------------]]

-- The weapons-platform is a stationary platform with beam-weapons. It's extremely slow to turn, but it's beam weapons do a huge amount of damage.
-- Smaller ships can dock to this platform to re-supply.
template = ShipTemplate():setName("Defense platform"):setClass("Corvette", "Support"):setModel("space_station_4")
template:setDescription([[This stationary defense platform operates like a station, with docking and resupply functions, but is armed with powerful beam weapons and can slowly rotate. Larger systems often use these platforms to resupply patrol ships.]])
template:setRadarTrace("radartrace_smallstation.png")
template:setHull(150)
template:setShields(120, 120, 120, 120, 120, 120)
template:setSpeed(0, 0.5, 0)
template:setDockClasses("Starfighter", "Frigate")
--               Arc, Dir, Range, CycleTime, Dmg
template:setBeam(0, 30,   0, 4000.0, 1.5, 20)
template:setBeam(1, 30,  60, 4000.0, 1.5, 20)
template:setBeam(2, 30, 120, 4000.0, 1.5, 20)
template:setBeam(3, 30, 180, 4000.0, 1.5, 20)
template:setBeam(4, 30, 240, 4000.0, 1.5, 20)
template:setBeam(5, 30, 300, 4000.0, 1.5, 20)

--[[----------------------Freighters----------------------]]

for cnt=1,5 do
    template = ShipTemplate():setName("Personnel Freighter " .. cnt):setClass("Corvette", "Freighter"):setModel("transport_1_" .. cnt)
    template:setDescription([[These freighters are designed to transport armed troops, military support personnel, and combat gear.]])
    template:setHull(100)
    template:setShields(50, 50)
    template:setSpeed(60 - 5 * cnt, 6, 10)
    template:setRadarTrace("radar_transport.png")
    
    if cnt > 2 then
        variation = template:copy("Personnel Jump Freighter " .. cnt)
        variation:setJumpDrive(true)
    end

    template = ShipTemplate():setName("Goods Freighter " .. cnt):setClass("Corvette", "Freighter"):setModel("transport_2_" .. cnt)
    template:setDescription([[Cargo freighters haul large loads of cargo across long distances on impulse power. Their cargo bays include climate control and stabilization systems that keep the cargo in good condition.]])
    template:setHull(100)
    template:setShields(50, 50)
    template:setSpeed(60 - 5 * cnt, 6, 10)
    template:setRadarTrace("radar_transport.png")
    
    if cnt > 2 then
        variation = template:copy("Goods Jump Freighter " .. cnt)
        variation:setJumpDrive(true)
    end
    
    template = ShipTemplate():setName("Garbage Freighter " .. cnt):setClass("Corvette", "Freighter"):setModel("transport_3_" .. cnt)
    template:setDescription([[These freighters are specially designed to haul garbage and waste. They are fitted with a trash compactor and fewer stabilzation systems than cargo freighters.]])
    template:setHull(100)
    template:setShields(50, 50)
    template:setSpeed(60 - 5 * cnt, 6, 10)
    template:setRadarTrace("radar_transport.png")
    
    if cnt > 2 then
        variation = template:copy("Garbage Jump Freighter " .. cnt)
        variation:setJumpDrive(true)
    end

    template = ShipTemplate():setName("Equipment Freighter " .. cnt):setClass("Corvette", "Freighter"):setModel("transport_4_" .. cnt)
    template:setDescription([[Equipment freighters have specialized environmental and stabilization systems to safely carry delicate machinery and complex instruments.]])
    template:setHull(100)
    template:setShields(50, 50)
    template:setSpeed(60 - 5 * cnt, 6, 10)
    template:setRadarTrace("radar_transport.png")
    
    if cnt > 2 then
        variation = template:copy("Equipment Jump Freighter " .. cnt)
        variation:setJumpDrive(true)
    end

    template = ShipTemplate():setName("Fuel Freighter " .. cnt):setClass("Corvette", "Freighter"):setModel("transport_5_" .. cnt)
    template:setDescription([[Fuel freighters have massive tanks for hauling fuel, and delicate internal sensors that watch for any changes to their cargo's potentially volatile state.]])
    template:setHull(100)
    template:setShields(50, 50)
    template:setSpeed(60 - 5 * cnt, 6, 10)
    template:setRadarTrace("radar_transport.png")
    
    if cnt > 2 then
        variation = template:copy("Fuel Jump Freighter " .. cnt)
        variation:setJumpDrive(true)
    end
end

template = ShipTemplate():setName("Jump Carrier"):setClass("Corvette", "Freighter"):setModel("transport_4_2")
template:setDescription([[The Jump Carrier is a specialized Freighter. It does not carry any cargo, as it's cargo bay is taken up by a specialized jump drive and the energy storage required to run this jump drive.
It is designed to carry other ships deep into space. So it has special docking parameters, allowing other ships to attach themselves to this ship.]])
template:setHull(100)
template:setShields(50, 50)
template:setSpeed(50, 6, 10)
template:setRadarTrace("radar_transport.png")
template:setJumpDrive(true)
template:setJumpDriveRange(5000, 100 * 50000) -- The jump carrier can jump a 100x longer distance then normal jump drives.
template:setDockClasses("Starfighter", "Frigate", "Corvette")


variation = template:copy("Benedict"):setType("playership"):setClass("Corvette","Freighter/Carrier")
variation:setDescription("Benedict is an improved version of the Jump Carrier")
variation:setShields(70, 70)
variation:setHull(200)
variation:setSpeed(60, 6, 8)
--                  Arc, Dir, Range, CycleTime, Dmg
variation:setBeam(0, 10,   0, 1500.0, 6.0, 4)
variation:setBeam(1, 10, 180, 1500.0, 6.0, 4)
--                       Arc, Dir, Rotate speed
variation:setBeamWeaponTurret( 0, 90,   0, 6)
variation:setBeamWeaponTurret( 1, 90, 180, 6)
variation:setCombatManeuver(400, 250)
variation:setJumpDriveRange(5000, 90000) 

variation:setRepairCrewCount(6)
variation:addRoomSystem(3,0,2,3, "Reactor")
variation:addRoomSystem(3,3,2,3, "Warp")
variation:addRoomSystem(6,0,2,3, "JumpDrive")
variation:addRoomSystem(6,3,2,3, "MissileSystem")
variation:addRoomSystem(5,2,1,2, "Maneuver")
variation:addRoomSystem(2,2,1,2, "RearShield")
variation:addRoomSystem(0,1,2,4, "Beamweapons")
variation:addRoomSystem(8,2,1,2, "FrontShield")
variation:addRoomSystem(9,1,2,4, "Impulse")

variation:addDoor(3, 3, true)
variation:addDoor(6, 3, true)
variation:addDoor(5, 2, false)
variation:addDoor(6, 3, false)
variation:addDoor(3, 2, false)
variation:addDoor(2, 3, false)
variation:addDoor(8, 2, false)
variation:addDoor(9, 3, false)

var2 = variation:copy("Kiriya")
var2:setDescription("Kiriya is an improved warp drive version of the Jump Carrier")
--          Arc, Dir, Range, CycleTime, Dmg
var2:setBeam(0, 10,   0, 1500.0, 6.0, 4)
var2:setBeam(1, 10, 180, 1500.0, 6.0, 4)
--                      Arc, Dir, Rotate speed
var2:setBeamWeaponTurret( 0, 90,   0, 6)
var2:setBeamWeaponTurret( 1, 90, 180, 6)
var2:setJumpDrive(false)
var2:setWarpSpeed(750)
