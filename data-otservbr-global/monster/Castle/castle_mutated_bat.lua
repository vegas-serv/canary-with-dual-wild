--# Monster converted using Devm monster converter #--
local mType = Game.createMonsterType("Hight Hellspawn")
local monster = {}

monster.description = "a Hight hellspawn"
monster.experience = 51550
monster.outfit = {
	lookType = 322,
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

monster.health = 11500
monster.maxHealth = 11500
monster.race = "fire"
monster.corpse = 9009
monster.speed = 460
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 4000,
	chance = 15
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
	{text = "Your fragile bones are like toothpicks to me.", yell = false},
	{text = "You little weasel will not live to see another day.", yell = false},
	{text = "I'm just a messenger of what's yet to come.", yell = false},
	{text = "HRAAAAAAAAAAAAAAAARRRR", yell = true},
	{text = "I'm taking you down with me!", yell = false}
}

monster.loot = {
	{name = "gold coin", chance = 60000, maxCount = 36},
	{name = "morning star", chance = 10000},
	{name = "broadsword", chance = 10000},
	{name = "warrior helmet", chance = 3886},
	{name = "knight legs", chance = 5030},
	{name = "red mushroom", chance = 7692, maxCount = 2},
	{name = "demonic essence", chance = 9090},
	{name = "assassin star", chance = 9090, maxCount = 2},
	{name = "onyx flail", chance = 103},
	{name = "berserk potion", chance = 934},
	{name = "spiked squelcher", chance = 970},
	{name = "great health potion", chance = 40333},
	{name = "ultimate health potion", chance = 9090},
	{name = "small topaz", chance = 5882, maxCount = 3},
	{name = "hellspawn tail", chance = 20000}
}

monster.attacks = {
	{name ="combat", interval = 2000, chance = 100, minDamage = 0, maxDamage = -1352, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 20, minDamage = -150, maxDamage = -175, type = COMBAT_FIRE, ShootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREATTACK, target = false}
}

monster.defenses = {
	defense = 40,
	armor = 40,
	{name ="combat", interval = 2000, chance = 10, minDamage = 120, maxDamage = 230, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="speed", interval = 2000, chance = 15, SpeedChange = 270, Duration = 5000}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 20},
	{type = COMBAT_ENERGYDAMAGE, percent = 10},
	{type = COMBAT_EARTHDAMAGE, percent = 80},
	{type = COMBAT_FIREDAMAGE, percent = 40},
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
