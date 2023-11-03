local mType = Game.createMonsterType("The Brainstealer")
local monster = {}

monster.description = "The Brainstealer"
monster.experience = 31160000
monster.outfit = {
	lookType = 1412,
}

monster.events = {
	"Deadmonsters"
}

monster.level = {
min = 725,
max = 1475
}

monster.health = 2380000
monster.maxHealth = 2380000
monster.race = "blood"
monster.corpse = 36843
monster.speed = 880
monster.manaCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 5000,
	chance = 8
}

monster.bosstiary = {
	bossRaceId = 2055,
	bossRace = RARITY_ARCHFOE,
	storageCooldown = Storage.Quest.U12_70.TooHotToHandle.BrainstealerTimer,
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
	canWalkOnPoison = false,
	pet = false
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.summon = {
	maxSummons = 2,
	summons = {
		{name = "brain parasite", chance = 20, interval = 4000, count = 1},
	}
}

monster.loot = {
	{name = "crystal coin", chance = 96429, maxCount = 2},
	{name = "moonstone", chance = 24888, maxCount = 2},
	{name = "white gem", chance = 25888, maxCount = 2},
	{name = "ultimate mana potion", chance = 42857, maxCount = 6},
	{name = "silver hand mirror", chance = 14786},
	{name = "supreme health potion", chance = 26786, maxCount = 6},
	{name = "ultimate spirit potion", chance = 26786, maxCount = 6},
	{name = "berserk potion", chance = 25000, maxCount = 3},
	{name = "bullseye potion", chance = 19643, maxCount = 3},
	{name = "mastermind potion", chance = 19643, maxCount = 3},
	{name = "ivory comb", chance = 11286},
	{name = "death toll", chance = 9500, maxCount = 2},
	{name = "angel figurine", chance = 8714},
	{name = "diamond", chance = 9714},
	{name = "cursed bone", chance = 6929},
	{name = "soulforged lantern", chance = 5143},
	{name = "amber", chance = 3357},
	{name = "grimace", chance = 3357},
	{name = "amber with a dragonfly", chance = 2571, maxCount = 2},
	{name = "giant sapphire", chance = 16800},
    {name = "Giant Amethyst", chance = 16800},
    {name = "Giant Emerald", chance = 16800},
    {name = "Giant Ruby", chance = 16800},
    {name = "Giant Topaz", chance = 16800},
    {name = "Hexagonal Ruby", chance = 16800},
    {name = "crystal coin", minCount = 0, maxCount = 30, chance = 50000},
	{name = "Brainstealer's tissue", chance = 8357},
	{name = "Brainstealer's brainwave", chance = 8357},
	{name = "Brainstealer's brain", chance = 8357},
	{name = "gilded eldritch claymore", chance = 357},
	{name = "gilded eldritch wand", chance = 357},
	{name = "gilded eldritch rod", chance = 357},
	{name = "gilded eldritch greataxe", chance = 357},
	{name = "gilded eldritch bow", chance = 357},
	{name = "gilded eldritch warmace", chance = 357},
	{name = "eldritch warmace", chance = 357},
	{name = "eldritch wand", chance = 357},
	{name = "eldritch tome", chance = 357},
	{name = "eldritch shield", chance = 357},
	{name = "eldritch rod", chance = 357},
	{name = "eldritch greataxe", chance = 357},
	{name = "eldritch cowl", chance = 357},
	{name = "eldritch breeches", chance = 357},
	{name = "eldritch cuirass", chance = 357},
	{name = "eldritch quiver", chance = 357},
	{name = "eldritch hood", chance = 357},
	{name = "eldritch folio", chance = 357},
	{name = "eldritch bow", chance = 357},
	{name = "eldritch crystal", chance = 1357},
	{name = "eldritch claymore", chance = 357},
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 1230, attack = 410},
	{name ="combat", interval = 1000, chance = 8, type = COMBAT_DEATHDAMAGE, minDamage = -800, maxDamage = -8900, radius = 9, effect = CONST_ME_MORTAREA, target = false},
	{name ="speed", interval = 1000, chance = 12, speedChange = -850, radius = 6, effect = CONST_ME_POISONAREA, target = false, duration = 60000},
	{name ="strength", interval = 1000, chance = 10, minDamage = -600, maxDamage = -1450, radius = 5, effect = CONST_ME_HITAREA, target = false},
	{name ="combat", interval = 3000, chance = 13, type = COMBAT_FIREDAMAGE, minDamage = -300, maxDamage = -5800, range = 7, radius = 7, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true},
	{name ="combat", interval = 3000, chance = 8, type = COMBAT_MANADRAIN, minDamage = -600, maxDamage = -2700, radius = 10, effect = CONST_ME_ENERGYAREA, target = false},
	{name ="combat", interval = 2000, chance = 9, type = COMBAT_ENERGYDAMAGE, minDamage = -400, maxDamage = -5800, length = 8, spread = 3, effect = CONST_ME_MAGIC_RED, target = false},
	-- poison
	{name ="condition", type = CONDITION_POISON, interval = 5000, chance = 18, minDamage = -800, maxDamage = -1000, effect = CONST_ME_HITBYPOISON, target = false},
	{name ="combat", interval = 2000, chance = 6, type = COMBAT_LIFEDRAIN, minDamage = -600, maxDamage = -1200, radius = 14, effect = CONST_ME_MAGIC_GREEN, target = false}
}

monster.defenses = {
	defense = 78,
	armor = 78,
	mitigation = 3.27,
	{ name = "combat", type = COMBAT_HEALING, chance = 15, interval = 2000, minDamage = 1450, maxDamage = 5350, effect = CONST_ME_MAGIC_BLUE },
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 10},
	{type = COMBAT_ENERGYDAMAGE, percent = -15},
	{type = COMBAT_EARTHDAMAGE, percent = 30},
	{type = COMBAT_FIREDAMAGE, percent = 25},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 100},
	{type = COMBAT_DROWNDAMAGE, percent = 100},
	{type = COMBAT_ICEDAMAGE, percent = 35},
	{type = COMBAT_HOLYDAMAGE , percent = -15},
	{type = COMBAT_DEATHDAMAGE , percent = -20}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType.onAppear = function(monster, creature)
	if monster:getType():isRewardBoss() then
		monster:setReward(true)
	end
end

mType:register(monster)
