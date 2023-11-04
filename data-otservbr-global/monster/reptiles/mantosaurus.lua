local mType = Game.createMonsterType("Mantosaurus")
local monster = {}

monster.description = "a mantosaurus"
monster.experience = 13420  
monster.outfit = {
	lookType = 1556,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.level = {
min = 525,
max = 775
}

monster.hazard = {
	criticalChance = 10.5, -- 10,5%
	canDodge = true, -- Activate/deactivate crit possibility on the animal
	canSpawnPod = true, -- Enable/disable possibility to drop spawn pod when killing the bug
	canDealMoreDamage = true -- Enable/Disable Increased Damage
}

monster.raceId = 2274
monster.Bestiary = {
	class = "Reptile",
	race = BESTY_RACE_REPTILE,
	toKill = 5000,
	FirstUnlock = 100,
	SecondUnlock = 1000,
	CharmsPoints = 100,
	Stars = 3,
	Occurrence = 0,
	Locations = "Crystal Enigma"
}
monster.health = 17450
monster.maxHealth = 17450
monster.race = "blood"
monster.corpse = 39315
monster.speed = 205
monster.manaCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 0
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
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "Klkkk... Klkkk...", yell = false}
}

monster.loot = {
	{ name = "mantosaurus jaw", chance = 14286},
	{ name = "crystal coin", chance = 7143, maxCount = 1},
	{ name = "red crystal fragment", chance = 7143},
	{ name = "cyan crystal fragment", chance = 7143},
	{ name = "green crystal shard", chance = 7143},
	{ name = "silver brooch", chance = 7143},
	{ name = "gold ring", chance = 5000},
	{ name = "coral brooch", chance = 5000},
	{ name = "ultimate mana potion", chance = 5000, maxCount = 5},
	{ id = 3007, chance = 7143} -- crystal ring
}

monster.attacks = {
    {name ="combat", interval = 2000, chance = 100, minDamage = -300, maxDamage = -700 } ,
    {name ="combat", interval = 2000, chance = 25, type = COMBAT_ENERGYDAMAGE, minDamage = -950, maxDamage = -1200, range = 4, radius = 4, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYAREA, target = false},
    {name ="combat", interval = 3000, chance = 25, type = COMBAT_PHYSICALDAMAGE, minDamage = -800, maxDamage = -1100, range = 4, radius = 4, effect = CONST_ME_EXPLOSIONHIT, target = false},
    {name ="combat", interval = 5000, chance = 41, type = COMBAT_EARTHDAMAGE, minDamage = -500, maxDamage = -900, range = 6, radius = 4, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA, target = true},
}

monster.defenses = {
	defense = 65,
	armor = 65
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = -10},
	{type = COMBAT_ENERGYDAMAGE, percent = 10},
	{type = COMBAT_EARTHDAMAGE, percent = 5},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -15},
	{type = COMBAT_HOLYDAMAGE , percent = -15},
	{type = COMBAT_DEATHDAMAGE , percent = 5}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}




mType:register(monster)