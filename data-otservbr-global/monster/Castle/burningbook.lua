--# Monster converted using Devm monster converter #--
local mType = Game.createMonsterType("Hight Burning Book")
local monster = {}

monster.description = "a Hight burning book"
monster.experience = 57300
monster.outfit = {
	lookType = 1061,
	lookHead = 79,
	lookBody = 113,
	lookLegs = 78,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.level = {
min = 325,
max = 445
}

monster.health = 24000
monster.maxHealth = 24000
monster.race = "undead"
monster.corpse = 32454
monster.speed = 220
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 5000,
	chance = 8
}

monster.flags = {
	isSummonable = false,
	isAttackable = true,
	isHostile = true,
	isConvinceable = false,
	isPushable = false,
	isBoss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetdistance = 1,
	runHealth = 0,
	isHealthHidden = false,
	canwalkonenergy = false,
	canwalkonfire = false,
	canwalkonpoison = false
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
	{name = "Platinum Coin", chance = 89960, maxCount = 55},
	{name = "Book Page", chance = 3000, maxCount = 7},
	{name = "Demonic Essence", chance = 43000, maxCount = 5},
	{name = "Small Amethyst", chance = 42000, maxCount = 14},
	{name = "Silken Bookmark", chance = 2000, maxCount = 2},
	{name = "Magma Coat", chance = 12000},
	{name = "Guardian Shield", chance = 1500},
	{name = "Soul Orb", chance = 3000, maxCount = 4},
	{name = "Necrotic Rod", chance = 3000},
	{name = "Magma Monocle", chance = 1500},
	{name = "Shadow Sceptre", chance = 18990}
}

monster.attacks = {
	{name ="combat", interval = 2000, chance = 100, minDamage = -200, maxDamage = -700, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 1000, chance = 15, minDamage = -200, maxDamage = -680, type = COMBAT_FIRE, range = 7, ShootEffect = CONST_ANI_FLAMMINGARROW, effect = CONST_ME_HITBYFIRE, target = false},
	{name ="combat", interval = 1500, chance = 12, minDamage = -200, maxDamage = -900, type = COMBAT_PHYSICAL, effect = CONST_ME_EXPLOSIONAREA, target = false},
	{name ="combat", interval = 2000, chance = 10, minDamage = -100, maxDamage = -850, type = COMBAT_LIFEDRAIN, length = 5, spread = 3, effect = CONST_ME_MAGIC_RED, target = false}
}

monster.defenses = {
	defense = 33,
	armor = 82
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -10},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
