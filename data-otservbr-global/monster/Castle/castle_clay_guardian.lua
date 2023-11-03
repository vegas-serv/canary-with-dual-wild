--# Monster converted using Devm monster converter #--
local mType = Game.createMonsterType("Hight Choking Fear")
local monster = {}

monster.description = "a Hight choking fear"
monster.experience = 51700
monster.outfit = {
	lookType = 586,
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

monster.health = 12800
monster.maxHealth = 12800
monster.race = "undead"
monster.corpse = 20159
monster.speed = 460
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 4000,
	chance = 5
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
	{text = "Ah, sweet air... don't you miss it?", yell = false},
	{text = "Murr tat muuza!", yell = false},
	{text = "kchh", yell = false}
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 100},
	{name = "platinum coin", chance = 100000, maxCount = 55},
	{name = "guardian shield", chance = 1540},
	{name = "beastslayer axe", chance = 3290},
	{name = "brown piece of cloth", chance = 6000},
	{name = "yellow piece of cloth", chance = 3500},
	{name = "great mana potion", chance = 20000, maxCount = 3},
	{name = "terra boots", chance = 11720},
	{name = "great spirit potion", chance = 20000, maxCount = 3},
	{name = "ultimate health potion", chance = 19000, maxCount = 3},
	{name = "spellbook of mind control", chance = 11720},
	{name = "underworld rod", chance = 11720},
	{name = "springsprout rod", chance = 510},
	{name = "green crystal shard", chance = 1540},
	{name = "brown crystal splinter", chance = 52500, maxCount = 12},
	{name = "blue crystal splinter", chance = 10000, maxCount = 13},
	{name = "cluster of solace", chance = 620},
	{name = "dead weight", chance = 14180},
	{name = "hemp rope", chance = 14180}
}

monster.attacks = {
	{name ="combat", interval = 2000, chance = 100, minDamage = 0, maxDamage = -1499, effect = CONST_ME_DRAWBLOOD, condition = {type = CONDITION_POISON, startDamage = 900, interval = 4000}},
	{name ="combat", interval = 2000, chance = 10, minDamage = -700, maxDamage = -900, length = 5, spread = 3, effect = CONST_ME_HITBYPOISON, target = false},
	{name ="combat", interval = 2000, chance = 10, minDamage = 0, maxDamage = -1300, type = COMBAT_PHYSICAL, ShootEffect = CONST_ANI_EXPLOSION, effect = CONST_ME_SLEEP, target = true},
	{name ="speed", interval = 2000, chance = 20, SpeedChange = -800, Duration = 15000},
	{name ="combat", interval = 2000, chance = 10, minDamage = -130, maxDamage = -300, type = COMBAT_MANADRAIN, effect = CONST_ME_SOUND_RED, target = false},
	{name ="combat", interval = 2000, chance = 20, minDamage = -250, maxDamage = -1200, type = COMBAT_DEATH, ShootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA, target = true}
}

monster.defenses = {
	defense = 35,
	armor = 35,
	{name ="combat", interval = 2000, chance = 10, minDamage = 80, maxDamage = 150, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 10},
	{type = COMBAT_ENERGYDAMAGE, percent = 15},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 10},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 50}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
