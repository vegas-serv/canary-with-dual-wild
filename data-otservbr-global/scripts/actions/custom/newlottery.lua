local decayItems = {
	[2772] = 2773, [2773] = 2772
}

local lottery = Action()

local slots = {
	-- aqui sao os slots da esteira, por onde os itens vao ir passando... podem ser adicionados quantos quiser...
	Position(32343, 32247, 6), Position(32344, 32247, 6), Position(32345, 32247, 6), Position(32346, 32247, 6),	Position(32347, 32247, 6),
	Position(32348, 32247, 6), Position(32349, 32247, 6), Position(32350, 32247, 6)
}

local itemtable = {
	--aqui pode ter ate 100 itens.. a chance nunca pode se repetir, ela deve ser de 1 a 100...
	-- inserir os itens respeitando a ordem: [1], [2], [3], ...  ate o ultimo [100]
	[1] = {id = 10227, chance = 2}, -- remover skull
	[2] = {id = 10200, chance = 4}, -- crystal boots
	[3] = {id = 12905, chance = 6}, -- stamina doll
	[4] = {id = 8176, chance = 8}, -- exp scroll
	[5] = {id = 19204, chance = 10}, -- turning fork
	[6] = {id = 30200, chance = 14}, -- bird card
	[7] = {id = 23687, chance = 18}, -- npc rashid
	[8] = {id = 28887, chance = 22}, -- vip days
	[9] = {id = 9145, chance = 26}, -- mount doll
	[10] = {id = 9219, chance = 34}, -- exp 200
	[11] = {id = 23487, chance = 38}, -- exp 100
	[12] = {id = 3239, chance = 42}, -- crystal aroow
	[13] = {id = 19369, chance = 46}, -- eye boss
	[14] = {id = 25977, chance = 54}, -- sun catc
	[15] = {id = 14674, chance = 58}, -- aniversario bp
	[16] = {id = 25976, chance = 62}, -- star vial
	[17] = {id = 28493, chance = 66}, -- bone fidle
	[18] = {id = 25975, chance = 70}, -- moon mirror
	[19] = {id = 39177, chance = 74}, -- nort ring
	[20] = {id = 19153, chance = 78}, -- amulet
	[21] = {id = 8153, chance = 82}, -- boost exp
	[22] = {id = 3365, chance = 85}, -- golden helmet
	[23] = {id = 3390, chance = 90}, -- horned helmet
	[24] = {id = 25780, chance = 95}, -- blosson bp
	[25] = {id = 23721, chance = 96}, -- loot pouch
	[26] = {id = 35572, chance = 95}, -- pirat coin
	[27] = {id = 19082, chance = 95}, -- tornament coin
	[28] = {id = 3417, chance = 95}, -- shield honor
	[29] = {id = 37317, chance = 95}, -- tibia coin
	[30] = {id = 9586, chance = 95}, -- surprise box
	[31] = {id = 21292, chance = 95} -- fedbag
}

local function ender(cid, position)
	local player = Player(cid)
	local posicaofim = Position(32347, 32247, 6) -- AQUI VAI APARECER A SETA, que define o item que o player ganhou
	local item = Tile(posicaofim):getTopDownItem()
	if item then
		local itemId = item:getId()
		posicaofim:sendMagicEffect(CONST_ME_TUTORIALARROW)
		player:addItem(itemId, 1)
	end
	local alavanca = Tile(position):getTopDownItem()
	if alavanca then
		alavanca:setActionId(18562) -- aqui volta o actionid antigo, para permitir uma proxima jogada...
	end
	if itemId == 19369 or itemId == 19204 then --checar se é o ID do item LENDARIO
		broadcastMessage("O player "..player:getName().." ganhou "..item:getName().."", MESSAGE_EVENT_ADVANCE) -- se for item raro mandar no broadcast
		
		for _, pid in ipairs(getPlayersOnline()) do
			if pid ~= cid then
				pid:say("O player "..player:getName().." ganhou "..item:getName().."", TALKTYPE_MONSTER_SAY) -- se nao for lendario, mandar uma mensagem comum
			end
		end
	end
end

local function delay(position, aux)
	local item = Tile(position):getTopDownItem()
	if item then
		local slot = aux + 1
		item:moveTo(slots[slot])
	end	
end

local function exec(cid)
	--calcular uma chance e atribuir um item
	local rand = math.random(1, 100)
	local aux, memo = 0, 0
	if rand >= 1 then
		for i = 1, #itemtable do
			local randitemid = itemtable[i].id
			local randitemchance = itemtable[i].chance
			if rand >= randitemchance then
				aux = aux + 1
				memo = randitemchance
			end
			
		end
	end
	-- Passo um: Criar um item no primeiro SLOT, e deletar se houver o item do ultimo slot.
	Game.createItem(itemtable[aux].id, 1, slots[1])
	slots[1]:sendMagicEffect(CONST_ME_POFF)
	local item = Tile(slots[#slots]):getTopDownItem()
	if item then
		item:remove()
	end
	--Passo dois: Mover itens para o proximo slot em todos os slots de 1 a 12 para o 2 > 13
	local maxslot = #slots-1
	local lastloop = 0
	for i = 1, maxslot do
		
		addEvent(delay, 1*1*60, slots[i], i)
	end
end

function lottery.onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if not player then
		return false
	end
	if not player:removeItem(30200, 1) then -- PARA JOGAR o player precisa ter o item 35058, que representa um bilhete vendido na store ou em um npc....
	       player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You need lottery ticket.")
		return false
	end
	
	item:transform(decayItems[item.itemid])
	item:decay()	
	--muda actionid do item para nao permitir executar duas instancias
	item:setActionId(18563)
	
	local segundos = 30
	local loopsize = segundos*2
	
	for i = 1, loopsize do
		addEvent(exec, 1*i*500, cid.uid)
	end
	addEvent(ender, (1*loopsize*500)+1000, cid.uid, fromPosition)
	
	return true
end

lottery:aid(18562)
lottery:register()
