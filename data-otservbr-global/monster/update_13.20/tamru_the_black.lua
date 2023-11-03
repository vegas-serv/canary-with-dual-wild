local mType = Game.createMonsterType("Tamru the Black")
local monster = {}

monster.description = "a Tamru the Black"
monster.experience = 11200000
monster.outfit = {
	lookType = 1646,
	lookHead = 95,
	lookBody = 132,
	lookLegs = 76,
	lookFeet = 76,
	lookAddons = 3,
	lookMount = 0
}

monster.level = {
min = 455,
max = 855
}

monster.health = 155000
monster.maxHealth = 155000
monster.race = "undead"
monster.corpse = 44043
monster.speed = 180
monster.manaCost = 0

monster.bosstiary = {
	bossRaceId = 2405,
	bossRace = RARITY_NEMESIS
}

monster.changeTarget = {
	interval = 4000,
	chance = 10
}

monster.strategiesTarget = {
	nearest = 80,
	health = 10,
	damage = 10,
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
	runHealth = 800,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {

}

monster.loot = {
	{ name = "gold coin", chance = 100000, maxCount = 197 },
	{ name = "platinum coin", chance = 100000, maxCount = 45 },
	{ name = "amulet of loss", chance = 120 },
	{ name = "gold ring", chance = 1870 },
	{ name = "diamond sceptre", chance = 5760 },
	{ name = "war hammer", chance = 2160 },
	{ name = "metal spats", chance = 1440 },
	{ name = "devil helmet", chance = 1360 },
	{ name = "magma legs", chance = 1150 },
	{ id = 6299, chance = 1410 }, 
	{ id = 43915, chance = 2500 },
	{ id = 43730, chance = 1500, maxCount = 3 },
	{ name = "soul orb", chance = 5000, maxCount = 2 },
	{ name = "crystal sword", chance = 5000 },
	{ name = "serpent sword", chance = 5000 },
	{ name = "rapier", chance = 5000 },
	{ name = "great mana potion", chance = 31360, maxCount = 3 },
	{ name = "ultimate health potion", chance = 14720, maxCount = 2 },
	{ name = "gold ingot", chance = 5270 },
	{id = 6571, chance = 60000, maxCount = 2}, -- surprise bag
	{id = 281, chance = 100000}, -- giant shimmering pearl (green)
	{id = 14681, chance = 10000}, -- anniversary cake
	{id = 3076, chance = 22500, maxCount = 3}, -- gold token
    {id = 3076, chance = 22500, maxCount = 3}, -- silver token
    {id = 19082, chance = 10500, maxCount = 2}, -- tornament token
    {id = 3043, chance = 12500, maxCount = 30}, -- crystal coin
    {id = 32622, chance = 42500, maxCount = 1}, -- giant ameth
    {id = 16129, chance = 42500, maxCount = 3}, -- major
    {id = 9586, chance = 500, maxCount = 1}, -- surprese box
    {id = 9145, chance = 500, maxCount = 1}, -- mount doll
    {id = 28895, chance = 500, maxCount = 1}, -- addon doll
    {id = 28887, chance = 500, maxCount = 1}, -- vip days
    {id = 12905, chance = 500, maxCount = 1}, -- stamina
    {id = 10227, chance = 500, maxCount = 1} -- remover skull
}

monster.attacks = {
	{ name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -400 },
	{ name ="combat", interval = 2000, chance = 15, type = COMBAT_EARTHDAMAGE, minDamage = 0, maxDamage = -615, range = 7, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA, target = false },
	{ name ="combat", interval = 2000, chance = 10, type = COMBAT_EARTHDAMAGE, minDamage = -100, maxDamage = -400, radius = 4, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA, target = true },
	{ name ="speed", interval = 4000, chance = 20, speedChange = -350, range = 7, shootEffect = CONST_ANI_POISON, target = true, duration = 12000 },
	{ name ="combat", interval = 2000, chance = 10, type = COMBAT_FIREDAMAGE, minDamage = 0, maxDamage = -574, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = false },
	{ name ="combat", interval = 2000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = -300, maxDamage = -646, radius = 3, effect = CONST_ME_POFF, target = false },
}

monster.defenses = {
	defense = 83,
	armor = 83
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = -5 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 60 },
	{ type = COMBAT_EARTHDAMAGE, percent = 20 },
	{ type = COMBAT_FIREDAMAGE, percent = -5 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 50 },
	{ type = COMBAT_HOLYDAMAGE , percent = 25 },
	{ type = COMBAT_DEATHDAMAGE , percent = 0 }
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false }
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
