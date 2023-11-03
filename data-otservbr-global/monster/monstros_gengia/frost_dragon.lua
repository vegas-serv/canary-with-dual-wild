--# Monster converted using Devm monster converter #--
local mType = Game.createMonsterType("Buggy Frost Dragon")
local monster = {}

monster.description = "a Buggy frost dragon"
monster.experience = 53100
monster.outfit = {
	lookType = 248,
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

monster.health = 14800
monster.maxHealth = 14800
monster.race = "undead"
monster.corpse = 7091
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
	{text = "YOU WILL FREEZE!", yell = true},
	{text = "ZCHHHHH!", yell = true},
	{text = "I am so cool", yell = false},
	{text = "Chill out!.", yell = false}
}

monster.loot = {
	{id = 1976, chance = 8500}, -- ramp
	{name = "golden mug", chance = 3000},
	{name = "small sapphire", chance = 5200},
	{name = "gold coin", chance = 33000, maxCount = 100},
	{name = "platinum coin", chance = 59800, maxCount = 55},
	{name = "gold coin", chance = 33000, maxCount = 42},
	{name = "life crystal", chance = 520},
	{name = "ice rapier", chance = 350},
	{name = "strange helmet", chance = 450},
	{name = "dragon scale mail", chance = 2380},
	{name = "royal helmet", chance = 3210},
	{name = "tower shield", chance = 3340},
	{name = "power bolt", chance = 6000, maxCount = 6},
	{name = "dragon ham", chance = 80370, maxCount = 5},
	{name = "green mushroom", chance = 12000},
	{name = "shard", chance = 12550},
	{name = "dragon slayer", chance = 3120},
	{id = 7441, chance = 4000} -- ice cube
}

monster.attacks = {
	{name ="combat", interval = 2000, chance = 100, minDamage = 0, maxDamage = -525, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 10, minDamage = -175, maxDamage = -380, type = COMBAT_LIFEDRAIN, length = 8, spread = 3, effect = CONST_ME_POFF, target = false},
	{name ="speed", interval = 2000, chance = 5, SpeedChange = -700, Duration = 12000},
	{name ="speed", interval = 2000, chance = 15, SpeedChange = -850, Duration = 18000},
	{name ="combat", interval = 2000, chance = 5, minDamage = -60, maxDamage = -520, type = COMBAT_ICE, effect = CONST_ME_ICETORNADO, target = false},
	{name ="combat", interval = 2000, chance = 10, minDamage = -100, maxDamage = -540, type = COMBAT_ICE, effect = CONST_ME_ICEAREA, target = true},
	{name ="combat", interval = 2000, chance = 5, minDamage = 0, maxDamage = -220, type = COMBAT_PHYSICAL, length = 1, spread = 0, effect = CONST_ME_POFF, target = false},
	{name ="speed", interval = 2000, chance = 20, SpeedChange = -600, Duration = 12000}
}

monster.defenses = {
	defense = 45,
	armor = 45,
	{name ="combat", interval = 2000, chance = 10, minDamage = 150, maxDamage = 200, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="speed", interval = 2000, chance = 15, SpeedChange = 290, Duration = 5000}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 10},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 100},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 10}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
