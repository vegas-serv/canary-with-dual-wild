local config = {
	-- soil guardian
	[16252] = {female = 514, male = 516, effect = CONST_ME_GREEN_RINGS},
	[16253] = {female = 514, male = 516, addon = 1, effect = CONST_ME_GREEN_RINGS, achievement = 'Funghitastic'},
	[16254] = {female = 514, male = 516, addon = 2, effect = CONST_ME_GREEN_RINGS, achievement = 'Funghitastic'},
	-- crystal warlord
	[16255] = {female = 513, male = 512, effect = CONST_ME_GIANTICE},
	[16256] = {female = 513, male = 512, addon = 1, effect = CONST_ME_GIANTICE, achievement = 'Crystal Clear'},
	[16257] = {female = 513, male = 512, addon = 2, effect = CONST_ME_GIANTICE, achievement = 'Crystal Clear'},
	-- makeshift warrior
	[27655] = {female = 1043, male = 1042},
	[27657] = {female = 1043, male = 1042, addon = 1, achievement = 'Cobbled and Patched'},
	[27656] = {female = 1043, male = 1042, addon = 2, achievement = 'Cobbled and Patched'},
	
	[31738] = {female = 1244, male = 1243, addon = 1},
	[31737] = {female = 1244, male = 1243, addon = 2},
	
	[32101] = {female = 1252, male = 1251, addon = 1},
	[32100] = {female = 1252, male = 1251, addon = 2},
	
	[32630] = {female = 1271, male = 1270, addon = 1},
	[32631] = {female = 1271, male = 1270, addon = 2},
	
	[35595] = {female = 1372, male = 1371, addon = 1},
	[35695] = {female = 1372, male = 1371, addon = 2},
	
	[34076] = {female = 1323, male = 1322, addon = 1},
	[34075] = {female = 1323, male = 1322, addon = 2},
	
	[37003] = {female = 1387, male = 1386, addon = 1},
	[37002] = {female = 1387, male = 1386, addon = 2},
	
	[39544] = {female = 1569, male = 1568, addon = 1},
	[39545] = {female = 1569, male = 1568, addon = 2}
}

local addons = Action()

function addons.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local useItem = config[item.itemid]
	if not useItem then
		return true
	end

	local looktype = player:getSex() == PLAYERSEX_FEMALE and useItem.female or useItem.male

	if useItem.addon then
		if not player:isPremium()
				or not player:hasOutfit(looktype)
				or player:hasOutfit(looktype, useItem.addon) then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You own no premium account, lack the base outfit or already own this outfit part.')
			return true
		end

		player:addOutfitAddon(useItem.female, useItem.addon)
		player:addOutfitAddon(useItem.male, useItem.addon)
		player:getPosition():sendMagicEffect(CONST_ME_GIFT_WRAPS)
		if player:hasOutfit(looktype, 3) then
			player:addAchievement(useItem.achievement)
		end
		item:remove()
	else
		if not player:isPremium() or player:hasOutfit(looktype) then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You own no premium account or already own this outfit part.')
			return true
		end

		player:addOutfit(useItem.female)
		player:addOutfit(useItem.male)
		player:getPosition():sendMagicEffect(CONST_ME_GIFT_WRAPS)
		item:remove()
	end
	return true
end

addons:id(16252, 16253, 16254, 16255, 16256, 16257, 27655, 27656, 27657, 31738, 31737, 32101, 32100, 32630, 32631, 35595, 35695, 34076, 34075, 37003, 37002, 39544, 39545)
addons:register()
