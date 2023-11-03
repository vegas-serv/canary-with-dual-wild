--# Monster converted using Devm monster converter #--
local mType = Game.createMonsterType("Hight Defiler")
local monster = {}

monster.description = "a defiler"
monster.experience = 54700
monster.outfit = {
	lookType = 238,
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

monster.health = 12650
monster.maxHealth = 12650
monster.race = "venom"
monster.corpse = 6532
monster.speed = 230
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
	illusionable = true,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 80,
	targetdistance = 1,
	runHealth = 85,
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
	{text = "Blubb", yell = false},
	{text = "Blubb Blubb", yell = false}
}

monster.loot = {
	{name = "small diamond", chance = 2439, maxCount = 2},
	{name = "small ruby", chance = 3000, maxCount = 2},
	{name = "gold coin", chance = 100000, maxCount = 72},
	{name = "small emerald", chance = 5366, maxCount = 3},
	{name = "talon", chance = 5710},
	{name = "platinum coin", chance = 95000, maxCount = 55},
	{name = "yellow gem", chance = 4219},
	{name = "green gem", chance = 5613},
	{name = "blue gem", chance = 4300},
	{name = "soul orb", chance = 20000},
	{id = 6300, chance = 3030}, -- death ring
	{name = "demonic essence", chance = 20320},
	{name = "glob of acid slime", chance = 14210},
	{name = "glob of tar", chance = 12000}
}

monster.attacks = {
	{name ="combat", interval = 2000, chance = 100, minDamage = 0, maxDamage = -240, effect = CONST_ME_DRAWBLOOD, condition = {type = CONDITION_POISON, startDamage = 150, interval = 4000}},
	{name ="combat", interval = 2000, chance = 20, minDamage = -160, maxDamage = -270, type = COMBAT_EARTH, range = 7, ShootEffect = CONST_ANI_POISON, target = false},
	{name ="combat", interval = 2000, chance = 15, minDamage = -400, maxDamage = -640, range = 7, effect = CONST_ME_HITBYPOISON, target = false},
	{name ="combat", interval = 2000, chance = 20, minDamage = -120, maxDamage = -170, type = COMBAT_EARTH, effect = CONST_ME_POISONAREA, target = false},
	{name ="combat", interval = 2000, chance = 10, minDamage = -500, maxDamage = -1000, length = 8, spread = 3, effect = CONST_ME_SMALLPLANTS, target = false},
	{name ="speed", interval = 2000, chance = 15, SpeedChange = -700, Duration = 15000}
}

monster.defenses = {
	defense = 20,
	armor = 20,
	{name ="combat", interval = 2000, chance = 10, minDamage = 280, maxDamage = 350, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 10},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = -25},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 20},
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
