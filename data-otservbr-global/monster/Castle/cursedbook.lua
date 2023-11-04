--# Monster converted using Devm monster converter #--
local mType = Game.createMonsterType("Hight Cursed Book")
local monster = {}

monster.description = "a Hight cursed book"
monster.experience = 57700
monster.outfit = {
	lookType = 1061,
	lookHead = 79,
	lookBody = 83,
	lookLegs = 113,
	lookFeet = 0,
	lookAddons = 1,
	lookMount = 0
}

monster.level = {
min = 325,
max = 445
}

monster.health = 21000
monster.maxHealth = 21000
monster.race = "undead"
monster.corpse = 33337
monster.speed = 220
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 5000,
	chance = 8
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
}

monster.loot = {
	{name = "Platinum Coin", chance = 10000, maxCount = 110},
	{name = "Small Diamond", chance = 10000, maxCount = 7},
	{name = "Small Stone", chance = 10000, maxCount = 7},
	{name = "Small Topaz", chance = 10000, maxCount = 7},
	{name = "Protection Amulet", chance = 10000},
	{name = "Terra Boots", chance = 5350},
	{name = "Terra Hood", chance = 6600},
	{name = "Diamond Sceptre", chance = 6600},
	{name = "Terra Mantle", chance = 6250},
	{name = "Terra Legs", chance = 6250},
	{name = "Terra Amulet", chance = 7500},
	{name = "Stone Skin Amulet", chance = 4350},
	{name = "Springsprout Rod", chance = 5350},
	{name = "Sacred Tree Amulet", chance = 3450},
	{name = "Swamplair Armor", chance = 3250}
}

monster.attacks = {
	{name ="combat", interval = 2000, chance = 100, minDamage = -100, maxDamage = -200, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 1000, chance = 15, minDamage = -400, maxDamage = -680, type = COMBAT_PHYSICAL, range = 7, ShootEffect = CONST_ANI_EARTHARROW, target = false},
	{name ="combat", interval = 1000, chance = 10, minDamage = -400, maxDamage = -575, type = COMBAT_LIFEDRAIN, length = 5, spread = 3, effect = CONST_ME_POISONAREA, target = false},
	{name ="combat", interval = 1000, chance = 12, minDamage = -230, maxDamage = -880, type = COMBAT_PHYSICAL, range = 7, effect = CONST_ME_GROUNDSHAKER, target = false}
}

monster.defenses = {
	defense = 40,
	armor = 82
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 50},
	{type = COMBAT_ENERGYDAMAGE, percent = 30},
	{type = COMBAT_EARTHDAMAGE, percent = 80},
	{type = COMBAT_FIREDAMAGE, percent = 50},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 50},
	{type = COMBAT_HOLYDAMAGE , percent = 50},
	{type = COMBAT_DEATHDAMAGE , percent = 50}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
