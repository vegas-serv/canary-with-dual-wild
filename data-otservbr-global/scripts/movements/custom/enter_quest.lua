local enterquest = MoveEvent()
function enterquest.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	if player:getStorageValue(79911) >= 1 then
		player:teleportTo(Position(31995, 32156, 7))
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	else
		local pos = Position(32167, 32049, 8)
		player:teleportTo(pos)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:say("You don't have access to this teleport yet.", TALKTYPE_MONSTER_SAY)
	end
	return true
end
enterquest:type("stepin")
enterquest:aid(32315)
enterquest:register()