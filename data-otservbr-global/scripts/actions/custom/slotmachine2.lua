if not slotMachinesData then
	slotMachinesData = {
		needItem = {id = 35572, count = 25},
		items = vector(9145, 28895, 28887, 30399, 30400, 39706, 39710, 39705, 39704, 10227, 9594, 9596, 23687, 9598),

		positions = {
			Position(32347, 32247, 7),
			Position(32348, 32247, 7),
			Position(32349, 32247, 7)
		},
		positionEffectDice = {
			Position(32348, 32245, 7),
			Position(32348, 32244, 7),
		},

		rolled = vector()
	}
end

local machines = Action()

local positions = slotMachinesData.positions
local function drawEffects()
	local n = 0
	local function decrease()
		if slotMachinesData.owner then
			return
		end
		local t = 20 - n
		if t > 0 then
			n = n + 1
			for _, position in ipairs(positions) do
				position:sendMagicEffect(math.random(CONST_ME_GIFT_WRAPS, CONST_ME_FIREWORK_BLUE))
			end
			addEvent(decrease, 850)
		end
	end
	decrease()
end

local function checkEquals(itemVec)
    local ret = true
    for i = 1, itemVec:size() do
        if itemVec:get(i) ~= itemVec:get(math.min(itemVec:size(), i + 1)) then
            ret = false
            break
        end
    end
	return ret, itemVec:front()
end

function machines.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local name = player:getName()

	if slotMachinesData.owner then
		player:sendCancelMessage('Aguarde a sua vez.')
		return true
	else
		local item = slotMachinesData.needItem
		if not player:removeItem(item.id, item.count) then
			player:sendCancelMessage(('Você não possui %dx %s.'):format(item.count, ItemType(item.id):getName()))
			return true
		end
		slotMachinesData.owner = name
	end

	item:transform(item.itemid + 1)
	player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
	fromPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
	slotMachinesData.positionEffectDice[1]:sendMagicEffect(CONST_ME_CRAPS)
	slotMachinesData.positionEffectDice[2]:sendMagicEffect(CONST_ME_CRAPS)


	-- clear items
	for index, position in ipairs(positions) do
		local tile = Tile(position)
		if tile then
			local item = tile:getTopDownItem()
			if item then
				item:remove()
			end
		end

		addEvent(function()
			position:sendMagicEffect(CONST_ME_MAGIC_GREEN)
		end, index * 100)
	end

	local rolledVec = slotMachinesData.rolled
	rolledVec:reset()

	for index, position in ipairs(positions) do
		addEvent(function()
			local item = Game.createItem(slotMachinesData.items:rand(), 1, position)
			rolledVec:emplace_back(item:getId())

			position:sendMagicEffect(CONST_ME_FIREATTACK)
		end, index * 1000)
	end

	-- check the result
	addEvent(function(name)
		local win, rewardId = checkEquals(rolledVec)
		local reward = Game.createItem(rewardId, 1)
		local player = Player(name)
		if not player then
            if win then
                local resultId = db.storeQuery("SELECT `id` FROM `players` WHERE `name` = '" .. name.. "'")
                if not resultId then
                    result.free(resultId)
                    return false
                end

                local targetPlayerGUID = result.getDataInt(resultId, "id")
                result.free(resultId)

                targetPlayer = Player(targetPlayerGUID, true)
                if not targetPlayer then
                    return false
                end
                local itemSend = Game.createItem(rewardId, 1)
                targetPlayer:getInbox():addItemEx(itemSend, INDEX_WHEREEVER, FLAG_NOLIMIT)
                targetPlayer:delete()
			end
		else
			if win then
					local itemMandar = Game.createItem(rewardId, 1)
                    player:getInbox():addItemEx(itemMandar, INDEX_WHEREEVER, FLAG_NOLIMIT)
					inbox = true
				local rewardName = reward:getName()
				player:sendTextMessage(MESSAGE_INFO_DESCR, ('Parabéns, você ganhou 1x %s.%s'):format(rewardName, inbox and ' O item foi enviado para a sua caixa de entrada (inbox).' or ''))
				Game.broadcastMessage(('[Slot Machine]: %s encontrou 1x %s, que sortudo(a).'):format(name, rewardName), MESSAGE_EVENT_ADVANCE)
			end
		end

		item:transform(item.itemid - 1)
		rolledVec:reset()
		slotMachinesData.owner = nil

		local centerPosition = positions[math.ceil(#positions/2)]
		if win then
			player:say('WIN!', TALKTYPE_MONSTER_YELL, false, 0, centerPosition)
			for _, position in ipairs(positions) do
				position:sendMagicEffect(CONST_ME_ENERGYAREA)
			end
			drawEffects()
		else
			player:say('LOSE!', TALKTYPE_MONSTER_YELL, false, 0, centerPosition)
			for _, position in ipairs(positions) do
				position:sendMagicEffect(CONST_ME_POFF)
			end
		end
	end, (#positions + 1) * 1000, name)
	return true
end

machines:uid(48124)
machines:register()
