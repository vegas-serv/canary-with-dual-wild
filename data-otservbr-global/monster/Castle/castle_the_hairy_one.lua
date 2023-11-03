--# Monster converted using Devm monster converter #--
local mType = Game.createMonsterType("Hight Undead Dragon")
local monster = {}

monster.description = "an Hight undead dragon"
monster.experience = 57200
monster.outfit = {
	lookType = 231,
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

monster.health = 15350
monster.maxHealth = 15350
monster.race = "undead"
monster.corpse = 6306
monster.speed = 450
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
	illusionable = true,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 70,
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
	{text = "FEEEED MY ETERNAL HUNGER!", yell = true},
	{text = "I SENSE LIFE", yell = true}
}

monster.loot = {
	{name = "golden mug", chance = 6002},
	{name = "black pearl", chance = 22780, maxCount = 2},
	{name = "small sapphire", chance = 28370, maxCount = 2},
	{name = "gold coin", chance = 55500, maxCount = 98},
	{name = "platinum coin", chance = 52000, maxCount = 55},
	{name = "life crystal", chance = 2500},
	{name = "golden armor", chance = 5860},
	{name = "knight armor", chance = 5500},
	{name = "royal helmet", chance = 3720},
	{name = "power bolt", chance = 15190, maxCount = 15},
	{name = "hardened bone", chance = 14180},
	{id = 6300, chance = 1150}, -- death ring
	{name = "demonic essence", chance = 12460},
	{name = "assassin star", chance = 26650, maxCount = 5},
	{name = "dragon slayer", chance = 6860},
	{name = "dragonbone staff", chance = 8000},
	{name = "great mana potion", chance = 21490},
	{name = "great health potion", chance = 21200},
	{name = "divine plate", chance = 5430},
	{name = "skullcracker armor", chance = 5290},
	{name = "gold ingot", chance = 6570},
	{name = "unholy bone", chance = 33380},
	{name = "spellweaver's robe", chance = 5860}
}

monster.attacks = {
	{name ="combat", interval = 2000, chance = 100, minDamage = 0, maxDamage = -1480, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 5, minDamage = -300, maxDamage = -400, type = COMBAT_PHYSICAL, range = 7, effect = CONST_ME_DRAWBLOOD, target = true},
	{name ="combat", interval = 2000, chance = 10, minDamage = -125, maxDamage = -600, type = COMBAT_DEATH, range = 7, ShootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_SMALLCLOUDS, target = false},
	{name ="combat", interval = 2000, chance = 5, minDamage = -100, maxDamage = -390, type = COMBAT_EARTH, range = 7, ShootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA, target = true},
	{name ="combat", interval = 2000, chance = 15, minDamage = 0, maxDamage = -180, type = COMBAT_EARTH, range = 7, ShootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA, target = true},
	{name ="combat", interval = 2000, chance = 10, minDamage = -150, maxDamage = -690, type = COMBAT_EARTH, length = 8, spread = 3, effect = CONST_ME_POISONAREA, target = false},
	{name ="combat", interval = 2000, chance = 10, minDamage = -300, maxDamage = -700, type = COMBAT_LIFEDRAIN, length = 8, spread = 3, effect = CONST_ME_MAGIC_RED, target = false},
	{name ="combat", interval = 2000, chance = 10, minDamage = -100, maxDamage = -200, type = COMBAT_LIFEDRAIN, effect = CONST_ME_MAGIC_RED, target = false}
}

monster.defenses = {
	defense = 40,
	armor = 40,
	{name ="combat", interval = 2000, chance = 15, minDamage = 200, maxDamage = 250, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 5},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 100},
	{type = COMBAT_ICEDAMAGE, percent = 50},
	{type = COMBAT_HOLYDAMAGE , percent = -25},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
