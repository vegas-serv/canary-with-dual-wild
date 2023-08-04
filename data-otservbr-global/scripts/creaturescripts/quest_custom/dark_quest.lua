local Infernatil = CreatureEvent("theravager") -- Change This
local enemyNames = {
    [1] = "the ravager"
}

local function removeTeleport(position)
    local spawnedTeleport = Tile(position):getItemById(17868) -- Teleport ( crystal from warzone tp )
    if spawnedTeleport then
        spawnedTeleport:remove()
        position:sendMagicEffect(CONST_ME_POFF)
    end
 
    return true
end

local function formatString(s)
    s = string.gsub(s, "[%d%p%c%s]", "")
    s = s:lower()
 
    return s
end

function Infernatil.onKill(creature, target) -- If you change first line this one also
    if not target or not target:isMonster() then
        return true
    end
 
    local f = false
    local t = formatString(target:getName())
    for _, v in ipairs(enemyNames) do
        if t == formatString(v) then
            f = true
        end
    end
 
    if not f then
        return true
    end

    local teleportSpawn = Position(33483, 32082, 8) -- Position for teleport to spawn 
    removeTeleport(teleportSpawn)
    teleportSpawn:sendMagicEffect(CONST_ME_TELEPORT)
 
    local item = Game.createItem(17868, 1, teleportSpawn)
    if item:isTeleport() then
        local teleportTo = Position(33587, 31848, 10) -- Teleport destination
        item:setDestination(teleportTo)
    end

    target:say('Take the teleport before they disappear!', TALKTYPE_MONSTER_SAY, 0, 0, teleportSpawn) -- Message 
    addEvent(removeTeleport, 200000, teleportSpawn)
 
    return true
end
Infernatil:register() -- If you change first line this one also