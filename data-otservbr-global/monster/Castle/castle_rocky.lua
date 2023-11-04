--# Monster converted using Devm monster converter #--
local mType = Game.createMonsterType("Hight Plaguesmith")
local monster = {}

monster.description = "a Hight plaguesmith"
monster.experience = 57500
monster.outfit = {
	lookType = 247,
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

monster.health = 13250
monster.maxHealth = 13250
monster.race = "venom"
monster.corpse = 6515
monster.speed = 440
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
	runHealth = 500,
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
	{text = "You are looking a bit feverish!", yell = false},
	{text = "You don't look that good!", yell = false},
	{text = "Hachoo!", yell = false},
	{text = "Cough Cough", yell = false}
}

monster.loot = {
	{name = "emerald bangle", chance = 341},
	{name = "silver brooch", chance = 2000},
	{name = "gold coin", chance = 50000, maxCount = 65},
	{name = "small amethyst", chance = 5000, maxCount = 3},
	{name = "platinum coin", chance = 17142, maxCount = 55},
	{name = "piece of iron", chance = 20000},
	{name = "mouldy cheese", chance = 50000},
	{name = "two handed sword", chance = 20000},
	{name = "war hammer", chance = 2127},
	{name = "morning star", chance = 29000},
	{name = "battle hammer", chance = 20000},
	{name = "hammer of wrath", chance = 1952},
	{name = "knight legs", chance = 6250},
	{name = "steel shield", chance = 20000},
	{name = "steel boots", chance = 3123},
	{name = "piece of royal steel", chance = 1234},
	{name = "piece of hell steel", chance = 1010},
	{name = "piece of draconian steel", chance = 1030},
	{name = "soul orb", chance = 4111},
	{name = "demonic essence", chance = 4033},
	{name = "onyx arrow", chance = 7692, maxCount = 4},
	{name = "great health potion", chance = 10000}
}

monster.attacks = {
	{name ="combat", interval = 1500, chance = 100, minDamage = 0, maxDamage = -1539, effect = CONST_ME_DRAWBLOOD, condition = {type = CONDITION_POISON, startDamage = 800, interval = 4000}},
	{name ="combat", interval = 2000, chance = 15, minDamage = -60, maxDamage = -114, type = COMBAT_EARTH, effect = CONST_ME_POISONAREA, target = false},
	{name ="combat", interval = 2000, chance = 10, minDamage = -100, maxDamage = -350, type = COMBAT_EARTH, length = 5, spread = 3, effect = CONST_ME_YELLOW_RINGS, target = false},
	{name ="speed", interval = 2000, chance = 15, SpeedChange = -800, Duration = 30000}
}

monster.defenses = {
	defense = 40,
	armor = 40,
	{name ="combat", interval = 2000, chance = 10, minDamage = 200, maxDamage = 280, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="speed", interval = 2000, chance = 15, SpeedChange = 440, Duration = 5000}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = -10},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 30},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 20},
	{type = COMBAT_HOLYDAMAGE , percent = -10},
	{type = COMBAT_DEATHDAMAGE , percent = 1}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
