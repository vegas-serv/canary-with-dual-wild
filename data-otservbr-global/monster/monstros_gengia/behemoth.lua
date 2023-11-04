--# Monster converted using Devm monster converter #--
local mType = Game.createMonsterType("Buggy Behemoth")
local monster = {}

monster.description = "a Buggy behemoth"
monster.experience = 53500
monster.outfit = {
	lookType = 55,
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

monster.health = 15000
monster.maxHealth = 15000
monster.race = "blood"
monster.corpse = 5999
monster.speed = 460
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
	{text = "You're so little!", yell = false},
	{text = "Human flesh - delicious!", yell = false},
	{text = "Crush the intruders!", yell = false}
}

monster.loot = {
	{name = "crystal necklace", chance = 2530},
	{name = "gold coin", chance = 40000, maxCount = 99},
	{name = "small amethyst", chance = 6380, maxCount = 15},
	{name = "platinum coin", chance = 59800, maxCount = 55},
	{name = "strange symbol", chance = 750},
	{name = "two handed sword", chance = 15980},
	{name = "double axe", chance = 10510},
	{name = "giant sword", chance = 4006},
	{name = "crowbar", chance = 100},
	{name = "war axe", chance = 5550},
	{name = "plate armor", chance = 3930},
	{name = "dark armor", chance = 4370},
	{name = "steel boots", chance = 3380},
	{name = "meat", chance = 30000, maxCount = 6},
	{name = "perfect behemoth fang", chance = 9090},
	{name = "behemoth claw", chance = 8430},
	{name = "assassin star", chance = 9750, maxCount = 5},
	{id = 7396, chance = 1170}, -- behemoth trophy
	{name = "titan axe", chance = 6590},
	{name = "great health potion", chance = 5120},
	{name = "battle stone", chance = 14000}
}

monster.attacks = {
	{name ="combat", interval = 2000, chance = 100, minDamage = 0, maxDamage = -950, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 15, minDamage = 0, maxDamage = -500, type = COMBAT_PHYSICAL, range = 7, ShootEffect = CONST_ANI_LARGEROCK, target = false}
}

monster.defenses = {
	defense = 45,
	armor = 45,
	{name ="speed", interval = 2000, chance = 15, SpeedChange = 300, Duration = 5000}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 10},
	{type = COMBAT_ENERGYDAMAGE, percent = 10},
	{type = COMBAT_EARTHDAMAGE, percent = 80},
	{type = COMBAT_FIREDAMAGE, percent = 30},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -10},
	{type = COMBAT_HOLYDAMAGE , percent = 30},
	{type = COMBAT_DEATHDAMAGE , percent = -5}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
