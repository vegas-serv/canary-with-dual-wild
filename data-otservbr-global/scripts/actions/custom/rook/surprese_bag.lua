local rewards = {
    { id = 27451, name = "Axe of Destruction" },
    { id = 27449, name = "Blade of Destruction" },
    { id = 27452, name = "Chopper of Destruction" },
    { id = 27454, name = "Hammer of Destruction" },
    { id = 27453, name = "Mace of Destruction" },
    { id = 27450, name = "Slayer of Destruction" },
    { id = 27455, name = "Bow of Destruction" },
    { id = 27456, name = "Crossbow of Destruction" },
    { id = 27458, name = "Rod of Destruction" },
    { id = 27457, name = "Wand of Destruction" }
}

local primalsBag = Action()

function primalsBag.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local randId = math.random(1, #rewards)
	local rewardItem = rewards[randId]

	player:addItem(rewardItem.id, 1)
	item:remove(1)

	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You received one ' .. rewardItem.name .. '.')
	return true
end

primalsBag:id(23488)
primalsBag:register()
