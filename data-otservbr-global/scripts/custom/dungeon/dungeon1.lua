local dungeon1 = Action()
function dungeon1.onUse(player, item, fromPosition, target, toPosition, isHotkey)
 player:setStorageValue(341002, 1)
 item:remove(1)
 player:sendTextMessage(MESSAGE_INFO_DESCR, "You've activated Dungeon Dark Torturer.")
 Game.broadcastMessage("O Jogador ".. player:getName() .." acabou de usar uma Exclusive Hunt.", MESSAGE_STATUS_WARNING)
 player:getPosition():sendMagicEffect(15)
 return true
end
dungeon1:id(32725)
dungeon1:register()

local dungeonTile1 = MoveEvent()

function dungeonTile1.onStepIn(creature, item, position, fromPosition)
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
			Game.createMonster("dungeon dark torturer", Position(math.random(16874, 16879),
			math.random(17079, 17084), 7), true, true)
		end
		creature:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		--player:setStorageValue(1381391, os.time() + (10 * 1000))
		creature:setStorageValue(2171371, os.time() + 15)
	
	return true
end

dungeonTile1:type("stepin")
dungeonTile1:aid(42255)
dungeonTile1:register()