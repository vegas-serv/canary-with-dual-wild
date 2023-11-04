local mType = Game.createMonsterType("Ayana the crimson curse")
local monster = {}

monster.description = "Ayana the crimson curse"
monster.experience = 12400000
monster.outfit = {
	lookType = 1647,
	lookHead = 132,
	lookBody = 132,
	lookLegs = 57,
	lookFeet = 76,
	lookAddons = 0,
	lookMount = 0
}

monster.level = {
min = 455,
max = 855
}

monster.health = 170000
monster.maxHealth = 170000
monster.race = "undead"
monster.corpse = 44039
monster.speed = 180
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10
}

monster.bosstiary = {
	bossRaceId = 2404,
	bossRace = RARITY_NEMESIS
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
	canWalkOnEnergy = false,
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
	{ name = "platinum coin", chance = 100000, maxCount = 50 },
	{ name = "amulet of loss", chance = 1120 },
	{ name = "gold ring", chance = 1870 },
	{ name = "hailstorm rod", chance = 10000 },
	{ name = "garlic necklace", chance = 2050 },
	{ name = "blank rune", chance = 26250, maxCount = 2 },
	{ name = "golden sickle", chance = 350 },
	{ name = "skull staff", chance = 1520 },
	{ name = "scythe", chance = 3000 },
	{ name = "bunch of wheat", chance = 50000 },
	{ name = "soul orb", chance = 23720 },
	{ id = 6299, chance = 410 }, 
	{ id = 43916, chance = 400 },
	{ id = 43729, chance = 2200, maxCount = 3 },
	{ id = 43738, chance = 9000 },
	{ id = 43849, chance = 1000 },
	{ id = 43857, chance = 700 },
	{ name = "demonic essence", chance = 28000 },
	{ name = "assassin star", chance = 5900, maxCount = 10 },
	{ name = "great mana potion", chance = 31360, maxCount = 3 },
	{ name = "seeds", chance = 4300 },
	{ name = "terra mantle", chance = 1050 },
	{ name = "terra legs", chance = 2500 },
	{ name = "ultimate health potion", chance = 14720, maxCount = 2 },
	{ name = "gold ingot", chance = 5270 },
	{ name = "bundle of cursed straw", chance = 5000 },
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
	{ name ="melee", interval = 2000, chance = 100, skill = 75, attack = 100 },
	{ name ="combat", interval = 1000, chance = 8, type = COMBAT_DEATHDAMAGE, minDamage = -300, maxDamage = -500, radius = 9, effect = CONST_ME_MORTAREA, target = false },
	{ name ="speed", interval = 1000, chance = 12, speedChange = -250, radius = 6, effect = CONST_ME_POISONAREA, target = false, duration = 60000 },
	{ name ="strength", interval = 1000, chance = 10, minDamage = -300, maxDamage = -750, radius = 5, effect = CONST_ME_HITAREA, target = false },
	{ name ="combat", interval = 3000, chance = 13, type = COMBAT_FIREDAMAGE, minDamage = -300, maxDamage = -500, range = 7, radius = 7, shootEffect = CONST_ANI_FIRE, effect = 244, target = true },
	{ name ="combat", interval = 3000, chance = 8, type = COMBAT_HOLYDAMAGE, minDamage = -300, maxDamage = -450, radius = 10, effect = 246, target = false }
}

monster.defenses = {
	defense = 110,
	armor = 110
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 25 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -5 },
	{ type = COMBAT_EARTHDAMAGE, percent = 20 },
	{ type = COMBAT_FIREDAMAGE, percent = 35 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -15 },
	{ type = COMBAT_HOLYDAMAGE , percent = -20 },
	{ type = COMBAT_DEATHDAMAGE , percent = 60 }
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
