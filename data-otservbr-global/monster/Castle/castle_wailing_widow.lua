--# Monster converted using Devm monster converter #--
local mType = Game.createMonsterType("Hight Medusa")
local monster = {}

monster.description = "a medusa"
monster.experience = 55050
monster.outfit = {
	lookType = 330,
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

monster.health = 13500
monster.maxHealth = 13500
monster.race = "blood"
monster.corpse = 9607
monster.speed = 280
monster.summonCost = 0
monster.maxSummons = 0

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
	staticAttackChance = 80,
	targetdistance = 1,
	runHealth = 600,
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
	{text = "You will make ssuch a fine ssstatue!", yell = false},
	{text = "There isss no chhhanccce of esscape", yell = false},
	{text = "Jusssst look at me!", yell = false},
	{text = "Are you tired or why are you moving thhat sslow<chuckle>", yell = false}
}

monster.loot = {
	{name = "gold coin", chance = 50000, maxCount = 90},
	{name = "small emerald", chance = 3770, maxCount = 4},
	{name = "platinum coin", chance = 74810, maxCount = 55},
	{name = "knight armor", chance = 1840},
	{name = "medusa shield", chance = 3040},
	{name = "titan axe", chance = 1160},
	{name = "great mana potion", chance = 10000, maxCount = 2},
	{name = "terra mantle", chance = 6870},
	{name = "terra legs", chance = 6420},
	{name = "terra amulet", chance = 4060},
	{name = "ultimate health potion", chance = 9290, maxCount = 2},
	{name = "sacred tree amulet", chance = 850},
	{name = "strand of medusa hair", chance = 9900}
}

monster.attacks = {
	{name ="combat", interval = 2000, chance = 100, minDamage = 0, maxDamage = -450, effect = CONST_ME_DRAWBLOOD, condition = {type = CONDITION_POISON, startDamage = 840, interval = 4000}},
	{name ="combat", interval = 2000, chance = 20, minDamage = -21, maxDamage = -350, type = COMBAT_LIFEDRAIN, range = 7, ShootEffect = CONST_ANI_EARTH, effect = CONST_ME_CARNIPHILA, target = true},
	{name ="combat", interval = 2000, chance = 15, minDamage = -250, maxDamage = -500, type = COMBAT_EARTH, length = 8, spread = 3, effect = CONST_ME_CARNIPHILA, target = false},
	{name ="speed", interval = 2000, chance = 25, SpeedChange = -900, Duration = 10000}
}

monster.defenses = {
	defense = 30,
	armor = 30,
	{name ="combat", interval = 2000, chance = 25, minDamage = 150, maxDamage = 300, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = -10},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = -5},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 100},
	{type = COMBAT_ICEDAMAGE, percent = 20},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
