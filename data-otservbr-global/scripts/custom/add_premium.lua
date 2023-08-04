local days = 25 --dias que da de vip

local addpremium = TalkAction("!premium")

function addpremium.onSay(player, item, fromPosition, target, toPosition, isHotkey)

if player:getStorageValue(77124) >= os.time() then
		player:sendCancelMessage("you need to wait 25 days to use it again.")
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		return true
	end
	if Tile(player:getPosition()):hasFlag(TILESTATE_PROTECTIONZONE) then
		player:addPremiumDays(days)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'you received 25 days of premium.')
		player:setStorageValue(77124, os.time() + 600 * 60 * 60)
	else
		player:sendCancelMessage("You can't use this when you're in a fight and in protection zone.")
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
	end
	return true
end
addpremium:register()