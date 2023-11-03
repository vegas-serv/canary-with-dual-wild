local mType = Game.createMonsterType("Brain Head")
local monster = {}

monster.description = "Brain Head"
monster.experience = 15135000
monster.outfit = {
	lookTypeEx = 32572,
}

monster.level = {
min = 425,
max = 875
}

monster.health = 2300000
monster.maxHealth = 2300000
monster.race = "undead"
monster.corpse = 32272
monster.speed = 0
monster.manaCost = 0
monster.maxSummons = 0

monster.events = {
	"Deadmonsters"
}

monster.changeTarget = {
	interval = 5000,
	chance = 8
}

monster.bosstiary = {
	bossRaceId = 1862,
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

monster.loot = {
	{name = "crystal coin", chance = 62500, maxCount = 2},
	{name = "white gem", chance = 45833, maxCount = 2},
	{name = "supreme health potion", chance = 41667, maxCount = 6},
	{name = "diamond", chance = 33333},
	{name = "berserk potion", chance = 12500, maxCount = 3},
	{name = "bullseye potion", chance = 12500, maxCount = 3},
	{name = "death toll", chance = 8500},
	{name = "mastermind potion", chance = 12500, maxCount = 3},
	{name = "moonstone", chance = 9500},
	{name = "ultimate mana potion", chance = 12500, maxCount = 6},
	{name = "ultimate spirit potion", chance = 12500, maxCount = 6},
	{name = "cursed bone", chance = 4333},
	{name = "ivory comb", chance = 4333},
	{name = "angel figurine", chance = 3167},
	{name = "giant amethyst", chance = 2167},
	{name = "giant topaz", chance = 2167},
	{name = "brain head's giant neuron", chance = 1000},
	{name = "brain head's left hemisphere", chance = 1000},
	{name = "brain head's right hemisphere", chance = 1000},
	{name = "ghost claw", chance = 145},
	{name = "phantasmal axe", chance = 150},
	{name = "giant sapphire", chance = 16800},
    {name = "Giant Amethyst", chance = 16800},
    {name = "Giant Emerald", chance = 16800},
    {name = "Giant Ruby", chance = 16800},
    {name = "Giant Topaz", chance = 16800},
    {name = "Hexagonal Ruby", chance = 16800},
    {name = "crystal coin", minCount = 0, maxCount = 30, chance = 50000},
	
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -200, maxDamage = -2500},
	{name ="Energy Wave", interval = 2000, chance = 20, minDamage = -500, maxDamage = -1680, target = false},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_EARTHDAMAGE, minDamage = 0, maxDamage = -2000, radius = 5, effect = CONST_ME_SMALLPLANTS, target = false},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_FIREDAMAGE, minDamage = -600, maxDamage = -2750, radius = 5, range = 7, effect = CONST_ME_FIREAREA, shootEffect = CONST_ANI_FIRE, target = true},
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 30},
	{type = COMBAT_ENERGYDAMAGE, percent = -50},
	{type = COMBAT_EARTHDAMAGE, percent = 40},
	{type = COMBAT_FIREDAMAGE, percent = -50},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -10},
	{type = COMBAT_HOLYDAMAGE , percent = 15},
	{type = COMBAT_DEATHDAMAGE , percent = 30}
}

monster.immunities = {
	{type = "paralyze", condition = false},
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
