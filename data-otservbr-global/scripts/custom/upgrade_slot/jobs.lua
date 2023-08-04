local jobsTalk = TalkAction("!jobs")


function jobsTalk.onSay(player, words, param)

    -- Upgrade Skills ---
    local normalUpgrade = player:getStorageValue(61114)
    local slotUpgrade = player:getStorageValue(61118)

	local text = '        Jobs Information  \n\n        Upgrade Skills        \n\n - Normal Upgrade Level: '..normalUpgrade..'/500.\n - Slot Upgrade Level: '..slotUpgrade..'/500.'

	return false,  player:popupFYI(text)
end

jobsTalk:register()