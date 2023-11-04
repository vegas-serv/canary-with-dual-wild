--# Monster converted using Devm monster converter #--
local mType = Game.createMonsterType("Buggy Wyrm")
local monster = {}

monster.description = "a Buggy wyrm"
monster.experience = 53550
monster.outfit = {
	lookType = 291,
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

monster.health = 12825
monster.maxHealth = 12825
monster.race = "blood"
monster.corpse = 8113
monster.speed = 330
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
	{text = "GRRR!", yell = false},
	{text = "GROOOOAAAAAAAAR!", yell = false}
}

monster.loot = {
	{name = "small diamond", chance = 750, maxCount = 3},
	{name = "gold coin", chance = 30000, maxCount = 100},
	{name = "platinum coin", chance = 48000, maxCount = 55},
	{name = "crossbow", chance = 5920},
	{id = 3449, chance = 5600},
	{name = "dragon ham", chance = 34800, maxCount = 3},
	{name = "dragonbone staff", chance = 3110},
	{name = "strong health potion", chance = 19970},
	{name = "strong mana potion", chance = 15310},
	{name = "lightning pendant", chance = 720},
	{name = "composite hornbow", chance = 3190},
	{name = "focus cape", chance = 4250},
	{name = "hibiscus dress", chance = 250},
	{name = "wand of starstorm", chance = 5420},
	{name = "wand of draconia", chance = 5990},
	{name = "shockwave amulet", chance = 1110},
	{name = "wyrm scale", chance = 5360}
}

monster.attacks = {
	{name ="combat", interval = 2000, chance = 100, minDamage = 0, maxDamage = -235, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 15, minDamage = -100, maxDamage = -520, type = COMBAT_ENERGY, effect = CONST_ME_YELLOWENERGY, target = false},
	{name ="combat", interval = 2000, chance = 10, minDamage = -130, maxDamage = -500, type = COMBAT_ENERGY, length = 5, spread = 2, effect = CONST_ME_PURPLEENERGY, target = false},
	{name ="combat", interval = 2000, chance = 20, minDamage = -100, maxDamage = -525, type = COMBAT_ENERGY, range = 7, ShootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYHIT, target = false},
	{name ="combat", interval = 2000, chance = 10, minDamage = -98, maxDamage = -145, type = COMBAT_LIFEDRAIN, length = 4, spread = 3, effect = CONST_ME_POFF, target = false}
}

monster.defenses = {
	defense = 35,
	armor = 35,
	{name ="combat", interval = 2000, chance = 15, minDamage = 100, maxDamage = 150, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="combat", interval = 2000, chance = 10, effect = CONST_ME_SOUND_YELLOW, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 100},
	{type = COMBAT_EARTHDAMAGE, percent = 75},
	{type = COMBAT_FIREDAMAGE, percent = 20},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -5},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = -5}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
