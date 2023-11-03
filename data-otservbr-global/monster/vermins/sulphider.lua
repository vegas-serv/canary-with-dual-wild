local mType = Game.createMonsterType("Sulphider")
local monster = {}

monster.description = "a sulphider"
monster.experience = 15460
monster.outfit = {
	lookType = 1546,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.level = {
min = 480,
max = 625
}

monster.hazard = {
	criticalChance = 10.5, -- 10,5%
	canDodge = true, -- Activate/deactivate crit possibility on the animal
	canSpawnPod = true, -- Enable/disable possibility to drop spawn pod when killing the bug
	canDealMoreDamage = true -- Enable/Disable Increased Damage
}

monster.raceId = 2264
monster.Bestiary = {
	class = "Vermin",
	race = BESTY_RACE_VERMIN,
	toKill = 5000,
	FirstUnlock = 100,
	SecondUnlock = 1000,
	CharmsPoints = 100,
	Stars = 5,
	Occurrence = 0,
	Locations = "Monster Graveyard"
}
monster.health = 18900
monster.maxHealth = 18900
monster.race = "blood"
monster.corpse = 39275
monster.speed = 215
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
	{text = "Tikkee...Takka...", yell = false}
}

monster.loot = {
	{ name="sulphur powder" , chance = 30853},
	{ name="sulphider shell" , chance = 23632},
	{ name="ultimate mana potion", chance = 14661},
	{ name="crystal coin" , chance = 13348, maxCount = 3},
	{ name="white pearl" , chance = 4376},
	{ name="fire axe" , chance = 2845},
	{ name="crown shield" , chance = 2188},
	{ name="amber staff" , chance = 1969},
	{ name="amulet of loss", chance = 1969},
	{ name="magma boots" , chance = 1313}
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -1000 },
	{ name = "combat", interval = 3500, chance = 40, type = COMBAT_FIREDAMAGE, minDamage = -650, maxDamage = -1060, range = 7, radius = 4, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true },
	{ name = "blast ring", interval = 4000, chance = 35, minDamage = -600, maxDamage = -1100 },
}

monster.defenses = {
	defense = 83,
	armor = 83
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 20},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -20},
	{type = COMBAT_HOLYDAMAGE , percent = -10},
	{type = COMBAT_DEATHDAMAGE , percent = 20}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}
mType:register(monster)


