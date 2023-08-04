local malEvent = CreatureEvent("primalOnKillEvent")

function malEvent.onDeath(creature, corpse, killer, mostDamageKiller, lastHitUnjustified, mostDamageUnjustified)
    for cid, _ in pairs(creature:getDamageMap()) do
        local creature = Player(cid)
        if creature and creature:isPlayer() then
	if not creature:hasMount(202) then
		creature:addMount(202)
		creature:say("win mount", TALKTYPE_MONSTER_SAY)
	else
		creature:sendTextMessage(19, "You already have this mount")
	end
   end
   end
    return true
end

malEvent:register()