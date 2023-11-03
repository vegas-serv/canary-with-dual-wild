--# Monster converted using Devm monster converter #--
local mType = Game.createMonsterType("Hight Hellflayer")
local monster = {}

monster.description = "a Hight hellflayer"
monster.experience = 62000
monster.outfit = {
	lookType = 856,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.level = {
min = 325,
max = 445
}

monster.health = 18000
monster.maxHealth = 18000
monster.race = "blood"
monster.corpse = 22784
monster.speed = 600
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10
}

monster.flags = {
	isSummonable = false,
	isAttackable = true,
	isHostile = true,
	isConvinceable = false,
	isPushable = false,
	isBoss = false,
	illusionable = true,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetdistance = 1,
	runHealth = 0,
	isHealthHidden = false,
	canwalkonenergy = false,
	canwalkonfire = false,
	canwalkonpoison = false
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "You should consider bargaining for you life!", yell = false},
	{text = "Your tainted soul belongs to us anyway!", yell = false},
	{text = "Today I deal only in death!", yell = false}
}

monster.loot = {
	{id = 3031, chance = 90000, maxCount = 130}, -- gold coin
	{id = 3035, chance = 20000, maxCount = 55}, -- platinum coin
	{id = 6558, chance = 4000, maxCount = 3}, -- flask of demonic blood
	{id = 9058, chance = 1300, maxCount = 2}, -- gold ingot
	{id = 238, chance = 9600, maxCount = 2}, -- great mana potion
	{id = 7642, chance = 2300, maxCount = 2}, -- great spirit potion
	{id = 3033, chance = 2000, maxCount = 5}, -- small amethyst
	{id = 3028, chance = 900, maxCount = 5}, -- small diamond
	{id = 3032, chance = 900, maxCount = 5}, -- small emerald
	{id = 3030, chance = 2000, maxCount = 5}, -- small ruby
	{id = 9057, chance = 900, maxCount = 5}, -- small topaz
	{id = 7643, chance = 5300, maxCount = 2}, -- ultimate health potion
	{id = 3019, chance = 1000}, -- demonbone amulet
	{id = 6499, chance = 1600}, -- demonic essence
	{id = 281, chance = 800}, -- giant shimmering pearl (green)
	{id = 3038, chance = 800}, -- green gem
	{id = 818, chance = 500}, -- magma boots
	{id = 821, chance = 1200}, -- magma legs
	{id = 3414, chance = 350}, -- mastermind shield
	{id = 22729, chance = 800}, -- pair of hellflayer horns
	{id = 3039, chance = 500}, -- red gem
	{id = 22866, chance = 280}, -- rift bow
	{id = 22867, chance = 180}, -- rift crossbow
	{id = 5741, chance = 450}, -- skull helmet
	{id = 22727, chance = 200}, -- rift lance
	{id = 7413, chance = 900}, -- titan axe
	{id = 3360, chance = 750}, -- golden armor
	{id = 8074, chance = 900}, -- spellbook of mind control
	{id = 3340, chance = 400} -- heavy mace
}

monster.attacks = {
	{name ="combat", interval = 2000, chance = 100, minDamage = 200, maxDamage = -1869, effect = CONST_ME_DRAWBLOOD, condition = {type = CONDITION_FIRE, startDamage = 0, interval = 9000}},
	{name ="combat", interval = 2000, chance = 15, minDamage = -170, maxDamage = -900, type = COMBAT_FIRE, range = 7, ShootEffect = CONST_ANI_POISON, target = false},
	{name ="combat", interval = 2000, chance = 20, minDamage = -250, maxDamage = -900, type = COMBAT_DEATH, ShootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA, target = true},
	{name ="combat", interval = 2000, chance = 10, minDamage = -50, maxDamage = -200, type = COMBAT_LIFEDRAIN, length = 8, spread = 3, effect = CONST_ME_PURPLEENERGY, target = false},
	{name ="combat", interval = 2000, chance = 10, minDamage = -300, maxDamage = -950, type = COMBAT_FIRE, ShootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREATTACK, target = true},
	{name ="combat", interval = 2000, chance = 10, minDamage = 300, maxDamage = -900, type = COMBAT_PHYSICAL, ShootEffect = CONST_ANI_EXPLOSION, effect = CONST_ME_SLEEP, target = true}
}

monster.defenses = {
	defense = 20,
	armor = 20,
	{name ="combat", interval = 2000, chance = 10, minDamage = 80, maxDamage = 95, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = -10},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 100},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
