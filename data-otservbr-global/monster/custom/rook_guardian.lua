local config = {
    transformChance = 75, -- Percent
    transformIntervals = {30000, 60000}, -- Milliseconds
    transformOutfits = {49, 286}, -- LookTypes
    damageIntervals = {15000, 30000}, -- Milliseconds
    damageAmountRange = {10000, 15000} -- Hit Points
}

local mType = Game.createMonsterType("Rook Guardian")
local monster = {}

monster.description = "a Rook Guardian"
monster.experience = 4630000
monster.outfit = {
	lookType = 12,
	lookHead = 0,
	lookBody = 76,
	lookLegs = 94,
	lookFeet = 94,
	lookAddons = 0,
	lookMount = 0
}

monster.level = {
min = 832,
max = 1244
}

monster.events = {
	"rookDeath"
}

monster.health = 500000
monster.maxHealth = 500000
monster.race = "venom"
monster.corpse = 31599
monster.speed = 825
monster.manaCost = 0

monster.changeTarget = {
    interval = 4000,
    chance = 10
}

monster.strategiesTarget = {
    nearest = 100,
}

monster.flags = {
    summonable = false,
    attackable = true,
    hostile = true,
    convinceable = false,
    pushable = false,
    rewardBoss = true,
    illusionable = false,
    canPushItems = true,
    canPushCreatures = true,
    staticAttackChance = 90,
    targetDistance = 1,
    runHealth = 0,
    healthHidden = false,
    isBlockable = false,
    canWalkOnEnergy = true,
    canWalkOnFire = true,
    canWalkOnPoison = true
}

monster.light = {
    level = 0,
    color = 0
}

monster.voices = {
    interval = 5000,
    chance = 10,
}

monster.loot = {
    {name = "platinum coin", minCount = 1, maxCount = 5, chance = 100000},
    {name = "crystal coin", minCount = 0, maxCount = 52, chance = 50000},
    {name = "supreme health potion", minCount = 0, maxCount = 6, chance = 35000},
    {name = "ultimate mana potion", minCount = 0, maxCount = 20, chance = 32000},
    {name = "ultimate spirit potion", minCount = 0, maxCount = 20, chance = 32000},
    {name = "bullseye potion", minCount = 0, maxCount = 10, chance = 12000},
    {name = "mastermind potion", minCount = 0, maxCount = 10, chance = 12000},
    {name = "berserk potion", minCount = 0, maxCount = 10, chance = 12000},
    {name = "piece of draconian steel", minCount = 0, maxCount = 3, chance = 9000},
    {name = "green gem", minCount = 0, maxCount = 2, chance = 12000},
    {name = "silver token", minCount = 0, maxCount = 5, chance = 49500},
    {name = "blue gem", chance = 11000},
    {name = "crusader helmet", chance = 6400},
    {name = "gold ingot", minCount = 0, maxCount = 1, chance = 10000},
    {id= 3039, chance = 11000}, -- red gem
    {name = "terra hood", chance = 7800},
    {name = "yellow gem", chance = 9500},
    {name = "young lich worm", chance = 5800},
    {name = "bear skin", chance = 1800},
    {name = "noble amulet", chance = 1100},
    {name = "rotten heart", chance = 1700},
    {name = "terra helmet", chance = 700},
    {name = "final judgement", chance = 460},
}

monster.attacks = {
    {name ="melee", interval = 2000, chance = 100, minDamage = -200, maxDamage = -5600},
    {name ="combat", interval = 1800, chance = 60, type = COMBAT_MANADRAIN, minDamage = -400, maxDamage = -1000, length = 7, spread = 2, effect = CONST_ME_EXPLOSIONHIT, target = false},
    {name ="combat", interval = 1800, chance = 19, type = COMBAT_PHYSICALDAMAGE, minDamage = -400, maxDamage = -5000, length = 7, spread = 3, effect = CONST_ME_BLOCKHIT, target = false},
    {name ="combat", interval = 1800, chance = 40, type = COMBAT_FIREDAMAGE, minDamage = -300, maxDamage = -8500, radius = 10, effect = CONST_ME_HITBYFIRE, target = false}
}

monster.defenses = {
    defense = 25,
    armor = 78,
    {name ="combat", interval = 2000, chance = 14, type = COMBAT_HEALING, minDamage = 150, maxDamage = 350, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
    {type = COMBAT_PHYSICALDAMAGE, percent = 0},
    {type = COMBAT_ENERGYDAMAGE, percent = 0},
    {type = COMBAT_EARTHDAMAGE, percent = 0},
    {type = COMBAT_FIREDAMAGE, percent = 20},
    {type = COMBAT_LIFEDRAIN, percent = 0},
    {type = COMBAT_MANADRAIN, percent = 0},
    {type = COMBAT_DROWNDAMAGE, percent = 0},
    {type = COMBAT_ICEDAMAGE, percent = 0},
    {type = COMBAT_HOLYDAMAGE , percent = 0},
    {type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
    {type = "paralyze", condition = true},
    {type = "outfit", condition = false},
    {type = "invisible", condition = true},
    {type = "bleed", condition = false}
}

local fireCombat = Combat()
fireCombat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
fireCombat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA)
fireCombat:setArea(createCombatArea(AREA_CIRCLE5X5))

function onGetFormulaValues(player, level, magicLevel)
    return -config.damageAmountRange[1], -config.damageAmountRange[2]
end

fireCombat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local waterCombat = Combat()
waterCombat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
waterCombat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ICEAREA)
waterCombat:setArea(createCombatArea(AREA_CIRCLE5X5))

function onGetFormulaValues(player, level, magicLevel)
    return -config.damageAmountRange[1], -config.damageAmountRange[2]
end

waterCombat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local intervalTicks = 0

mType.onThink = function(monster, interval)
    intervalTicks = intervalTicks + interval
    if intervalTicks < 1000 then
        return
    end

    local applyDamage = nil
    local damageInterval = config.damageIntervals[math.random(#config.damageIntervals)]
    if intervalTicks >= damageInterval then
        intervalTicks = intervalTicks - damageInterval
        applyDamage = true
    end

    local spectators = Game.getSpectators(monster:getPosition(), false, true, 10, 10, 10, 10)
    if #spectators == 0 then
        return
    end

    for _, spectator in pairs(spectators) do
        local outfit = spectator:getOutfit()
        if not table.contains(config.transformOutfits, outfit.lookType) then
            if math.random(1, 100) <= config.transformChance then
                local condition = Condition(CONDITION_OUTFIT)
                outfit.lookType = config.transformOutfits[math.random(#config.transformOutfits)]
                condition:setOutfit(outfit)
                condition:setTicks(math.random(unpack(config.transformIntervals)))
                spectator:addCondition(condition)
            end
        elseif applyDamage then
            if outfit.lookType == config.transformOutfits[1] then
                fireCombat:execute(monster, Variant(spectator:getPosition()))
            elseif outfit.lookType == config.transformOutfits[2] then
                waterCombat:execute(monster, Variant(spectator:getPosition()))
            end
        end
    end
end

mType.onAppear = function(monster, creature)
    if monster:getType():isRewardBoss() then
        monster:setReward(true)
    end
end

mType.onDisappear = function(monster, creature)
end

mType.onMove = function(monster, creature, fromPosition, toPosition)
end

mType.onSay = function(monster, creature, type, message)
end

mType:register(monster)