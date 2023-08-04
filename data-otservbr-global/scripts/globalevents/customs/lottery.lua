local lottery = GlobalEvent("lottery")

local config = {
    interval = "4 hours",
    rewards = {[3043] = 50, [35572] = 100, [19082] = 5, [8176] = 1, [12905] = 1, [9145] = 1, [8153] = 1, [22516] = 2, [22721] = 2, [35572] = 50, [19082] = 2}, -- Random Reward
    website = false
}

function lottery.onThink(interval)
    local players = {}
    for _, player in ipairs(Game.getPlayers()) do
        if not player:getGroup():getAccess() then
            table.insert(players, player)
        end
    end

    local c = #players
    if c <= 0 then
        return true
    end

    local winner  = players[math.random(#players)]

    local items = {}
    for itemid, count in pairs(config.rewards) do
        items[#items + 1] = itemid
    end

    local itemid = items[math.random(1, #items)]
    local amount = config.rewards[itemid]
    winner:addItem(itemid, amount)

    local it   = ItemType(itemid)
    local name = ""
    if amount == 1 then
        name = it:getArticle() .. " " .. it:getName()
    else
        name = amount .. " " .. it:getPluralName()
    end

    broadcastMessage("[LOTTERY SYSTEM] " .. winner:getName() .. " won " .. name .. "! Congratulations! (Next lottery in " .. config.interval .. ")")

    return true
end

lottery:interval(14400000) --- 1 minute
lottery:register()
