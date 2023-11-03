--# Monster converted using Devm monster converter #--
local mType = Game.createMonsterType("Hight Dark Torturer")
local monster = {}

monster.description = "a Hight dark torturer"
monster.experience = 58650
monster.outfit = {
	lookType = 234,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.level = {
min = 325,
max = 445
}

monster.health = 15350
monster.maxHealth = 15350
monster.race = "undead"
monster.corpse = 6328
monster.speed = 440
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10
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
	staticAttackChance = 80,
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
	{text = "You like it, don't you?", yell = false},
	{text = "IahaEhheAie!", yell = false},
	{text = "It's party time!", yell = false},
	{text = "Harrr, Harrr!", yell = false},
	{text = "The torturer is in!", yell = false}
}

monster.loot = {
	{name = "gold coin", chance = 40000, maxCount = 99},
	{name = "platinum coin", chance = 55000, maxCount = 55},
	{name = "golden legs", chance = 5030},
	{name = "steel boots", chance = 9050},
	{name = "ham", chance = 60000, maxCount = 2},
	{name = "orichalcum pearl", chance = 2760, maxCount = 2},
	{name = "cat's paw", chance = 2222},
	{name = "jewelled backpack", chance = 3192},
	{name = "soul orb", chance = 23000},
	{name = "demonic essence", chance = 8520},
	{name = "assassin star", chance = 2222, maxCount = 5},
	{name = "vile axe", chance = 5480},
	{name = "butcher's axe", chance = 4850},
	{name = "great mana potion", chance = 14830, maxCount = 2},
	{name = "great health potion", chance = 10000, maxCount = 2},
	{name = "gold ingot", chance = 6140}
}

monster.attacks = {
	{name ="combat", interval = 2000, chance = 100, minDamage = 0, maxDamage = -1500, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 10, minDamage = 0, maxDamage = -1781, type = COMBAT_PHYSICAL, range = 7, ShootEffect = CONST_ANI_THROWINGKNIFE, target = false}
}

monster.defenses = {
	defense = 40,
	armor = 40,
	{name ="combat", interval = 2000, chance = 10, minDamage = 200, maxDamage = 250, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 30},
	{type = COMBAT_EARTHDAMAGE, percent = 90},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -10},
	{type = COMBAT_HOLYDAMAGE , percent = -10},
	{type = COMBAT_DEATHDAMAGE , percent = 10}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
