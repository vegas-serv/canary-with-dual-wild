local food = TalkAction("!food")

local config = {
	storage = 11111,
	exhaust = 10*60
}

function food.onSay(cid, words, param)
	if getPlayerStorageValue(cid, config.storage) > os.time() then
		doPlayerSendCancel(cid, "You can only use this action every " .. (config.exhaust / 60) .. " minutes.")
		return false
	end

	if doPlayerRemoveMoney(cid, 0) == true then
		local bp = doPlayerAddItem(cid, 3725, 100)
		doSendMagicEffect(getCreaturePosition(cid),13)
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You won an 100 Brown Mushroom.")
		setPlayerStorageValue(cid, config.storage, os.time() + config.exhaust)
	else
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You do not have enough money.")
		doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
	end
	return true
end

food:register()

local shared = TalkAction("!shared")

function shared.onSay(player, words, param)
    player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
    if player then
        local text = '-- Party Info -- \n\n'
        text = text .. '-----------\n'
        text = text .. 'Min Level: ' .. math.ceil((player:getLevel() * 2) / 3) .. '  \n'
        text = text .. 'Max Level: ' .. math.ceil((player:getLevel() * player:getLevel()) / ((player:getLevel() * 2) / 3)) .. '  \n'
        text = text .. '-----------\n'
        player:showTextDialog(34266, text)
    end
    return false
end

shared:register()