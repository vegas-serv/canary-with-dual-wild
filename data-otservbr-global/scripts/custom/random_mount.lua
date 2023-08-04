local chance = 30

local randMount = Action()

function randMount.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if player:hasMount(207) and player:hasMount(208) and player:hasMount(209) and player:hasMount(210) and player:hasMount(211) and player:hasMount(212) then
        player:sendTextMessage(MESSAGE_STATUS_SMALL, "You've already obtained all rewards.")
        return player:getPosition():sendMagicEffect(CONST_ME_POFF)
    end
    local effect = CONST_ME_POFF
    if math.random(100) <= chance and not player:hasMount(207) then
        player:addMount(207)
        effect = CONST_ME_MAGIC_RED
    elseif not player:hasMount(208) then
        player:addMount(208)
        effect = CONST_ME_MAGIC_BLUE
    
	elseif not player:hasMount(209) then
        player:addMount(209)
        effect = CONST_ME_MAGIC_BLUE
    
	elseif not player:hasMount(210) then
        player:addMount(210)
        effect = CONST_ME_MAGIC_BLUE
    
	elseif not player:hasMount(211) then
        player:addMount(211)
        effect = CONST_ME_MAGIC_BLUE
    
	elseif not player:hasMount(212) then
        player:addMount(212)
        effect = CONST_ME_MAGIC_BLUE
    end
    player:getPosition():sendMagicEffect(effect)
    item:remove(1)
    return true
end

randMount:id(22152)
randMount:register()