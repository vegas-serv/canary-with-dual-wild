local bp = TalkAction("!bp")

local config = {
	storage = 1111,
	exhaust = 1*60
}

function bp.onSay(cid, words, param)
	if getPlayerStorageValue(cid, config.storage) > os.time() then
		doPlayerSendCancel(cid, "You can only use this action every " .. (config.exhaust / 60) .. " minutes.")
		return false
	end

	if doPlayerRemoveMoney(cid, 1000) == true then
		local bp = doPlayerAddItem(cid, 2854, 1)
		doSendMagicEffect(getCreaturePosition(cid),13)
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You won an 1 backpack.")
		setPlayerStorageValue(cid, config.storage, os.time() + config.exhaust)
	else
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You do not have enough money.")
		doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
	end
	return true
end

bp:register()