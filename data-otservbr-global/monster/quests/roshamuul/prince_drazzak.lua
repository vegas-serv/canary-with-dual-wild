local mType = Game.createMonsterType("Prince Drazzak")
local monster = {}

monster.description = "Prince Drazzak"
monster.experience = 6100000
monster.outfit = {
	lookType = 12,
	lookHead = 77,
	lookBody = 78,
	lookLegs = 94,
	lookFeet = 55,
	lookAddons = 0,
	lookMount = 0
}

monster.level = {
min = 525,
max = 975
}

monster.health = 2330000
monster.maxHealth = 2330000
monster.race = "fire"
monster.corpse = 6068
monster.speed = 540
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
	targetDistance = 1,
	runHealth = 2000,
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
	{text = "EVEN WITH ALL THAT TIME IN THE PRISON THAT WEAKENED ME, YOU ARE NO MATCH TO ME!", yell = true},
	{text = "DIE!", yell = true},
	{text = "SORCERERS MUST DIE!", yell = true},
	{text = "DRUIDS MUST DIE!", yell = true},
	{text = "PALADINS MUST DIE!", yell = true},
	{text = "KNIGHTS MUST DIE!", yell = true},
	{text = "GET OVER HERE!", yell = true},
	{text = "CRUSH THEM ALL!", yell = true},
	{text = "VARIPHOR WILL RULE!", yell = true},
	{text = "THEY WILL ALL PAY!", yell = true},
	{text = "NOT EVEN AEONS OF IMPRISONMENT WILL STOP ME!", yell = true},
	{text = "They used you fools to escape and they left ME behind!!??", yell = false}
}

monster.loot = {
	{id = 20063, chance = 100000}, -- dream matter
	{id = 20062, chance = 100000, maxCount = 2}, -- cluster of solace
	{id = 20264, chance = 93750, maxCount = 3}, -- unrealized dream
	{id = 6499, chance = 100000, maxCount = 2}, -- demonic essence
	{id = 5954, chance = 50000}, -- demon horn
	{id = 3035, chance = 100000, maxCount = 50}, -- platinum coin
	{id = 7643, chance = 100000, maxCount = 100}, -- ultimate health potion
	{id = 7642, chance = 100000, maxCount = 100}, -- great spirit potion
	{id = 238, chance = 100000, maxCount = 100}, -- great mana potion
	{id = 20279, chance = 25000}, -- eye pod
	{id = 20274, chance = 2500}, -- nightmare horn
	{id = 20277, chance = 25000}, -- psychedelic tapestry
	{id = 20278, chance = 25000}, -- demonic tapestry
	{id = 5741, chance = 2500}, -- skull helmet
	{id = 7417, chance = 2500, unique = true}, -- runed sword
	{id = 20276, chance = 7000, unique = true}, -- dream warden mask
	{id = 7418, chance = 1000}, -- nightmare blade
	{id = 820, chance = 1000}, -- lightning boots
	{id = 281, chance = 5000}, -- giant shimmering pearl (green)
	{id = 282, chance = 5000}, -- giant shimmering pearl (brown)
	{id = 3076, chance = 22500, maxCount = 3}, -- gold token
    {id = 3076, chance = 22500, maxCount = 3}, -- silver token
    {id = 19082, chance = 22500, maxCount = 2}, -- tornament token
    {id = 3043, chance = 52500, maxCount = 30}, -- crystal coin
    {id = 8153, chance = 12500, maxCount = 1}, -- boost exp 50%
    {id = 37110, chance = 12500, maxCount = 2}, -- exalted core
    {id = 32622, chance = 42500, maxCount = 1}, -- giant ameth
    {id = 16129, chance = 42500, maxCount = 3}, -- major
    {id = 9586, chance = 12500, maxCount = 1}, -- surprese box
    {id = 9145, chance = 12500, maxCount = 1}, -- mount doll
    {id = 28895, chance = 12500, maxCount = 1}, -- addon doll
    {id = 28887, chance = 12500, maxCount = 1}, -- vip days
    {id = 12905, chance = 12500, maxCount = 1}, -- stamina
    {id = 10227, chance = 12500, maxCount = 1} -- remover skull
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 430, attack = 610},
	{name ="combat", interval = 1000, chance = 8, type = COMBAT_DEATHDAMAGE, minDamage = -800, maxDamage = -5900, radius = 9, effect = CONST_ME_MORTAREA, target = false},
	{name ="speed", interval = 1000, chance = 12, speedChange = -850, radius = 6, effect = CONST_ME_POISONAREA, target = false, duration = 60000},
	{name ="strength", interval = 1000, chance = 10, minDamage = -600, maxDamage = -1450, radius = 5, effect = CONST_ME_HITAREA, target = false},
	{name ="combat", interval = 3000, chance = 13, type = COMBAT_FIREDAMAGE, minDamage = -300, maxDamage = -4800, range = 7, radius = 7, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true},
	{name ="combat", interval = 3000, chance = 8, type = COMBAT_MANADRAIN, minDamage = -600, maxDamage = -700, radius = 10, effect = CONST_ME_ENERGYAREA, target = false},
	{name ="combat", interval = 2000, chance = 9, type = COMBAT_ENERGYDAMAGE, minDamage = -400, maxDamage = -800, length = 8, spread = 3, effect = CONST_ME_MAGIC_RED, target = false},
	-- poison
	{name ="condition", type = CONDITION_POISON, interval = 5000, chance = 18, minDamage = -800, maxDamage = -1000, effect = CONST_ME_HITBYPOISON, target = false},
	{name ="combat", interval = 2000, chance = 6, type = COMBAT_LIFEDRAIN, minDamage = -600, maxDamage = -1200, radius = 14, effect = CONST_ME_MAGIC_GREEN, target = false}
}

monster.defenses = {
	defense = 65,
	armor = 55,
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 1500, maxDamage = 3000, effect = CONST_ME_MAGIC_RED, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 30},
	{type = COMBAT_ENERGYDAMAGE, percent = 30},
	{type = COMBAT_EARTHDAMAGE, percent = 30},
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
