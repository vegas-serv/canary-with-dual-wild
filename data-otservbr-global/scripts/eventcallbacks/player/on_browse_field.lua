local callback = EventCallback()

function callback.playerOnBrowseField(player, position)
local items, item = Tile(position):getItems()
    for i = 1, #items do
        item = items[i]
        if isInArray({1722, 1723}, item:getId()) then
            self:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
            return false
        end
    end
	return true
end

callback:register()