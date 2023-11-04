local mType = Game.createMonsterType("Sulphur Spouter")
local monster = {}

monster.description = "a sulphur spouter"
monster.experience = 13360
monster.outfit = {
	lookType = 1547,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.level = {
min = 500,
max = 700
}

monster.hazard = {
	criticalChance = 10.5, -- 10,5%
	canDodge = true, -- Activate/deactivate crit possibility on the animal
	canSpawnPod = true, -- Enable/disable possibility to drop spawn pod when killing the bug
	canDealMoreDamage = true -- Enable/Disable Increased Damage
}

monster.raceId = 2265
monster.Bestiary = {
	class = "Elemental",
	race = BESTY_RACE_ELEMENTAL,
	toKill = 5000,
	FirstUnlock = 100,
	SecondUnlock = 1000,
	CharmsPoints = 100,
	Stars = 5,
	Occurrence = 1,
	Locations = "Great Pearl Fan Reef"
}

monster.health = 17100
monster.maxHealth = 17100
monster.race = "blood"
monster.corpse = 39279
monster.speed = 180
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
	{text = "Gruugl...", yell = false}
}

monster.loot = {
	{name = "Sulphur Powder", chance = 39440},
	{name = "Crystal Coin", chance = 22310, minCount = 1, maxCount = 2},
	{name = "Ultimate Mana Potion", chance = 12890, minCount = 1, maxCount = 2},
	{name = "Yellow Gem", chance = 2820},
	{id = 282, chance = 2450}, -- Giant Shimmering Pearl (Green)
	{name = "Slightly Rusted Legs", chance = 2420},
	{name = "Knight Legs", chance = 2360},
	{id = 3039, chance = 2190}, -- Red Gem
	{name = "Warrior's Shield", chance = 1760},
	{id = 23533, chance = 1110}, -- Ring of Red Plasma
	{name = "Fire Sword", chance = 770},
	{name = "Crystal Crossbow", chance = 510},
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -200, maxDamage = -720},
	{name ="combat", interval = 2000, chance = 35, type = COMBAT_DEATHDAMAGE, minDamage = -800, maxDamage = -1500, length = 4, spread = 2, effect = CONST_ME_MORTAREA, target = false},
	{name ="combat", interval = 3000, chance = 25, type = COMBAT_EARTHDAMAGE, minDamage = -900, maxDamage = -1500, radius = 4, effect = CONST_ME_YELLOW_RINGS, target = false},

}

monster.defenses = {
	defense = 84,
	armor = 84
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = -20},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}
mType:register(monster)