local bossDoll = Action()
local bosseye = {
	-- Config
	mainTitle = "Boss Eye",
	mainMsg = "Status dos boss",
}
function bossDoll.onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
    player:sendBossWindow(bosseye)
    return true
end
bossDoll:id(19369)
bossDoll:register()