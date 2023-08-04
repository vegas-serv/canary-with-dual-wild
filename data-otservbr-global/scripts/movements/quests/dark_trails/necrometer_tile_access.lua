local necrometerTileAccess = MoveEvent()

function necrometerTileAccess.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return false
	end

	 player:teleportTo({x = 33419,  y = 32106, z = 10})
	return true
end

necrometerTileAccess:aid(25001)
necrometerTileAccess:register()
