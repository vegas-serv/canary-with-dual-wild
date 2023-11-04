--# Monster converted using Devm monster converter #--
local mType = Game.createMonsterType("Hight Rage Squid")
local monster = {}

monster.description = "a Hight rage squid"
monster.experience = 58000
monster.outfit = {
	lookType = 1059,
	lookHead = 94,
	lookBody = 78,
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
monster.corpse = 32482
monster.speed = 215
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
	{name = "great spirit potion", chance = 10000, maxCount = 3},
	{name = "fire mushroom", chance = 10000, maxCount = 6},
	{name = "small amethyst", chance = 90000, maxCount = 5},
	{name = "slime heart", chance = 3000},
	{name = "piece of dead brain", chance = 4900},
	{name = "platinum coin", chance = 100000, maxCount = 186},
	{name = "ultimate health potion", chance = 10000, maxCount = 3},
	{name = "small topaz", chance = 90000, maxCount = 5},
	{name = "small emerald", chance = 90000, maxCount = 5},
	{name = "orb", chance = 66000, maxCount = 5},
	{name = "purple tome", chance = 6333},
	{name = "great mana potion", chance = 10000, maxCount = 3},
	{name = "demonic essence", chance = 4300},
	{name = "small ruby", chance = 90000, maxCount = 5},
	{name = "talon", chance = 8990},
	{name = "might ring", chance = 4990},
	{name = "devil helmet", chance = 6990},
	{name = "demonrage sword", chance = 7400},
	{id = 7393, chance = 390}, -- demon trophy
	{name = "giant sword", chance = 7250},
	{name = "demon shield", chance = 7250},
	{name = "magic plate armor", chance = 750},
	{name = "platinum amulet", chance = 6350},
	{name = "wand of everblazing", chance = 7300},
	{name = "fire axe", chance = 7500}
}

monster.attacks = {
	{name ="combat", interval = 2000, chance = 100, minDamage = 0, maxDamage = -500, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 1000, chance = 15, minDamage = 200, maxDamage = -280, type = COMBAT_FIRE, range = 7, ShootEffect = CONST_ANI_FLAMMINGARROW, effect = CONST_ME_HITBYFIRE, target = false},
	{name ="combat", interval = 2000, chance = 10, minDamage = 200, maxDamage = -380, type = COMBAT_FIRE, range = 7, ShootEffect = CONST_ANI_FIRE, target = false},
	{name ="combat", interval = 2000, chance = 10, minDamage = 200, maxDamage = -175, type = COMBAT_LIFEDRAIN, length = 5, spread = 3, effect = CONST_ME_MAGIC_RED, target = false},
	{name ="combat", interval = 2000, chance = 12, minDamage = 200, maxDamage = -475, type = COMBAT_FIRE, effect = CONST_ME_HITBYFIRE, target = false},
	{name ="combat", interval = 2000, chance = 10, minDamage = 200, maxDamage = -475, type = COMBAT_FIRE, effect = CONST_ME_FIREAREA, target = false}
}

monster.defenses = {
	defense = 78,
	armor = 78
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -15},
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
