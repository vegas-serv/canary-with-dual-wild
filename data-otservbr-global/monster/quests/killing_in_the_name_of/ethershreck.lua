local mType = Game.createMonsterType("Ethershreck")
local monster = {}

monster.description = "Ethershreck"
monster.experience = 5600000
monster.outfit = {
	lookType = 351,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.level = {
min = 425,
max = 775
}

monster.health = 395000
monster.maxHealth = 395000
monster.race = "undead"
monster.corpse = 10445
monster.speed = 760
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 5
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
	staticAttackChance = 70,
	targetDistance = 1,
	runHealth = 366,
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
	{text = "EMBRACE MY GIFTS!", yell = true}
}

monster.loot = {
	{id = 10449, chance = 100000}, -- ghastly dragon head
	{id = 3031, chance = 100000, maxCount = 230}, -- gold coin
	{id = 3035, chance = 100000, maxCount = 15}, -- platinum coin
	{id = 10450, chance = 100000}, -- undead heart
	{id = 6499, chance = 97000}, -- demonic essence
	{id = 281, chance = 45000}, -- giant shimmering pearl (green)
	{id = 282, chance = 45000}, -- giant shimmering pearl (brown)
	{id = 9057, chance = 97000, maxCount = 10}, -- small topaz
	{id = 10406, chance = 76000}, -- zaoan halberd
	{id = 7643, chance = 60000}, -- ultimate health potion
	{id = 10310, chance = 45000}, -- shiny stone
	{id = 10451, chance = 37000}, -- jade hat
	{id = 239, chance = 34000, maxCount = 3}, -- great health potion
	{id = 10386, chance = 30000}, -- zaoan shoes
	{id = 238, chance = 26000, maxCount = 3}, -- great mana potion
	{id = 7642, chance = 26000, maxCount = 3}, -- great spirit potion
	{id = 10438, chance = 21000}, -- spellweaver's robe
	{id = 10387, chance = 15000}, -- zaoan legs
	{id = 10384, chance = 13000}, -- zaoan armor
	{id = 10385, chance = 13000}, -- zaoan helmet
	{id = 10389, chance = 10000}, -- sai
	{id = 10388, chance = 8700}, -- drakinata
	{id = 12801, chance = 2170}, -- golden can of oil
	{id = 3076, chance = 22500, maxCount = 3}, -- gold token
    {id = 3076, chance = 22500, maxCount = 3}, -- silver token
    {id = 19082, chance = 1200, maxCount = 1}, -- tornament token
    {id = 3043, chance = 55500, maxCount = 30}, -- crystal coin
	{name = "giant sapphire", chance = 16800},
    {name = "Giant Amethyst", chance = 16800},
    {name = "Giant Emerald", chance = 16800},
    {name = "Giant Ruby", chance = 16800},
    {name = "Giant Topaz", chance = 16800},
    {name = "Hexagonal Ruby", chance = 16800},
	{id = 39037, chance = 550},
	{id = 32725, chance = 550},
	{id = 32633, chance = 550},
	{id = 39036, chance = 550},
	{id = 39038, chance = 550},
	{id = 39040, chance = 550},
	{id = 39039, chance = 550}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 380, attack = 100},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_LIFEDRAIN, minDamage = -80, maxDamage = -1230, range = 7, effect = CONST_ME_MAGIC_RED, target = true},
	{name ="ghastly dragon curse", interval = 2000, chance = 10, range = 7, target = false},
	-- poison
	{name ="condition", type = CONDITION_POISON, interval = 2000, chance = 10, minDamage = -920, maxDamage = -4260, range = 7, shootEffect = CONST_ANI_DEATH, effect = CONST_ME_SMALLCLOUDS, target = false},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_LIFEDRAIN, minDamage = -90, maxDamage = -1350, range = 7, effect = CONST_ME_MAGIC_RED, target = true},
	{name ="combat", interval = 2000, chance = 13, type = COMBAT_DEATHDAMAGE, minDamage = -70, maxDamage = -3180, radius = 4, effect = CONST_ME_MORTAREA, target = false}
}

monster.defenses = {
	defense = 35,
	armor = 45,
	{name ="combat", interval = 2000, chance = 9, type = COMBAT_HEALING, minDamage = 70, maxDamage = 300, effect = CONST_ME_MAGIC_GREEN, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = -10},
	{type = COMBAT_ENERGYDAMAGE, percent = -10},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 10},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 50},
	{type = COMBAT_HOLYDAMAGE , percent = -15},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
