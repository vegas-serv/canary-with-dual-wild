local mType = Game.createMonsterType("Apocalypse")
local monster = {}

monster.description = "Apocalypse"
monster.experience = 550000
monster.outfit = {
	lookType = 12,
	lookHead = 94,
	lookBody = 128,
	lookLegs = 94,
	lookFeet = 65,
	lookAddons = 0,
	lookMount = 0
}

monster.level = {
min = 375,
max = 450
}

monster.health = 360000
monster.maxHealth = 360000
monster.race = "fire"
monster.corpse = 6068
monster.speed = 550
monster.manaCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 40
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
	rewardBoss = true,
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
	canWalkOnPoison = true
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "BOW TO THE POWER OF THE RUTHLESS SEVEN!", yell = true},
	{text = "DESTRUCTION!", yell = true},
	{text = "CHAOS!", yell = true},
	{text = "DEATH TO ALL!", yell = true}
}

monster.loot = {
	{id = 3025, chance = 13500}, -- ancient amulet
	{id = 3116, chance = 19000}, -- big bone
	{name = "black pearl", chance = 15000, maxCount = 35},
	{name = "boots of haste", chance = 14000},
	{id = 3076, chance = 22500}, -- crystal ball
	{name = "crystal necklace", chance = 21500},
	{id = 3007, chance = 15500}, -- crystal ring
	{name = "demon shield", chance = 15500},
	{name = "devil helmet", chance = 11000},
	{name = "dragon hammer", chance = 34500},
	{id = 3051, chance = 13500}, -- energy ring
	{name = "fire axe", chance = 17000},
	{name = "giant sword", chance = 12500},
	{name = "platinum coin", chance = 69900, maxCount = 100},
	{name = "platinum coin", chance = 68800, maxCount = 100},
	{name = "crystal coin", chance = 47700, maxCount = 40},
	{name = "crystal coin", chance = 36600, maxCount = 15},
	{name = "gold ring", chance = 28000},
	{name = "golden legs", chance = 15000},
	{name = "giant ruby", chance = 31500},
	{name = "giant sapphire", chance = 31500},
	{name = "giant emerald", chance = 31500},
	{name = "ice rapier", chance = 27500},
	{name = "magic plate armor", chance = 13000},
	{name = "mastermind shield", chance = 17500},
	{name = "purple tome", chance = 12600},
	{name = "ring of the sky", chance = 13500},
	{name = "silver dagger", chance = 15500},
	{name = "skull staff", chance = 25000},
	{name = "talon", chance = 14000, maxCount = 27},
	{name = "teddy bear", chance = 10500},
	{name = "thunder hammer", chance = 3500},
	{id = 3002, chance = 5100}, -- voodoo doll
	{name = "white pearl", chance = 12500, maxCount = 35},
	{id = 3076, chance = 22500, maxCount = 3}, -- gold token
    {id = 3076, chance = 22500, maxCount = 3}, -- silver token
    {id = 19082, chance = 22500, maxCount = 2}, -- tornament token
    {id = 3043, chance = 52500, maxCount = 30}, -- crystal coin
    {id = 8153, chance = 12500, maxCount = 1}, -- boost exp 50%
    {id = 37110, chance = 12500, maxCount = 2}, -- exalted core
    {id = 32622, chance = 42500, maxCount = 1}, -- giant ameth
    {id = 16129, chance = 42500, maxCount = 3}, -- major
    {id = 9586, chance = 12500, maxCount = 1}, -- surprese box
    {id = 9145, chance = 12500, maxCount = 1}, -- mount doll
    {id = 28895, chance = 12500, maxCount = 1}, -- addon doll
    {id = 28887, chance = 12500, maxCount = 1}, -- vip days
    {id = 12905, chance = 12500, maxCount = 1}, -- stamina
    {id = 10227, chance = 12500, maxCount = 1} -- remover skull
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 530, attack = 510},
	{name ="combat", interval = 1000, chance = 8, type = COMBAT_DEATHDAMAGE, minDamage = -800, maxDamage = -4900, radius = 9, effect = CONST_ME_MORTAREA, target = false},
	{name ="speed", interval = 1000, chance = 12, speedChange = -850, radius = 6, effect = CONST_ME_POISONAREA, target = false, duration = 60000},
	{name ="strength", interval = 1000, chance = 10, minDamage = -600, maxDamage = -1450, radius = 5, effect = CONST_ME_HITAREA, target = false},
	{name ="combat", interval = 3000, chance = 13, type = COMBAT_FIREDAMAGE, minDamage = -300, maxDamage = -800, range = 7, radius = 7, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true},
	{name ="combat", interval = 3000, chance = 8, type = COMBAT_MANADRAIN, minDamage = -600, maxDamage = -700, radius = 10, effect = CONST_ME_ENERGYAREA, target = false},
	{name ="combat", interval = 2000, chance = 9, type = COMBAT_ENERGYDAMAGE, minDamage = -400, maxDamage = -800, length = 8, spread = 3, effect = CONST_ME_MAGIC_RED, target = false},
	-- poison
	{name ="condition", type = CONDITION_POISON, interval = 5000, chance = 18, minDamage = -800, maxDamage = -1000, effect = CONST_ME_HITBYPOISON, target = false},
	{name ="combat", interval = 2000, chance = 6, type = COMBAT_LIFEDRAIN, minDamage = -600, maxDamage = -1200, radius = 14, effect = CONST_ME_MAGIC_GREEN, target = false}
}

monster.defenses = {
	defense = 145,
	armor = 188,
	{name ="combat", interval = 1000, chance = 15, type = COMBAT_HEALING, minDamage = 1000, maxDamage = 3000, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="speed", interval = 2000, chance = 8, speedChange = 480, effect = CONST_ME_MAGIC_RED, target = false, duration = 6000}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 100},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType.onThink = function(monster, interval)
end

mType.onAppear = function(monster, creature)
	if monster:getType():isRewardBoss() then
		monster:setReward(true)
	end
end

mType.onDisappear = function(monster, creature)
end

mType.onMove = function(monster, creature, fromPosition, toPosition)
end

mType.onSay = function(monster, creature, type, message)
end

mType:register(monster)
