local teleportitem = Action()

function teleportitem.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local playerPos = player:getPosition()
    local destination = Position(17604, 17437, 8)

    if not Tile(player:getPosition()):hasFlag(TILESTATE_PROTECTIONZONE) and (player:isPzLocked() or player:getCondition(CONDITIONID_DEFAULT))  then
		player:sendCancelMessage("You can't buy bless while in battle.")
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		return
	end

    player:teleportTo(destination)
    destination:sendMagicEffect(CONST_ME_TELEPORT)
  
    return true
end

teleportitem:id(38014)
teleportitem:register()