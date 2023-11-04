local mType = Game.createMonsterType("Alptramun")
local monster = {}

monster.description = "Alptramun"
monster.experience = 15500000
monster.outfit = {
	lookType = 1143,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.level = {
min = 550,
max = 950
}

monster.health = 300000
monster.maxHealth = 300000
monster.race = "blood"
monster.corpse = 30155
monster.speed = 425
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10
}

monster.events = {
	"Deadmonsters"
}

monster.bosstiary = {
	bossRaceId = 1698, -- or 1715 need test
	bossRace = RARITY_NEMESIS
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
}

monster.loot = {
	{name = "silver token", chance = 100000, maxCount = 5},
	{name = "skull staff", chance = 10000, maxCount = 5},
	{name = "energy bar", chance = 10000, maxCount = 5},
	{name = "purple tendril lantern", chance = 10000},
	{name = "crystal coin", chance = 100000, maxCount = 2},
	{name = "blue gem", chance = 1000},
	{name = "platinum coin", chance = 29580, maxCount = 5},
	{name = "supreme health potion", chance = 21540, maxCount = 20},
	{name = "ultimate spirit potion", chance = 22540, maxCount = 20},
	{name = "royal star", chance = 26540, maxCount = 100},
	{id = 281, chance = 28540}, -- giant shimmering pearl (green)
	{name = "gold token", chance = 15000, maxCount = 2},
	{name = "berserk potion", chance = 8050, maxCount = 10},
	{name = "bullseye potion", chance = 6780, maxCount = 10},
	{id = 23542, chance = 23520}, -- collar of blue plasma
	{id = 23544, chance = 10590}, -- collar of red plasma
	{name = "gold ingot", chance = 7630},
	{name = "huge chunk of crude iron", chance = 8900},
	{name = "mysterious remains", chance = 90000},
	{name = "piggy bank", chance = 13770, maxCount = 4},
	{name = "green gem", chance = 2740},
	{id= 3039, chance = 2580}, -- red gem
	{name = "crunor idol", chance = 2640},
	{name = "giant ruby", chance = 2840},
	{name = "magic sulphur", chance = 2740},
	{name = "yellow gem", chance = 2900},
	{name = "mastermind potion", chance = 2900, maxCount = 10},
	{name = "violet gem", chance = 1500},
	{name = "alptramun's toothbrush", chance = 520},
	{name = "dream shroud", chance = 620},
	{name = "pair of dreamwalkers", chance = 720},
	{name = "soul stone", chance = 820},
	{id = 23529, chance = 10590}, -- ring of blue plasma
	{name = "pomegranate", chance = 880},
	{name = "dream shroud", chance = 980},
	{name = "giant sapphire", chance = 16800},
    {name = "Giant Amethyst", chance = 16800},
    {name = "Giant Emerald", chance = 16800},
    {name = "Giant Ruby", chance = 16800},
    {name = "Giant Topaz", chance = 16800},
    {name = "Hexagonal Ruby", chance = 16800},
    {name = "crystal coin", minCount = 0, maxCount = 30, chance = 50000},
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -1000},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_DEATHDAMAGE, minDamage = -190, maxDamage = -2300, range = 7, length = 6, spread = 3, shootEffect = CONST_ANI_POISON, target = false},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_DEATHDAMAGE, minDamage = -70, maxDamage = -3160, range = 3, length = 6, spread = 3, effect = CONST_ME_MORTAREA, target = false},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_FIREDAMAGE, minDamage = -90, maxDamage = -2160, range = 3, length = 6, spread = 3, effect = CONST_ME_HITBYFIRE, target = false},
	{name ="stone shower rune", interval = 2000, chance = 10, minDamage = -230, maxDamage = -1450, range = 7, target = false}
}

monster.defenses = {
	defense = 20,
	armor = 20
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
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.heals = {
	{type = COMBAT_DEATHDAMAGE , percent = 100}
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
