local storeBox = Action()

local REWARD = {8153, 37317, 9586, 19082, 3043, 37110, 3079, 28887, 9145, 28895, 37378, 8176, 23487, 16129, 22516, 22721}
local JEWEL = {37317, 9586, 19082, 3043, 37110, 3079, 28887, 9145, 28895, 37378, 8176, 23487, 16129, 22516, 22721}
function storeBox.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local randomChance = math.random(1, #REWARD)
    player:addItem(REWARD[randomChance], 1)

    local randomLoot = math.random(1,20)
    if randomLoot == 1 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You found an extra item!")
        local randomChance = math.random(1, #REWARD)
        player:addItem(REWARD[randomChance], 1)
    end

    local randomJewel = math.random(1,10)
    if randomJewel == 1 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You found a jewel!")
        local randomChance = math.random(1, #JEWEL)
        player:addItem(JEWEL[randomChance], 1)
    end

    player:getPosition():sendMagicEffect(CONST_ME_THUNDER)
    item:remove(1)
    return true
end

storeBox:id(9586)
storeBox:register()