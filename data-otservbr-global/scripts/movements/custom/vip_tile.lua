local checkvip = MoveEvent()

local vipPosition = Position(0, 0, 0)

function checkvip.onStepIn(cid, item, position, fromPosition)
local player = Player(cid)
if not player then
return true
end

if item.actionid == 1500 then
if not player:isVip() then
player:teleportTo(fromPosition)
fromPosition:sendMagicEffect(CONST_ME_POFF)
player:sendCancelMessage('You do not have any vip days.')
end
elseif item.actionid == 12011 then
if player:isVip() then
player:say('!* VIP *!', TALKTYPE_MONSTER_SAY)
player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
else
player:teleportTo(fromPosition)
player:sendCancelMessage('You do not have any vip days.')
fromPosition:sendMagicEffect(CONST_ME_POFF)
end
end
return true
end

checkvip:type("stepin")
checkvip:aid(12011)
checkvip:register()