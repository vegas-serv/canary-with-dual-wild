--# Monster converted using Devm monster converter #--
local mType = Game.createMonsterType("Buggy Lizard High Guard")
local monster = {}

monster.description = "a Buggy lizard high guard"
monster.experience = 52000
monster.outfit = {
	lookType = 337,
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

monster.health = 12800
monster.maxHealth = 12800
monster.race = "blood"
monster.corpse = 10355
monster.speed = 340
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
	{text = "Hizzzzzzz!", yell = false},
	{text = "To armzzzz!", yell = false},
	{text = "Engage zze aggrezzor!", yell = false}
}

monster.loot = {
	{name = "gold coin", chance = 32000, maxCount = 27},
	{name = "small emerald", chance = 12520, maxCount = 14},
	{name = "platinum coin", chance = 4900, maxCount = 55},
	{name = "tower shield", chance = 4040},
	{name = "lizard leather", chance = 4000},
	{name = "lizard scale", chance = 5970},
	{name = "strong health potion", chance = 11925},
	{name = "great health potion", chance = 7070},
	{name = "red lantern", chance = 11220},
	{name = "bunch of ripe rice", chance = 4950},
	{name = "Zaoan armor", chance = 2380},
	{name = "Zaoan shoes", chance = 3700},
	{name = "Zaoan legs", chance = 2720},
	{name = "spiked iron ball", chance = 7000},
	{name = "high guard flag", chance = 12990},
	{name = "high guard shoulderplates", chance = 8150}
}

monster.attacks = {
	{name ="combat", interval = 2000, chance = 100, minDamage = 0, maxDamage = -606, effect = CONST_ME_DRAWBLOOD}
}

monster.defenses = {
	defense = 35,
	armor = 35,
	{name ="combat", interval = 2000, chance = 10, minDamage = 25, maxDamage = 75, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_GREEN, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 5},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 45},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -10},
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
