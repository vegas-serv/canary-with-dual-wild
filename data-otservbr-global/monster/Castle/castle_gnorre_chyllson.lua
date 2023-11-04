--# Monster converted using Devm monster converter #--
local mType = Game.createMonsterType("Hight Grim Reaper")
local monster = {}

monster.description = "a Hight grim reaper"
monster.experience = 51500
monster.outfit = {
	lookType = 300,
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

monster.health = 15900
monster.maxHealth = 15900
monster.race = "undead"
monster.corpse = 8127
monster.speed = 460
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 5000,
	chance = 20
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
	{text = "Death!", yell = false},
	{text = "Come a little closer!", yell = false},
	{text = "The end is near!", yell = false}
}

monster.loot = {
	{name = "gold coin", chance = 99000, maxCount = 55},
	{name = "platinum coin", chance = 5200, maxCount = 55},
	{name = "dark shield", chance = 3000},
	{name = "scythe", chance = 9000},
	{name = "orichalcum pearl", chance = 1400, maxCount = 4},
	{name = "demonic essence", chance = 10600},
	{name = "nightmare blade", chance = 3880},
	{name = "great mana potion", chance = 10000},
	{name = "glacier kilt", chance = 3330},
	{name = "ultimate health potion", chance = 9600},
	{name = "skullcracker armor", chance = 3270},
	{name = "underworld rod", chance = 3910},
	{name = "mystical hourglass", chance = 5300}
}

monster.attacks = {
	{name ="combat", interval = 2000, chance = 100, minDamage = 0, maxDamage = -1320, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 20, minDamage = 0, maxDamage = -865, type = COMBAT_PHYSICAL, range = 7, ShootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA, target = false},
	{name ="combat", interval = 2000, chance = 10, minDamage = -350, maxDamage = -920, type = COMBAT_DEATH, length = 8, spread = 3, effect = CONST_ME_DRAWBLOOD, target = false},
	{name ="combat", interval = 2000, chance = 15, minDamage = 0, maxDamage = -900, type = COMBAT_PHYSICAL, length = 7, spread = 3, effect = CONST_ME_EXPLOSIONAREA, target = false},
	{name ="combat", interval = 2000, chance = 10, minDamage = -225, maxDamage = -875, type = COMBAT_DEATH, effect = CONST_ME_DRAWBLOOD, target = false}
}

monster.defenses = {
	defense = 35,
	armor = 35,
	{name ="combat", interval = 2000, chance = 15, minDamage = 130, maxDamage = 205, type = COMBAT_HEALING, effect = CONST_ME_DRAWBLOOD, target = false},
	{name ="speed", interval = 2000, chance = 15, SpeedChange = 450, Duration = 5000}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 20},
	{type = COMBAT_ENERGYDAMAGE, percent = -10},
	{type = COMBAT_EARTHDAMAGE, percent = 40},
	{type = COMBAT_FIREDAMAGE, percent = -10},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 65},
	{type = COMBAT_HOLYDAMAGE , percent = -10},
	{type = COMBAT_DEATHDAMAGE , percent = 80}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
