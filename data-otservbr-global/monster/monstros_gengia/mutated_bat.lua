--# Monster converted using Devm monster converter #--
local mType = Game.createMonsterType("Buggy Mutated Bat")
local monster = {}

monster.description = "a Buggy mutated bat"
monster.experience = 54300
monster.outfit = {
	lookType = 307,
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

monster.health = 14200
monster.maxHealth = 14200
monster.race = "blood"
monster.corpse = 8915
monster.speed = 310
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
	{text = "Shriiiiiek", yell = false}
}

monster.loot = {
	{name = "black pearl", chance = 11720, maxCount = 13},
	{name = "platinum coin", chance = 48000, maxCount = 55},
	{name = "gold coin", chance = 40000, maxCount = 70},
	{name = "small amethyst", chance = 11500, maxCount = 12},
	{name = "battle shield", chance = 7760},
	{name = "black shield", chance = 70},
	{name = "star herb", chance = 5060},
	{name = "bat wing", chance = 5900, maxCount = 2},
	{name = "mercenary sword", chance = 3110},
	{id = 9808, chance = 12530}, -- lizard statue
	{id = 9809, chance = 12530, maxCount = 2}, -- zaoan decoration
	{name = "batwing hat", chance = 3080},
	{name = "mutated bat ear", chance = 14900}
}

monster.attacks = {
	{name ="combat", interval = 2000, chance = 100, minDamage = 0, maxDamage = -168, effect = CONST_ME_DRAWBLOOD, condition = {type = CONDITION_POISON, startDamage = 120, interval = 4000}},
	{name ="combat", interval = 2000, chance = 15, minDamage = -70, maxDamage = -280, type = COMBAT_EARTH, range = 7, ShootEffect = CONST_ANI_POISON, target = false},
	{name ="combat", interval = 2000, chance = 15, minDamage = -30, maxDamage = -290, type = COMBAT_DROWN, effect = CONST_ME_SOUND_WHITE, target = false},

	{name ="combat", interval = 2000, chance = 15, minDamage = -190, maxDamage = -240, length = 4, spread = 3, effect = CONST_ME_POISONAREA, target = false}
}

monster.defenses = {
	defense = 20,
	armor = 20,
	{name ="combat", interval = 2000, chance = 10, minDamage = 80, maxDamage = 95, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = -10},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 100},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
