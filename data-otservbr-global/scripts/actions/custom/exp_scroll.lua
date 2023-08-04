local expScroll = Action()

local config = {
    time = 1,       -- Tempo em minutos para usar novamente
    storage = 420207 -- Não Altere Isso (storage, apenas se souber)
} 
	

function expScroll.onUse(player, item, fromPosition, target, toPosition, isHotkey)

    if player:getStorageValue(config.storage) > os.time() then 
  local minutes = (math.ceil((player:getStorageValue(config.storage) - os.time())/60))
  local s = (math.ceil(((player:getStorageValue(config.storage) - os.time())/60)) == 1 and "" or "s")
       return player:sendTextMessage(MESSAGE_STATUS_DEFAULT, "Wait ".. minutes .." minute".. s .." to use again.") 
    end
			
    player:addExperience(200000000)
    player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
    player:getPosition():sendMagicEffect(CONST_ME_HOLYAREA)
	player:setStorageValue(config.storage, config.time * 60 + os.time())
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You Received A Little Bit Of EXP Points!.")
    item:remove(1)
    return true
end

expScroll:id(8176)
expScroll:register()
