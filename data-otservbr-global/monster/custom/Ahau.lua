local mType = Game.createMonsterType("Ahau")
local monster = {}

monster.description = "Ahau"
monster.experience = 6500000
monster.outfit = {
	lookType = 1591,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.level = {
min = 732,
max = 944
}

monster.health = 2900000
monster.maxHealth = 2900000
monster.race = "venom"
monster.corpse = 42069
monster.speed = 570
monster.manaCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 8
}

monster.events = {
	"Deadmonsters",
	"ahauOnKillEvent",
	"killahauOutfit"
}

monster.bosstiary = {
	bossRaceId = 2346,
	bossRace = RARITY_ARCHFOE,
	storageCooldown = Storage.FerumbrasAscension.AhauTimer
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
	runHealth = 1,
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
	{text = "YOUR FUTILE ATTACKS ONLY FEED MY RAGE!", yell = false},
	{text = "YOU-ARE-WEAK!!", yell = false},
	{text = "DEEESTRUCTIOOON!!", yell = false}
}

monster.loot = {
	{name = "crystal coin", chance = 70540},
	{name = "platinum coin", chance = 90540, maxCount = 132},
	{name = "ultimate health potion", chance = 32220, maxCount = 7},
	{name = "violet gem", chance = 74560},
	{name = "green gem", chance = 64560},
	{name = "blue gem", chance = 54560},
	{name = "northwind rod", chance = 11920},
	{name = "sacred tree amulet", chance = 21920},
	{id = 33933, chance = 10920}, -- apron
	{name = "glacier shoes", chance = 12920},
	{name = "glacier robe", chance = 22920},
	{name = "stone skin amulet", chance = 8920},
	{id = 23533, chance = 28920}, -- ring of red plasma
	{id = 33932, chance = 5920}, -- head
	{name = "glacial rod", chance = 3920},
	{id = 34024, chance = 450}, -- gruesome fan
	{name = "giant sapphire", chance = 6800},
    {name = "Giant Amethyst", chance = 6800},
    {name = "Giant Emerald", chance = 6800},
    {name = "Giant Ruby", chance = 6800},
    {name = "Giant Topaz", chance = 6800},
    {name = "Hexagonal Ruby", chance = 6800},
	{id = 3076, chance = 22500, maxCount = 3}, -- gold token
    {id = 3076, chance = 22500, maxCount = 3} -- silver token
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -1000, maxDamage = -5000},
	{name ="combat", interval = 3000, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = -500, maxDamage = -3000, length = 10, spread = 3, effect = CONST_ME_HITBYFIRE, target = false},
	{name ="speed", interval = 2000, chance = 25, speedChange = -600, radius = 7, effect = CONST_ME_GREEN_RINGS, target = false, duration = 15000},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_DEATHDAMAGE, minDamage = -500, maxDamage = -2700, radius = 7, effect = CONST_ME_LOSEENERGY, target = false},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_FIREDAMAGE, minDamage = -300, maxDamage = -2700, radius = 5, effect = CONST_ME_EXPLOSIONHIT, target = false},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_DEATHDAMAGE, minDamage = -1500, maxDamage = -8800, length = 12, spread = 3, effect = CONST_ME_MORTAREA, target = false},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = -500, maxDamage = -2800, length = 10, spread = 3, effect = CONST_ME_HITBYFIRE, target = false},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_ENERGYDAMAGE, minDamage = -500, maxDamage = -2800, length = 10, spread = 3, effect = CONST_ME_ENERGYHIT, target = false}
}

monster.defenses = {
	defense = 145,
	armor = 188,
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 1000, maxDamage = 3000, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="speed", interval = 2000, chance = 8, speedChange = 880, effect = CONST_ME_MAGIC_RED, target = false, duration = 6000}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 10},
	{type = COMBAT_ENERGYDAMAGE, percent = 10},
	{type = COMBAT_EARTHDAMAGE, percent = 10},
	{type = COMBAT_FIREDAMAGE, percent = 10},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 10},
	{type = COMBAT_HOLYDAMAGE , percent = 10},
	{type = COMBAT_DEATHDAMAGE , percent = 10}
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