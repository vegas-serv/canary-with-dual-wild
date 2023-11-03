--# Monster converted using Devm monster converter #--
local mType = Game.createMonsterType("Buggy Lizard Chosen")
local monster = {}

monster.description = "a Buggy lizard chosen"
monster.experience = 56400
monster.outfit = {
	lookType = 344,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.level = {
min = 413,
max = 640
}

monster.health = 16050
monster.maxHealth = 16050
monster.race = "blood"
monster.corpse = 10371
monster.speed = 336
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10
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
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true,
	pet = false
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "Grzzzzzzz!", yell = false},
	{text = "Garrrblarrrrzzzz!", yell = false},
	{text = "Kzzzzzz!", yell = false}
}

monster.loot = {
	{name = "small diamond", chance = 2550, maxCount = 5},
	{name = "gold coin", chance = 32000, maxCount = 36},
	{name = "platinum coin", chance = 12920, maxCount = 55},
	{name = "tower shield", chance = 4100},
	{name = "lizard leather", chance = 3000},
	{name = "lizard scale", chance = 4980, maxCount = 3},
	{name = "great health potion", chance = 5350, maxCount = 3},
	{name = "Zaoan armor", chance = 3980},
	{name = "Zaoan helmet", chance = 2140},
	{name = "Zaoan shoes", chance = 3810},
	{name = "Zaoan legs", chance = 4940},
	{name = "spiked iron ball", chance = 9890},
	{name = "corrupted flag", chance = 13350},
	{name = "cursed shoulder spikes", chance = 15800},
	{name = "scale of corruption", chance = 12870}
}

monster.attacks = {
	{name ="combat", interval = 2000, chance = 100, minDamage = 0, maxDamage = -360, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 15, minDamage = -240, maxDamage = -620, length = 3, spread = 2, effect = CONST_ME_POISONAREA, target = false},
	{name ="combat", interval = 2000, chance = 15, minDamage = -190, maxDamage = -540, type = COMBAT_EARTH, effect = CONST_ME_HITBYPOISON, target = false},
	{name ="combat", interval = 2000, chance = 10, minDamage = -90, maxDamage = -480, type = COMBAT_EARTH, length = 8, spread = 3, effect = CONST_ME_GREEN_RINGS, target = false}
}

monster.defenses = {
	defense = 45,
	armor = 28,
	{name ="combat", interval = 2000, chance = 10, minDamage = 75, maxDamage = 125, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_GREEN, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 20},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 10},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 10},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
