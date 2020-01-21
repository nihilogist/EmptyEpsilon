
wreck = FactionInfo():setName("Wreckage")
wreck:setGMColor(128, 128, 128)
wreck:setDescription([[Many ships have been lost in the Wake over the millenia. These shattered hulks are the catacombs of warp space, their plasma drives quiet and their weapons inactive.]])

imperium = FactionInfo():setName("Imperial Navy")
imperium:setGMColor(255, 255, 255)
imperium:setDescription([[The ships of the Great and Undaunted Imperial Navy are the pride of the starlanes, each of them a cathedral of the void.]])

risingFlame = FactionInfo():setName("Rising Flame")
risingFlame:setGMColor(180, 90, 90)
risingFlame:setDescription([[The Rising Flame's navy is small, but their exceptional intelligence gathering capability means that they are often exactly where they need to be to strike hardest at the Imperiuim.]])
risingFlame:setEnemy(imperium)
imperium:setEnemy(risingFlame)




