local table = {
  
        -- [1,5] = VOCATION ID
        -- [LEVEL] = {items = {{itemid = ITEM_ID, count = COUNT}}, storage = YOU_CHOOSE, msg = "MESSAGE FOR THE PLAYER"},

   [{1, 5}] = {
     [10] = {items = {{itemid = 3043, count = 1}}, storage = 40100, msg = "You won crystal coin for reaching level 10!"},
     [25] = {items = {{itemid = 3043, count = 4}}, storage = 40101, msg = "You won crystal coins for reaching level 25!"},
     [50] = {items = {{itemid = 3043, count = 5}}, storage = 40102, msg = "You won crystal coins for reaching level 50!"}
   },
   [{2, 6}] = {
     [10] = {items = {{itemid = 3043, count = 1}}, storage = 40201, msg = "You won crystal coin for reaching level 10!"},
     [25] = {items = {{itemid = 3043, count = 4}}, storage = 40202, msg = "You won crystal coins for reaching level 25!"},
     [50] = {items = {{itemid = 3043, count = 5}}, storage = 40203, msg = "You won crystal coins for reaching level 50!"}
   },
   [{3, 7}] = {
     [10] = {items = {{itemid = 3043, count = 1}}, storage = 40301, msg = "You won crystal coin for reaching level 10!"},
     [25] = {items = {{itemid = 3043, count = 4}}, storage = 40302, msg = "You won crystal coins for reaching level 25!"},
     [50] = {items = {{itemid = 3043, count = 5}}, storage = 40303, msg = "You won crystal coins for reaching level 50!"}
   },
   [{4, 8}] = {
     [10] = {items = {{itemid = 3043, count = 1}}, storage = 40401, msg = "You won crystal coin for reaching level 10!"},
     [25] = {items = {{itemid = 3043, count = 4}}, storage = 40402, msg = "You won crystal coins for reaching level 25!"},
     [50] = {items = {{itemid = 3043, count = 5}}, storage = 40403, msg = "You won crystal coins for reaching level 50!"}
   }
}

local rewardLevel = CreatureEvent("RewardLevel")
function rewardLevel.onAdvance(player, skill, oldLevel, newLevel)


    if skill ~= SKILL_LEVEL or newLevel <= oldLevel then
        
        return true
    
    end

        for voc, x in pairs(table) do
            if isInArray(voc, player:getVocation():getId()) then
            	for level, z in pairs(x) do
            		if newLevel >= level and player:getStorageValue(z.storage) ~= 1 then
                		for v = 1, #z.items do
                			local ret = ", "
                			if v == 1 then
                			ret = ""
                		
                                        end
				        player:addItem(z.items[v].itemid, z.items[v].count)
            				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, z.msg)
            				player:setStorageValue(z.storage, 1)
                		end
                        end
                end
      
   			player:save()

   			return true
   
            end
         end
end

rewardLevel:register()