--# Monster converted using Devm monster converter #--
local mType = Game.createMonsterType("Buggy Bog Raider")
local monster = {}

monster.description = "a Buggy bog raider"
monster.experience = 53800
monster.outfit = {
	lookType = 299,
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

monster.health = 13900
monster.maxHealth = 13900
monster.race = "venom"
monster.corpse = 8123
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
	{text = "Tchhh!", yell = false},
	{text = "Slurp!", yell = false}
}

monster.loot = {
	{name = "gold coin", chance = 50750, maxCount = 100},
	{name = "platinum coin", chance = 59800, maxCount = 55},
	{name = "plate legs", chance = 2040},
	{name = "great health potion", chance = 2000},
	{name = "great spirit potion", chance = 2008},
	{name = "ultimate health potion", chance = 3740},
	{name = "belted cape", chance = 2590},
	{name = "paladin armor", chance = 4110},
	{name = "springsprout rod", chance = 4030},
	{name = "boggy dreads", chance = 9870}
}

monster.attacks = {
	{name ="combat", interval = 2000, chance = 100, minDamage = 0, maxDamage = -183, effect = CONST_ME_DRAWBLOOD, condition = {type = CONDITION_POISON, startDamage = 180, interval = 4000}},
	{name ="combat", interval = 2000, chance = 10, minDamage = -90, maxDamage = -140, type = COMBAT_LIFEDRAIN, range = 7, effect = CONST_ME_MAGIC_RED, target = true},
	{name ="combat", interval = 2000, chance = 10, minDamage = -100, maxDamage = -275, type = COMBAT_EARTH, effect = CONST_ME_BUBBLES, target = false},
	{name ="combat", interval = 2000, chance = 15, minDamage = -96, maxDamage = -110, type = COMBAT_EARTH, range = 7, ShootEffect = CONST_ANI_SMALLEARTH, target = true},
	{name ="speed", interval = 2000, chance = 15, SpeedChange = -600, Duration = 15000}
}

monster.defenses = {
	defense = 15,
	armor = 15,
	{name ="combat", interval = 2000, chance = 10, minDamage = 65, maxDamage = 95, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = -20},
	{type = COMBAT_ENERGYDAMAGE, percent = -10},
	{type = COMBAT_EARTHDAMAGE, percent = 30},
	{type = COMBAT_FIREDAMAGE, percent = 85},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -5},
	{type = COMBAT_HOLYDAMAGE , percent = -5},
	{type = COMBAT_DEATHDAMAGE , percent = 5}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
