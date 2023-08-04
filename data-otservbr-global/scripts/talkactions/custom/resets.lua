local resetSys = TalkAction("!reset")

local config = {
    storageResets = 731500,
    backToLevel = 8,
    redskull = true, -- need to be without redskull to reset?
    battle = true, -- need to be without battle to reset?
    pz = true, -- need to be in protect zone to reset?
    defaultGainMaxHealth = 0.02, -- If the stage don't have gainMaxHealth, use this value
    defaultGainMaxMana = 0.02, -- If the stage don't have gainMaxMana, use this value
    stages = {
        --[[ You can extra properties to each stage
            Example:
                {..., gainMaxHealth = 0.25 gainMaxMana = 0.25 }
        ]]--
        {resets = 4, level = 350, premium = 350},
        {resets = 9, level = 450, premium = 450},
        {resets = 14, level = 500, premium = 500},
        {resets = 19, level = 550, premium = 550},
        {resets = 24, level = 600, premium = 600},
        {resets = 29, level = 650, premium = 650},
        {resets = 34, level = 700, premium = 700},
        {resets = 39, level = 750, premium = 750},
        {resets = 44, level = 800, premium = 800},
        {resets = 49, level = 820, premium = 820},
        {resets = 54, level = 850, premium = 850},
        {resets = 59, level = 870, premium = 870},
        {resets = 64, level = 900, premium = 900},
        {resets = 69, level = 920, premium = 920},
        {resets = 74, level = 950, premium = 950},
        {resets = 79, level = 970, premium = 970},
        {resets = 84, level = 1000, premium = 1000},
        {resets = 89, level = 1100, premium = 1100},
        {resets = 94, level = 1500, premium = 1500},
        {resets = math.huge, level = 2000, premium = 2000}
    }
}

local function getExperienceForLevel(lv)
    lv = lv - 1
    return ((50 * lv * lv * lv) - (150 * lv * lv) + (400 * lv)) / 3
end

function resetSys.onSay(player, words, param) 
    if config.redskull and player:getSkull() == 4 then
        player:sendCancelMessage("You need to be without red skull to reset.")
        return false
    elseif config.pz and not getTilePzInfo(player:getPosition()) then
        player:sendCancelMessage("You need to be in protection zone to reset.")
        return false
    elseif config.battle and player:getCondition(CONDITION_INFIGHT) then
        player:sendCancelMessage("You need to be without battle to reset.")
        return false
    end

    local playerResets = math.max(0, player:getStorageValue(config.storageResets))
    local stage = nil
    for _, _stage in pairs(config.stages) do
        if playerResets <= _stage.resets then
            stage = _stage
            break
        end
    end

    if not stage then
        print("[Warning - ResetSystem::onSay] Stage not found for player: " .. player:getName())
        return false
    end

    local resetLevel = player:isVip() and stage.premium or stage.level
    local playerLevel = player:getLevel()
    if playerLevel < resetLevel then
        player:sendCancelMessage("You need level " .. resetLevel .. " or more to reset.")
        return false
    end

    playerResets = playerResets + 1
    player:setStorageValue(config.storageResets, playerResets)
    player:removeExperience(getExperienceForLevel(playerLevel) - getExperienceForLevel(config.backToLevel))
    local maxHealth = player:getMaxHealth()
    local maxMana = player:getMaxMana()
    local newMaxHealth = 0
    local newMaxMana = 0
    if stage.gainMaxHealth then
        newMaxHealth = maxHealth + math.ceil(maxHealth * stage.gainMaxHealth)
    else
        newMaxHealth = maxHealth + math.ceil(maxHealth * config.defaultGainMaxHealth)
    end

    if stage.gainMaxMana then
        newMaxMana = maxMana + math.ceil(maxMana * stage.gainMaxMana)
    else
        newMaxMana = maxMana + math.ceil(maxMana * config.defaultGainMaxMana)
    end

    player:setMaxHealth(newMaxHealth)
    player:setMaxMana(newMaxMana)
    player:addHealth(newMaxHealth)
    player:addMana(newMaxMana)
    player:getPosition():sendMagicEffect(CONST_ME_FIREWORK_RED)
    player:sendTextMessage(MESSAGE_INFO_DESCR, "Now you have " .. playerResets .. " " .. (playerResets == 1 and "reset" or "resets") .. ".")
	player:remove() -- need kick player to add functions (outfit, mounts, and exp)
    return false
end

resetSys:register()