local dungeon5 = Action()
function dungeon5.onUse(player, item, fromPosition, target, toPosition, isHotkey)
 player:setStorageValue(341046, 1)
 item:remove(1)
 player:sendTextMessage(MESSAGE_INFO_DESCR, "You've activated Dungeon Hellflayer.")
 Game.broadcastMessage("O Jogador ".. player:getName() .." acabou de usar uma Exclusive Hunt.", MESSAGE_STATUS_WARNING)
 player:getPosition():sendMagicEffect(15)
 return true
end
dungeon5:id(39038)
dungeon5:register()

local dungeonTile5 = MoveEvent()

function dungeonTile5.onStepIn(creature, item, position, fromPosition)
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
			Game.createMonster("dungeon hellflayer", Position(math.random(16872, 16876),
			math.random(17128, 17134), 7), true, true)
		end
		creature:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		--player:setStorageValue(1381391, os.time() + (10 * 1000))
		creature:setStorageValue(2171371, os.time() + 15)
	
	return true
end

dungeonTile5:type("stepin")
dungeonTile5:aid(42251)
dungeonTile5:register()