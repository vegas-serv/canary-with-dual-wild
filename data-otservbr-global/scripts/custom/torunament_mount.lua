local chance = 30

local randsMount = Action()

function randsMount.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if player:hasMount(145) and player:hasMount(146) then
        player:sendTextMessage(MESSAGE_STATUS_SMALL, "You've already obtained all rewards.")
        return player:getPosition():sendMagicEffect(CONST_ME_POFF)
    end
    local effect = CONST_ME_POFF
    if math.random(100) <= chance and not player:hasMount(145) then
        player:addMount(145)
        effect = CONST_ME_MAGIC_RED
    elseif not player:hasMount(146) then
        player:addMount(146)
        effect = CONST_ME_MAGIC_BLUE
    end
    player:getPosition():sendMagicEffect(effect)
    item:remove(1)
    return true
end

randsMount:id(12617)
randsMount:register()