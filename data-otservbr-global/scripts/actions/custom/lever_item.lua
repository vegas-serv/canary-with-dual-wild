-- <action fromaid="1515" toaid="1522" script="custom/potionLevers.lua" />

local potions = {
	[11515] = {id = 23373, charges = 100, value = 60000}, -- health potion
	[11516] = {id = 238, charges = 100, value = 30000}, -- mana potion
	[11517] = {id = 237, charges = 100, value = 10000}, -- strong health potion
	[11518] = {id = 268, charges = 100, value = 8000}, -- strong mana potion
	[11519] = {id = 23374, charges = 100, value = 60000}, -- great health potion
	[11520] = {id = 7642, charges = 100, value = 30000}, -- great mana potion
	[11521] = {id = 239, charges = 100, value = 20000}, -- ultimate health potion
	[11522] = {id = 7643, charges = 100, value = 30000}, -- spirit potion
	[11523] = {id = 23375, charges = 100, value = 60000}, -- spirit potion
	
	
	[11524] = {id = 3081, charges = 10, value = 30000}, -- spirit potion
	[11525] = {id = 3048, charges = 30, value = 50000}, -- spirit potion
	
	[11526] = {id = 28895, charges = 1, value = 50000000}, -- spirit potion
	[11527] = {id = 12905, charges = 1, value = 55000000}, -- spirit potion
	[11528] = {id = 9145, charges = 1, value = 50000000}, -- spirit potion
	[11529] = {id = 8176, charges = 1, value = 150000000}, -- spirit potion
	[11530] = {id = 9219, charges = 1, value = 150000000}, -- spirit potion
	[11531] = {id = 37110, charges = 1, value = 55000000}, -- spirit potion
	[11532] = {id = 35572, charges = 50, value = 1500000}, -- spirit potion
	[11533] = {id = 10227, charges = 1, value = 45000000}, -- spirit potion
	[11534] = {id = 18339, charges = 1, value = 15000000}, -- spirit potion
	[11535] = {id = 8153, charges = 1, value = 75000000}, -- spirit potion
	[11536] = {id = 23487, charges = 1, value = 100000000}, -- spirit potion
	[11537] = {id = 28887, charges = 1, value = 120000000}, -- spirit potion
	
	[11538] = {id = 8192, charges = 10, value = 50000000}, -- spirit potion
	[11539] = {id = 20138, charges = 10, value = 200000000} -- spirit potion
}

local leveritem = Action()

function leveritem.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local potion = potions[item.actionid]
	if not potion then
		return false
	end

	if player:getStorageValue(177124) >= os.time() then
		player:sendCancelMessage("Você precisa esperar 1 segundo entre uma compra e outra.")
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		return true
	end

	local potionId = ItemType(potion.id)
	local itemWeight = potionId:getWeight() * potion.charges
	if player:getFreeCapacity() >= itemWeight then
		if not player:removeMoney(potion.value) then
			player:sendCancelMessage("Voce nao tem ".. potion.value .." gold coins para comprar ".. potion.charges .." ".. potionId:getName() ..".")
			player:getPosition():sendMagicEffect(CONST_ME_POFF)
		elseif not player:addItem(potion.id, potion.charges) then
			print("[ERROR] ACTION: potions_lever, FUNCTION: addItem, PLAYER: "..player:getName())
		else
			player:sendCancelMessage("Voce comprou ".. potion.charges .."x ".. potionId:getName() ..".")
			player:setStorageValue(177124, os.time() + 1)
			player:getPosition():sendMagicEffect(29)
		end
		
	else
		player:sendCancelMessage("Voce nao tem a cap necessaria para comprar.")
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
	end

	item:transform(item.itemid == 36709 and 36710 or 36709)
	return true
end

leveritem:aid(11515, 11516, 11517, 11518, 11519, 11520, 11521, 11522, 11523, 11524, 11525, 11526, 11527, 11528, 11529, 11530, 11531, 11532, 11533, 11534, 11535, 11536, 11537, 11538, 11539)
leveritem:register()