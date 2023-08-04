local lastquest = MoveEvent()

function lastquest.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end
		if player:getLevel() >= 5000 then
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "danger! This area reeks of danger.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You do not have level 5000+ to enter here.")
			player:teleportTo(fromPosition, true)
			end
	return true
end

lastquest:type("stepin")
lastquest:position({x = 17867, y = 17371, z = 8})
lastquest:register()