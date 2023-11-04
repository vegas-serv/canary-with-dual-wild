local mType = Game.createMonsterType("Goshnar's Malice")
local monster = {}

monster.description = "Goshnar's Malice"
monster.experience = 12000000
monster.outfit = {
	lookType = 1306,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.level = {
min = 725,
max = 1575
}

monster.health = 3000000
monster.maxHealth = 3000000
monster.race = "undead"
monster.corpse = 33871
monster.speed = 550
monster.manaCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 10
}

monster.bosstiary = {
	bossRaceId = 1901,
	bossRace = RARITY_ARCHFOE,
	storageCooldown = Storage.Quest.U12_40.SoulWar.GoshnarMaliceTimer
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
		{name = "malicious soul", chance = 30, interval = 1000, count = 2}
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
	{name = "malice's spine", chance = 2000, maxCount = 1},
	{name = "malice's horn", chance = 2000, maxCount = 1},
	{name = "bracelet of strengthening", chance = 400},
	{name = "spectral horseshoe", chance = 400},
	{name = "the skull of a beast", chance = 400},
	{name = "figurine of malice", chance = 400},
	{name = "bag you desire", chance = 100},
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -5000},
	{name ="combat", interval = 2000, chance = 22, type = COMBAT_ICEDAMAGE, minDamage = -450, maxDamage = -11400, length = 10, spread = 4, effect = CONST_ME_ICEAREA, target = false},
	{name ="combat", interval = 2000, chance = 30, type = COMBAT_ICEDAMAGE, minDamage = -350, maxDamage = -5000, range = 7, radius = 4, shootEffect = CONST_ANI_ICE, effect = CONST_ME_ICEAREA, target = true},
	{name ="combat", interval = 2000, chance = 14, type = COMBAT_HOLYDAMAGE, minDamage = -100, maxDamage = -8700, length = 8, spread = 3, effect = CONST_ME_MORTAREA, target = false},
	{name ="combat", interval = 2000, chance = 18, type = COMBAT_PHYSICALDAMAGE, minDamage = -300, maxDamage = -2700, radius = 4, effect = CONST_ME_EXPLOSIONAREA, target = false},
	{name ="combat", interval = 2000, chance = 14, type = COMBAT_FIREDAMAGE, minDamage = -300, maxDamage = -1840, length = 8, spread = 3, effect = CONST_ME_HITBYFIRE, target = false},
	{name ="combat", interval = 2000, chance = 14, type = COMBAT_HOLYDAMAGE, minDamage = -300, maxDamage = -8700, length = 8, spread = 3, effect = CONST_ME_HOLYAREA, target = false},
	{name ="combat", interval = 2000, chance = 29, type = COMBAT_ICEDAMAGE, minDamage = -300, maxDamage = -5840, range = 7, radius = 4, effect = CONST_ME_FIREAREA, target = true}

}

monster.defenses = {
	defense = 160,
	armor = 160,
	mitigation = 5.40,
	{name ="speed", interval = 1000, chance = 20, speedChange = 900, effect = CONST_ME_MAGIC_RED, target = false, duration = 10000},
	{name ="combat", interval = 2000, chance = 25, type = COMBAT_HEALING, minDamage = 1250, maxDamage = 3250, effect = CONST_ME_MAGIC_BLUE, target = false},
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
