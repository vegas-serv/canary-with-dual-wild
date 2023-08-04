local premiocastle = Action()

function premiocastle.onUse(cid, item, item2, topos, frompos) 
local config = {
    time = 2160,       -- Tempo em minutos para usar novamente
    level = 400,      -- Level minimo para dar USE e receber o item
    storage = 42007, -- Não Altere Isso (storage, apenas se souber)
    efeito = 66      -- Efeito que vai sair
} 

    if getPlayerLevel(cid) <= config.level then 
        return doPlayerSendCancel(cid, "You do not have enough level to use this.") 
    end

    if getPlayerStorageValue(cid, config.storage) > os.time() then 
  local minutes = (math.ceil((getPlayerStorageValue(cid, config.storage) - os.time())/60))
  local s = (math.ceil(((getPlayerStorageValue(cid, config.storage) - os.time())/60)) == 1 and "" or "s")
       return doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Wait ".. minutes .." minute".. s .." to use again.") 
    end

    pos = getThingPos(cid) 
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "You received a stamina refil.") 
        doSendMagicEffect(pos, config.efeito)
        setPlayerStorageValue(cid, config.storage, config.time * 60 + os.time())
        doPlayerAddItem(cid, 8153, 1)
   return true
end

premiocastle:aid(2126)
premiocastle:register()