
wreck = FactionInfo():setName("Wreckage")
wreck:setGMColor(128, 128, 128)
wreck:setDescription([[Many ships have been lost in the Wake over the millenia. These shattered hulks are the catacombs of warp space, their plasma drives quiet and their weapons inactive.]])

imperium = FactionInfo():setName("Imperial Navy")
imperium:setGMColor(255, 255, 255)
imperium:setDescription([[The ships of the Great and Undaunted Imperial Navy are the pride of the starlanes, each of them a cathedral of the void.]])

risingFlame = FactionInfo():setName("Rising Flame")
risingFlame:setGMColor(180, 90, 90)
risingFlame:setDescription([[The Rising Flame's navy is small, but their exceptional intelligence gathering capability means that they are often exactly where they need to be to strike hardest at the Imperiuim.]])

pikes = FactionInfo():setName("Pikes")
pikes:setGMColor(90, 180, 90)
pikes:setDescription([[The Pikes are the privateer arm of the Circle Of Thorns crime syndicate.]])

pikesHostile = FactionInfo():setName("The Pikes")
pikesHostile:setGMColor(70, 220, 70)
pikesHostile:setDescription([[The Pikes are the privateer arm of the Circle Of Thorns crime syndicate.]])

kirill = FactionInfo():setName("Kirill")
kirill:setGMColor(90, 90, 180)
kirill:setDescription([[Clan Kirill are the most populous pirate band in The Wake]])

kirillHostile = FactionInfo():setName("Clan Kirill")
kirillHostile:setGMColor(70, 70, 220)
kirillHostile:setDescription([[Clan Kirill are the most populous pirate band in The Wake]])

wakeCult = FactionInfo():setName("Wake Cult")
wakeCult:setGMColor(255,192,203)
wakeCult:setDescription([[The Wake Cult are eeeeevil.]])

childrenOfTain = FactionInfo():setName("Children of Tain")
childrenOfTain:setGMColor(255,192,203)
childrenOfTain:setDescription([[More bad guys.]])

unknown = FactionInfo():setName("Unknown Ship")
unknown:setGMColor(80, 80, 180)
unknown:setDescription([[The Imperium is vast, and not everything is charted.]])

-- Rising Flame is directly opposed to Imperial Navy and vice versa
risingFlame:setEnemy(imperium)
imperium:setEnemy(risingFlame)

-- Pikes Hostile are opposed to the Imperial Navy and vice versa
pikesHostile:setEnemy(imperium)
imperium:setEnemy(pikesHostile)

-- Kirill Hostile are opposed to the Imperial Navy and vice versa
kirillHostile:setEnemy(imperium)
imperium:setEnemy(kirillHostile)

-- Wake Cult are opposed to the Imperial Navy and vice versa
wakeCult:setEnemy(imperium)
imperium:setEnemy(wakeCult)

-- childrenOfTain are opposed to the Imperial Navy and vice versa
childrenOfTain:setEnemy(imperium)
imperium:setEnemy(childrenOfTain)

-- everyone is opposed to the unknown threat
risingFlame:setEnemy(unknown)
imperium:setEnemy(unknown)
pikes:setEnemy(unknown)
pikesHostile:setEnemy(unknown)
kirill:setEnemy(unknown)
kirillHostile:setEnemy(unknown)

-- the unknown ships attack *everyone*
unknown:setEnemy(imperium)
unknown:setEnemy(risingFlame)
unknown:setEnemy(pikes)
unknown:setEnemy(pikesHostile)
unknown:setEnemy(kirill)
unknown:setEnemy(kirillHostile)

