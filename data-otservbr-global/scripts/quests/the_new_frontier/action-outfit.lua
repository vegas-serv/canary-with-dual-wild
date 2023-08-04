local TheNewFrontier = Storage.Quest.U8_54.TheNewFrontier

local theNewFrontierOutfit = Action()

function theNewFrontierOutfit.onUse(player, item)
	
		player:addOutfit(335, 0)
		player:addOutfit(336, 0)
		player:setStorageValue(TheNewFrontier.Mission09.RewardDoor, 1)
		player:setStorageValue(TheNewFrontier.Questline, 27)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have gained your new outfit and may leave the reward room now!")
	
	return true
end

theNewFrontierOutfit:position({x = 33053, y = 31020, z = 7})
theNewFrontierOutfit:register()
