local mType = Game.createMonsterType("Chayenne")
local monster = {}

monster.description = "Chayenne"
monster.experience = 55000000
monster.outfit = {
	lookType = 155,
	lookHead = 78,
	lookBody = 0,
	lookLegs = 105,
	lookFeet = 99,
	lookAddons = 0,
	lookMount = 0
}

monster.level = {
min = 525,
max = 975
}

monster.health = 12000000
monster.maxHealth = 12000000
monster.race = "blood"
monster.corpse = 6081
monster.speed = 450
monster.manaCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 10
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
	{text = "We don't stop playing because we grow old, we grow old because we stop playing.", yell = false},
	{text = "Oooh dang, he's hot *-*", yell = false},
	{text = "Oh came on, take it easy.", yell = false},
	{text = "Work hard, play harder!", yell = false},
	{text = "They are doing WHAT with my quest?!", yell = false}
}

monster.loot = {
	{id = 6571, chance = 100000, maxCount = 2}, -- surprise bag
	{id = 281, chance = 100000}, -- giant shimmering pearl (green)
	{id = 14681, chance = 100000}, -- anniversary cake
	{id = 14682, chance = 100000, unique = true}, -- chayenne's magical key
	{id = 3076, chance = 22500, maxCount = 3}, -- gold token
    {id = 3076, chance = 22500, maxCount = 3}, -- silver token
    {id = 19082, chance = 12500, maxCount = 2}, -- tornament token
    {id = 3043, chance = 12500, maxCount = 30}, -- crystal coin
    {id = 8153, chance = 5500, maxCount = 1}, -- boost exp 50%
    {id = 37110, chance = 7500, maxCount = 2}, -- exalted core
    {id = 32622, chance = 42500, maxCount = 1}, -- giant ameth
    {id = 16129, chance = 42500, maxCount = 3}, -- major
    {id = 9586, chance = 7500, maxCount = 1}, -- surprese box
    {id = 9145, chance = 4500, maxCount = 1}, -- mount doll
    {id = 28895, chance = 4500, maxCount = 1}, -- addon doll
    {id = 28887, chance = 4500, maxCount = 1}, -- vip days
    {id = 12905, chance = 4500, maxCount = 1}, -- stamina
    {id = 10227, chance = 4500, maxCount = 1} -- remover skull
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -2625},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_DEATHDAMAGE, minDamage = -260, maxDamage = -4310, radius = 6, effect = CONST_ME_MORTAREA, target = false},
	{name ="combat", interval = 2000, chance = 10, type = COMBAT_MANADRAIN, minDamage = -50, maxDamage = -210, length = 8, spread = 3, effect = CONST_ME_BLOCKHIT, target = false},
	{name ="combat", interval = 2000, chance = 10, type = COMBAT_FIREDAMAGE, minDamage = -200, maxDamage = -2300, length = 8, spread = 3, effect = CONST_ME_EXPLOSIONAREA, target = false},
	{name ="combat", interval = 2000, chance = 5, type = COMBAT_DEATHDAMAGE, minDamage = -300, maxDamage = -3800, length = 8, spread = 3, target = false},
	{name ="combat", interval = 3000, chance = 18, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -1150, radius = 5, effect = CONST_ME_GROUNDSHAKER, target = true},
	{name ="fury skill reducer", interval = 2000, chance = 5, target = false}
}

monster.defenses = {
	defense = 20,
	armor = 15,
	{name ="combat", interval = 1000, chance = 1, type = COMBAT_HEALING, minDamage = 0, maxDamage = 10000, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="combat", interval = 3500, chance = 30, type = COMBAT_HEALING, minDamage = 1000, maxDamage = 1000, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="outfit", interval = 2000, chance = 10, effect = CONST_ME_ENERGYHIT, target = false, duration = 10000, outfitMonster = "Devovorga"},
	{name ="outfit", interval = 2000, chance = 10, effect = CONST_ME_ENERGYHIT, target = false, duration = 10000, outfitMonster = "Chayenne"}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 20},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 20},
	{type = COMBAT_HOLYDAMAGE , percent = 10},
	{type = COMBAT_DEATHDAMAGE , percent = 30}
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
