local days = 5 --dias que da de vip

local vip = Action()
function vip.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if Tile(player:getPosition()):hasFlag(TILESTATE_PROTECTIONZONE) then
		player:addPremiumDays(days)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'you received 5 days of premium.')
		item:remove(1)
	else
		player:sendCancelMessage("You can't use this when you're in a fight and in protection zone.")
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
	end
	return true
end


vip:id(28887) -- id vip item
vip:register()