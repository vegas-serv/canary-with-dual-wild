local mType = Game.createMonsterType("The Halloween Hare")
local monster = {}

monster.description = "The Halloween Hare"
monster.experience = 0
monster.outfit = {
	lookType = 74,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.level = {
min = 1300,
max = 2600
}

monster.health = 10000000
monster.maxHealth = 10000000
monster.race = "blood"
monster.corpse = 0
monster.speed = 375
monster.manaCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 95
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
	staticAttackChance = 10,
	targetDistance = 2,
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
}

monster.loot = {
	{name = "pumpkin", chance = 100000},
	{name = "yummy gummy worm", chance = 100000, maxCount = 20},
	{id = 3599, chance = 1000, maxCount = 50}, -- candy cane
	{id = 6569, chance = 1000, maxCount = 50}, -- candy
	{name = "spiderwebs", chance = 1000},
	{id = 8178, chance = 1000}, -- toy spider
	{id = 6491, chance = 1000}, -- bat decoration
	{id = 6525, chance = 1000}, -- skeleton decoration
	{name = "bar of chocolate", chance = 1000},
	{id = 6570, chance = 1000}, -- surprise bag
	{id = 6571, chance = 1000}, -- surprise bag
	{id = 2977, chance = 1000}, -- pumpkinhead
	{id = 3076, chance = 22500, maxCount = 3}, -- gold token
    {id = 3076, chance = 22500, maxCount = 3}, -- silver token
    {id = 19082, chance = 12500, maxCount = 2}, -- tornament token
    {id = 3043, chance = 12500, maxCount = 30}, -- crystal coin
    {id = 8153, chance = 5500, maxCount = 1}, -- boost exp 50%
    {id = 37110, chance = 7500, maxCount = 2}, -- exalted core
    {id = 32622, chance = 42500, maxCount = 1}, -- giant ameth
    {id = 16129, chance = 42500, maxCount = 3}, -- major
    {id = 9586, chance = 7500, maxCount = 1}, -- surprese box
    {id = 9145, chance = 4500, maxCount = 1}, -- mount doll
    {id = 28895, chance = 4500, maxCount = 1}, -- addon doll
    {id = 28887, chance = 4500, maxCount = 1}, -- vip days
    {id = 12905, chance = 4500, maxCount = 1}, -- stamina
    {id = 10227, chance = 4500, maxCount = 1} -- remover skull
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = 0},
	{name ="outfit", interval = 2000, chance = 6, radius = 3, effect = CONST_ME_BLOCKHIT, target = false, duration = 6000, outfitMonster = "bat"},
	{name ="outfit", interval = 2000, chance = 5, radius = 3, effect = CONST_ME_BLOCKHIT, target = false, duration = 6000, outfitMonster = "Thornback tortoise"},
	{name ="outfit", interval = 2000, chance = 6, radius = 3, effect = CONST_ME_BLOCKHIT, target = false, duration = 6000, outfitMonster = "orc"},
	{name ="outfit", interval = 2000, chance = 5, radius = 3, effect = CONST_ME_BLOCKHIT, target = false, duration = 6000, outfitMonster = "snake"},
	{name ="outfit", interval = 2000, chance = 6, radius = 3, effect = CONST_ME_BLOCKHIT, target = false, duration = 6000, outfitMonster = "warlock"},
	{name ="outfit", interval = 2000, chance = 5, radius = 3, effect = CONST_ME_BLOCKHIT, target = false, duration = 6000, outfitMonster = "witch"},
	{name ="outfit", interval = 2000, chance = 5, radius = 3, effect = CONST_ME_BLOCKHIT, target = false, duration = 6000, outfitMonster = "necromancer"},
	{name ="outfit", interval = 2000, chance = 5, radius = 3, effect = CONST_ME_BLOCKHIT, target = false, duration = 6000, outfitMonster = "dwarf geomancer"},
	{name ="outfit", interval = 2000, chance = 5, radius = 3, effect = CONST_ME_BLOCKHIT, target = false, duration = 6000, outfitMonster = "monk"},
	{name ="outfit", interval = 2000, chance = 5, radius = 3, effect = CONST_ME_BLOCKHIT, target = false, duration = 6000, outfitMonster = "crab"},
	{name ="outfit", interval = 2000, chance = 5, radius = 3, effect = CONST_ME_BLOCKHIT, target = false, duration = 6000, outfitMonster = "ghost"},
	{name ="outfit", interval = 2000, chance = 5, radius = 3, effect = CONST_ME_BLOCKHIT, target = false, duration = 6000, outfitMonster = "minotaur mage"},
	{name ="outfit", interval = 2000, chance = 5, radius = 3, effect = CONST_ME_BLOCKHIT, target = false, duration = 6000, outfitMonster = "green frog"},
	{name ="outfit", interval = 2000, chance = 5, radius = 3, effect = CONST_ME_BLOCKHIT, target = false, duration = 6000, outfitMonster = "parrot"},
	{name ="outfit", interval = 2000, chance = 15, radius = 3, effect = CONST_ME_BLOCKHIT, target = false, duration = 6000, outfitItem = 2096}
}

monster.defenses = {
	defense = 1244,
	armor = 1244,
	{name ="combat", interval = 1000, chance = 50, type = COMBAT_HEALING, minDamage = 1500, maxDamage = 2000, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 100},
	{type = COMBAT_ENERGYDAMAGE, percent = 100},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 100},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = true},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
