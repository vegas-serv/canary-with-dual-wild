--# Monster converted using Devm monster converter #--
local mType = Game.createMonsterType("Buggy Fury")
local monster = {}

monster.description = "a Buggy fury"
monster.experience = 55000
monster.outfit = {
	lookType = 149,
	lookHead = 94,
	lookBody = 77,
	lookLegs = 96,
	lookFeet = 0,
	lookAddons = 3,
	lookMount = 0
}

monster.level = {
min = 413,
max = 640
}

monster.health = 14100
monster.maxHealth = 14100
monster.race = "blood"
monster.corpse = 18118
monster.speed = 450
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
	{text = "Ahhhhrrrr!", yell = false},
	{text = "Waaaaah!", yell = false},
	{text = "Carnage!", yell = false},
	{text = "Dieee!", yell = false}
}

monster.loot = {
	{name = "gold coin", chance = 38000, maxCount = 69},
	{name = "platinum coin", chance = 12800, maxCount = 55},
	{name = "terra rod", chance = 4000},
	{name = "golden legs", chance = 3130},
	{name = "steel boots", chance = 2790},
	{name = "meat", chance = 25000},
	{name = "orichalcum pearl", chance = 11500, maxCount = 4},
	{name = "red piece of cloth", chance = 5000},
	{name = "soul orb", chance = 3500},
	{name = "demonic essence", chance = 4300},
	{name = "assassin dagger", chance = 3660},
	{name = "noble axe", chance = 3000},
	{name = "great health potion", chance = 10500},
	{name = "jalapeno pepper", chance = 29280, maxCount = 4}
}

monster.attacks = {
	{name ="combat", interval = 2000, chance = 100, minDamage = 0, maxDamage = -510, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 10, minDamage = -200, maxDamage = -300, type = COMBAT_FIRE, length = 8, spread = 3, effect = CONST_ME_EXPLOSIONAREA, target = false},
	{name ="combat", interval = 2000, chance = 5, minDamage = -120, maxDamage = -700, type = COMBAT_DEATH, length = 8, spread = 3, effect = CONST_ME_DRAWBLOOD, target = false},
	{name ="combat", interval = 2000, chance = 10, minDamage = -120, maxDamage = -600, type = COMBAT_DEATH, effect = CONST_ME_DRAWBLOOD, target = false},

	{name ="combat", interval = 2000, chance = 10, minDamage = -120, maxDamage = -300, type = COMBAT_LIFEDRAIN, effect = CONST_ME_HITAREA, target = false},
	{name ="combat", interval = 2000, chance = 10, minDamage = -125, maxDamage = -550, type = COMBAT_DEATH, range = 7, ShootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_SMALLCLOUDS, target = false},
	{name ="speed", interval = 2000, chance = 15, SpeedChange = -800, Duration = 30000}
}

monster.defenses = {
	defense = 20,
	armor = 20,
	{name ="speed", interval = 2000, chance = 15, SpeedChange = 800, Duration = 5000}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = -10},
	{type = COMBAT_ENERGYDAMAGE, percent = -10},
	{type = COMBAT_EARTHDAMAGE, percent = -10},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 30},
	{type = COMBAT_HOLYDAMAGE , percent = 30},
	{type = COMBAT_DEATHDAMAGE , percent = -10}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
