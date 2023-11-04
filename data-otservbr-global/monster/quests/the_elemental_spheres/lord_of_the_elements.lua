local config = {
    transformChance = 90, -- Percent
    transformIntervals = {20000, 40000}, -- Milliseconds
    transformOutfits = {49, 286}, -- LookTypes
    damageIntervals = {5000, 10000}, -- Milliseconds
    damageAmountRange = {10000, 50000} -- Hit Points
}

local mType = Game.createMonsterType("Lord of the Elements")
local monster = {}

monster.description = "Lord of the Elements"
monster.experience = 800000
monster.outfit = {
	lookType = 1646,
	lookHead = 94,
	lookBody = 55,
	lookLegs = 91,
	lookFeet = 91,
	lookAddons = 0,
	lookMount = 0
}

monster.level = {
min = 1350,
max = 2150
}

monster.health = 8000000
monster.maxHealth = 8000000
monster.race = "undead"
monster.corpse = 8181
monster.speed = 1185
monster.manaCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 10
}

monster.bosstiary = {
	bossRaceId = 454,
	bossRace = RARITY_ARCHFOE
}

monster.strategiesTarget = {
	nearest = 70,
	health = 10,
	damage = 10,
	random = 10,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false
}

monster.light = {
	level = 0,
	color = 0
}

monster.summon = {
	maxSummons = 4,
	summons = {
		{name = "Blistering Fire Elemental", chance = 50, interval = 4000, count = 1},
		{name = "Jagged Earth Elemental", chance = 50, interval = 4000, count = 1},
		{name = "Roaring Water Elemental", chance = 50, interval = 4000, count = 1},
		{name = "Overcharged Energy Elemental", chance = 50, interval = 4000, count = 1}
	}
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "WHO DARES CALLING ME?", yell = true},
	{text = "I'LL FREEZE YOU THEN I CRUSH YOU!", yell = true}
}

monster.loot = {
	{name = "small sapphire", chance = 7142, maxCount = 4},
	{name = "small ruby", chance = 11111, maxCount = 4},
	{name = "small emerald", chance = 11111, maxCount = 4},
	{name = "small amethyst", chance = 11111, maxCount = 3},
	{name = "platinum coin", chance = 50000, maxCount = 9},
	{name = "earthborn titan armor", chance = 2063},
	{name = "gold ingot", chance = 25000}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 1230, attack = 1210},
	{name ="combat", interval = 1000, chance = 8, type = COMBAT_DEATHDAMAGE, minDamage = -800, maxDamage = -31900, radius = 9, effect = CONST_ME_MORTAREA, target = false},
	{name ="speed", interval = 1000, chance = 12, speedChange = -850, radius = 6, effect = CONST_ME_POISONAREA, target = false, duration = 60000},
	{name ="strength", interval = 1000, chance = 10, minDamage = -600, maxDamage = -11450, radius = 5, effect = CONST_ME_HITAREA, target = false},
	{name ="combat", interval = 3000, chance = 13, type = COMBAT_FIREDAMAGE, minDamage = -300, maxDamage = -80000, range = 7, radius = 7, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true},
	{name ="combat", interval = 3000, chance = 8, type = COMBAT_MANADRAIN, minDamage = -600, maxDamage = -70000, radius = 10, effect = CONST_ME_ENERGYAREA, target = false},
	{name ="combat", interval = 2000, chance = 9, type = COMBAT_ENERGYDAMAGE, minDamage = -400, maxDamage = -80000, length = 8, spread = 3, effect = CONST_ME_MAGIC_RED, target = false},
	-- poison
	{name ="condition", type = CONDITION_POISON, interval = 5000, chance = 18, minDamage = -800, maxDamage = -10100, effect = CONST_ME_HITBYPOISON, target = false},
	{name ="combat", interval = 2000, chance = 6, type = COMBAT_LIFEDRAIN, minDamage = -600, maxDamage = -12100, radius = 14, effect = CONST_ME_MAGIC_GREEN, target = false}
}

monster.defenses = {
	defense = 30,
	armor = 30,
	{name ="combat", interval = 1000, chance = 25, type = COMBAT_HEALING, minDamage = 100, maxDamage = 195, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="outfit", interval = 1500, chance = 40, effect = CONST_ME_MAGIC_BLUE, target = false, duration = 3000, outfitMonster = "Energy Overlord"},
	{name ="outfit", interval = 1500, chance = 40, effect = CONST_ME_MAGIC_BLUE, target = false, duration = 3000, outfitMonster = "Fire Overlord"},
	{name ="outfit", interval = 1500, chance = 40, effect = CONST_ME_MAGIC_BLUE, target = false, duration = 3000, outfitMonster = "Earth Overlord"},
	{name ="outfit", interval = 1500, chance = 40, effect = CONST_ME_MAGIC_BLUE, target = false, duration = 3000, outfitMonster = "Ice Overlord"}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 1},
	{type = COMBAT_ENERGYDAMAGE, percent = 30},
	{type = COMBAT_EARTHDAMAGE, percent = 45},
	{type = COMBAT_FIREDAMAGE, percent = 30},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 100},
	{type = COMBAT_ICEDAMAGE, percent = 30},
	{type = COMBAT_HOLYDAMAGE , percent = 100},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.immunities = {
	{type = "paralyze", condition = false},
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
