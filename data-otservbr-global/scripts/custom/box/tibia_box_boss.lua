local rewards = {
    { name = "The Snapper Boss", id = 11640},
	{ name = "Hide Boss", id = 11638},
	{ name = "Deathbine Boss", id = 11636},
	{ name = "The Bloodtusk Boss", id = 11634},
	{ name = "Shardhead Boss", id = 11632},
	{ name = "Esmeralda Boss", id = 11630},
	{ name = "Fleshcrawler Boss", id = 11628},
	{ name = "Ribstride Boss", id = 11626},
	{ name = "The Bloodweb Boss", id = 11624},
	{ name = "Thul Boss", id = 11622},
	{ name = "The Old Widow Boss", id = 11620},
	{ name = "Hemming Boss", id = 11618},
	{ name = "Tormentor Boss", id = 11616},
	{ name = "Flameborn Boss", id = 11614},
	{ name = "Fazzrah Boss", id = 11612},
	{ name = "Tromphonyte Boss", id = 11610},
	{ name = "Sulphur Scuttler Boss", id = 11608},
	{ name = "Bruise Payne Boss", id = 11606},
	{ name = "The Many Boss", id = 11604},
	{ name = "The Noxious Spawn Boss", id = 11650},
	{ name = "Gorgo Boss", id = 11648},
	{ name = "Stonecracker Boss", id = 11646},
	{ name = "Leviathan Boss", id = 11644},
	{ name = "Kerberos Boss", id = 11642},
	{ name = "Ethershreck Boss", id = 18338},
	{ name = "Paiz The Pauperizer Boss", id = 18337},
	{ name = "Bretzecutioner Boss", id = 18336},
	{ name = "Zanakeph Boss", id = 18335},
	{ name = "Tiquandas Revenge Boss", id = 18334},
	{ name = "Demodras Boss", id = 18333},
	{ name = "Necropharus Boss", id = 18332},
	{ name = "The Horned Fox Boss", id = 18331},
	{ name = "Lethal Lissy Boss", id = 18329},
	{ name = "Fahim The Wise Boss", id = 18328}
}

local boxboss = Action()

function boxboss.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local randId = math.random(1, #rewards)
	local rewardItem = rewards[randId]

	player:addItem(rewardItem.id, 1)
	item:remove(1)

	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You received one ' .. rewardItem.name .. '.')
	return true
end

boxboss:id(4010)
boxboss:register()