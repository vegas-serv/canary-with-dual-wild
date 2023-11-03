local mType = Game.createMonsterType("Hulking Carnisylvan Noob")
local monster = {}

monster.description = "a hulking carnisylvan noob"
monster.experience = 14700
monster.outfit = {
	lookType = 1418,
	lookHead = 21,
	lookBody = 3,
	lookLegs = 94,
	lookFeet = 94,
	lookAddons = 0,
	lookMount = 0
}

monster.level = {
min = 332,
max = 444
}

monster.raceId = 2107
monster.Bestiary = {
	class = "Human",
	race = BESTY_RACE_HUMAN,
	toKill = 2500,
	FirstUnlock = 100,
	SecondUnlock = 1000,
	CharmsPoints = 50,
	Stars = 4,
	Occurrence = 0,
	Locations = "Forest of Life"
}

monster.health = 18600
monster.maxHealth = 18600
monster.race = "blood"
monster.corpse = 36881
monster.speed = 710
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10
}

monster.strategiesTarget = {
	nearest = 100,
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
	canPushCreatures = false,
	staticAttackChance = 70,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "Gaaahnnnh.", yell = false},
}

monster.loot = {
	{name = "platinum coin", chance = 70000, maxCount = 130},
	{id = 3115, chance = 27670, maxCount = 1}, -- bone
	{name = "great health potion", chance = 14990, maxCount = 4},
	{name = "carnisylvan bark", chance = 12100, maxCount = 1},
	{name = "carnisylvan finger", chance = 10090, maxCount = 2},
	{name = "terra hood", chance = 7200},
	{name = "terra boots", chance = 4900},
	{name = "knight axe", chance = 3460},
	{name = "lightning headband", chance = 3460},
	{name = "dragonbone staff", chance = 5190},
	{name = "diamond sceptre", chance = 4320},
	{name = "epee", chance = 2590},
	{name = "war hammer", chance = 3750},
	{name = "human teeth", chance = 1580},
	{name = "golden legs", chance = 1440},
	{name = "magic plate armor", chance = 1130},
	{name = "mastermind shield", chance = 1480},
	{name = "demon shield", chance = 1740},
	{name = "giant sapphire", chance = 6800},
    {name = "Giant Amethyst", chance = 6800},
    {name = "Giant Emerald", chance = 6800},
    {name = "Giant Ruby", chance = 6800},
    {name = "Giant Topaz", chance = 6800},
    {name = "Hexagonal Ruby", chance = 6800}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -1300},
	{name ="combat", interval = 2000, chance = 60, type = COMBAT_EARTHDAMAGE, minDamage = -350, maxDamage = -2450, range = 5, shootEffect = CONST_ANI_SMALLEARTH, effect = CONST_ME_POISONAREA, target = true},
	{name ="combat", interval = 2000, chance = 40, type = COMBAT_PHYSICALDAMAGE, minDamage = -600, maxDamage = -1800, radius = 4, effect = CONST_ME_EXPLOSIONHIT, target = false},
	{name ="combat", interval = 2000, chance = 30, type = COMBAT_PHYSICALDAMAGE, minDamage = -350, maxDamage = -2400, length = 4, spread = 0, effect = CONST_ME_EXPLOSIONHIT, target = false},
}

monster.defenses = {
	defense = 51,
	armor = 51
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 15},
	{type = COMBAT_EARTHDAMAGE, percent = 20},
	{type = COMBAT_FIREDAMAGE, percent = -20},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -10},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 10}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
