local mType = Game.createMonsterType("Goshnar's Megalomania")
local monster = {}

monster.description = "Goshnar's Megalomania"
monster.experience = 20000000
monster.outfit = {
	lookType = 1308,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.level = {
min = 925,
max = 1775
}

monster.health = 5000000
monster.maxHealth = 5000000
monster.race = "undead"
monster.corpse = 33889
monster.speed = 665

monster.changeTarget = {
	interval = 2000,
	chance = 10
}

monster.bosstiary = {
	bossRaceId = 1969,
	bossRace = RARITY_NEMESIS,
	storageCooldown = Storage.Quest.U12_40.SoulWar.GoshnarMegalomaniaTimer
}

monster.events = {
	"Deadmonsters"
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
	staticAttackChance = 95,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true,
	pet = false
}

monster.light = {
	level = 0,
	color = 0,
}

monster.summon = {
	maxSummons = 4,
	summons = {
		{name = "dreadful harvester", chance = 40, interval = 1000, count = 2},
		{name = "aspect of power", chance = 50, interval = 1000, count = 2}
	}
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
	{name = "crystal coin", chance = 55000, minCount = 70, maxCount = 75},
	{id = 281, chance = 1150}, -- giant shimmering pearl (green)
	{name = "giant sapphire", chance = 10000, maxCount = 1},
	{name = "giant topaz", chance = 10000, maxCount = 1},
	{name = "violet gem", chance = 6000, maxCount = 1},
	{name = "blue gem", chance = 10000, maxCount = 3},
	{id= 3039, chance = 10000, maxCount = 3}, -- red gem
	{name = "green gem", chance = 10000, maxCount = 3},
	{name = "yellow gem", chance = 10000, maxCount = 3},
	{name = "white gem", chance = 6000, maxCount = 3},
	{name = "dragon figurine", chance = 10000, maxCount = 1},
	{name = "bullseye potion", chance = 15000, minCount = 10, maxCount = 25},
	{name = "mastermind potion", chance = 15000, minCount = 10, maxCount = 25},
	{name = "berserk potion", chance = 15000, minCount = 10, maxCount = 25},
	{name = "ultimate mana potion", chance = 18000, minCount = 50, maxCount = 100},
	{name = "supreme health potion", chance = 18000, minCount = 50, maxCount = 100},
	{name = "ultimate spirit potion", chance = 18000, minCount = 50, maxCount = 100},
	{name = "figurine of malice", chance = 400},
	{name = "figurine of cruelty", chance = 400},
	{name = "figurine of hatred", chance = 400},
	{name = "figurine of greed", chance = 400},
	{name = "figurine of spite", chance = 400},
	{name = "figurine of megalomania", chance = 400},
	{name = "megalomania's skull", chance = 400},
	{name = "megalomania's essence", chance = 400},
	{name = "bag you desire", chance = 100}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -8000},
	{name ="combat", interval = 2000, chance = 30, type = COMBAT_PHYSICALDAMAGE, minDamage = -950, maxDamage = -5400, range = 7, radius = 3, shootEffect = CONST_ANI_DEATH, effect = CONST_ME_MORTAREA, target = true},
	{name ="combat", interval = 2000, chance = 10, type = COMBAT_DEATHDAMAGE, minDamage = -1000, maxDamage = -5500, length = 8, spread = 3, effect = CONST_ME_INSECTS, target = false},
	{name ="singlecloudchain", interval = 6000, chance = 40, minDamage = -1300, maxDamage = -12500, range = 6, effect = CONST_ME_ENERGYHIT, target = true},
	{name ="combat", interval = 2000, chance = 10, type = COMBAT_DEATHDAMAGE, minDamage = -1300, maxDamage = -2200, length = 10, spread = 0, effect = CONST_ME_BLUE_GHOST, target = false},
	{name ="combat", interval = 2000, chance = 14, type = COMBAT_HOLYDAMAGE, minDamage = -100, maxDamage = -15700, length = 8, spread = 3, effect = CONST_ME_MORTAREA, target = false},
	{name ="combat", interval = 2000, chance = 18, type = COMBAT_PHYSICALDAMAGE, minDamage = -300, maxDamage = -14700, radius = 4, effect = CONST_ME_EXPLOSIONAREA, target = false},
	{name ="combat", interval = 2000, chance = 14, type = COMBAT_FIREDAMAGE, minDamage = -300, maxDamage = -15840, length = 8, spread = 3, effect = CONST_ME_HITBYFIRE, target = false},
	{name ="combat", interval = 2000, chance = 14, type = COMBAT_HOLYDAMAGE, minDamage = -300, maxDamage = -15700, length = 8, spread = 3, effect = CONST_ME_HOLYAREA, target = false},
	{name ="combat", interval = 2000, chance = 29, type = COMBAT_ICEDAMAGE, minDamage = -300, maxDamage = -15840, range = 7, radius = 4, effect = CONST_ME_FIREAREA, target = true}

}

monster.defenses = {
	defense = 160,
	armor = 160,
	mitigation = 8.40,
	{name ="speed", interval = 1000, chance = 20, speedChange = 900, effect = CONST_ME_MAGIC_RED, target = false, duration = 10000},
	{name ="combat", interval = 2000, chance = 25, type = COMBAT_HEALING, minDamage = 2250, maxDamage = 4250, effect = CONST_ME_MAGIC_BLUE, target = false},
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
	{type = COMBAT_DEATHDAMAGE , percent = 0},
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
