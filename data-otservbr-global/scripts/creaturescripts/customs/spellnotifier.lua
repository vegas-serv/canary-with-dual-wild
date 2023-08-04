local spellnoti = CreatureEvent("SpellNotifier")
function spellnoti.onAdvance(player, skill, oldLevel, newLevel)
    if skill == SKILL_LEVEL then
        local spells = {}
        for _, spell in ipairs(player:getInstantSpells()) do
            
            if spell.level > oldLevel and spell.level <= newLevel then
                table.insert(spells, "   [".. spell.name .."] \"".. spell.words .. "\" Mana[".. spell.mana .."]")
            end
        end

        if #spells > 0 then 
            sendChannelMessage(12, TALKTYPE_CHANNEL_R1, "O player " .. player:getName() .. " just advanced to level ".. newLevel .." and learned new spells!")
            
            for _, spellInfo in pairs(spells) do
                sendChannelMessage(12, TALKTYPE_CHANNEL_R1, spellInfo)
            end
        end
    end
    
    return true
end
spellnoti:register()