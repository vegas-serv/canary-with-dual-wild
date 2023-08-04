local dungeon6 = Action()
function dungeon6.onUse(player, item, fromPosition, target, toPosition, isHotkey)
 player:setStorageValue(341057, 1)
 item:remove(1)
 player:sendTextMessage(MESSAGE_INFO_DESCR, "You've activated Dungeon Many Faces.")
 Game.broadcastMessage("O Jogador ".. player:getName() .." acabou de usar uma Exclusive Hunt.", MESSAGE_STATUS_WARNING)
 player:getPosition():sendMagicEffect(15)
 return true
end
dungeon6:id(39040)
dungeon6:register()

local dungeonTile6 = MoveEvent()

function dungeonTile6.onStepIn(creature, item, position, fromPosition)
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
			Game.createMonster("dungeon many faces", Position(math.random(16855, 16859),
			math.random(17116, 17123), 7), true, true)
		end
		creature:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		--player:setStorageValue(1381391, os.time() + (10 * 1000))
		creature:setStorageValue(2171371, os.time() + 15)
	
	return true
end

dungeonTile6:type("stepin")
dungeonTile6:aid(42250)
dungeonTile6:register()