local config = {
	[23538] = {mountId = 94, message = "You receive the permission to ride a sparkion"},
	[23684] = {mountId = 98, message = "You receive the permission to ride a neon sparkid"},
	[23685] = {mountId = 99, message = "You receive the permission to ride a vortexion"},
	[32629] = {mountId = 162, message = "You receive the permission to ride a Haze"},
	[36835] = {mountId = 183, message = "You receive the permission to ride a Shellodon"},
	[34073] = {mountId = 167, message = "You receive the permission to ride a Phantasmal Jade"},
	[36938] = {mountId = 184, message = "You receive the permission to ride a Singeing Steed"},
	[32075] = {mountId = 9, message = "You receive the permission to ride a Blazebringer"},
	[37611] = {mountId = 182, message = "You receive the permission to ride a Phant"},
	[43901] = {mountId = 217, message = "You receive the permission to ride a Foxmouse"},
}

local heartDestructionEggs = Action()

function heartDestructionEggs.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local mount = config[item.itemid]

	if not mount then
		return true
	end

	if not player:hasMount(mount.mountId) then
		player:addMount(mount.mountId)
		player:say(mount.message, TALKTYPE_MONSTER_SAY)
		item:remove(1)
	else
		player:sendTextMessage(19, "You already have this mount")
	end
	return true
end


for itemId, info in pairs(config) do
	heartDestructionEggs:id(itemId)
end

heartDestructionEggs:register()
