local mType = Game.createMonsterType("Zavarash")
local monster = {}

monster.description = "Zavarash"
monster.experience = 210000
monster.outfit = {
	lookType = 12,
	lookHead = 0,
	lookBody = 15,
	lookLegs = 57,
	lookFeet = 85,
	lookAddons = 0,
	lookMount = 0
}

monster.level = {
min = 325,
max = 445
}

monster.health = 350000
monster.maxHealth = 350000
monster.race = "blood"
monster.corpse = 6068
monster.speed = 620
monster.manaCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 25
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
	targetDistance = 4,
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

monster.summon = {
	maxSummons = 2,
	summons = {
		{name = "dark torturer", chance = 100, interval = 1000, count = 2}
	}
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "Harrr, Harrr!", yell = true}
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
	{id = 8100, chance = 170}, -- obsidian truncheon
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
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -1600},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -3000, range = 7, shootEffect = CONST_ANI_THROWINGKNIFE, target = false},
	{name ="combat", interval = 2000, chance = 10, type = COMBAT_ICEDAMAGE, minDamage = 0, maxDamage = -1100, length = 8, spread = 3, effect = CONST_ME_ICEATTACK, target = false},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_ICEDAMAGE, minDamage = 0, maxDamage = -4110, range = 7, shootEffect = CONST_ANI_SNOWBALL, target = false},
	{name ="combat", interval = 2000, chance = 10, type = COMBAT_ICEDAMAGE, minDamage = -300, maxDamage = -2750, length = 8, spread = 3, effect = CONST_ME_ICEAREA, target = false},
}

monster.defenses = {
	defense = 65,
	armor = 55,
	{name ="combat", interval = 2000, chance = 30, type = COMBAT_HEALING, minDamage = 400, maxDamage = 600, radius = 8, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="speed", interval = 2000, chance = 18, speedChange = 1284, effect = CONST_ME_MAGIC_GREEN, target = false, duration = 7000},
	{name ="invisible", interval = 2000, chance = 20, effect = CONST_ME_MAGIC_BLUE}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 50},
	{type = COMBAT_ENERGYDAMAGE, percent = 50},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = -50},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 50},
	{type = COMBAT_HOLYDAMAGE , percent = -50},
	{type = COMBAT_DEATHDAMAGE , percent = 50}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = true},
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
