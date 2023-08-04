local dungeon4 = Action()
function dungeon4.onUse(player, item, fromPosition, target, toPosition, isHotkey)
 player:setStorageValue(341035, 1)
 item:remove(1)
 player:sendTextMessage(MESSAGE_INFO_DESCR, "You've activated Dungeon Grimeleech.")
 Game.broadcastMessage("O Jogador ".. player:getName() .." acabou de usar uma Exclusive Hunt.", MESSAGE_STATUS_WARNING)
 player:getPosition():sendMagicEffect(15)
 return true
end
dungeon4:id(39036)
dungeon4:register()

local dungeonTile4 = MoveEvent()

function dungeonTile4.onStepIn(creature, item, position, fromPosition)
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
			Game.createMonster("dungeon grimeleech", Position(math.random(16893, 16896),
			math.random(17128, 17134), 7), true, true)
		end
		creature:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		--player:setStorageValue(1381391, os.time() + (10 * 1000))
		creature:setStorageValue(2171371, os.time() + 15)
	
	return true
end

dungeonTile4:type("stepin")
dungeonTile4:aid(42252)
dungeonTile4:register()