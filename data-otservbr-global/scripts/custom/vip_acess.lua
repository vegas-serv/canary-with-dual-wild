local checkvip = MoveEvent()

local vipPosition = Position(21276, 21188, 6)

function checkvip.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	if player:isVip() then
player:teleportTo(vipPosition)
player:say('!* VIP *!', TALKTYPE_MONSTER_SAY)
vipPosition:sendMagicEffect(CONST_ME_STUN)
else
player:teleportTo(fromPosition)
player:sendCancelMessage('You do not have any vip days.')
fromPosition:sendMagicEffect(CONST_ME_POFF)
end
end

checkvip:type("stepin")
checkvip:uid(12011)
checkvip:register()