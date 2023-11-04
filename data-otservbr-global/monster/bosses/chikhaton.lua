local mType = Game.createMonsterType("Chikhaton")
local monster = {}

monster.description = "Chikhaton"
monster.experience = 300000
monster.outfit = {
	lookType = 361,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.level = {
min = 375,
max = 450
}

monster.health = 500000
monster.maxHealth = 500000
monster.race = "blood"
monster.corpse = 6068
monster.speed = 510
monster.manaCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 30
}

monster.bosstiary = {
	bossRaceId = 647,
	bossRace = RARITY_NEMESIS
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
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = true
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "Victis", yell = false}
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 100},
	{name = "holy orchid", chance = 100000},
	{name = "elvish talisman", chance = 88000},
	{name = "elven astral observer", chance = 82000},
	{name = "yellow gem", chance = 41790},
	{name = "blank rune", chance = 25370, maxCount = 1},
	{name = "melon", chance = 22390},
	{name = "bread", chance = 16420},
	{name = "elven amulet", chance = 14930},
	{name = "great mana potion", chance = 13430},
	{name = "life crystal", chance = 13430},
	{name = "sling herb", chance = 8960},
	{id = 3257, chance = 7460}, -- cornucopia
	{name = "green tunic", chance = 4480},
	{name = "royal spear", chance = 1490, maxCount = 2},
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
	{name ="melee", interval = 2000, chance = 100, skill = 300, attack = 280},
	{name ="combat", interval = 1000, chance = 15, type = COMBAT_MANADRAIN, minDamage = -30, maxDamage = -1560, range = 7, target = false},
	{name ="combat", interval = 1000, chance = 25, type = COMBAT_ENERGYDAMAGE, minDamage = -70, maxDamage = -2390, range = 7, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYHIT, target = false},
	{name ="combat", interval = 1000, chance = 25, type = COMBAT_PHYSICALDAMAGE, minDamage = -80, maxDamage = -3151, range = 7, shootEffect = CONST_ANI_SUDDENDEATH, target = false},
	{name ="effect", interval = 1000, chance = 25, range = 7, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA, target = false}
}

monster.defenses = {
	defense = 35,
	armor = 35,
	{name ="combat", interval = 4000, chance = 15, type = COMBAT_HEALING, minDamage = 550, maxDamage = 850, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType.onThink = function(monster, interval)
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
