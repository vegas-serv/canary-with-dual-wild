local mType = Game.createMonsterType("The Sandking")
local monster = {}

monster.description = "The Sandking"
monster.experience = 5000000
monster.outfit = {
	lookType = 1013,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.level = {
min = 350,
max = 550
}

monster.health = 150000
monster.maxHealth = 150000
monster.race = "venom"
monster.corpse = 25866
monster.speed = 625
monster.manaCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 30
}

monster.events = {
	"Deadmonsters"
}

monster.events = {
	"CultsOfTibiaBossDeath",
}

monster.bosstiary = {
	bossRaceId = 1444,
	bossRace = RARITY_ARCHFOE,
	storageCooldown = Storage.CultsOfTibia.Life.BossTimer
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
	canPushItems = false,
	canPushCreatures = false,
	staticAttackChance = 95,
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
	{text = "CREEEAK!", yell = false}
}

monster.loot = {
	{name = "small amethyst", chance = 21000, maxCount = 10},
	{name = "small emerald", chance = 19000, maxCount = 10},
	{id= 3039, chance = 12000}, -- red gem
	{name = "platinum coin", chance = 68299, maxCount = 30},
	{name = "gold coin", chance = 100000, maxCount = 200},
	{name = "small diamond", chance = 21000, maxCount = 10},
	{name = "green gem", chance = 12000},
	{name = "luminous orb", chance = 35000},
	{name = "great mana potion", chance = 31230, maxCount = 10},
	{name = "ultimate health potion", chance = 28230, maxCount = 10},
	{name = "cobra crown", chance = 400},
	{name = "silver token", chance = 2500},
	{name = "gold token", chance = 1532},
	{name = "small topaz", chance = 11520, maxCount = 10},
	{name = "blue gem", chance = 21892},
	{name = "yellow gem", chance = 29460},
	{name = "magic sulphur", chance = 18920},
	{id = 7440, chance = 2000}, -- mastermind potion
	{id = 20062, chance = 2000, maxCount = 2}, -- cluster of solace
	{name = "hailstorm rod", chance = 3470},
	{id = 3036, chance = 1000}, -- violet gem
	{id = 3098, chance = 20000}, -- ring of healing
	{id = 3030, chance = 7360, maxCount = 10}, -- small ruby
	{id = 281, chance = 28540}, -- giant shimmering pearl (green)
	{name = "skull staff", chance = 13790},
	{name = "grasshopper legs", chance = 13790},
	{name = "huge chunk of crude iron", chance = 10000, maxCount = 2},
	{id = 7404, chance = 3430}, -- assassin dagger
	{name = "runed sword", chance = 6666},
	{name = "djinn blade", chance = 200},
	{id = 16121, chance = 10000, maxCount = 3}, -- green crystal shard
	{id = 16120, chance = 10000, maxCount = 3}, -- violet crystal shard
	{id = 16119, chance = 10000, maxCount = 3}, -- blue crystal shard
	{id = 7642, chance = 4800}, -- great spirit potion
	{id = 16161, chance = 3030}, -- crystalline axe
	{id = 3341, chance = 1200}, -- arcane staff
	{name = "heart of the mountain", chance = 400},
	{name = "giant sapphire", chance = 16800},
    {name = "Giant Amethyst", chance = 16800},
    {name = "Giant Emerald", chance = 16800},
    {name = "Giant Ruby", chance = 16800},
    {name = "Giant Topaz", chance = 16800},
    {name = "Hexagonal Ruby", chance = 16800},
    {name = "crystal coin", minCount = 0, maxCount = 30, chance = 50000},
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -1500},
	{name ="combat", interval = 2000, chance = 14, type = COMBAT_HOLYDAMAGE, minDamage = -100, maxDamage = -1700, length = 8, spread = 3, effect = CONST_ME_MORTAREA, target = false},
	{name ="combat", interval = 2000, chance = 18, type = COMBAT_PHYSICALDAMAGE, minDamage = -300, maxDamage = -1700, radius = 4, effect = CONST_ME_EXPLOSIONAREA, target = false},
	{name ="combat", interval = 2000, chance = 14, type = COMBAT_FIREDAMAGE, minDamage = -300, maxDamage = -1840, length = 8, spread = 3, effect = CONST_ME_HITBYFIRE, target = false},
	{name ="combat", interval = 2000, chance = 14, type = COMBAT_HOLYDAMAGE, minDamage = -300, maxDamage = -1700, length = 8, spread = 3, effect = CONST_ME_HOLYAREA, target = false},
	{name ="combat", interval = 2000, chance = 29, type = COMBAT_ICEDAMAGE, minDamage = -300, maxDamage = -1840, range = 7, radius = 4, effect = CONST_ME_FIREAREA, target = true}
}

monster.defenses = {
	defense = 30,
	armor = 30
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
