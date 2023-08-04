local table = 
{
	-- [level] = type = "item", id = {ITEM_ID, QUANTITY}, msg = "MESSAGE"},
	-- [level] = type = "bank", id = {QUANTITY, 0}, msg = "MESSAGE"},
	-- [level] = type = "addon", id = {ID_ADDON_FEMALE, ID_ADDON_MALE}, msg = "MESSAGE"},
	-- [level] = type = "mount", id = {ID_MOUNT, 0}, msg = "MESSAGE"},

	[100] = {type = "item", id = {3043, 5}, msg = "You win 5 crystal coins for reach the level 100!"},
	[150] = {type = "bank", id = {200000, 0}, msg = "Was deposited in your bank 200000 gold coins!"},
	[50] = {type = "addon", id = {140, 132}, msg = "You win the addon Noblewoman full for reach the level 50!"},
	[60] = {type = "mount", id = {17, 0}, msg = "You win the mount war horse!"},
	[200] = {type = "addon", id = {874, 873}, msg = "You win the addon Philosopher full for reach the level 200!"},
	[250] = {type = "mount", id = {34, 0}, msg = "You win the mount Steelbeak!"},
}

local storage = 15000

local levelReward = CreatureEvent("LevelReward")
function levelReward.onAdvance(player, skill, oldLevel, newLevel)

	if skill ~= SKILL_LEVEL or newLevel <= oldLevel then
		return true
	end

	for level, _ in pairs(table) do
		if newLevel >= level and player:getStorageValue(storage) < level then
			if table[level].type == "item" then	
				player:addItem(table[level].id[1], table[level].id[2])
			elseif table[level].type == "bank" then
				player:setBankBalance(player:getBankBalance() + table[level].id[1])
			elseif table[level].type == "addon" then
				player:addOutfitAddon(table[level].id[1], 3)
				player:addOutfitAddon(table[level].id[2], 3)
			elseif table[level].type == "mount" then
				player:addMount(table[level].id[1])
			else
				return false
			end

			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, table[level].msg)
			player:setStorageValue(storage, level)
		end
	end

	player:save()

	return true
end

levelReward:register()