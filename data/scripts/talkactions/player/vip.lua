local vip = TalkAction("!checkvip", "!vip")

function vip.onSay(player, words, param)
	local days = player:getVipDays()
	if days == 0 then
		local msg = 'You do not have VIP on your account.'
		player:sendCancelMessage(msg)
		player:sendTextMessage(MESSAGE_STATUS, msg)
	else
		player:sendTextMessage(MESSAGE_STATUS, string.format('You have %s VIP day%s left.', (days == 0xFFFF and 'infinite amount of' or days), (days == 1 and '' or 's')))
	end
	return true
end

<<<<<<<< HEAD:data/scripts/talkactions/custom/vip_player.lua
vip:register()
========
vip:groupType("normal")
vip:register()
>>>>>>>> 1ccfc45b7a8e4bfc19a8456f114be9de829578de:data/scripts/talkactions/player/vip.lua
