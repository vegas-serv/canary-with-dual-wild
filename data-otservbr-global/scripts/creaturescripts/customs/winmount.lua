local cEvent = CreatureEvent("newOnKillEvent")

function cEvent.onDeath(creature, corpse, killer, mostDamageKiller, lastHitUnjustified, mostDamageUnjustified)
    for cid, _ in pairs(creature:getDamageMap()) do
        local creature = Player(cid)
        if creature and creature:isPlayer() then
	if not creature:hasMount(175) then
		creature:addMount(175)
		creature:say("win mount", TALKTYPE_MONSTER_SAY)
	else
		creature:sendTextMessage(19, "You already have this mount")
	end
   end
   end
    return true
end

cEvent:register()