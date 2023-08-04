local presentbox = Action()
local presents = {
    [33982] = { -- item id of the item that will give u random items
        {8192, 50}, {19082, 5}, {14112, 3}, {35572, 100}, 37110, 9586, 21292, 18339, 3246, 39754, 3427, 3437, 3368, 22526, 19366, 3393, 3394, 22524, 40603, 20139}
}

function presentbox.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local targetItem = presents[item.itemid]
    if not targetItem then
        return true
    end
    
    local count = 1
    local gift = targetItem[math.random(#targetItem)]
    if type(gift) == "table" then
        count = gift[2]
        gift = gift[1]
    end
    
    player:addItem(gift, count)
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You got ".. ItemType(gift):getName() ..".")
    
    item:remove(1)
    fromPosition:sendMagicEffect(CONST_ME_GIFT_WRAPS)
    return true
end

presentbox:id(33982)
presentbox:register()