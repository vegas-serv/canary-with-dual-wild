local mType = Game.createMonsterType("Horadron")
local monster = {}

monster.description = "Horadron"
monster.experience = 6800000
monster.outfit = {
	lookType = 12,
	lookHead = 78,
	lookBody = 80,
	lookLegs = 110,
	lookFeet = 77,
	lookAddons = 0,
	lookMount = 0
}

monster.level = {
min = 625,
max = 975
}

monster.health = 1300000
monster.maxHealth = 1300000
monster.race = "blood"
monster.corpse = 6068
monster.speed = 560
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
	rewardBoss = false,
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

monster.summon = {
	maxSummons = 2,
	summons = {
		{name = "Defiler", chance = 12, interval = 2000, count = 2}
	}
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "Even I fear the wrath of the princes. And the cold touch of those whom they serve! You are not prepared!", yell = false},
	{text = "You foolish mortals with you medding you brought the end upon your world!", yell = false},
	{text = "After all those aeons I smell freedom at last!", yell = false}
}

monster.loot = {
	{id = 20062, chance = 100000}, -- cluster of solace
	{id = 5954, chance = 100000}, -- demon horn
	{id = 6499, chance = 100000}, -- demonic essence
	{id = 20063, chance = 13850}, -- dream matter
	{id = 20276, chance = 5380}, -- dream warden mask
	{id = 3031, chance = 100000, maxCount = 200}, -- gold coin
	{id = 3035, chance = 100000, maxCount = 50}, -- platinum coin
	{id = 20264, chance = 100000}, -- unrealized dream
	{id = 8075, chance = 5130}, -- spellbook of lost souls
	{id = 8073, chance = 35900}, -- spellbook of warding
	{id = 8074, chance = 10260}, -- spellbook of mind control
	{id = 3344, chance = 33330}, -- beastslayer axe
	{id = 7456, chance = 12820}, -- noble axe
	{id = 7453, chance = 2560}, -- executioner
	{id = 7388, chance = 2560}, -- vile axe
	{id = 3360, chance = 1220}, -- golden armor
	{id = 3567, chance = 1220}, -- blue robe
	{id = 3381, chance = 17950}, -- crown armor
	{id = 3364, chance = 250}, -- golden legs
	{id = 3303, chance = 90}, -- great axe
	{id = 8098, chance = 90}, -- demonwing axe
	{id = 822, chance = 1750}, -- lightning legs
	{id = 3371, chance = 1750}, -- knight legs
	{id = 3382, chance = 20510}, -- crown legs
	{id = 3554, chance = 15380}, -- steel boots
	{id = 3028, chance = 17950, maxCount = 25}, -- small diamond
	{id = 3033, chance = 5130, maxCount = 25}, -- small amethyst
	{id = 3032, chance = 10260, maxCount = 25}, -- small emerald
	{id = 3029, chance = 28210, maxCount = 25}, -- small sapphire
	{id = 9057, chance = 15380, maxCount = 25}, -- small topaz
	{id = 3030, chance = 20510, maxCount = 25}, -- small ruby
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
	{name ="melee", interval = 2000, chance = 100, skill = 510, attack = 500},
	{name ="combat", interval = 2000, chance = 25, type = COMBAT_EARTHDAMAGE, minDamage = -600, maxDamage = -3000, length = 8, spread = 3, effect = CONST_ME_HITBYPOISON, target = false},
	{name ="combat", interval = 2000, chance = 25, type = COMBAT_EARTHDAMAGE, minDamage = -600, maxDamage = -3000, length = 8, spread = 3, effect = CONST_ME_HITBYPOISON, target = false},
	{name ="combat", interval = 2000, chance = 30, type = COMBAT_EARTHDAMAGE, minDamage = -100, maxDamage = -3235, range = 7, shootEffect = CONST_ANI_POISON, effect = CONST_ME_HITBYPOISON, target = true},
	{name ="combat", interval = 2000, chance = 25, type = COMBAT_EARTHDAMAGE, minDamage = -100, maxDamage = -3250, radius = 3, effect = CONST_ME_POISONAREA, target = false},
	-- poison
	{name ="condition", type = CONDITION_POISON, interval = 2000, chance = 25, minDamage = -300, maxDamage = -1450, radius = 3, effect = CONST_ME_HITBYPOISON, target = false}
}

monster.defenses = {
	defense = 65,
	armor = 55,
	{name ="combat", interval = 2000, chance = 35, type = COMBAT_HEALING, minDamage = 400, maxDamage = 700, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 30},
	{type = COMBAT_ENERGYDAMAGE, percent = 30},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 30},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 30},
	{type = COMBAT_HOLYDAMAGE , percent = 30},
	{type = COMBAT_DEATHDAMAGE , percent = 30}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = true},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
