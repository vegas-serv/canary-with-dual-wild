local mType = Game.createMonsterType("Zushuka")
local monster = {}

monster.description = "zushuka" -- (immortal) // (mortal): lookType = 149, lookHead = 86, lookBody = 10, lookLegs = 11, lookFeet = 4, lookAddons = 0, lookMount = 0
monster.experience = 3900000
monster.outfit = {
	lookType = 149,
	lookHead = 86,
	lookBody = 10,
	lookLegs = 11,
	lookFeet = 4,
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
monster.corpse = 18265
monster.speed = 410
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10
}

monster.bosstiary = {
	bossRaceId = 990, -- or 990 (mortal)
	bossRace = RARITY_NEMESIS
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
	staticAttackChance = 70,
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
	{text = "Cool down, will you?", yell = false},
	{text = "Freeze!", yell = false},
	{text = "Is this all you've got?", yell = false},
	{text = "Pay for your ignorance!", yell = false},
	{text = "And stay cool.", yell = false},
	{text = "Your cold dead body will be a marvelous ice statue.", yell = false}
}

monster.loot = {
	{id = 3031, chance = 92000, maxCount = 200}, -- gold coin
	{id = 19083, chance = 92000}, -- silver raid token
	{id = 7290, chance = 57000}, -- shard
	{id = 7449, chance = 42000}, -- crystal sword
	{id = 7642, chance = 42000, maxCount = 5}, -- great spirit potion
	{id = 3284, chance = 42000}, -- ice rapier
	{id = 3052, chance = 42000}, -- life ring
	{id = 7443, chance = 35000}, -- bullseye potion
	{id = 819, chance = 35000}, -- glacier shoes
	{id = 7440, chance = 35000}, -- mastermind potion
	{id = 3035, chance = 35000}, -- platinum coin
	{id = 5909, chance = 35000, maxCount = 2}, -- white piece of cloth
	{id = 7439, chance = 28000}, -- berserk potion
	{id = 3041, chance = 28000}, -- blue gem
	{id = 3574, chance = 28000}, -- mystic turban
	{id = 815, chance = 21000}, -- glacier amulet
	{id = 238, chance = 21000, maxCount = 5}, -- great mana potion
	{id = 5912, chance = 14000}, -- blue piece of cloth
	{id = 3333, chance = 14000}, -- crystal mace
	{id = 3085, chance = 14000}, -- dragon necklace
	{id = 823, chance = 14000}, -- glacier kilt
	{id = 824, chance = 14000}, -- glacier robe
	{id = 9058, chance = 14000}, -- gold ingot
	{id = 239, chance = 14000, maxCount = 5}, -- great health potion
	{id = 7459, chance = 14000}, -- pair of earmuffs
	{id = 3324, chance = 14000}, -- skull staff
	{id = 3079, chance = 7000}, -- boots of haste
	{id = 829, chance = 7000}, -- glacier mask
	{id = 5911, chance = 7000}, -- red piece of cloth
	{id = 19365, chance = 7000}, -- trapped lightning
	{id = 7410, chance = 3000}, -- queen's sceptre
	{id = 3076, chance = 22500, maxCount = 3}, -- gold token
    {id = 3076, chance = 22500, maxCount = 3}, -- silver token
    {id = 19082, chance = 1200, maxCount = 2}, -- tornament token
    {id = 3043, chance = 12500, maxCount = 30}, -- crystal coin
    {id = 8153, chance = 550, maxCount = 1}, -- boost exp 50%
    {id = 37110, chance = 750, maxCount = 2}, -- exalted core
    {id = 32622, chance = 42500, maxCount = 1}, -- giant ameth
    {id = 16129, chance = 42500, maxCount = 3}, -- major
    {id = 9586, chance = 750, maxCount = 1}, -- surprese box
    {id = 9145, chance = 400, maxCount = 1}, -- mount doll
    {id = 28895, chance = 450, maxCount = 1}, -- addon doll
    {id = 28887, chance = 450, maxCount = 1}, -- vip days
    {id = 12905, chance = 450, maxCount = 1}, -- stamina
    {id = 10227, chance = 450, maxCount = 1} -- remover skull
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -2560},
	{name ="combat", interval = 2000, chance = 10, type = COMBAT_ICEDAMAGE, minDamage = 0, maxDamage = -1100, length = 8, spread = 3, effect = CONST_ME_ICEATTACK, target = false},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_ICEDAMAGE, minDamage = 0, maxDamage = -4110, range = 7, shootEffect = CONST_ANI_SNOWBALL, target = false},
	{name ="combat", interval = 2000, chance = 10, type = COMBAT_ICEDAMAGE, minDamage = -300, maxDamage = -2750, length = 8, spread = 3, effect = CONST_ME_ICEAREA, target = false},
	{name ="outfit", interval = 2000, chance = 10, range = 7, effect = CONST_ME_MAGIC_BLUE, target = false, duration = 4000, outfitItem = 7172},
	{name ="speed", interval = 2000, chance = 15, speedChange = -330, range = 7, effect = CONST_ME_ICETORNADO, target = false, duration = 20000}
}

monster.defenses = {
	defense = 20,
	armor = 20,
	{name ="combat", interval = 10000, chance = 1, type = COMBAT_HEALING, minDamage = 7500, maxDamage = 7515, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="combat", interval = 3000, chance = 15, type = COMBAT_HEALING, minDamage = 200, maxDamage = 500, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = -10},
	{type = COMBAT_EARTHDAMAGE, percent = 40},
	{type = COMBAT_FIREDAMAGE, percent = 50},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 100},
	{type = COMBAT_HOLYDAMAGE , percent = 30},
	{type = COMBAT_DEATHDAMAGE , percent = -10}
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
