local config = {
	[11640] = {storage = 34100},
	[11638] = {storage = 34101},
	[11636] = {storage = 34102},
	[11634] = {storage = 34103},
	[11632] = {storage = 34104},
	[11630] = {storage = 34105},
	[11628] = {storage = 34106},
	[11626] = {storage = 34107},
	[11624] = {storage = 34108},
[11622] = {storage = 34109},
[11620] = {storage = 34110},
[11618] = {storage = 34111},
[11616] = {storage = 34112},
[11614] = {storage = 34113},
[11612] = {storage = 34114},
[11610] = {storage = 34115},
[11608] = {storage = 34116},
[11606] = {storage = 34117},
[11604] = {storage = 34118},
[11650] = {storage = 34119},
[11648] = {storage = 34120},
[11646] = {storage = 34121},
[11644] = {storage = 34122},
[11642] = {storage = 34123},
[18338] = {storage = 34124},
[18337] = {storage = 34125},
[18336] = {storage = 34126},
[18335] = {storage = 34127},
[18334] = {storage = 51612},
[18333] = {storage = 51613},
[18332] = {storage = 51610},
[18331] = {storage = 51611},
[18329] = {storage = 51619},
[18328] = {storage = 51618}
}


local entertask = Action()
function entertask.onUse(player, item, fromPosition, target, toPosition, isHotkey)

local useItem = config[item.itemid]
	if not useItem then
		return true
	end
	
 player:setStorageValue(useItem.storage, 1)
 item:remove(1)
 player:sendTextMessage(MESSAGE_INFO_DESCR, "You've activated acess boss.")
 player:getPosition():sendMagicEffect(15)
 return true
end

for index, value in pairs(config) do
	entertask:id(index)
end

entertask:register()