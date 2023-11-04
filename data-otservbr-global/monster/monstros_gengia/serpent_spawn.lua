--# Monster converted using Devm monster converter #--
local mType = Game.createMonsterType("Buggy Serpent Spawn")
local monster = {}

monster.description = "a Buggy serpent spawn"
monster.experience = 56050
monster.outfit = {
	lookType = 220,
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

monster.health = 16500
monster.maxHealth = 16500
monster.race = "venom"
monster.corpse = 6061
monster.speed = 450
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
	{text = "Sssssouls for the one", yell = false},
	{text = "HISSSS", yell = true},
	{text = "Tsssse one will risssse again", yell = false},
	{text = "I bring your deathhh, mortalssss", yell = false}
}

monster.loot = {
	{name = "golden mug", chance = 2870},
	{name = "small sapphire", chance = 12000},
	{name = "platinum coin", chance = 48000, maxCount = 55},
	{name = "gold coin", chance = 32300, maxCount = 39},
	{name = "life crystal", chance = 1800},
	{name = "snakebite rod", chance = 4930},
	{name = "warrior helmet", chance = 3560},
	{name = "strange helmet", chance = 12670},
	{name = "crown armor", chance = 3510},
	{name = "royal helmet", chance = 2140},
	{name = "tower shield", chance = 4920},
	{name = "power bolt", chance = 6200},
	{name = "green mushroom", chance = 18200},
	{name = "charmer's tiara", chance = 4180},
	{name = "mercenary sword", chance = 3070},
	{name = "noble axe", chance = 2750},
	{name = "great mana potion", chance = 2000},
	{name = "swamplair armor", chance = 2190},
	{name = "spellbook of mind control", chance = 4190},
	{name = "snake skin", chance = 4800},
	{name = "winged tail", chance = 1960}
}

monster.attacks = {
	{name ="combat", interval = 2000, chance = 100, minDamage = 0, maxDamage = -552, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 20, minDamage = -80, maxDamage = -500, type = COMBAT_EARTH, range = 7, ShootEffect = CONST_ANI_POISON, target = false},

	{name ="speed", interval = 2000, chance = 25, SpeedChange = -850, Duration = 12000},
	{name ="combat", interval = 2000, chance = 10, minDamage = -200, maxDamage = -500, type = COMBAT_LIFEDRAIN, length = 8, spread = 3, effect = CONST_ME_SOUND_RED, target = false},
	{name ="combat", interval = 2000, chance = 10, minDamage = -200, maxDamage = -700, type = COMBAT_EARTH, length = 8, spread = 3, effect = CONST_ME_POISONAREA, target = false}
}

monster.defenses = {
	defense = 35,
	armor = 35,
	{name ="combat", interval = 2000, chance = 15, minDamage = 250, maxDamage = 500, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="speed", interval = 2000, chance = 15, SpeedChange = 340, Duration = 5000}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = -10},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = -10},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
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
