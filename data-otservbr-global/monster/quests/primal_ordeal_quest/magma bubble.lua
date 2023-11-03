local mType = Game.createMonsterType("Magma Bubble")
local monster = {}

monster.description = "a Magma Bubble"
monster.experience = 15000000
monster.outfit = {
	lookType = 1413,
	lookHead = 0,
	lookBody = 38,
	lookLegs = 94,
	lookFeet = 82,
	lookAddons = 3,
	lookMount = 0
}

monster.level = {
min = 325,
max = 875
}

monster.health = 250000
monster.maxHealth = 250000
monster.race = "venom"
monster.corpse = 36847
monster.speed = 0
monster.summonCost = 0
monster.maxSummons = 3

monster.changeTarget = {
	interval = 4000,
	chance = 10
}

monster.events = {
	"Deadmonsters",
	"MagmaBubbleDeath"
}

monster.bosstiary = {
	bossRaceId = 2242,
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
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true,
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
	{name = "platinum coin", chance = 100000, maxCount = 5},
	{name = "silver token", chance = 100000, maxCount = 2},
	{name = "ultimate spirit potion", chance = 70370, maxCount = 20},
	{name = "ultimate mana potion", chance = 55560, maxCount = 14},
	{name = "supreme health potion", chance = 51850, maxCount = 14},
	{id = 3039, chance = 33600},
	{name = "blue gem", chance = 29630},
	{name = "yellow gem", chance = 29630},
	{name = "bullseye potion", chance = 25930, maxCount = 10},
	{name = "knight armor", chance = 22220},
	{name = "green gem", chance = 22220, maxCount = 2},
	{name = "mastermind potion", chance = 18520, maxCount = 10},
	{name = "lightning headband", chance = 18520},
	{name = "berserk potion", chance = 14810, maxCount = 10},
	{name = "crystal coin", chance = 14810},
	{name = "gold ingot", chance = 11110},
	{name = "huge chunk of crude iron", chance = 7410},
	{name = "haunted blade", chance = 7410},
	{name = "giant ruby", chance = 3700},
	{name = "violet gem", chance = 3700},
	{name = "giant sapphire", chance = 16800},
    {name = "Giant Amethyst", chance = 16800},
    {name = "Giant Emerald", chance = 16800},
    {name = "Giant Ruby", chance = 16800},
    {name = "Giant Topaz", chance = 16800},
    {name = "Hexagonal Ruby", chance = 16800},
    {name = "crystal coin", minCount = 0, maxCount = 30, chance = 50000},
	{name = "alicorn headguard", chance = 370},
	{name = "spiritthorn armor", chance = 370},
	{name = "alicorn quiver", chance = 370},
	{name = "alicorn ring", chance = 370},
	{name = "smoldering eye", chance = 370},
	{id = 39177, chance = 300},
	{name = "portable flame", chance = 370},
	{name = "spiritthorn helmet", chance = 370},
	{name = "firefighting axe", chance = 370},
	{name = "arcanomancer regalia", chance = 370},
	{name = "arcanomancer folio", chance = 370},
	{name = "arcanomancer sigil", chance = 370},
	{name = "arboreal ring", chance = 370},
	{name = "arboreal tome", chance = 370},
	{name = "arboreal crown", chance = 370},
	
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -275, maxDamage = -3750 },
	{ name = "combat", interval = 2000, chance = 75, type = COMBAT_FIREDAMAGE, minDamage = -525, maxDamage = -2650, radius = 3, range = 8, effect = CONST_ME_HITBYFIRE, target = true },
	{ name = "combat", interval = 3700, chance = 37, type = COMBAT_FIREDAMAGE, minDamage = -1700, maxDamage = -5750, length = 8, spread = 3, effect = CONST_ME_MAGIC_RED, target = false },
	{ name = "combat", interval = 3100, chance = 15, type = COMBAT_FIREDAMAGE, minDamage = -1000, maxDamage = -8000, range = 8, effect = CONST_ME_FIREAREA, shootEffect = CONST_ANI_FIRE, target = true },
}

monster.defenses = {
	defense = 25,
	armor = 78,
	mitigation = 2.0,
	{name ="combat", interval = 2000, chance = 50, minDamage = 150, maxDamage = 3550, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 20},
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
