local dungeon7 = Action()
function dungeon7.onUse(player, item, fromPosition, target, toPosition, isHotkey)
 player:setStorageValue(341068, 1)
 item:remove(1)
 player:sendTextMessage(MESSAGE_INFO_DESCR, "You've activated Dungeon Vexclaw.")
 Game.broadcastMessage("O Jogador ".. player:getName() .." acabou de usar uma Exclusive Hunt.", MESSAGE_STATUS_WARNING)
 player:getPosition():sendMagicEffect(15)
 return true
end
dungeon7:id(39039)
dungeon7:register()

local dungeonTile7 = MoveEvent()

function dungeonTile7.onStepIn(creature, item, position, fromPosition)
  if not creature or not creature:isPlayer() then
		return false
	end
	
	if creature:getStorageValue(2171371) > os.time() then
				creature:teleportTo(fromPosition, true)
				creature:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				creature:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have to wait 15 second to face again!")
				return true
			end
    for i = 1, 10 do
			Game.createMonster("dungeon vexclaw", Position(math.random(16857, 16861),
			math.random(17090, 17096), 7), true, true)
		end
		creature:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		--player:setStorageValue(1381391, os.time() + (10 * 1000))
		creature:setStorageValue(2171371, os.time() + 15)
	
	return true
end

dungeonTile7:type("stepin")
dungeonTile7:aid(42249)
dungeonTile7:register()