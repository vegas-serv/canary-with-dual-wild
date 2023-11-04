local mType = Game.createMonsterType("Haunter")
local monster = {}

monster.description = "Haunter"
monster.experience = 400000
monster.outfit = {
	lookType = 320,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.level = {
min = 250,
max = 650
}

monster.health = 185000
monster.maxHealth = 185000
monster.race = "blood"
monster.corpse = 9001
monster.speed = 335
monster.manaCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 9
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
	rewardBoss = false,
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
	canWalkOnPoison = false
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "Surrender and I'll end it quick.", yell = false}
}

monster.loot = {
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 265, attack = 224},
	{name ="combat", interval = 1000, chance = 15, type = COMBAT_ENERGYDAMAGE, minDamage = -60, maxDamage = -130, range = 7, shootEffect = CONST_ANI_ENERGY, target = false},
	{name ="combat", interval = 1000, chance = 13, type = COMBAT_FIREDAMAGE, minDamage = -85, maxDamage = -115, range = 7, shootEffect = CONST_ANI_FIRE, target = false},
	{name ="combat", interval = 1000, chance = 17, type = COMBAT_PHYSICALDAMAGE, minDamage = -135, maxDamage = -175, range = 7, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA, target = false},
	{name ="combat", interval = 1000, chance = 15, type = COMBAT_EARTHDAMAGE, minDamage = -40, maxDamage = -120, range = 7, shootEffect = CONST_ANI_POISON, target = false},
	{name ="combat", interval = 1000, chance = 12, type = COMBAT_LIFEDRAIN, minDamage = -110, maxDamage = -130, range = 7, effect = CONST_ME_MAGIC_RED, target = false},
	{name ="speed", interval = 1000, chance = 10, speedChange = -850, range = 7, effect = CONST_ME_MAGIC_RED, target = false, duration = 20000},
	{name ="combat", interval = 1000, chance = 8, type = COMBAT_EARTHDAMAGE, minDamage = -35, maxDamage = -85, length = 8, spread = 3, effect = CONST_ME_GREEN_RINGS, target = false},
	{name ="combat", interval = 1000, chance = 6, type = COMBAT_LIFEDRAIN, minDamage = -75, maxDamage = -85, length = 8, spread = 3, effect = CONST_ME_MAGIC_RED, target = false},
	{name ="combat", interval = 1000, chance = 9, type = COMBAT_MANADRAIN, minDamage = -150, maxDamage = -250, length = 8, spread = 3, effect = CONST_ME_LOSEENERGY, target = false}
}

monster.defenses = {
	defense = 20,
	armor = 25,
	{name ="combat", interval = 2000, chance = 16, type = COMBAT_HEALING, minDamage = 100, maxDamage = 155, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="speed", interval = 2000, chance = 16, speedChange = 360, effect = CONST_ME_MAGIC_RED, target = false, duration = 80000}
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
	{type = COMBAT_DEATHDAMAGE , percent = 10}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
