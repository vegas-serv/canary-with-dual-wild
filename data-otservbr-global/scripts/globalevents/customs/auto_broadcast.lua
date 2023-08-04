local AutoBroadCast = GlobalEvent("text")
function AutoBroadCast.onThink(interval, lastExecution)
    local messages = {

    "[Daily Reward]: Using the !reward command you receive your daily reward",
	"[FASTATTACK]: increase atk speed by training fighting skill",
	"[COMMANDS]: !commands",
	"[UPGRADE SYSTEM]: improves your character's skills by improving your equipment, use upgrade essence on item, reaching +50",
	"[RESET SYSTEM]: improves your character by resetting it, say !reset",
	"[LOOT BONUS]: increases your chance of loot by leveling skill fishing",
	"[VIP]: be a VIP and get 20% loot and exp and win double tournament coins and acess VIP island",
	"[ROOKGARD]: GET ROOK ACCESS AND GET 20% EXP",

}
    sendChannelMessage(12, TALKTYPE_CHANNEL_R1, messages[math.random(#messages)])
    return true
end
AutoBroadCast:interval(250000)
AutoBroadCast:register()