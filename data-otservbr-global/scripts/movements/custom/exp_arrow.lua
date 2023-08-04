local function sendEffect(cid)
    local player = Player(cid)
    if not player then
        return true
    end
    local pos = player:getPosition()
    local pos2 = player:getPosition() + Position(math.random(-2, 2), math.random(-2, 2), 0)
    pos2:sendDistanceEffect(pos, 31)
end

local exp_arrow = MoveEvent()

function exp_arrow.onStepIn(player, item, position, fromPosition)
	
    if player:isMonster() then
        return true
    end
    local tile = Tile(player:getPosition())
    if tile then
        local ground = tile:getGround()
        if ground then
            ground:removeAttribute(ITEM_ATTRIBUTE_ACTIONID)
            player:setStorageValue(16381, os.time() + 60)
            player:sendTextMessage(MESSAGE_INFO_DESCR, 'You have received double experience for the next 60 seconds.')
            for i = 0, 25 do
                addEvent(sendEffect, 100 * i, player:getId())
            end
        end
    end
    return true
end

exp_arrow:type("stepin")
exp_arrow:aid(16381)
exp_arrow:register()
