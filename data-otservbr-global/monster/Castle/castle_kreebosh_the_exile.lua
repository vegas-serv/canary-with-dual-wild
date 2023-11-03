--# Monster converted using Devm monster converter #--
local mType = Game.createMonsterType("Hight Guzzlemaw")
local monster = {}

monster.description = "a Hight guzzlemaw"
monster.experience = 58500
monster.outfit = {
	lookType = 584,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.level = {
min = 325,
max = 445
}

monster.health = 14400
monster.maxHealth = 14400
monster.race = "blood"
monster.corpse = 20151
monster.speed = 470
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10
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
	staticAttackChance = 80,
	targetdistance = 1,
	runHealth = 0,
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
	{text = "Gmmmooooh! *chomp*", yell = false},
	{text = "MWAAAH! *gurgle*", yell = false},
	{text = "*chomp* Mmmoh! *chomp*", yell = false}
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 100},
	{name = "platinum coin", chance = 100000, maxCount = 55},
	{name = "banana skin", chance = 10700},
	{name = "piece of iron", chance = 10500},
	{name = "fishbone", chance = 9500},
	{name = "two handed sword", chance = 2700},
	{name = "ham", chance = 10000},
	{name = "iron ore", chance = 3000},
	{name = "fish fin", chance = 5000},
	{name = "hardened bone", chance = 5700},
	{name = "assassin dagger", chance = 4000},
	{name = "haunted blade", chance = 5000},
	{name = "nightmare blade", chance = 3380},
	{name = "great mana potion", chance = 17000, maxCount = 3},
	{name = "great health potion", chance = 18500, maxCount = 2},
	{name = "sai", chance = 1200},
	{name = "violet crystal shard", chance = 3000},
	{name = "brown crystal splinter", chance = 12000, maxCount = 2},
	{name = "red crystal fragment", chance = 7600},
	{name = "cluster of solace", chance = 920},
	{name = "frazzle tongue", chance = 15000},
	{name = "frazzle skin", chance = 14000}
}

monster.attacks = {
	{name ="combat", interval = 2000, chance = 100, minDamage = 0, maxDamage = -1499, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 10, minDamage = -500, maxDamage = -1000, effect = CONST_ME_DRAWBLOOD, target = false},
	{name ="combat", interval = 2000, chance = 10, minDamage = 0, maxDamage = -1300, type = COMBAT_PHYSICAL, length = 8, spread = 3, effect = CONST_ME_EXPLOSIONAREA, target = true},
	{name ="combat", interval = 2000, chance = 20, minDamage = 0, maxDamage = -900, type = COMBAT_PHYSICAL, ShootEffect = CONST_ANI_LARGEROCK, effect = CONST_ME_STONES, target = true},
	{name ="speed", interval = 2000, chance = 15, SpeedChange = -800, Duration = 15000},
	{name ="combat", interval = 2000, chance = 10, minDamage = 0, maxDamage = -800, type = COMBAT_LIFEDRAIN, length = 8, spread = 3, effect = CONST_ME_MAGIC_RED, target = false}
}

monster.defenses = {
	defense = 50,
	armor = 50,
	{name ="combat", interval = 2000, chance = 20, minDamage = 250, maxDamage = 425, type = COMBAT_HEALING, effect = CONST_ME_HITBYPOISON, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 10},
	{type = COMBAT_ENERGYDAMAGE, percent = 5},
	{type = COMBAT_EARTHDAMAGE, percent = 15},
	{type = COMBAT_FIREDAMAGE, percent = 5},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 5},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 5}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
