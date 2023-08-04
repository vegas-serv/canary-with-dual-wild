local spiritual = Action()

function spiritual.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local hasOutfit = player:getStorageValue(Storage.OutfitQuest.Afflicted.spiritual) == 1
		if hasOutfit then
			return false
		end

		if player:getItemCount(44048) < 4 then
				return false
		end

		player:removeItem(44048, 4)
		player:addMount(219)
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		player:setStorageValue(Storage.OutfitQuest.Afflicted.spiritual, 1)
		player:say('You have restored an mount.', TALKTYPE_MONSTER_SAY, false, player)
	return true
end

spiritual:id(44048)
spiritual:register()
