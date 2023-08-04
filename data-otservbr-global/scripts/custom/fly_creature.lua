local go = CreatureEvent("fly")

local item = {id = 35572, count = 50}

function go.onModalWindow(player, modalWindowId, buttonId, choiceId)
    if(modalWindowId ~= 4597 or buttonId == 2) then
        return false
    end
	
	local item = item
		if not player:removeItem(item.id, item.count) then
			player:sendCancelMessage(('Voce nao possui %dx %s.'):format(item.count, ItemType(item.id):getName()))
			return true
		end

    if(not getTileInfo(player:getPosition()).protection) then
        player:sendTextMessage(MESSAGE_STATUS_SMALL, "You can only fly in protection zone.")
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return false
    end

    local positions = {
       [1] = {x = 32638, y = 31916, z = 8}, -- Kazordoon
[2] = {x = 32942, y = 32076, z = 7}, -- venore
[3] = {x = 32373, y = 32213, z = 6}, -- thais
[4] = {x = 32356, y = 31808, z = 6}, -- carlin
[5] = {x = 32691, y = 31696, z = 6}, -- Ab'Dendriel
[6] = {x = 32312, y = 32870, z = 7}, -- liberty bay
[7] = {x = 32623, y = 32756, z = 7}, -- Port Hope
[8] = {x = 33180, y = 32823, z = 7}, -- ankrahmun
[9] = {x = 33271, y = 32464, z = 7}, -- darashia
[10] = {x = 33167, y = 31773, z = 7}, -- edron
[11] = {x = 32239, y = 31142, z = 7}, -- svargrond
[12] = {x = 32766, y = 31242, z = 7}, -- yalahar
[13] = {x = 33011, y = 31519, z = 10}, -- farmine
[14] = {x = 33463, y = 31315, z = 7}, -- gray island
[15] = {x = 33520, y = 32555, z = 7}, -- roshamuul
[16] = {x = 33640, y = 31877, z = 5}, -- oramond
[17] = {x = 33648, y = 31680, z = 8}, -- krailos
[18] = {x = 33490, y = 32221, z = 5}, -- feyrist
[19] = {x = 33921, y = 31477, z = 5}, -- issavi
[20] = {x = 33800, y = 32857, z = 6}, -- marapur
[21] = {x = 6417, y = 6170, z = 7}, -- etheno
[22] = {x = 33527, y = 32860, z = 14}, -- gnomprona
[23] = {x = 33793, y = 32621, z = 7} -- ingol
    }

    player:teleportTo(positions[choiceId])
    player:getPosition():sendMagicEffect(CONST_ME_FIREAREA)
    return true
end

go:register()