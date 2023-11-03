local mType = Game.createMonsterType("Gorzindel")
local monster = {}

monster.description = "Gorzindel"
monster.experience = 3000000
monster.outfit = {
	lookType = 1062,
	lookHead = 94,
	lookBody = 81,
	lookLegs = 10,
	lookFeet = 0,
	lookAddons = 1,
	lookMount = 0
}

monster.level = {
min = 255,
max = 455
}

monster.health = 200000
monster.maxHealth = 200000
monster.race = "blood"
monster.corpse = 22495
monster.speed = 515
monster.manaCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 4
}

monster.events = {
	"Deadmonsters"
}

monster.bosstiary = {
	bossRaceId = 1591,
	bossRace = RARITY_ARCHFOE
}

monster.strategiesTarget = {
	nearest = 100,
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
	{text = "THE STOLEN POWERS HEAL GORZINDEL!", yell = false},
	{text = "GORZINDEL USES THE POWERS OF STOLEN SPELLS!", yell = false},
	{text = "GORZINDEL UNLEASHES THE STOLEN POWERS OF DEATH!", yell = false}
}

monster.loot = {
	{name = "platinum coin", chance = 90000},
	{name = "crystal coin", chance = 90000, maxCount = 8},
	{name = "small amethyst", chance = 90000, maxCount = 12},
	{name = "small diamond", chance = 90000, maxCount = 12},
	{name = "small emerald", chance = 90000, maxCount = 12},
	{name = "small ruby", chance = 90000, maxCount = 12},
	{name = "small topaz", chance = 90000, maxCount = 12},
	{name = "onyx chip", chance = 90000, maxCount = 12},
	{name = "great spirit potion", chance = 90000, maxCount = 8},
	{name = "supreme health potion", chance = 90000, maxCount = 12},
	{name = "ultimate health potion", chance = 90000, maxCount = 18},
	{name = "ultimate mana potion", chance = 90000, maxCount = 8},
	{name = "ultimate spirit potion", chance = 90000, maxCount = 12},
	{name = "berserk potion", chance = 90000, maxCount = 2},
	{name = "bullseye potion", chance = 90000, maxCount = 2},
	{name = "mastermind potion", chance = 90000, maxCount = 2},
	{name = "chaos mace", chance = 30000},
	{name = "crown armor", chance = 30000},
	{name = "curious matter", chance = 30000},
	{name = "demon horn", chance = 30000},
	{name = "dreaded cleaver", chance = 30000},
	{id = 281, chance = 30000}, -- giant shimmering pearl (green)
	{name = "gold token", chance = 1000, maxCount = 6},
	{name = "green gem", chance = 1000},
	{name = "knowledgeable book", chance = 1000},
	{name = "ominous book", chance = 1000},
	{name = "magic sulphur", chance = 1000, maxCount = 2},
	{name = "muck rod", chance = 1000},
	{id= 3039, chance = 1000}, -- red gem
	{id = 8906, chance = 1000}, -- heavily rusted helmet
	{id = 8900, chance = 1000}, -- heavily rusted shield
	{name = "silver Token", chance = 1000, maxCount = 6},
	{name = "sinister book", chance = 1000},
	{name = "spellbook of warding", chance = 1000},
	{name = "steel boots", chance = 1000},
	{name = "stone skin amulet", chance = 1000},
	{name = "wand of cosmic Energy", chance = 1000},
	{name = "yellow gem", chance = 1000},
	{name = "giant sapphire", chance = 16800},
    {name = "Giant Amethyst", chance = 16800},
    {name = "Giant Emerald", chance = 16800},
    {name = "Giant Ruby", chance = 16800},
    {name = "Giant Topaz", chance = 16800},
    {name = "Hexagonal Ruby", chance = 16800},
    {name = "crystal coin", minCount = 0, maxCount = 30, chance = 50000},
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -2000, condition = {type = CONDITION_POISON, totalDamage = 870, interval = 4000}},
	{name ="combat", interval = 2200, chance = 19, type = COMBAT_FIREDAMAGE, minDamage = 0, maxDamage = -1000, range = 7, radius = 7, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true},
	{name ="combat", interval = 3000, chance = 32, type = COMBAT_MANADRAIN, minDamage = -200, maxDamage = -800, range = 7, radius = 7, effect = CONST_ME_MORTAREA, target = true},
	{name ="combat", interval = 1300, chance = 27, type = COMBAT_EARTHDAMAGE, minDamage = 0, maxDamage = -600, radius = 3, effect = CONST_ME_EXPLOSIONAREA, target = false},
	{name ="combat", interval = 1200, chance = 6, type = COMBAT_DEATHDAMAGE, minDamage = -300, maxDamage = -2900, length = 8, spread = 3, effect = CONST_ME_MORTAREA, target = false},
	{name ="combat", interval = 1000, chance = 5, type = COMBAT_FIREDAMAGE, minDamage = -500, maxDamage = -1000, length = 8, spread = 3, effect = CONST_ME_HITBYFIRE, target = false},
	{name ="combat", interval = 1000, chance = 5, type = COMBAT_ICEDAMAGE, minDamage = -1000, maxDamage = -5000, length = 8, spread = 3, effect = CONST_ME_ICEAREA, target = false},
	{name ="combat", interval = 4000, chance = 10, type = COMBAT_LIFEDRAIN, minDamage = -500, maxDamage = -1000, length = 8, spread = 3, effect = CONST_ME_WATERSPLASH, target = false},
	{name ="speed", interval = 1900, chance = 14, speedChange = -700, range = 7, radius = 1, target = true, duration = 15000}
}

monster.defenses = {
	defense = 33,
	armor = 28
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 1},
	{type = COMBAT_ENERGYDAMAGE, percent = 10},
	{type = COMBAT_EARTHDAMAGE, percent = 20},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 10},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 15}
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
