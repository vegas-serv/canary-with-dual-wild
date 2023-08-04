local horsesmount = Action()
function horsesmount.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if player:hasMount(213) then
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        player:sendTextMessage(MESSAGE_INFO_DESCR, "You already have this mount.")
        return true
    end

    player:addMount(213) -- Id da Mount
    player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
    player:say('You received mount Lula.', TALKTYPE_ORANGE_1)
    return true
end

horsesmount:uid(62224)
horsesmount:register()