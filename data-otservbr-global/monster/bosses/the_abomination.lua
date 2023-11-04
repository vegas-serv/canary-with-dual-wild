local mType = Game.createMonsterType("The Abomination")
local monster = {}

monster.description = "the Abomination"
monster.experience = 12500000
monster.outfit = {
	lookType = 1393,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.level = {
min = 425,
max = 545
}

monster.health = 1380500
monster.maxHealth = 1380500
monster.race = "venom"
monster.corpse = 36612
monster.speed = 570
monster.manaCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 8
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
	{text = "Blubb", yell = false}
}

monster.loot = {
	{id = 20062, chance = 100000}, -- cluster of solace
	{id = 3031, chance = 100000, maxCount = 197}, -- gold coin
	{id = 3035, chance = 100000, maxCount = 50}, -- platinum coin
	{id = 5954, chance = 100000}, -- demon horn
	{id = 20264, chance = 60000}, -- unrealized dream
	{id = 6499, chance = 60000}, -- demonic essence
	{id = 281, chance = 40000}, -- giant shimmering pearl (green)
	{id = 16120, chance = 40000, maxCount = 8}, -- violet crystal shard
	{id = 238, chance = 34440, maxCount = 10}, -- great mana potion
	{id = 7643, chance = 34440, maxCount = 10}, -- ultimate health potion
	{id = 7642, chance = 34440, maxCount = 5}, -- great spirit potion
	{id = 16119, chance = 30000, maxCount = 8}, -- blue crystal shard
	{id = 16121, chance = 30000, maxCount = 8}, -- green crystal shard
	{id = 3038, chance = 20000}, -- green gem
	{id = 3415, chance = 15030}, -- guardian shield
	{id = 3315, chance = 15030}, -- guardian halberd
	{id = 3041, chance = 15030}, -- blue gem
	{id = 9058, chance = 15030}, -- gold ingot
	{id = 7428, chance = 15030}, -- bonebreaker
	{id = 3340, chance = 12940}, -- heavy mace
	{id = 3419, chance = 11540}, -- crown shield
	{id = 20276, chance = 10000}, -- dream warden mask
	{id = 8063, chance = 9620}, -- paladin armor
	{id = 7387, chance = 8390}, -- diamond sceptre
	{id = 3420, chance = 6290}, -- demon shield
	{id = 3414, chance = 1400}, -- mastermind shield
	{id = 7431, chance = 700}, -- demonbone
	{id = 8049, chance = 350}, -- lavos armor
	{id = 36938, chance = 170}, -- obsidian truncheon
	{id = 3076, chance = 22500, maxCount = 3}, -- gold token
    {id = 3076, chance = 22500, maxCount = 3}, -- silver token
    {id = 19082, chance = 1200, maxCount = 2}, -- tornament token
    {id = 3043, chance = 12500, maxCount = 30}, -- crystal coin
    {id = 32622, chance = 4200, maxCount = 1} -- giant ameth
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 490, attack = 320},
	{name ="speed", interval = 1000, chance = 12, speedChange = -800, radius = 6, effect = CONST_ME_POISONAREA, target = false, duration = 10000},
	{name ="combat", interval = 1000, chance = 9, type = COMBAT_EARTHDAMAGE, minDamage = -200, maxDamage = -2650, radius = 4, effect = CONST_ME_POISONAREA, target = false},
	{name ="combat", interval = 1000, chance = 11, type = COMBAT_LIFEDRAIN, minDamage = -400, maxDamage = -1900, radius = 4, shootEffect = CONST_ANI_POISON, effect = CONST_ME_SOUND_GREEN, target = true},
	{name ="combat", interval = 2000, chance = 19, type = COMBAT_PHYSICALDAMAGE, minDamage = -350, maxDamage = -1850, length = 7, spread = 3, shootEffect = CONST_ANI_POISON, target = false},
	{name ="combat", interval = 2000, chance = 10, type = COMBAT_ICEDAMAGE, minDamage = 0, maxDamage = -3100, length = 8, spread = 3, effect = CONST_ME_ICEATTACK, target = false},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_ICEDAMAGE, minDamage = 0, maxDamage = -2110, range = 7, shootEffect = CONST_ANI_SNOWBALL, target = false},
	{name ="combat", interval = 2000, chance = 10, type = COMBAT_ICEDAMAGE, minDamage = -300, maxDamage = -1750, length = 8, spread = 3, effect = CONST_ME_ICEAREA, target = false},
	{name ="abomination ida", interval = 15000, chance = 40, target = false},
	{name ="abomination volta", interval = 15000, chance = 40, target = false}
}

monster.defenses = {
	defense = 25,
	armor = 25,
	{name ="combat", interval = 1000, chance = 75, type = COMBAT_HEALING, minDamage = 505, maxDamage = 605, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = false},
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
