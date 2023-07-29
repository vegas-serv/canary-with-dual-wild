local internalNpcName = "Master Pikeno"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 128,
	lookHead = 116,
	lookBody = 39,
	lookLegs = 12,
	lookFeet = 97,
	lookAddons = 2
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

local function creatureSayCallback(npc, creature, type, message)
	local player = Player(creature)
	local playerId = player:getId()

	if not npcHandler:checkInteraction(npc, creature) then
		return false
	end

	if MsgContains(message, 'arena') then
		npcHandler:say('We can bring you to arena with one of our coaches for 200 pirate coins. Are you interested?', npc, creature)
		npcHandler:setTopic(playerId, 1)
	elseif isInArray({'rent', 'horses'}, message) then
		npcHandler:say('Do you want to rent a horse for one day at a price of 500 gold?', npc, creature)
		npcHandler:setTopic(playerId, 2)
	elseif MsgContains(message, 'yes') then
		local player = Player(creature)
		if npcHandler:getTopic(playerId) == 1 then
			if player:isPzLocked() then
				npcHandler:say('First get rid of those blood stains!', npc, creature)
				return true
			end

			if not player:removeItem(35572, 200) then
				npcHandler:say('You don\'t have enough item.', npc, creature)
				return true
			end

			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			local destination = Position(17459, 17339, 8)
			player:teleportTo(destination)
			destination:sendMagicEffect(CONST_ME_TELEPORT)
			npcHandler:say('Have a nice trip!', npc, creature)
		elseif npcHandler:getTopic(playerId) == 2 then
			if player:getStorageValue(Storage.RentedHorseTimer) >= os.time() then
				npcHandler:say('You already have a horse.', npc, creature)
				return true
			end

			if not player:removeMoneyBank(500) then
				npcHandler:say('You do not have enough money to rent a horse!', npc, creature)
				return true
			end

			local mountId = {22, 25, 26}
			player:addMount(mountId[math.random(#mountId)])
			player:setStorageValue(Storage.RentedHorseTimer, os.time() + 86400)
			player:addAchievement('Natural Born Cowboy')
			npcHandler:say('I\'ll give you one of our experienced ones. Take care! Look out for low hanging branches.', npc, creature)
		end
		npcHandler:setTopic(playerId, 0)
	elseif MsgContains(message, 'no') and npcHandler:getTopic(playerId) > 0 then
		npcHandler:say('Then not.', npc, creature)
		npcHandler:setTopic(playerId, 0)
	end
	return true
end

npcHandler:setMessage(MESSAGE_GREET, 'Salutations, |PLAYERNAME| I guess you are here for the {arena}.')

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

-- npcType registering the npcConfig table
npcType:register(npcConfig)
