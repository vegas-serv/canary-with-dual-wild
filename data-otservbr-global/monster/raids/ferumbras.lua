local mType = Game.createMonsterType("Ferumbras")
local monster = {}

monster.description = "Ferumbras"
monster.experience = 52000000
monster.outfit = {
	lookType = 229,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.level = {
min = 525,
max = 1975
}

monster.health = 2500000
monster.maxHealth = 2500000
monster.race = "venom"
monster.corpse = 6078
monster.speed = 560
monster.manaCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 8
}

monster.events = {
	"Deadmonsters"
}

monster.bosstiary = {
	bossRaceId = 231,
	bossRace = RARITY_NEMESIS
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
	targetDistance = 2,
	runHealth = 2500,
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
	maxSummons = 4,
	summons = {
		{name = "Demon", chance = 12, interval = 3000, count = 4}
	}
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "NO ONE WILL STOP ME THIS TIME!", yell = true},
	{text = "THE POWER IS MINE!", yell = true},
	{text = "I returned from death and you dream about defeating me?", yell = false},
	{text = "Witness the first seconds of my eternal world domination!", yell = false},
	{text = "Even in my weakened state I will crush you all!", yell = false}
}

monster.loot = {
	{id = 5903, chance = 1000, unique = true}, -- ferumbras' hat
	{id = 3031, chance = 98000, maxCount = 184}, -- gold coin
	{id = 9058, chance = 75000, maxCount = 2}, -- gold ingot
	{id = 3422, chance = 2600, unique = true}, -- great shield
	{id = 8075, chance = 2600}, -- spellbook of lost souls
	{id = 3360, chance = 24000}, -- golden armor
	{id = 3364, chance = 22000}, -- golden legs
	{id = 8074, chance = 22000}, -- spellbook of mind control
	{id = 8040, chance = 2200}, -- velvet mantle
	{id = 3420, chance = 20000}, -- demon shield
	{id = 8057, chance = 2000}, -- divine plate
	{id = 821, chance = 20000}, -- magma legs
	{id = 3442, chance = 2000}, -- tempest shield
	{id = 3010, chance = 18000}, -- emerald bangle
	{id = 823, chance = 18000}, -- glacier kilt
	{id = 822, chance = 18000}, -- lightning legs
	{id = 3439, chance = 1800}, -- phoenix shield
	{id = 8090, chance = 1800}, -- spellbook of dark mysteries
	{id = 812, chance = 18000}, -- terra legs
	{id = 8102, chance = 1600}, -- emerald sword
	{id = 7405, chance = 1600}, -- havoc blade
	{id = 7451, chance = 1600}, -- shadow sceptre
	{id = 3032, chance = 16000, maxCount = 100}, -- small emerald
	{id = 281, chance = 14000, maxCount = 5}, -- giant shimmering pearl (green)
	{id = 282, chance = 14000, maxCount = 5}, -- giant shimmering pearl (brown)
	{id = 3366, chance = 14000}, -- magic plate armor
	{id = 3414, chance = 14000}, -- mastermind shield
	{id = 7417, chance = 1400}, -- runed sword
	{id = 8076, chance = 1400}, -- spellscroll of prophecies
	{id = 7427, chance = 12000}, -- chaos mace
	{id = 8098, chance = 1200}, -- demonwing axe
	{id = 8041, chance = 1200}, -- greenwood coat
	{id = 3029, chance = 12000, maxCount = 98}, -- small sapphire
	{id = 3026, chance = 12000, maxCount = 88}, -- white pearl
	{id = 7407, chance = 1000}, -- haunted blade
	{id = 8096, chance = 1000}, -- hellforged axe
	{id = 7411, chance = 1000}, -- ornamented axe
	{id = 3033, chance = 10000, maxCount = 54}, -- small amethyst
	{id = 9057, chance = 10000, maxCount = 87}, -- small topaz
	{id = 7382, chance = 8000}, -- demonrage sword
	{id = 7422, chance = 800}, -- jade hammer
	{id = 3035, chance = 8000, maxCount = 58}, -- platinum coin
	{id = 7423, chance = 800}, -- skullcrusher
	{id = 5944, chance = 8000, maxCount = 9}, -- soul orb
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
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -3350},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_MANADRAIN, minDamage = -500, maxDamage = -1700, range = 7, effect = CONST_ME_MAGIC_RED, target = false},
	{name ="combat", interval = 2000, chance = 25, type = COMBAT_LIFEDRAIN, minDamage = -300, maxDamage = -1450, length = 8, spread = 3, effect = CONST_ME_HITBYPOISON, target = false},
	{name ="combat", interval = 2000, chance = 21, type = COMBAT_LIFEDRAIN, minDamage = -450, maxDamage = -1500, radius = 6, effect = CONST_ME_POFF, target = false},
	-- poison
	{name ="condition", type = CONDITION_POISON, interval = 2000, chance = 15, minDamage = -20, maxDamage = -40, range = 7, shootEffect = CONST_ANI_POISON, target = false},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_LIFEDRAIN, minDamage = -900, maxDamage = -1000, range = 4, radius = 3, target = false},
	-- energy damage
	{name ="condition", type = CONDITION_ENERGY, interval = 2000, chance = 18, minDamage = -300, maxDamage = -3400, radius = 6, effect = CONST_ME_ENERGYHIT, target = false},
	-- fire
	{name ="condition", type = CONDITION_FIRE, interval = 3000, chance = 20, minDamage = -500, maxDamage = -5600, range = 7, radius = 7, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true}
}

monster.defenses = {
	defense = 120,
	armor = 100,
	{name ="combat", interval = 2000, chance = 10, type = COMBAT_HEALING, minDamage = 900, maxDamage = 1500, effect = CONST_ME_MAGIC_GREEN, target = false},
	{name ="invisible", interval = 4000, chance = 20, effect = CONST_ME_MAGIC_BLUE}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 100},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 90},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 20},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
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
