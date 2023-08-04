local megahunt = MoveEvent()

function megahunt.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	if item.actionid == 11555 then
		if player:getLevel() >= 500 then
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You're entering the realm of Loot Hunts.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You do not have level 500+ to enter here.")
			player:teleportTo(fromPosition, true)
			end
			end
	return true
end

megahunt:type("stepin")
megahunt:aid(11555)
megahunt:register()
