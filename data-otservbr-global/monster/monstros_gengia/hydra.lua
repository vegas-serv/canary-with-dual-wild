--# Monster converted using Devm monster converter #--
local mType = Game.createMonsterType("Buggy Hydra")
local monster = {}

monster.description = "a Buggy hydra"
monster.experience = 55100
monster.outfit = {
	lookType = 121,
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

monster.health = 15350
monster.maxHealth = 15350
monster.race = "blood"
monster.corpse = 6048
monster.speed = 350
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
	{text = "FCHHHHH", yell = false},
	{text = "HISSSS", yell = false}
}

monster.loot = {
	{name = "small sapphire", chance = 5000},
	{name = "gold coin", chance = 20000, maxCount = 46},
	{name = "platinum coin", chance = 48000, maxCount = 55},
	{name = "life crystal", chance = 570},
	{name = "boots of haste", chance = 3130},
	{name = "stone skin amulet", chance = 5900},
	{id = 3098, chance = 5600},
	{name = "warrior helmet", chance = 4890},
	{name = "knight armor", chance = 4000},
	{name = "royal helmet", chance = 3210},
	{name = "medusa shield", chance = 4270},
	{name = "ham", chance = 60000, maxCount = 4},
	{name = "hydra egg", chance = 930},
	{name = "strong mana potion", chance = 11380},
	{name = "cucumber", chance = 4780},
	{name = "hydra head", chance = 10120}
}

monster.attacks = {
	{name ="combat", interval = 2000, chance = 100, minDamage = 0, maxDamage = -470, effect = CONST_ME_DRAWBLOOD},
	{name ="speed", interval = 2000, chance = 25, SpeedChange = -700, Duration = 15000},
	{name ="combat", interval = 2000, chance = 10, minDamage = -100, maxDamage = -650, type = COMBAT_ICE, length = 8, spread = 3, effect = CONST_ME_LOSEENERGY, target = false},
	{name ="combat", interval = 2000, chance = 10, minDamage = -80, maxDamage = -655, type = COMBAT_ICE, ShootEffect = CONST_ANI_SMALLICE, target = true},
	{name ="combat", interval = 2000, chance = 10, minDamage = -66, maxDamage = -520, type = COMBAT_EARTH, length = 8, spread = 3, effect = CONST_ME_CARNIPHILA, target = false}
}

monster.defenses = {
	defense = 35,
	armor = 35,
	{name ="combat", interval = 2000, chance = 25, minDamage = 260, maxDamage = 407, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = -5},
	{type = COMBAT_ENERGYDAMAGE, percent = -10},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 50},
	{type = COMBAT_HOLYDAMAGE , percent = 30},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
