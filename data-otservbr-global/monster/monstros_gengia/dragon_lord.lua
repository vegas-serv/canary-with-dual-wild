--# Monster converted using Devm monster converter #--
local mType = Game.createMonsterType("Buggy Dragon Lord")
local monster = {}

monster.description = "a Buggy dragon lord"
monster.experience = 53100
monster.outfit = {
	lookType = 39,
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
monster.race = "blood"
monster.corpse = 5984
monster.speed = 400
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
	{text = "ZCHHHHH", yell = true},
	{text = "YOU WILL BURN!", yell = true}
}

monster.loot = {
	{name = "golden mug", chance = 3190},
	{name = "small sapphire", chance = 5300},
	{name = "platinum coin", chance = 59800, maxCount = 55},
	{name = "gold coin", chance = 33750, maxCount = 45},
	{id = 3051, chance = 5600},
	{name = "life crystal", chance = 3680},
	{name = "fire sword", chance = 14290},
	{name = "strange helmet", chance = 360},
	{name = "dragon scale mail", chance = 2170},
	{name = "royal helmet", chance = 2280},
	{name = "tower shield", chance = 4250},
	{name = "power bolt", chance = 6700, maxCount = 7},
	{name = "dragon ham", chance = 80000, maxCount = 5},
	{name = "green mushroom", chance = 12000},
	{name = "red dragon scale", chance = 1920},
	{name = "red dragon leather", chance = 1040},
	{name = "royal spear", chance = 8800, maxCount = 3},
	{name = "dragon lord trophy", chance = 4180},
	{name = "dragon slayer", chance = 4100},
	{name = "strong health potion", chance = 970}
}

monster.attacks = {
	{name ="combat", interval = 2000, chance = 100, minDamage = 0, maxDamage = -430, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 20, minDamage = -100, maxDamage = -600, type = COMBAT_FIRE, range = 7, ShootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true},
	{name ="firefield", interval = 2000, chance = 10, range = 7, ShootEffect = CONST_ANI_FIRE, target = true},
	{name ="combat", interval = 2000, chance = 15, minDamage = -150, maxDamage = -530, type = COMBAT_FIRE, length = 8, spread = 3, effect = CONST_ME_FIREAREA, target = false}
}

monster.defenses = {
	defense = 35,
	armor = 35,
	{name ="combat", interval = 2000, chance = 15, minDamage = 57, maxDamage = 93, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 20},
	{type = COMBAT_EARTHDAMAGE, percent = 80},
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
