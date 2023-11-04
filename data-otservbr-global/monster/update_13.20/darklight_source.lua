local mType = Game.createMonsterType("Darklight Source")
local monster = {}

monster.description = "a Darklight Source"
monster.experience = 20800
monster.outfit = {
	lookType = 1660,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.level = {
min = 355,
max = 655
}

monster.raceId = 2398
monster.Bestiary = {
	class = "Construct",
	race = BESTY_RACE_CONSTRUCT,
	toKill = 5000,
	FirstUnlock = 25,
	SecondUnlock = 3394,
	CharmsPoints = 100,
	Stars = 5,
	Occurrence = 0,
	Locations = "Sanctuary."
	}

monster.health = 31550
monster.maxHealth = 31550
monster.race = "undead"
monster.corpse = 43840
monster.speed = 220
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10
}

monster.strategiesTarget = {
	nearest = 80,
	health = 10,
	damage = 10,
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
	runHealth = 800,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = true,
	canWalkOnPoison = true
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {

}

monster.loot = {
	{ name = "crystal coin", chance = 70540 },
	{ name = "plate armor", chance = 7500 },
	{ name = "ultimate health potion", chance = 52220, maxCount = 7 },
	{ name = "medusa shield", chance = 5500 },
	{ name = "knight legs", chance = 2500 },
	{ name = "gold ring", chance = 3500 },
	{ name = "jade hammer", chance = 1500 },
	{ name = "twiceslicer", chance = 1500 },
	{ name = "stone skin amulet", chance = 15500 },
	{ name = "nightmare blade", chance = 9500 },
	{ name = "demonrage sword", chance = 7500 },
	{ name = "dreaded cleaver", chance = 2500 },
	{ name = "butcher's axe", chance = 1500 },
	{ id = 43894, chance = 1500 },
	{ id = 43850, chance = 5000 },
	{ id = 43851, chance = 1500 },
}

monster.attacks = {
	{ name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -1000 },
	{ name ="combat", interval = 2000, chance = 17, type = COMBAT_ENERGYDAMAGE, minDamage = -700, maxDamage = -1100, radius = 4, shootEffect = CONST_ANI_ETHEREALSPEAR, effect = CONST_ME_ENERGYAREA, target = true },
	{ name ="combat", interval = 3000, chance = 15, type = COMBAT_ENERGYDAMAGE, minDamage = -700, maxDamage = -1100, radius = 4, effect = CONST_ME_ENERGYHIT, target = false },
	{ name ="combat", interval = 2000, chance = 20, type = COMBAT_HOLYDAMAGE, minDamage = -550, maxDamage = -900, range = 7, shootEffect = CONST_ANI_SMALLHOLY, effect = CONST_ME_HOLYDAMAGE, target = true }
}

monster.defenses = {
	defense = 115,
	armor = 115
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = -10 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 55 },
	{ type = COMBAT_EARTHDAMAGE, percent = -10 },
	{ type = COMBAT_FIREDAMAGE, percent = -15 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 40 },
	{ type = COMBAT_HOLYDAMAGE , percent = 0 },
	{ type = COMBAT_DEATHDAMAGE , percent = 0 }
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false }
}

mType:register(monster)
