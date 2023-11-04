local config = {
    transformChance = 90, -- Percent
    transformIntervals = {20000, 40000}, -- Milliseconds
    transformOutfits = {1594, 1595}, -- LookTypes
    damageIntervals = {5000, 10000}, -- Milliseconds
    damageAmountRange = {5000, 9000} -- Hit Points
}

local mType = Game.createMonsterType("Morshabaal")
local monster = {}

monster.description = "Morshabaal"
monster.experience = 15000000
monster.outfit = {
	lookType = 1468,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.level = {
min = 1300,
max = 5600
}

monster.events = {
	"Deadmonsters"
}

monster.bosstiary = {
	bossRaceId = 2118,
	bossRace = RARITY_NEMESIS,
	storageCooldown = Storage.Quest.U12_60.APiratesTail.MorshabaalTimer
}

monster.health = 16000000
monster.maxHealth = 16000000
monster.race = "undead"
monster.corpse = 6068
monster.speed = 900
monster.manaCost = 0

monster.changeTarget = {
	interval = 10000,
	chance = 20
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
	rewardBoss = true,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 98,
	targetDistance = 1,
	runHealth = 3500,
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
	maxSummons = 2,
	summons = {
		{name = "Orshabaal", chance = 20, interval = 4000, count = 2}
	}
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "COME AND GIVE ME SOME AMUSEMENT", yell = false},
	{text = "IS THAT THE BEST YOU HAVE TO OFFER, TIBIANS?", yell = true},
	{text = "I AM Morshabaal OF THE TRIANGLE... AND I AM HERE TO CHALLENGE YOU ALL.", yell = true},
	{text = "FLAWLESS VICTORY!", yell = true}
}

