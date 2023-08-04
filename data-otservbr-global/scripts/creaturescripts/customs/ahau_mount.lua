local caEvent = CreatureEvent("ahauOnKillEvent")

function caEvent.onDeath(creature, corpse, killer, mostDamageKiller, lastHitUnjustified, mostDamageUnjustified)
    for cid, _ in pairs(creature:getDamageMap()) do
        local creature = Player(cid)
        if creature and creature:isPlayer() then
	if not creature:hasMount(206) then
		creature:addMount(206)
		creature:say("win mount", TALKTYPE_MONSTER_SAY)
	else
		creature:sendTextMessage(19, "You already have this mount")
	end
   end
   end
    return true
end

caEvent:register()