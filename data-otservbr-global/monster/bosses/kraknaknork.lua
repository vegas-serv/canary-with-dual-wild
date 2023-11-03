local mType = Game.createMonsterType("Kraknaknork")
local monster = {}

monster.description = "Kraknaknork"
monster.experience = 13000000
monster.outfit = {
	lookType = 6,
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

monster.health = 3800000
monster.maxHealth = 3800000
monster.race = "blood"
monster.corpse = 5978
monster.speed = 890
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10
}

monster.strategiesTarget = {
	nearest = 70,
	health = 10,
	damage = 10,
	random = 10,
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
	staticAttackChance = 90,
	targetDistance = 4,
	runHealth = 23,
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

monster.summon = {
	maxSummons = 1,
	summons = {
		{name = "Weakened Demon", chance = 20, interval = 2000, count = 1},
		{name = "Bye Lula", chance = 75, interval = 2000, count = 1},
		{name = "Bolsonaro", chance = 75, interval = 2000, count = 1}
	}
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "KRAK ORC DEMON", yell = false},
	{text = "???!!!", yell = false},
	{text = "Grak brrretz gulu.", yell = false}
}

monster.loot = {
	{name = "gold coin", chance = 95000, maxCount = 15},
	{name = "orc leather", chance = 4300}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -2210, condition = {type = CONDITION_POISON, totalDamage = 2225, interval = 4000}},
	{name ="kraknaknork ice wave", interval = 2000, chance = 45, minDamage = -1, maxDamage = -8815, target = false},
	{name ="kraknaknork poison wave", interval = 2000, chance = 44, minDamage = -1, maxDamage = -5510, target = false},
	{name ="kraknaknork explosion wave", interval = 2000, chance = 44, minDamage = 0, maxDamage = -5512, target = false},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -8558, range = 7, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA, target = false},
	{name ="speed", interval = 1000, chance = 6, speedChange = -100, range = 7, effect = CONST_ME_MAGIC_RED, target = false, duration = 20000},
	{name ="outfit", interval = 2000, chance = 35, range = 7, target = false, duration = 3000, outfitMonster = "Sheep"}
}

monster.defenses = {
	defense = 5,
	armor = 5
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = false},
	{type = "bleed", condition = false}
}

mType.onThink = function(monster, interval)
end

mType.onAppear = function(monster, creature)
end

mType.onDisappear = function(monster, creature)
end

mType.onMove = function(monster, creature, fromPosition, toPosition)
end

mType.onSay = function(monster, creature, type, message)
end

mType:register(monster)
