--# Monster converted using Devm monster converter #--
local mType = Game.createMonsterType("Buggy Warlock")
local monster = {}

monster.description = "a Buggy warlock"
monster.experience = 56000
monster.outfit = {
	lookType = 130,
	lookHead = 19,
	lookBody = 71,
	lookLegs = 128,
	lookFeet = 128,
	lookAddons = 1,
	lookMount = 0
}

monster.level = {
min = 413,
max = 640
}

monster.health = 11500
monster.maxHealth = 11500
monster.race = "blood"
monster.corpse = 18246
monster.speed = 420
monster.summonCost = 0
monster.maxSummons = 1

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

monster.summons = {
	{name = "stone golem", chance = 10, interval = 2000, max = 1}
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "Learn the secret of our magic! YOUR death!", yell = false},
	{text = "Even a rat is a better mage than you.", yell = false},
	{text = "We don't like intruders!", yell = false}
}

monster.loot = {
	{name = "red tome", chance = 300},
	{name = "candlestick", chance = 1500},
	{name = "piggy bank", chance = 60},
	{name = "ring of the sky", chance = 3430},
	{name = "small sapphire", chance = 1190},
	{name = "platinum coin", chance = 48000, maxCount = 55},
	{name = "talon", chance = 11150},
	{name = "mind stone", chance = 2000},
	{name = "stone skin amulet", chance = 11330},
	{name = "poison dagger", chance = 7600},
	{name = "skull staff", chance = 6370},
	{name = "golden armor", chance = 111640},
	{name = "blue robe", chance = 15410},
	{name = "cherry", chance = 19000, maxCount = 4},
	{name = "bread", chance = 9000},
	{name = "dark mushroom", chance = 3000},
	{name = "assassin star", chance = 3500, maxCount = 4},
	{name = "assassin star", chance = 3470, maxCount = 4},
	{name = "great mana potion", chance = 14760},
	{name = "great health potion", chance = 15190},
	{name = "lightning robe", chance = 15000},
	{name = "luminous orb", chance = 1510}
}

monster.attacks = {
	{name ="combat", interval = 2000, chance = 100, minDamage = 0, maxDamage = -130, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 25, minDamage = -90, maxDamage = -680, type = COMBAT_ENERGY, range = 7, ShootEffect = CONST_ANI_ENERGY, target = false},
	{name ="combat", interval = 2000, chance = 5, range = 5, target = false},
	{name ="combat", interval = 2000, chance = 10, minDamage = 0, maxDamage = -120, type = COMBAT_MANADRAIN, range = 7, target = false},
	{name ="combat", interval = 2000, chance = 20, minDamage = -50, maxDamage = -680, type = COMBAT_FIRE, range = 7, ShootEffect = CONST_ANI_BURSTARROW, effect = CONST_ME_FIREAREA, target = true},
	{name ="firefield", interval = 2000, chance = 10, range = 7, ShootEffect = CONST_ANI_FIRE, target = true},
	{name ="combat", interval = 2000, chance = 10, minDamage = -150, maxDamage = -530, type = COMBAT_ENERGY, length = 8, spread = 3, effect = CONST_ME_BIGCLOUDS, target = false},
	{name ="speed", interval = 2000, chance = 15, SpeedChange = -600, Duration = 20000}
}

monster.defenses = {
	defense = 20,
	armor = 20,
	{name ="combat", interval = 2000, chance = 20, minDamage = 100, maxDamage = 225, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="invisible", interval = 2000, chance = 20, effect = CONST_ME_MAGIC_BLUE}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = -5},
	{type = COMBAT_ENERGYDAMAGE, percent = 100},
	{type = COMBAT_EARTHDAMAGE, percent = 95},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 100},
	{type = COMBAT_HOLYDAMAGE , percent = -5},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
