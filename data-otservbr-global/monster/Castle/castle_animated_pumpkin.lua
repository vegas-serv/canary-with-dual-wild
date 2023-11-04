--# Monster converted using Devm monster converter #--
local mType = Game.createMonsterType("Hight Blightwalker")
local monster = {}

monster.description = "a Hight blightwalker"
monster.experience = 55850
monster.outfit = {
	lookType = 246,
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

monster.health = 18900
monster.maxHealth = 18900
monster.race = "undead"
monster.corpse = 6353
monster.speed = 450
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
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetdistance = 1,
	runHealth = 800,
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
	{text = "I can see you decaying!", yell = false},
	{text = "Let me taste your mortality!", yell = false},
	{text = "Your lifeforce is waning!", yell = false}
}

monster.loot = {
	{name = "gold coin", chance = 100000, maxCount = 197},
	{name = "platinum coin", chance = 100000, maxCount = 55},
	{name = "amulet of loss", chance = 1120},
	{name = "gold ring", chance = 5870},
	{name = "hailstorm rod", chance = 10000},
	{name = "garlic necklace", chance = 2050},
	{name = "blank rune", chance = 26250, maxCount = 2},
	{name = "golden sickle", chance = 350},
	{name = "skull staff", chance = 11520},
	{name = "scythe", chance = 3000},
	{name = "bunch of wheat", chance = 50000},
	{name = "soul orb", chance = 23720},
	{name = "demonic essence", chance = 28000},
	{name = "assassin star", chance = 5900, maxCount = 10},
	{name = "great mana potion", chance = 31360, maxCount = 3},
	{name = "seeds", chance = 4300},
	{name = "terra mantle", chance = 19050},
	{name = "terra legs", chance = 19500},
	{name = "ultimate health potion", chance = 14720, maxCount = 2},
	{name = "gold ingot", chance = 19270},
	{name = "bundle of cursed straw", chance = 15000}
}

monster.attacks = {
	{name ="combat", interval = 2000, chance = 100, minDamage = 0, maxDamage = -990, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 20, minDamage = -220, maxDamage = -1405, type = COMBAT_EARTH, range = 7, ShootEffect = CONST_ANI_POISON, target = true},
	{name ="combat", interval = 2000, chance = 15, minDamage = -65, maxDamage = -535, type = COMBAT_LIFEDRAIN, effect = CONST_ME_MAGIC_GREEN, target = false},
	{name ="speed", interval = 2000, chance = 15, SpeedChange = -300, Duration = 30000}
}

monster.defenses = {
	defense = 50,
	armor = 50
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = -10},
	{type = COMBAT_ENERGYDAMAGE, percent = 20},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 50},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 50},
	{type = COMBAT_HOLYDAMAGE , percent = -30},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
