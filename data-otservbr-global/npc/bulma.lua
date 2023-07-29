local internalNpcName = "Bulma"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 150
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 1456,
	lookHead = 85,
	lookBody = 7,
	lookLegs = 12,
	lookFeet = 19,
	lookAddons = 2,
	lookMount = 376
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

npcConfig.shop = {
	{ itemName = "ankh", clientId = 3077, buy = 31000 },
	{ itemName = "ape fur", clientId = 5883, buy = 21200 },
	{ itemName = "banana staff", clientId = 3348, buy = 100000 },
	{ itemName = "bat wing", clientId = 5894, buy = 21500 },
	{ itemName = "bear paw", clientId = 5896, buy = 21000 },
	{ itemName = "behemoth claw", clientId = 5930, buy = 32000 },
	{ itemName = "blue piece of cloth", clientId = 5912, buy = 22000 },
	{ itemName = "bonelord eye", clientId = 5898, buy = 38000 },
	{ itemName = "brown piece of cloth", clientId = 5913, buy = 21000 },
	{ itemName = "chicken feather", clientId = 5890, buy = 33000 },
	{ itemName = "demon dust", clientId = 5526, buy = 43000 },
	{ itemName = "enchanted chicken wing", clientId = 5891, buy = 8200000 },
	{ itemName = "demonic essence", clientId = 6499, buy = 11000 },
	{ itemName = "fish fin", clientId = 5895, buy = 15000 },
	{ itemName = "flask of warrior's sweat", clientId = 5885, buy = 1000000 },
	{ itemName = "eye patch", clientId = 6098, buy = 35000 },
	{ itemName = "green piece of cloth", clientId = 5910, buy = 20000 },
	{ itemName = "hardened bone", clientId = 5925, buy = 27000 },
	{ itemName = "heaven blossom", clientId = 3657, buy = 35000 },
	{ itemName = "holy orchid", clientId = 5922, buy = 39000 },
	{ itemName = "honeycomb", clientId = 5902, buy = 34000 },
	{ itemName = "iron ore", clientId = 5880, buy = 35000 },
	{ itemName = "hook", clientId = 6097, buy = 36000 },
	{ itemName = "huge chunk of crude iron", clientId = 5892, buy = 250000 },
	{ itemName = "lizard leather", clientId = 5876, buy = 31500 },
	{ itemName = "lizard scale", clientId = 5881, buy = 31200 },
	{ itemName = "magic sulphur", clientId = 5904, buy = 48000 },
	{ itemName = "minotaur leather", clientId = 5878, buy = 28000 },
	{ itemName = "perfect behemoth fang", clientId = 5893, buy = 42500 },
	{ itemName = "peg leg", clientId = 6126, buy = 42500 },
	{ itemName = "piece of draconian steel", clientId = 5889, buy = 350000 },
	{ itemName = "piece of hell steel", clientId = 5888, buy = 320000 },
	{ itemName = "piece of royal steel", clientId = 5887, buy = 313500 },
	
	
	{ itemName = "red dragon leather", clientId = 5948, buy = 44200 },
	{ itemName = "red dragon scale", clientId = 5882, buy = 44200 },
	{ itemName = "red piece of cloth", clientId = 5911, buy = 43000 },
	
	{ itemName = "shard", clientId = 7290, buy = 31300 },
	
	{ itemName = "sniper gloves", clientId = 5875, buy = 635000 },
	{ itemName = "spider silk", clientId = 5879, buy = 41000 },
	{ itemName = "spirit container", clientId = 5884, buy = 540000 },
	{ itemName = "spool of yarn", clientId = 5886, buy = 1200000 },
	{ itemName = "turtle shell", clientId = 5899, buy = 59000 },
	{ itemName = "tribal mask", clientId = 3403, buy = 100000},
	{ itemName = "vampire dust", clientId = 5905, buy = 51000 },
	{ itemName = "white piece of cloth", clientId = 5909, buy = 21000 },
	{ itemName = "wolf paw", clientId = 5897, buy = 27000 },
	{ itemName = "yellow piece of cloth", clientId = 5914, buy = 31500 }
}
-- On buy npc shop message
npcType.onBuyItem = function(npc, player, itemId, subType, amount, ignore, inBackpacks, totalCost)
	npc:sellItem(player, itemId, amount, subType, 0, ignore, inBackpacks)
end
-- On sell npc shop message
npcType.onSellItem = function(npc, player, itemId, subtype, amount, ignore, name, totalCost)
	player:sendTextMessage(MESSAGE_INFO_DESCR, string.format("Sold %ix %s for %i gold.", amount, name, totalCost))
end
-- On check npc shop message (look item)
npcType.onCheckItem = function(npc, player, clientId, subType)
end

local function creatureSayCallback(npc, creature, type, message)
	local player = Player(creature)
	local playerId = player:getId()

	if not npcHandler:checkInteraction(npc, creature) then
		return false
	end

	if MsgContains(message, "name") then
		return npcHandler:say("Me Bulma.", npc, creature)
	elseif MsgContains(message, "job") then
		return npcHandler:say("Tje hari ku ne finjala. {Ariki}?", npc, creature)
	elseif MsgContains(message, "passage") then
		return npcHandler:say("Soso yana. <shakes his head>", npc, creature)
	end
	return true
end

npcHandler:setMessage(MESSAGE_FAREWELL, "Si, jema ze harun. <waves>")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

npcType:register(npcConfig)
