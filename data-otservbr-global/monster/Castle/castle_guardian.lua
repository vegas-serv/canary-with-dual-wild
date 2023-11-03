--# Monster converted using Devm monster converter #--
local mType = Game.createMonsterType("Castle Guardian")
local monster = {}

monster.description = "a castle guardian"
monster.experience = 1000
monster.outfit = {
	lookType = 131,
	lookHead = 114,
	lookBody = 94,
	lookLegs = 58,
	lookFeet = 94,
	lookAddons = 3,
	lookMount = 0
}

monster.health = 100000
monster.maxHealth = 100000
monster.race = "blood"
monster.corpse = 0
monster.speed = 0
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 5000,
	chance = 30
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
	targetdistance = 4,
	runHealth = 800,
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

monster.attacks = {
	{name ="combat", interval = 1000, chance = 100, minDamage = -250, maxDamage = -250, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 1000, chance = 35, minDamage = -250, maxDamage = -250, type = COMBAT_PHYSICAL, range = 7, ShootEffect = CONST_ANI_ENERGY, target = false},
	{name ="combat", interval = 1000, chance = 17, minDamage = -250, maxDamage = -250, type = COMBAT_MANADRAIN, range = 7, target = false},
	{name ="speed", interval = 1000, chance = 12, SpeedChange = -600, Duration = 40000},
	{name ="combat", interval = 2000, chance = 45, minDamage = -250, maxDamage = -250, type = COMBAT_FIRE, range = 7, ShootEffect = CONST_ANI_BURSTARROW, effect = CONST_ME_FIREAREA, target = true},
	{name ="firefield", interval = 1000, chance = 20, range = 7, ShootEffect = CONST_ANI_FIRE, target = true},
	{name ="combat", interval = 2000, chance = 25, minDamage = -250, maxDamage = -250, type = COMBAT_ENERGY, length = 8, spread = 3, effect = CONST_ME_ENERGYHIT, target = false},
	{name ="speed", interval = 6000, chance = 10, SpeedChange = -600, Duration = 20000}
}

monster.defenses = {
	defense = 1,
	armor = 1
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = -33},
	{type = COMBAT_ENERGYDAMAGE, percent = 100},
	{type = COMBAT_EARTHDAMAGE, percent = 90},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 100},
	{type = COMBAT_HOLYDAMAGE , percent = -25},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
