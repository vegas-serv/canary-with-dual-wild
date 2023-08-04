local cEvent = CreatureEvent("killPaleWormOutfit")

local outfits = {
    [PLAYERSEX_FEMALE] = { lookType = 1437, addons = 3 },
    [PLAYERSEX_MALE] = { lookType = 1436, addons = 3 }
}

function cEvent.onDeath(creature, corpse, killer, mostDamageKiller, lastHitUnjustified, mostDamageUnjustified)
    for cid, _ in pairs(creature:getDamageMap()) do
        local creature = Player(cid)
		if creature and creature:isPlayer() then
        local sex = creature and creature:getSex() or nil
        local outfit = outfits[sex]
        if creature and not creature:hasOutfit(outfit.lookType, outfit.addons) then
            creature:addOutfitAddon(outfit.lookType, outfit.addons)
            creature:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have received Royal Bounacean Advisor outfit.")
        end
    end
	
	end

    return true
end

cEvent:register()