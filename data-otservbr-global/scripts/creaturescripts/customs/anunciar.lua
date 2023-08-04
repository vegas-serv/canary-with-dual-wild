local deadMonsters = CreatureEvent("Deadmonsters")
function deadMonsters.onDeath(monster, corpse, killer, mostDamageKiller, unjustified, mostDamageUnjustified)    	
	sendChannelMessage(9, TALKTYPE_CHANNEL_R1, "the player " .. killer:getName() .. " killed the boss " .. monster:getName() .. "!")
    return true
end
deadMonsters:register()