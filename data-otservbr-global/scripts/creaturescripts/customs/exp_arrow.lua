local function sendMessage(target)
    if not target then
        return true
    end
    target:sendMagicEffect(56)
    target:sendMagicEffect(57)
end

local config = {
    ['Rotworm'] = { chance = 100 }, -- 100 means 1%
    ['Crocodile'] = { chance = 100 },
    ['Mutated Bat'] = { chance = 100 },
    ['Mutated Human'] = { chance = 100 },
    ['Brimstone Bug'] = { chance = 100 },
    ['Troll'] = { chance = 100 },
    ['Coldheart'] = { chance = 100 },
    ['Crazed Beggar'] = { chance = 100 }
}

local Exparrow = CreatureEvent("Exparrow")
function Exparrow.onKill(creature, target)
	if target:isPlayer() then
        return true
    end
   -- local monster = config[target:getName()]
   -- if not monster then
      --  return true
   -- end
    if math.random(1, 100) <= 2 then
        local tile = Tile(target:getPosition())
        if tile then
            local ground = tile:getGround()
            if ground then
                ground:setAttribute(ITEM_ATTRIBUTE_ACTIONID, 16381)
                target:say('DOUBLE EXP!', TALKTYPE_MONSTER_SAY)
                for i = 0, 3 do
                    addEvent(sendMessage, 750 * i, target:getPosition())
                end
            end
        end
    end
    return true
end

Exparrow:register()