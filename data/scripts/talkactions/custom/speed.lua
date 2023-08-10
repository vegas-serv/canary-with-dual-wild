local speed = TalkAction("!speed")

function speed.onSay(player, words, param)
local voc = player:getHazardSystemPoints()
player:sendCancelMessage("You have " .. voc .. " Hazard Points.")

end

speed:register()