monster.loot = {
	{name = "blue tome", chance = 20000},
	{name = "teddy bear", chance = 12500},
	{id = 3007, chance = 8333}, -- crystal ring
	{name = "white pearl", chance = 25000, maxCount = 15},
	{name = "black pearl", chance = 11111, maxCount = 14},
	{name = "small diamond", chance = 25000, maxCount = 5},
	{name = "small sapphire", chance = 25000, maxCount = 10},
	{name = "small emerald", chance = 25000, maxCount = 10},
	{name = "small amethyst", chance = 25000, maxCount = 17},
	{name = "talon", chance = 12500, maxCount = 7},
	{name = "platinum coin", chance = 100000, maxCount = 69},
	{name = "green gem", chance = 20000},
	{name = "blue gem", chance = 14285},
	{name = "might ring", chance = 12500},
	{id = 3049, chance = 12500}, -- stealth ring
	{name = "strange symbol", chance = 11111},
	{name = "life crystal", chance = 12500},
	{name = "mind stone", chance = 20000},
	{name = "gold ring", chance = 20000},
	{id = 3098, chance = 20000}, -- ring of healing
	{name = "twin axe", chance = 11111},
	{name = "golden armor", chance = 8333},
	{name = "magic plate armor", chance = 8333},
	{name = "demon shield", chance = 12500},
	{name = "golden boots", chance = 8333},
	{name = "demon horn", chance = 33333, maxCount = 2},
	{id = 6299, chance = 25000}, -- death ring
	{name = "demonic essence", chance = 100000},
	{name = "ruthless axe", chance = 14285},
	{name = "assassin star", chance = 12500, maxCount = 44},
	{name = "havoc blade", chance = 16666},
	{name = "ravenwing", chance = 14285},
	{name = "great mana potion", chance = 20000},
	{name = "great health potion", chance = 20000},
	{name = "glacier kilt", chance = 8333},
	{name = "great spirit potion", chance = 25000},
	{name = "ultimate health potion", chance = 25000},
	{name = "oceanborn leviathan armor", chance = 16666},
	{name = "frozen plate", chance = 8333},
	{name = "spellbook of warding", chance = 20000},
	{name = "spellbook of mind control", chance = 11111},
	{name = "spellbook of lost souls", chance = 16666},
	{name = "spellscroll of prophecies", chance = 25000},
	{name = "spellbook of dark mysteries", chance = 20000},
	{id = 14112, chance = 22500, maxCount = 3}, --bar of gold
    {id = 37609, chance = 2500}, --green helmet
    {id = 37608, chance = 2500}, --green armor
    {id = 37607, chance = 2500}, --green legs
    {id = 37610, chance = 2500}, --green boots
    {id = 37613, chance = 12500}, --morshabaal brain
    {id = 37810, chance = 12500}, --morshabaal stract
    {id = 37611, chance = 1500, unique = true}, --morshabaal mask
	{id = 3076, chance = 22500, maxCount = 3}, -- gold token
    {id = 3076, chance = 22500, maxCount = 3}, -- silver token
    {id = 19082, chance = 12500, maxCount = 2}, -- tornament token
    {id = 3043, chance = 12500, maxCount = 30}, -- crystal coin
    {id = 8153, chance = 5500, maxCount = 1}, -- boost exp 50%
    {id = 37110, chance = 7500, maxCount = 2}, -- exalted core
    {id = 32622, chance = 42500, maxCount = 1}, -- giant ameth
    {id = 16129, chance = 42500, maxCount = 3}, -- major
    {id = 9586, chance = 7500, maxCount = 1}, -- surprese box
    {id = 9145, chance = 4500, maxCount = 1}, -- mount doll
    {id = 28895, chance = 4500, maxCount = 1}, -- addon doll
    {id = 28887, chance = 4500, maxCount = 1}, -- vip days
    {id = 12905, chance = 4500, maxCount = 1}, -- stamina
    {id = 10227, chance = 4500, maxCount = 1} -- remover skull
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -28191},
	{name ="combat", interval = 2000, chance = 40, type = COMBAT_PHYSICALDAMAGE, minDamage = -250, maxDamage = -13500, range = 7, radius = 6, effect = CONST_ME_HITAREA, target = false},
	{name ="combat", interval = 3000, chance = 34, type = COMBAT_PHYSICALDAMAGE, minDamage = -120, maxDamage = -23500, range = 7, radius = 1, shootEffect = CONST_ANI_WHIRLWINDSWORD, target = true},
	{name ="combat", interval = 4000, chance = 30, type = COMBAT_ENERGYDAMAGE, minDamage = -100, maxDamage = -37800, length = 8, spread = 3, effect = CONST_ME_MORTAREA, target = false},
	{name ="combat", interval = 3000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = -200, maxDamage = -13480, range = 14, radius = 5, effect = CONST_ME_POFF, target = false},
	{name ="combat", interval = 4000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = -100, maxDamage = -23650, range = 7, radius = 13, effect = CONST_ME_BLOCKHIT, target = false},
	{name ="combat", interval = 4000, chance = 18, type = COMBAT_PHYSICALDAMAGE, minDamage = -200, maxDamage = -33600, radius = 14, effect = CONST_ME_LOSEENERGY, target = false},
	{name ="combat", interval = 3000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = -200, maxDamage = -45750, range = 7, radius = 4, effect = CONST_ME_ENERGYAREA, target = false}
}

monster.defenses = {
	defense = 65,
	armor = 55,
	{name ="combat", interval = 3000, chance = 35, type = COMBAT_HEALING, minDamage = 300, maxDamage = 20800, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="speed", interval = 4000, chance = 80, speedChange = 1840, effect = CONST_ME_MAGIC_RED, target = false, duration = 6000}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 1},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -10},
	{type = COMBAT_HOLYDAMAGE , percent = -1},
	{type = COMBAT_DEATHDAMAGE , percent = 1}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

local fireCombat = Combat()
fireCombat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
fireCombat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HOLYDAMAGE)
fireCombat:setArea(createCombatArea(AREA_SQUAREWAVE7))

function onGetFormulaValues(player, level, magicLevel)
    return -config.damageAmountRange[1], -config.damageAmountRange[2]
end

fireCombat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local waterCombat = Combat()
waterCombat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
waterCombat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ICEAREA)
waterCombat:setArea(createCombatArea(AREA_SQUAREWAVE7))

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
