local internalNpcName = "Bill Das Missoes Impossiveis"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 493,
	lookHead = 41,
	lookBody = 115,
	lookLegs = 100,
	lookFeet = 95,
	lookAddons = 3
}

npcConfig.flags = {
	floorchange = false
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

npcType.onThink = function(npc, interval)
	npcHandler:onThink(npc, interval)
end

npcType.onAppear = function(npc, creature)
	npcHandler:onAppear(npc, creature)
end

npcType.onDisappear = function(npc, creature)
	npcHandler:onDisappear(npc, creature)
end

npcType.onMove = function(npc, creature, fromPosition, toPosition)
	npcHandler:onMove(npc, creature, fromPosition, toPosition)
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onSay(npc, creature, type, message)
end

npcType.onCloseChannel = function(npc, creature)
	npcHandler:onCloseChannel(npc, creature)
end

local missions = {
   [1] = {
     items = {
       {id = 5890, count = 12},
       {id = 5878, count = 20},
       {id = 5894, count = 8}
     },
     message = "Great, for your first mission you need to collect some items, I need",
     level = 100, -- minimum level voor this mission
     rewarditems = {
       {id = 8192, count = 5},
       {id = 3043, count = 30}
     },
     rewardexp = 23500000
   },
   [2] = {
     monsters = {
       {name = "Rats", count = 100, storage = 21900},
       {name = "Rotworms", count = 50, storage = 21901}
     },
     message = "Thanks, for your next mission kill",
     level = 100,
     rewarditems = {
       {id = 3043, count = 50}
     },
     rewardexp = 21500000
   },
   [3] = {
     monsters = {
       {name = "Cyclops", count = 100, storage = 21902},
       {name = "Cyclops Drone", count = 50, storage = 21903}
     },
     message = "Thanks, for your next mission kill",
     level = 120,
     rewarditems = {
       {id = 3043, count = 60}
     },
     rewardexp = 22500000
   },
   [4] = {
     items = {
       {id = 5883, count = 100},
       {id = 11511, count = 50}
     },
     message = "Great, for your second mission you need to collect some items, I need",
     level = 150, -- minimum level voor this mission
     rewarditems = {
       {id = 3043, count = 50},
       {id = 20138, count = 1}
     },
     rewardexp = 23500000
   },
   [5] = {
     items = {
       {id = 5896, count = 55},
       {id = 5930, count = 10}
     },
     message = "Great, for your next mission you need to collect some items, I need",
     level = 150, -- minimum level voor this mission
     rewarditems = {
       {id = 3043, count = 50},
       {id = 35572, count = 25}
     },
     rewardexp = 24500000
   },
   [6] = {
     items = {
       {id = 11703, count = 25},
       {id = 9656, count = 15}
     },
     message = "Great, for your next mission you need to collect some items, I need",
     level = 150, -- minimum level voor this mission
     rewarditems = {
       {id = 3043, count = 50},
       {id = 35572, count = 25}
     },
     rewardexp = 24500000
   },
   [7] = {
     monsters = {
       {name = "Blood Beast", count = 150, storage = 21904},
       {name = "Minotaur Hunter", count = 100, storage = 21905}
     },
     message = "Thanks, for your next mission kill",
     level = 150,
     rewarditems = {
       {id = 3043, count = 50}
     },
     rewardexp = 34500000
   },
   [8] = {
     monsters = {
       {name = "Dragon Lord", count = 150, storage = 21906}
     },
     message = "Thanks, for your next mission kill",
     level = 150,
     rewarditems = {
       {id = 3043, count = 50},
	   {id = 35572, count = 25}
     },
     rewardexp = 45500000
   },
   [9] = {
     items = {
       {id = 11453, count = 25},
       {id = 9689, count = 25}
     },
     message = "Great, for your next mission you need to collect some items, I need",
     level = 150, -- minimum level voor this mission
     rewarditems = {
       {id = 3043, count = 55},
       {id = 35572, count = 25}
     },
     rewardexp = 43500000
   },
   [10] = {
     items = {
       {id = 10301, count = 5},
       {id = 12600, count = 25}
     },
     message = "Great, for your next mission you need to collect some items, I need",
     level = 150, -- minimum level voor this mission
     rewarditems = {
       {id = 3043, count = 55},
       {id = 35572, count = 25}
     },
     rewardexp = 46500000
   },
   [11] = {
     monsters = {
       {name = "Serpent Spawn", count = 150, storage = 21907},
       {name = "Hydra", count = 200, storage = 21908}
     },
     message = "Thanks, for your next mission kill",
     level = 250,
     rewarditems = {
       {id = 3043, count = 55}
     },
     rewardexp = 55500000
   },
   [12] = {
     monsters = {
       {name = "Medusa", count = 250, storage = 21909}
     },
     message = "Thanks, for your next mission kill",
     level = 250,
     rewarditems = {
       {id = 8192, count = 50}
     },
     rewardexp = 55500000
   },
    [13] = {
     items = {
       {id = 9638, count = 50},
       {id = 14079, count = 25}
     },
     message = "Great, for your next mission you need to collect some items, I need",
     level = 250, -- minimum level voor this mission
     rewarditems = {
       {id = 8192, count = 25},
       {id = 35572, count = 25}
     },
     rewardexp = 65500000
   },
    [14] = {
     items = {
       {id = 11455, count = 5},
       {id = 23511, count = 1}
     },
     message = "Great, for your next mission you need to collect some items, I need",
     level = 250, -- minimum level voor this mission
     rewarditems = {
       {id = 3043, count = 55},
       {id = 22516, count = 5}
     },
     rewardexp = 65500000
   },
   [15] = {
     monsters = {
       {name = "Behemoth", count = 350, storage = 21910}
     },
     message = "Thanks, for your next mission kill",
     level = 250,
     rewarditems = {
       {id = 35572, count = 100}
     },
     rewardexp = 65500000
   },
   [16] = {
     monsters = {
       {name = "Dragon", count = 150, storage = 21911}
     },
     message = "Thanks, for your next mission kill",
     level = 150,
     rewarditems = {
       {id = 3043, count = 55}
     },
     rewardexp = 45500000
   },
    [17] = {
     items = {
       {id = 32774, count = 5},
       {id = 10410, count = 50}
     },
     message = "Great, for your next mission you need to collect some items, I need",
     level = 250, -- minimum level voor this mission
     rewarditems = {
       {id = 3043, count = 50},
       {id = 20138, count = 5}
     },
     rewardexp = 56500000
   },
    [18] = {
     items = {
       {id = 25695, count = 35},
       {id = 10303, count = 10}
     },
     message = "Great, for your next mission you need to collect some items, I need",
     level = 250, -- minimum level voor this mission
     rewarditems = {
       {id = 8192, count = 50},
       {id = 3043, count = 60}
     },
     rewardexp = 66500000
   },
   [19] = {
     monsters = {
       {name = "Quara Pincher", count = 100, storage = 21912},
       {name = "Quara Mantassin", count = 150, storage = 21913}
     },
     message = "Thanks, for your next mission kill",
     level = 290,
     rewarditems = {
       {id = 3043, count = 80}
     },
     rewardexp = 55500000
   },
   [20] = {
     monsters = {
       {name = "Elder Wyrm", count = 150, storage = 21914},
       {name = "Wyrm", count = 200, storage = 21915}
     },
     message = "Thanks, for your next mission kill",
     level = 220,
     rewarditems = {
       {id = 22721, count = 5}
     },
     rewardexp = 58500000
   },
   [21] = {
     items = {
       {id = 14044, count = 30},
       {id = 5954, count = 50}
     },
     message = "Great, for your next mission you need to collect some items, I need",
     level = 250, -- minimum level voor this mission
     rewarditems = {
       {id = 19082, count = 2},
       {id = 3043, count = 55}
     },
     rewardexp = 56500000
   },
   [22] = {
     items = {
       {id = 12541, count = 5},
       {id = 27597, count = 15}
     },
     message = "Great, for your next mission you need to collect some items, I need",
     level = 250, -- minimum level voor this mission
     rewarditems = {
       {id = 3043, count = 50},
       {id = 22516, count = 5}
     },
     rewardexp = 56500000
   },
   [23] = {
     monsters = {
       {name = "Fury", count = 550, storage = 21916}
     },
     message = "Thanks, for your next mission kill",
     level = 250,
     rewarditems = {
       {id = 9586, count = 1}
     },
     rewardexp = 49500000
   },
   [24] = {
     monsters = {
       {name = "Juggernaut", count = 550, storage = 21917}
     },
     message = "Thanks, for your next mission kill",
     level = 150,
     rewarditems = {
       {id = 9586, count = 1}
     },
     rewardexp = 89500000
   },
   [25] = {
     items = {
       {id = 11658, count = 5},
       {id = 30005, count = 25}
     },
     message = "Great, for your next mission you need to collect some items, I need",
     level = 250, -- minimum level voor this mission
     rewarditems = {
       {id = 3043, count = 50},
       {id = 35572, count = 50}
     },
     rewardexp = 57500000
   },
   [26] = {
     items = {
       {id = 20063, count = 1},
       {id = 11465, count = 40}
     },
     message = "Great, for your next mission you need to collect some items, I need",
     level = 250, -- minimum level voor this mission
     rewarditems = {
       {id = 3043, count = 55},
       {id = 8192, count = 55}
     },
     rewardexp = 57500000
   },
   [27] = {
     monsters = {
       {name = "Undead Dragon", count = 250, storage = 21918},
       {name = "Lava Golem", count = 200, storage = 21919}
     },
     message = "Thanks, for your next mission kill",
     level = 350,
     rewarditems = {
       {id = 8176, count = 1}
     },
     rewardexp = 62500000
   },
   [28] = {
     monsters = {
       {name = "Blightwalker", count = 250, storage = 21920},
       {name = "Defiler", count = 200, storage = 21921}
     },
     message = "Thanks, for your next mission kill",
     level = 350,
     rewarditems = {
       {id = 19082, count = 2}
     },
     rewardexp = 72500000
   },
   [29] = {
     items = {
       {id = 18994, count = 50},
       {id = 11464, count = 45}
     },
     message = "Great, for your next mission you need to collect some items, I need",
     level = 300, -- minimum level voor this mission
     rewarditems = {
       {id = 3043, count = 60},
       {id = 8192, count = 50}
     },
     rewardexp = 58000000
   },
   [30] = {
     items = {
       {id = 23508, count = 55},
       {id = 10306, count = 45}
     },
     message = "Great, for your next mission you need to collect some items, I need",
     level = 300, -- minimum level voor this mission
     rewarditems = {
       {id = 3043, count = 55},
       {id = 22721, count = 5}
     },
     rewardexp = 58000000
   },
   [31] = {
     monsters = {
       {name = "Plaguesmith", count = 250, storage = 21922}
     },
     message = "Thanks, for your next mission kill",
     level = 350,
     rewarditems = {
       {id = 8176, count = 1}
     },
     rewardexp = 49500000
   },
   [32] = {
     monsters = {
       {name = "Dark Torturer", count = 250, storage = 21923}
     },
     message = "Thanks, for your next mission kill",
     level = 350,
     rewarditems = {
       {id = 8176, count = 1}
     },
     rewardexp = 59500000
   },
   [33] = {
     items = {
       {id = 28823, count = 35},
       {id = 25694, count = 45}
     },
     message = "Great, for your next mission you need to collect some items, I need",
     level = 300, -- minimum level voor this mission
     rewarditems = {
       {id = 3043, count = 60},
       {id = 9586, count = 1}
     },
     rewardexp = 48000000
   },
   [34] = {
     items = {
       {id = 5885, count = 1},
       {id = 20198, count = 55}
     },
     message = "Great, for your next mission you need to collect some items, I need",
     level = 300, -- minimum level voor this mission
     rewarditems = {
       {id = 3043, count = 65},
       {id = 22721, count = 5}
     },
     rewardexp = 58000000
   },
   [35] = {
     monsters = {
       {name = "Demon", count = 750, storage = 21924}
     },
     message = "Thanks, for your next mission kill",
     level = 350,
     rewarditems = {
       {id = 20138, count = 5}
     },
     rewardexp = 79500000
   },
    [36] = {
     monsters = {
       {name = "Hellfire Fighter", count = 250, storage = 21925},
       {name = "Hellhound", count = 200, storage = 21926}
     },
     message = "Thanks, for your next mission kill",
     level = 450,
     rewarditems = {
       {id = 3043, count = 50}
     },
     rewardexp = 52500000
   },
   [37] = {
     items = {
       {id = 9649, count = 55},
       {id = 9655, count = 45}
     },
     message = "Great, for your next mission you need to collect some items, I need",
     level = 400, -- minimum level voor this mission
     rewarditems = {
       {id = 3043, count = 55},
       {id = 19082, count = 2}
     },
     rewardexp = 69000000
   },
   [38] = {
     items = {
       {id = 8775, count = 45},
       {id = 21199, count = 2}
     },
     message = "Great, for your next mission you need to collect some items, I need",
     level = 400, -- minimum level voor this mission
     rewarditems = {
       {id = 3043, count = 50},
       {id = 8192, count = 55}
     },
     rewardexp = 67000000
   },
   [39] = {
     monsters = {
       {name = "Nightmare", count = 250, storage = 21927},
       {name = "Grim Reaper", count = 200, storage = 21928}
     },
     message = "Thanks, for your next mission kill",
     level = 450,
     rewarditems = {
       {id = 14112, count = 1},
	   {id = 3043, count = 10}
     },
     rewardexp = 72500000
   },
   [40] = {
     monsters = {
       {name = "Drillworm", count = 150, storage = 21929},
       {name = "Ghastly Dragon", count = 150, storage = 21930}
     },
     message = "Thanks, for your next mission kill",
     level = 450,
     rewarditems = {
       {id = 19082, count = 2},
	   {id = 14112, count = 1}
     },
     rewardexp = 42500000
   },
   [41] = {
     items = {
       {id = 11539, count = 25},
       {id = 16205, count = 1}
     },
     message = "Great, for your next mission you need to collect some items, I need",
     level = 400, -- minimum level voor this mission
     rewarditems = {
       {id = 3043, count = 65},
       {id = 9586, count = 1}
     },
     rewardexp = 65000000
   },
   [42] = {
     items = {
       {id = 28824, count = 1},
       {id = 18926, count = 5}
     },
     message = "Great, for your next mission you need to collect some items, I need",
     level = 440, -- minimum level voor this mission
     rewarditems = {
       {id = 3043, count = 55},
       {id = 19082, count = 2}
     },
     rewardexp = 75000000
   },
   [43] = {
     items = {
       {id = 4839, count = 30},
       {id = 10282, count = 25}
     },
     message = "Great, for your next mission you need to collect some items, I need",
     level = 400, -- minimum level voor this mission
     rewarditems = {
       {id = 3043, count = 50},
       {id = 8192, count = 65}
     },
     rewardexp = 66000000
   },
   [44] = {
     monsters = {
       {name = "Hellspawn", count = 180, storage = 21931},
       {name = "Silencer", count = 160, storage = 21932}
     },
     message = "Thanks, for your next mission kill",
     level = 450,
     rewarditems = {
       {id = 8176, count = 1},
	   {id = 3043, count = 35}
     },
     rewardexp = 72500000
   },
   [45] = {
     monsters = {
       {name = "Frost Dragon", count = 550, storage = 21933}
     },
     message = "Thanks, for your next mission kill",
     level = 450,
     rewarditems = {
       {id = 22721, count = 5},
	   {id = 3043, count = 75}
     },
     rewardexp = 61500000
   },
   [46] = {
     items = {
       {id = 18929, count = 25},
       {id = 32773, count = 15}
     },
     message = "Great, for your next mission you need to collect some items, I need",
     level = 100, -- minimum level voor this mission
     rewarditems = {
       {id = 3043, count = 75},
       {id = 20138, count = 2}
     },
     rewardexp = 66000000
   },
   [47] = {
     items = {
       {id = 31441, count = 35},
       {id = 31442, count = 45}
     },
     message = "Great, for your next mission you need to collect some items, I need",
     level = 400, -- minimum level voor this mission
     rewarditems = {
       {id = 3043, count = 75},
       {id = 35572, count = 25}
     },
     rewardexp = 65000000
   },
   [48] = {
     items = {
       {id = 36785, count = 25},
       {id = 36786, count = 25}
     },
     message = "Great, for your next mission you need to collect some items, I need",
     level = 400, -- minimum level voor this mission
     rewarditems = {
       {id = 3043, count = 44},
       {id = 14112, count = 1}
     },
     rewardexp = 54000000
   },
   [49] = {
     monsters = {
       {name = "Terrorsleep", count = 350, storage = 21934}
     },
     message = "Thanks, for your next mission kill",
     level = 450,
     rewarditems = {
       {id = 9586, count = 1},
	   {id = 3043, count = 55}
     },
     rewardexp = 71500000
   },
   [50] = {
     monsters = {
       {name = "Demon Outcast", count = 350, storage = 21935}
     },
     message = "Thanks, for your next mission kill",
     level = 450,
     rewarditems = {
       {id = 22516, count = 5},
	   {id = 3043, count = 55}
     },
     rewardexp = 81500000
   },
   [51] = {
     items = {
       {id = 36771, count = 25},
       {id = 34160, count = 5}
     },
     message = "Great, for your next mission you need to collect some items, I need",
     level = 400, -- minimum level voor this mission
     rewarditems = {
       {id = 3043, count = 55},
       {id = 19082, count = 4}
     },
     rewardexp = 64000000
   },
   [52] = {
     items = {
       {id = 11489, count = 30},
       {id = 12517, count = 30}
     },
     message = "Great, for your next mission you need to collect some items, I need",
     level = 400, -- minimum level voor this mission
     rewarditems = {
       {id = 3043, count = 50},
       {id = 35572, count = 25}
     },
     rewardexp = 64500000
   },
   [53] = {
     monsters = {
       {name = "Worker Golem", count = 280, storage = 21936},
       {name = "War Golem", count = 260, storage = 21937}
     },
     message = "Thanks, for your next mission kill",
     level = 450,
     rewarditems = {
       {id = 8176, count = 1},
	   {id = 3043, count = 56}
     },
     rewardexp = 62500000
   },
   [54] = {
     monsters = {
       {name = "Deepling Guard", count = 250, storage = 21938},
       {name = "Deepling Warrior", count = 200, storage = 21939}
     },
     message = "Thanks, for your next mission kill",
     level = 450,
     rewarditems = {
       {id = 8192, count = 50},
	   {id = 3043, count = 75}
     },
     rewardexp = 72500000
   },
   [55] = {
     items = {
       {id = 21193, count = 35},
       {id = 11474, count = 5}
     },
     message = "Great, for your next mission you need to collect some items, I need",
     level = 400, -- minimum level voor this mission
     rewarditems = {
       {id = 3043, count = 55},
       {id = 35572, count = 25}
     },
     rewardexp = 53500000
   },
   [56] = {
     items = {
       {id = 37613, count = 1},
       {id = 37810, count = 1}
     },
     message = "Great, for your next mission you need to collect some items, I need",
     level = 500, -- minimum level voor this mission
     rewarditems = {
       {id = 14112, count = 10},
       {id = 9586, count = 1}
     },
     rewardexp = 63500000
   },
   [57] = {
     monsters = {
       {name = "Draken Abomination", count = 350, storage = 21940},
       {name = "Draken Spellweaver", count = 250, storage = 21941}
     },
     message = "Thanks, for your next mission kill",
     level = 450,
     rewarditems = {
       {id = 8192, count = 55},
	   {id = 3043, count = 55}
     },
     rewardexp = 82500000
   },
   [58] = {
     monsters = {
       {name = "Lizard High Guard", count = 350, storage = 21942},
       {name = "Lizard Zaogun", count = 250, storage = 21943}
     },
     message = "Thanks, for your next mission kill",
     level = 550,
     rewarditems = {
       {id = 20138, count = 4},
	   {id = 3043, count = 55}
     },
     rewardexp = 62500000
   },
   [59] = {
     items = {
       {id = 22188, count = 25},
       {id = 22189, count = 35}
     },
     message = "Great, for your next mission you need to collect some items, I need",
     level = 400, -- minimum level voor this mission
     rewarditems = {
       {id = 3043, count = 55},
       {id = 8176, count = 1}
     },
     rewardexp = 73500000
   },
   [60] = {
     items = {
       {id = 5808, count = 1},
       {id = 5943, count = 1}
     },
     message = "Great, for your next mission you need to collect some items, I need",
     level = 500, -- minimum level voor this mission
     rewarditems = {
       {id = 14112, count = 5},
       {id = 8176, count = 1}
     },
     rewardexp = 63500000
   },
   [61] = {
     monsters = {
       {name = "Orc Berserker", count = 250, storage = 21944},
       {name = "Orc Warlord", count = 150, storage = 21945}
     },
     message = "Thanks, for your next mission kill",
     level = 450,
     rewarditems = {
       {id = 35572, count = 55},
	   {id = 3043, count = 54}
     },
     rewardexp = 32500000
   },
   [62] = {
     monsters = {
       {name = "Ancient Scarab", count = 250, storage = 21946},
       {name = "Crazed Winter Vanguard", count = 250, storage = 21947}
     },
     message = "Thanks, for your next mission kill",
     level = 450,
     rewarditems = {
       {id = 11468, count = 1},
	   {id = 3043, count = 55}
     },
     rewardexp = 72500000
   },
   [63] = {
     items = {
       {id = 22729, count = 25},
       {id = 6540, count = 1}
     },
     message = "Great, for your next mission you need to collect some items, I need",
     level = 500, -- minimum level voor this mission
     rewarditems = {
       {id = 3043, count = 55},
       {id = 9586, count = 1}
     },
     rewardexp = 63500000
   },
   [64] = {
     items = {
       {id = 9641, count = 50},
       {id = 11484, count = 100}
     },
     message = "Great, for your next mission you need to collect some items, I need",
     level = 440, -- minimum level voor this mission
     rewarditems = {
       {id = 3043, count = 55},
       {id = 8192, count = 45}
     },
     rewardexp = 83500000
   },
   [65] = {
     monsters = {
       {name = "Crawler", count = 250, storage = 21948},
       {name = "Waspoid", count = 200, storage = 21949}
     },
     message = "Thanks, for your next mission kill",
     level = 450,
     rewarditems = {
       {id = 5907, count = 1},
	   {id = 3043, count = 55}
     },
     rewardexp = 72500000
   },
   [66] = {
     monsters = {
       {name = "Sparkion", count = 220, storage = 21950},
       {name = "Breach Brood", count = 190, storage = 21951}
     },
     message = "Thanks, for your next mission kill",
     level = 450,
     rewarditems = {
       {id = 35572, count = 44},
	   {id = 3043, count = 55}
     },
     rewardexp = 82500000
   },
   [67] = {
     monsters = {
       {name = "Dread Intruder", count = 220, storage = 21952},
       {name = "Reality Reaver", count = 100, storage = 21953}
     },
     message = "Thanks, for your next mission kill",
     level = 450,
     rewarditems = {
       {id = 19082, count = 2},
	   {id = 3043, count = 44}
     },
     rewardexp = 82500000
   },
   [68] = {
     items = {
       {id = 29345, count = 50},
       {id = 31354, count = 5}
     },
     message = "Great, for your next mission you need to collect some items, I need",
     level = 500, -- minimum level voor this mission
     rewarditems = {
       {id = 3043, count = 55},
       {id = 8192, count = 44}
     },
     rewardexp = 82500000
   },
   [69] = {
     items = {
       {id = 6561, count = 1},
       {id = 29346, count = 45}
     },
     message = "Great, for your next mission you need to collect some items, I need",
     level = 500, -- minimum level voor this mission
     rewarditems = {
       {id = 3043, count = 55},
       {id = 20138, count = 5}
     },
     rewardexp = 83500000
   },
   [70] = {
     monsters = {
       {name = "Sight Of Surrender", count = 150, storage = 21954},
       {name = "crazed winter rearguard", count = 300, storage = 21955}
     },
     message = "Thanks, for your next mission kill",
     level = 550,
     rewarditems = {
       {id = 9586, count = 1},
	   {id = 3043, count = 65}
     },
     rewardexp = 112500000
   },
   [71] = {
     monsters = {
       {name = "Midnight Asura", count = 650, storage = 21956},
       {name = "Dawnfire Asura", count = 700, storage = 21957}
     },
     message = "Thanks, for your next mission kill",
     level = 550,
     rewarditems = {
       {id = 8176, count = 1},
	   {id = 3043, count = 54}
     },
     rewardexp = 92500000
   },
   [72] = {
     items = {
       {id = 23986, count = 15},
       {id = 34100, count = 1}
     },
     message = "Great, for your next mission you need to collect some items, I need",
     level = 400, -- minimum level voor this mission
     rewarditems = {
       {id = 3043, count = 55},
       {id = 22721, count = 10}
     },
     rewardexp = 85500000
   },
   [73] = {
     items = {
       {id = 22721, count = 5},
	   {id = 22516, count = 5},
       {id = 35572, count = 25}
     },
     message = "Great, for your next mission you need to collect some items, I need",
     level = 400, -- minimum level voor this mission
     rewarditems = {
       {id = 14112, count = 5},
       {id = 19082, count = 5}
     },
     rewardexp = 76500000
   },
   [74] = {
     monsters = {
       {name = "flimsy lost soul", count = 500, storage = 21958}
     },
     message = "Thanks, for your next mission kill",
     level = 550,
     rewarditems = {
       {id = 19082, count = 2},
	   {id = 14112, count = 2}
     },
     rewardexp = 91100000
   },
   [75] = {
     monsters = {
	   {name = "Freakish Lost Soul", count = 460, storage = 21959},
       {name = "Mean Lost Soul", count = 470, storage = 21960}
     },
     message = "Thanks, for your next mission kill",
     level = 550,
     rewarditems = {
       {id = 19082, count = 2},
	   {id = 14112, count = 2}
     },
     rewardexp = 101100000
   },
   [76] = {
     items = {
       {id = 32703, count = 25},
	   {id = 32774, count = 5},
       {id = 32698, count = 5}
     },
     message = "Great, for your next mission you need to collect some items, I need",
     level = 500, -- minimum level voor this mission
     rewarditems = {
       {id = 14112, count = 2},
       {id = 19082, count = 5}
     },
     rewardexp = 96500000
   },
   [77] = {
     items = {
       {id = 34146, count = 25},
	   {id = 34139, count = 15},
       {id = 32703, count = 55}
     },
     message = "Great, for your next mission you need to collect some items, I need",
     level = 500, -- minimum level voor this mission
     rewarditems = {
       {id = 14112, count = 2},
       {id = 19082, count = 5}
     },
     rewardexp = 105500000
   },
   [78] = {
     monsters = {
	   {name = "True Dawnfire Asura", count = 560, storage = 21961},
	   {name = "True Midnight Asura", count = 550, storage = 21962},
       {name = "True Frost Flower Asura", count = 570, storage = 21963}
     },
     message = "Thanks, for your next mission kill",
     level = 650,
     rewarditems = {
       {id = 8176, count = 1},
	   {id = 14112, count = 2}
     },
     rewardexp = 121100000
   },
   [79] = {
     monsters = {
	   {name = "Brachiodemon", count = 415, storage = 21964},
	   {name = "Infernal Demon", count = 415, storage = 21965},
	   {name = "Infernal Phantom", count = 415, storage = 21966},
       {name = "Branchy Crawler", count = 415, storage = 21967}
     },
     message = "Thanks, for your next mission kill",
     level = 550,
     rewarditems = {
       {id = 14112, count = 5},
	   {id = 20138, count = 2}
     },
     rewardexp = 151100000
   },
   [80] = {
     monsters = {
	   {name = "Cobra Scout", count = 530, storage = 21968},
       {name = "Cobra Assassin", count = 590, storage = 21969}
     },
     message = "Thanks, for your next mission kill",
     level = 550,
     rewarditems = {
       {id = 8176, count = 1},
	   {id = 14112, count = 2}
     },
     rewardexp = 101100000
   },
   [81] = {
     items = {
       {id = 34148, count = 35},
	   {id = 34141, count = 35},
       {id = 3036, count = 135}
     },
     message = "Great, for your next mission you need to collect some items, I need",
     level = 600, -- minimum level voor this mission
     rewarditems = {
       {id = 14112, count = 2},
       {id = 8192, count = 25}
     },
     rewardexp = 89500000
   },
   [82] = {
     items = {
       {id = 34145, count = 50},
	   {id = 34138, count = 35},
       {id = 32703, count = 25}
     },
     message = "Great, for your next mission you need to collect some items, I need",
     level = 700, -- minimum level voor this mission
     rewarditems = {
       {id = 19082, count = 5},
       {id = 8176, count = 1}
     },
     rewardexp = 95500000
   },
   [83] = {
     monsters = {
	   {name = "Mould Phantom", count = 590, storage = 21970},
       {name = "Rotten Golem", count = 550, storage = 21971}
     },
     message = "Thanks, for your next mission kill",
     level = 750,
     rewarditems = {
       {id = 19082, count = 5},
	   {id = 8192, count = 30}
     },
     rewardexp = 104100000
   },
   [84] = {
     monsters = {
	   {name = "Animated Feather", count = 590, storage = 21972},
       {name = "Rage Squid", count = 550, storage = 21973}
     },
     message = "Thanks, for your next mission kill",
     level = 750,
     rewarditems = {
       {id = 8192, count = 25},
	   {id = 14112, count = 2}
     },
     rewardexp = 124100000
   },
   [85] = {
     monsters = {
	   {name = "Icecold Book", count = 520, storage = 21974},
       {name = "Burning Book", count = 590, storage = 21975}
     },
     message = "Thanks, for your next mission kill",
     level = 750,
     rewarditems = {
       {id = 14112, count = 2},
	   {id = 19082, count = 5}
     },
     rewardexp = 151000000
   },
   [86] = {
     items = {
       {id = 34147, count = 50},
	   {id = 34140, count = 35},
       {id = 32703, count = 35}
     },
     message = "Great, for your next mission you need to collect some items, I need",
     level = 700, -- minimum level voor this mission
     rewarditems = {
       {id = 14112, count = 2},
       {id = 19082, count = 5}
     },
     rewardexp = 115500000
   },
   [87] = {
     monsters = {
       {name = "Bony Sea Devil", count = 715, storage = 21976}
     },
     message = "Thanks, for your next mission kill",
     level = 750,
     rewarditems = {
       {id = 14112, count = 2},
	   {id = 19082, count = 2}
     },
     rewardexp = 85100000
   },
   [88] = {
     monsters = {
	   {name = "Capricious Phantom", count = 550, storage = 21977},
       {name = "Turbulent Elemental", count = 570, storage = 21978}
     },
     message = "Thanks, for your next mission kill",
     level = 770,
     rewarditems = {
       {id = 14112, count = 5},
	   {id = 8192, count = 40}
     },
     rewardexp = 125100000
   },
   [89] = {
     monsters = {
	   {name = "Cloak Of Terror", count = 550, storage = 21979},
       {name = "Courage Leech", count = 530, storage = 21980}
     },
     message = "Thanks, for your next mission kill",
     level = 750,
     rewarditems = {
       {id = 14112, count = 5},
	   {id = 8192, count = 40}
     },
     rewardexp = 135100000
   },
   [90] = {
     items = {
       {id = 34149, count = 50},
	   {id = 34142, count = 35},
       {id = 32703, count = 35}
     },
     message = "Great, for your next mission you need to collect some items, I need",
     level = 700, -- minimum level voor this mission
     rewarditems = {
       {id = 14112, count = 5},
       {id = 19082, count = 5}
     },
     rewardexp = 105500000
   },
   [91] = {
     monsters = {
	   {name = "Distorted Phantom", count = 550, storage = 21981},
       {name = "Many Faces", count = 530, storage = 21982}
     },
     message = "Thanks, for your next mission kill",
     level = 750,
     rewarditems = {
       {id = 8192, count = 50},
	   {id = 14112, count = 5}
     },
     rewardexp = 95100000
   },
   [92] = {
     monsters = {
	   {name = "Tunnel Tyrant", count = 550, storage = 21983}
     },
     message = "Thanks, for your next mission kill",
     level = 750,
     rewarditems = {
       {id = 8192, count = 50},
	   {id = 14112, count = 5}
     },
     rewardexp = 85100000
   },
   [93] = {
     monsters = {
	   {name = "Girtablilu Warrior", count = 750, storage = 21984}
     },
     message = "Thanks, for your next mission kill",
     level = 750,
     rewarditems = {
       {id = 8192, count = 50},
	   {id = 14112, count = 2}
     },
     rewardexp = 115100000
   },
   [94] = {
     items = {
       {id = 36820, count = 200},
	   {id = 36821, count = 130},
       {id = 36823, count = 125}
     },
     message = "Great, for your next mission you need to collect some items, I need",
     level = 300, -- minimum level voor this mission
     rewarditems = {
       {id = 14112, count = 2},
       {id = 35572, count = 25}
     },
     rewardexp = 98500000
   },
   [95] = {
     monsters = {
	   {name = "Vexclaw", count = 630, storage = 21985}
     },
     message = "Thanks, for your next mission kill",
     level = 650,
     rewarditems = {
       {id = 14112, count = 3},
	   {id = 8176, count = 1}
     },
     rewardexp = 125100000
   },
   [96] = {
     monsters = {
	   {name = "Hellflayer", count = 620, storage = 21986}
     },
     message = "Thanks, for your next mission kill",
     level = 650,
     rewarditems = {
       {id = 14112, count = 3},
	   {id = 19082, count = 2}
     },
     rewardexp = 151000000
   },
   [97] = {
     monsters = {
	   {name = "Juvenile Bashmu", count = 500, storage = 21987}
     },
     message = "Thanks, for your next mission kill",
     level = 650,
     rewarditems = {
       {id = 19082, count = 2},
	   {id = 14112, count = 3}
     },
     rewardexp = 125100000
   },
   [98] = {
     items = {
       {id = 17818, count = 125},
       {id = 17817, count = 125}
     },
     message = "Great, for your next mission you need to collect some items, I need",
     level = 600, -- minimum level voor this mission
     rewarditems = {
       {id = 14112, count = 2},
       {id = 19082, count = 2}
     },
     rewardexp = 97500000
   },
   [99] = {
     monsters = {
	   {name = "Feversleep", count = 600, storage = 21988}
     },
     message = "Thanks, for your next mission kill",
     level = 750,
     rewarditems = {
       {id = 14112, count = 2},
	   {id = 8192, count = 40}
     },
     rewardexp = 125100000
   },
   [100] = {
     monsters = {
	   {name = "Burster Spectre", count = 500, storage = 21989}
     },
     message = "Thanks, for your next mission kill",
     level = 750,
     rewarditems = {
       {id = 14112, count = 2},
	   {id = 8192, count = 40}
     },
     rewardexp = 145100000
   },
   [101] = {
     monsters = {
	   {name = "Gazer Spectre", count = 500, storage = 21990}
     },
     message = "Thanks, for your next mission kill",
     level = 750,
     rewarditems = {
       {id = 14112, count = 2},
	   {id = 8192, count = 40}
     },
     rewardexp = 151000000
   },
   [102] = {
     monsters = {
	   {name = "Floating Savant", count = 300, storage = 21991}
     },
     message = "Thanks, for your next mission kill",
     level = 650,
     rewarditems = {
       {id = 14112, count = 2},
	   {id = 8176, count = 1}
     },
     rewardexp = 145100000
   },
   [103] = {
     monsters = {
	   {name = "Ripper Spectre", count = 500, storage = 21992}
     },
     message = "Thanks, for your next mission kill",
     level = 750,
     rewarditems = {
       {id = 19082, count = 3},
	   {id = 8192, count = 40}
     },
     rewardexp = 135100000
   },
   [104] = {
     items = {
       {id = 3060, count = 125},
       {id = 3062, count = 125}
     },
     message = "Great, for your next mission you need to collect some items, I need",
     level = 700, -- minimum level voor this mission
     rewarditems = {
       {id = 8192, count = 50},
       {id = 14112, count = 2}
     },
     rewardexp = 126500000
   },
   [105] = {
     items = {
       {id = 11444, count = 145},
	   {id = 11443, count = 130},
       {id = 3602, count = 125}
     },
     message = "Great, for your next mission you need to collect some items, I need",
     level = 500, -- minimum level voor this mission
     rewarditems = {
       {id = 14112, count = 2},
       {id = 8176, count = 1}
     },
     rewardexp = 128500000
   },
   [106] = {
     monsters = {
	   {name = "Fury", count = 350, storage = 21993}
     },
     message = "Thanks, for your next mission kill",
     level = 550,
     rewarditems = {
       {id = 14112, count = 2},
	   {id = 8192, count = 40}
     },
     rewardexp = 115100000
   },
   [107] = {
     monsters = {
	   {name = "Senador Dark Torturer", count = 750, storage = 21994}
     },
     message = "Thanks, for your next mission kill",
     level = 850,
     rewarditems = {
       {id = 8176, count = 1},
	   {id = 8192, count = 40}
     },
     rewardexp = 115100000
   },
   [108] = {
     monsters = {
	   {name = "Cockroach", count = 600, storage = 21995}
     },
     message = "Thanks, for your next mission kill",
     level = 850,
     rewarditems = {
       {id = 8176, count = 1},
	   {id = 8192, count = 50}
     },
     rewardexp = 95100000
   },
   [109] = {
     monsters = {
	   {name = "Demon 22", count = 700, storage = 21996}
     },
     message = "Great, for your next mission you need to collect some items, I need",
     level = 850,
     rewarditems = {
       {id = 8176, count = 1},
	   {id = 9586, count = 1}
     },
     rewardexp = 95100000
   },
   [110] = {
     items = {
       {id = 10308, count = 145},
	   {id = 12737, count = 1},
       {id = 14011, count = 115}
     },
     message = "Great, for your next mission you need to collect some items, I need",
     level = 600, -- minimum level voor this mission
     rewarditems = {
       {id = 35572, count = 50},
       {id = 8192, count = 10}
     },
     rewardexp = 118500000
   },
   [111] = {
     items = {
       {id = 12730, count = 100},
	   {id = 14010, count = 130},
       {id = 14044, count = 50}
     },
     message = "Thanks, for your next mission kill.",
     level = 600, -- minimum level voor this mission
     rewarditems = {
       {id = 22721, count = 10},
       {id = 14112, count = 5}
     },
     rewardexp = 98500000
   },
   
   [112] = {
     monsters = {
	   {name = "Temer Fury", count = 650, storage = 21997},
       {name = "Dilma Grimeleech", count = 650, storage = 21998}
     },
     message = "Thanks, for your next mission kill.",
     level = 850,
     rewarditems = {
       {id = 8176, count = 1},
	   {id = 8192, count = 50}
     },
     rewardexp = 170000000
   },
   [113] = {
     monsters = {
	   {name = "Hellflayer Sem Dedo", count = 735, storage = 21999},
       {name = "Hellhound 9 Dedo", count = 720, storage = 22000}
     },
     message = "Thanks, for your next mission kill.",
     level = 850,
     rewarditems = {
       {id = 20138, count = 5},
	   {id = 8192, count = 100}
     },
     rewardexp = 170000000
   },
   [114] = {
     monsters = {
	   {name = "Bozo Infernal Demon", count = 820, storage = 22001},
       {name = "Juggernaut Moura", count = 520, storage = 22002}
     },
     message = "Thanks, for your next mission kill.",
     level = 850,
     rewarditems = {
       {id = 9586, count = 1},
	   {id = 33982, count = 1}
     },
     rewardexp = 170000000
   },
   [115] = {
     monsters = {
	   {name = "Many Meu Chapa", count = 850, storage = 22003},
       {name = "Vex Claw", count = 855, storage = 22004}
     },
     message = "Good, now your final mission.",
     level = 950,
     rewarditems = {
       {id = 23488, count = 1},
	   {id = 9586, count = 1}
     },
     rewardexp = 170000000
   }
}

local storage = 45551

local function getItemsMonstersFromTable(imtable)
     local text = ""
     for v = 1, #imtable do
         local ret = ", "
         if v == 1 then
             ret = ""
         elseif v == #imtable then
             ret = " and "
         end
         text = text .. ret
         count = imtable[v].count
         if imtable[v].id then
             info = ItemType(imtable[v].id)
             text = text .. (count > 1 and count or info:getArticle()).." "..(count > 1 and info:getPluralName() or info:getName())
         else
             text = text .. count .." "..imtable[v].name
         end
     end
     return text
end

local function creatureSayCallback(npc, creature, type, message)
	local player = Player(creature)
	local playerId = player:getId()

	if not npcHandler:checkInteraction(npc, creature) then
		return false
	end
     local x = missions[player:getStorageValue(storage)]

     if MsgContains(message, 'mission') or MsgContains(message, 'quest') then
         if player:getStorageValue(storage) == -1 then
             npcHandler:say("I have several missions for you, do you accept the challenge?", npc, creature)
             npcHandler:setTopic(playerId, 1)
         elseif x then
             if player:getLevel() >= x.level then
                 npcHandler:say("Did you "..(x.items and "get "..getItemsMonstersFromTable(x.items) or "kill "..getItemsMonstersFromTable(x.monsters)).."?", npc, creature)
                 npcHandler:setTopic(playerId, 1)
             else
                 npcHandler:say("The mission I gave you is for level "..x.level..", come back later.", npc, creature)
             end
         else
             npcHandler:say("You already did all the missions, great job though.", npc, creature)
             npcHandler:releaseFocus(npc, creature)
         end
     elseif MsgContains(message, 'yes') and npcHandler:getTopic(playerId) == 1 then
         if player:getStorageValue(storage) == -1 then
             player:setStorageValue(storage, 1)
             local x = missions[player:getStorageValue(storage)]
             npcHandler:say(x.message.." "..getItemsMonstersFromTable(x.items or x.monsters)..".", npc, creature)
         elseif x then
             local imtable = x.items or x.monsters
             local amount = 0
             for it = 1, #imtable do
                 local check = x.items and player:getItemCount(imtable[it].id) or player:getStorageValue(imtable[it].storage)
                 if check >= imtable[it].count then
                     amount = amount + 1
                 end
             end
             if amount == #imtable then
                 if x.items then
                     for it = 1, #x.items do
                         player:removeItem(x.items[it].id, x.items[it].count)
                     end
                 end
                 if x.rewarditems then
                     for r = 1, #x.rewarditems do
                         player:addItem(x.rewarditems[r].id, x.rewarditems[r].count)
                     end
                     player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You received "..getItemsMonstersFromTable(x.rewarditems)..".")
                 end
                 if x.rewardexp then
                     player:addExperience(x.rewardexp)
                     player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You received "..x.rewardexp.." experience.")
                 end
                 player:setStorageValue(storage, player:getStorageValue(storage) + 1)
                 local x = missions[player:getStorageValue(storage)]
                 if x then
                     npcHandler:say(x.message.." "..getItemsMonstersFromTable(x.items or x.monsters)..".", npc, creature)
                 else
                     npcHandler:say("Well done! You did a great job on all your missions.", npc, creature)
                 end
             else
                 local n = 0
                 for i = 1, #imtable do
                     local check = x.items and player:getItemCount(imtable[i].id) or player:getStorageValue(imtable[i].storage)
                     if check < imtable[i].count then
                         n = n + 1
                     end
                 end
                 local text = ""
                 local c = 0
                 for v = 1, #imtable do
                     local check = x.items and player:getItemCount(imtable[v].id) or player:getStorageValue(imtable[v].storage)
                     if check < imtable[v].count then
                         c = c + 1
                         local ret = ", "
                         if c == 1 then
                             ret = ""
                         elseif c == n then
                             ret = " and "
                         end
                         text = text .. ret
                         if x.items then
                             local count, info = imtable[v].count - player:getItemCount(imtable[v].id), ItemType(imtable[v].id)
                             text = text .. (count > 1 and count or info:getArticle()).." "..(count > 1 and info:getPluralName() or info:getName())
                         else
                             local count = imtable[v].count - (player:getStorageValue(imtable[v].storage) + 1)
                             text = text .. count.." "..imtable[v].name
                         end
                     end
                 end
                 npcHandler:say(x.items and "You don't have all items, you still need to get "..text.."." or "You didn't kill all monsters, you still need to kill "..text..".", npc, creature)
             end
         end
         npcHandler:setTopic(playerId, 0)
     elseif MsgContains(message, 'no') and npcHandler:getTopic(playerId) == 1 then
         npcHandler:say("Oh well, I guess not then.", npc, creature)
         npcHandler:setTopic(playerId, 0)
     end
     return true
end

npcHandler:setMessage(MESSAGE_GREET, 'Hello |PLAYERNAME|. You are probably eager to enter the {mission}.')

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setCallback(CALLBACK_ON_TRADE_REQUEST, onTradeRequest)
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)
-- On check npc shop message (look item)
npcType.onCheckItem = function(npc, player, clientId, subType)
end

npcType:register(npcConfig)
