--# Monster converted using Devm monster converter #--
local mType = Game.createMonsterType("Hight Demon")
local monster = {}

monster.description = "a Hight demon"
monster.experience = 59000
monster.outfit = {
	lookType = 35,
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

monster.health = 14200
monster.maxHealth = 14200
monster.race = "fire"
monster.corpse = 5995
monster.speed = 480
monster.summonCost = 0
monster.maxSummons = 1

monster.changeTarget = {
	interval = 4000,
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

monster.summons = {
	{name = "fire elemental", chance = 10, interval = 2000}
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "Your soul will be mine!", yell = false},
	{text = "MUHAHAHAHA!", yell = false},
	{text = "CHAMEK ATH UTHUL ARAK!", yell = false},
	{text = "I SMELL FEEEEAAAAAR!", yell = false},
	{text = "Your resistance is futile!", yell = false}
}

monster.loot = {
	{name = "purple tome", chance = 1180},
	{name = "gold coin", chance = 60000, maxCount = 100},
	{name = "small emerald", chance = 9690, maxCount = 5},
	{name = "small amethyst", chance = 7250, maxCount = 5},
	{name = "small ruby", chance = 7430, maxCount = 5},
	{name = "small topaz", chance = 7470, maxCount = 5},
	{name = "demonic essence", chance = 14630},
	{name = "talon", chance = 3430},
	{name = "platinum coin", chance = 90540, maxCount = 55},
	{name = "might ring", chance = 1890},
	{name = "platinum amulet", chance = 680},
	{name = "orb", chance = 2854},
	{name = "gold ring", chance = 1050},
	{name = "double axe", chance = 4750},
	{name = "giant sword", chance = 9980},
	{name = "ice rapier", chance = 1550},
	{name = "golden sickle", chance = 1440},
	{name = "fire axe", chance = 4030},
	{name = "devil helmet", chance = 1180},
	{name = "golden legs", chance = 4440},
	{name = "magic plate armor", chance = 3130},
	{name = "mastermind shield", chance = 3480},
	{name = "demon shield", chance = 3740},
	{name = "fire mushroom", chance = 19660, maxCount = 6},
	{name = "demon horn", chance = 14920},
	{name = "assassin star", chance = 12550, maxCount = 10},
	{name = "demonrage sword", chance = 3370},
	{id = 7393, chance = 90}, -- demon trophy
	{name = "great mana potion", chance = 22220, maxCount = 3},
	{name = "ultimate health potion", chance = 19540, maxCount = 3},
	{name = "great spirit potion", chance = 18510, maxCount = 3}
}

monster.attacks = {
	{name ="combat", interval = 2000, chance = 100, minDamage = 0, maxDamage = -1520, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 10, minDamage = 0, maxDamage = -120, type = COMBAT_MANADRAIN, range = 7, target = false},
	{name ="combat", interval = 2000, chance = 20, minDamage = -150, maxDamage = -950, type = COMBAT_FIRE, range = 7, ShootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true},
	{name ="firefield", interval = 2000, chance = 10, range = 7, ShootEffect = CONST_ANI_FIRE, target = true},
	{name ="combat", interval = 2000, chance = 10, minDamage = -300, maxDamage = -490, type = COMBAT_LIFEDRAIN, length = 8, spread = 3, effect = CONST_ME_PURPLEENERGY, target = false},
	{name ="combat", interval = 2000, chance = 10, minDamage = -210, maxDamage = -900, type = COMBAT_ENERGY, range = 1, ShootEffect = CONST_ANI_ENERGY, target = false},
	{name ="speed", interval = 2000, chance = 15, SpeedChange = -700, Duration = 30000}
}

monster.defenses = {
	defense = 55,
	armor = 55,
	{name ="combat", interval = 2000, chance = 15, minDamage = 180, maxDamage = 250, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="speed", interval = 2000, chance = 15, SpeedChange = 320, Duration = 5000}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 30},
	{type = COMBAT_ENERGYDAMAGE, percent = 50},
	{type = COMBAT_EARTHDAMAGE, percent = 40},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 100},
	{type = COMBAT_ICEDAMAGE, percent = -10},
	{type = COMBAT_HOLYDAMAGE , percent = -10},
	{type = COMBAT_DEATHDAMAGE , percent = 30}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
