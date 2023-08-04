local horsemount = Action()
function horsemount.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if player:hasMount(9) then
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        player:sendTextMessage(MESSAGE_INFO_DESCR, "You already have this mount.")
        return true
    end

    player:addMount(9) -- Id da Mount
    player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
    player:say('You received mount Blazebringer.', TALKTYPE_ORANGE_1)
    return true
end

horsemount:uid(62054)
horsemount:register()