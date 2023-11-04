local mType = Game.createMonsterType("Bakragore")
local monster = {}

monster.name = "Bakragore"
monster.description = "Bakragore"
monster.experience = 78000000
monster.outfit = {
	lookType = 1671,
}

monster.health = 1200000
monster.maxHealth = 1200000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 39712
monster.speed = 400
monster.summonCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 25
}

monster.level = {
min = 1000,
max = 1500
}

monster.events = {
	"Deadmonsters",
	"killDecayingOutfit"
}

monster.flags = {
	attackable = true,
	hostile = true,
	summonable = false,
	convinceable = false,
	illusionable = false,
	boss = true,
	ignoreSpawnBlock = false,
	pushable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 70,
	targetDistance = 1,
	healthHidden = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false,
	rewardBoss = true
}

monster.bosstiary = {
	bossRaceId = 2367,
	bossRace = RARITY_NEMESIS,
	storageCooldown = Storage.Marapur.Bakragore
}

monster.light = {
	level = 0,
	color = 0
}

monster.summon = {
	maxSummons = 5,
	summons = {
		{ name = "Elder Bloodjaw", chance = 75, interval = 5000, count = 5 },
	},
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 10},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = -10},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -50},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 10}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -800, maxDamage = -1600},
	{name ="combat", interval = 2000, chance = 25, type = COMBAT_FIREDAMAGE, minDamage = -700, maxDamage = -8100, radius = 7, target = false, effect = CONST_ME_HITBYFIRE},
	{name ="combat", interval = 1800, chance = 20, type = COMBAT_ENERGYDAMAGE, minDamage = -700, maxDamage = -1100, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYHIT},
	{name ="combat", interval = 3000, chance = 30, type = COMBAT_MANADRAIN, minDamage = -100, maxDamage = -2700, effect = CONST_ME_PURPLEENERGY},
	{name ="combat", interval = 2000, chance = 55, type = COMBAT_DEATHDAMAGE, minDamage = -350, maxDamage = -2195, length = 7, spread = 0, effect = CONST_ME_BLACKSMOKE, target = false},
	{name ="combat", interval = 2000, chance = 30, type = COMBAT_ENERGYDAMAGE, minDamage = -280, maxDamage = -1120, length = 7, spread = 0, effect = CONST_ME_ENERGYHIT, target = false},
	{name ="thunderstorm ring", interval = 2000, chance = 35, minDamage = -325, maxDamage = -3415},
	{name ="energy chain", interval = 2000, chance = 55, minDamage = -302, maxDamage = -2309, range = 7, target = true},
	{name ="ice chain", interval = 2000, chance = 35, minDamage = -1100, maxDamage = -1100, range = 7},
	{name ="fear", interval = 2000, chance = 1, target = true},
}

monster.defenses = {
	defense = 5,
	armor = 10,
	mitigation = 6.34,
}

monster.loot = {
	{name="crystal coin",chance = 100000, maxCount = 122},
	{name="ultimate mana potion", chance = 32653, maxCount = 114},
	{name="ultimate health potion",chance = 30612, maxCount = 114},
	{name= "bullseye potion",chance = 24490, maxCount = 5},
	{name= "berserk potion",chance = 22449, maxCount = 5},
	{id = 39233, chance = 5000},
	{name = "mastermind potion",chance = 18367, maxCount = 5},
	{name = "giant amethyst", chance = 6122},
	{name = "giant ruby", chance = 4082},
	{name = "giant emerald", chance = 4082},
	{name = "giant sapphire", chance = 2041},
	{name = "giant topaz", chance = 2041},
	{name = "spiritual horseshoe", chance = 100},
	{name = "toy ball", chance = 150},
	{id = 43860, chance = 20}
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