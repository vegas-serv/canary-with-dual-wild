local rewards = {
    { id = 39039, name = "Exclusive Hunt Dungeon Vexclaw" },
    { id = 39040, name = "Exclusive Hunt Dungeon Many Faces" },
    { id = 39038, name = "Exclusive Hunt Dungeon Hellflayer" },
    { id = 39036, name = "Exclusive Hunt Dungeon Grimeleech" },
    { id = 32633, name = "Exclusive Hunt Dungeon Demon" },
    { id = 32725, name = "Exclusive Hunt Dungeon Dark Torturer" },
    { id = 39037, name = "Exclusive Hunt Dungeon Fury" }
}

local boxdungeon = Action()

function boxdungeon.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local randId = math.random(1, #rewards)
	local rewardItem = rewards[randId]

	player:addItem(rewardItem.id, 1)
	item:remove(1)

	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You received one ' .. rewardItem.name .. '.')
	return true
end

boxdungeon:id(3997)
boxdungeon:register()