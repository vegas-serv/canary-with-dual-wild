local storagesTable = {
	{storage = 42727, bossName = "Amazon Set Quest"},
	{storage = 14337, bossName = "Blazebringer Mount Quest"},
	{storage = 50459, bossName = "Ferumbras Quest"},
	{storage = 50371, bossName = "The First Dragon"},
	{storage = 52003, bossName = "POI"},
	{storage = 79911, bossName = "Rook Acess"},
	{storage = 52382, bossName = "Rook Quest"},
}

local enterlast = MoveEvent()
function enterlast.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return false
	end
	if player:getLevel() < 5000 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You need at least level 5000 to enter.")
		player:teleportTo(fromPosition, true)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		return false
	end
	local text = ""
	for value in pairs(storagesTable) do
		if player:getStorageValue(storagesTable[value].storage) < 0 then
			text = text .. "\n" .. storagesTable[value].bossName
		end
	end
	if text == "" then
		return true
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "you need to complete the following quests:" .. text)
		player:teleportTo(fromPosition, true)
		return false
	end
end

enterlast:type("stepin")
enterlast:position({x = 17867, y = 17363, z = 8})
enterlast:register()