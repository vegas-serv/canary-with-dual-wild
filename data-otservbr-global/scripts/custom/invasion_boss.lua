local raidBossInformation = {
    {
        dayToSpawn = "Sunday",
        position = Position(17604, 17355, 6),
        monsterName = "Apocalypse",
        respawnTime = 6, -- hours
        messageOnSpawn = "Apocalypse has been summoned from hell to plague the lands of mortals again.",
        messageOnDeath = "Apocalypse has been defeated, the demon master will reveal himself in the arena in 6 hours.",
        creatureId = 0, -- don't touch
        lastKilledTime = 0 -- don't touch
    },
    {
        dayToSpawn = "Monday",
        position = Position(17604, 17355, 6),
        monsterName = "Chikhaton",
        respawnTime = 6, -- hours
        messageOnSpawn = "Chikhaton has been summoned from hell to plague the lands of mortals again.",
        messageOnDeath = "Chikhaton has been defeated, the demon master will reveal himself in the arena in 6 hours.",
        creatureId = 0, -- don't touch
        lastKilledTime = 0 -- don't touch
    },
    {
        dayToSpawn = "Friday",
        position = Position(17604, 17355, 6),
        monsterName = "Infernatil",
        respawnTime = 6, -- hours
        messageOnSpawn = "Infernatil is awakening... demonic entities are entering the mortal realm in the arena.",
        messageOnDeath = "Infernatil has been defeated, the demon master will reveal himself in the arena in 6 hours.",
        creatureId = 0, -- don't touch
        lastKilledTime = 0 -- don't touch
    },
    {
        dayToSpawn = "Saturday",
        position = Position(17604, 17355, 6),
        monsterName = "Zushuka",
        respawnTime = 6, -- hours
        messageOnSpawn = "Zushuka is awakening... demonic entities are entering the mortal realm in the arena.",
        messageOnDeath = "Zushuka has been defeated, the demon master will reveal himself in the arena in 6 hours.",
        creatureId = 0, -- don't touch
        lastKilledTime = 0 -- don't touch
    },
    {
        dayToSpawn = "Thursday",
        position = Position(17604, 17355, 6),
        monsterName = "Zavarash",
        respawnTime = 6, -- hours
        messageOnSpawn = "Zavarash return is at hand. The Mi'hen Academy calls for Heroes to fight that evil..",
        messageOnDeath = "Zavarash has been defeated, the wizard master will reveal himself in the arena in 4 hours.",
        creatureId = 0, -- don't touch
        lastKilledTime = 0 -- don't touch
    },
    {
        dayToSpawn = "Wednesday",
        position = Position(17604, 17355, 6),
        monsterName = "The Mutated Pumpkin",
        respawnTime = 6, -- hours
        messageOnSpawn = "The Mutated Pumpkin is awakening... demonic entities are entering the mortal realm in the arena.",
        messageOnDeath = "The Mutated Pumpkin has been defeated, the demon master will reveal himself in the arena in 6 hours.",
        creatureId = 0, -- don't touch
        lastKilledTime = 0 -- don't touch
    },
    ------ Pits of Inferno
    {
        dayToSpawn = "Wednesday",
        position = Position(17604, 17355, 6),
        monsterName = "Devovorga",
        respawnTime = 6, -- hours
        messageOnSpawn = "Devovorga is awakening... demonic entities are spawning in the arena.",
        messageOnDeath = "Devovorga has been defeated, this demonic spawn will reveal himself in the arena in 6 hours.",
        creatureId = 0, -- don't touch
        lastKilledTime = 0 -- don't touch
    },
    {
        dayToSpawn = "Thursday",
        position = Position(17604, 17355, 6),
        monsterName = "The Abomination",
        respawnTime = 6, -- hour
        messageOnSpawn = "The Abomination is awakening... demonic entities are spawning in the arena.",
        messageOnDeath = "The Abomination has been defeated, this demonic spawn will reveal himself in the arena in 6 hours.",
        creatureId = 0, -- don't touch
        lastKilledTime = 0 -- don't touch
    },
    {
        dayToSpawn = "Saturday",
        position = Position(17604, 17355, 6),
        monsterName = "Omrafir",
        respawnTime = 6, -- hour
        messageOnSpawn = "Omrafir is awakening... demonic entities are spawning in the arena.",
        messageOnDeath = "Omrafir has been defeated, this demonic spawn will reveal himself in the arena in 6 hours.",
        creatureId = 0, -- don't touch
        lastKilledTime = 0 -- don't touch
    },
    {
        dayToSpawn = "Friday",
        position = Position(17604, 17355, 6),
        monsterName = "Prince Drazzak",
        respawnTime = 6, -- hour
        messageOnSpawn = "Prince Drazzak is awakening... demonic entities are spawning in the arena.",
        messageOnDeath = "Prince Drazzak has been defeated, this demonic spawn will reveal himself in the arena in 6 hours.",
        creatureId = 0, -- don't touch
        lastKilledTime = 0 -- don't touch
    },
    {
        dayToSpawn = "Wednesday",
        position = Position(17604, 17355, 6),
        monsterName = "Horadron",
        respawnTime = 6, -- hour
        messageOnSpawn = "Horadron is awakening... demonic entities are spawning in the the arena.",
        messageOnDeath = "Horadron has been defeated, this demonic spawn will reveal himself in the arena in 6 hours.",
        creatureId = 0, -- don't touch
        lastKilledTime = 0 -- don't touch
    },
    {
        dayToSpawn = "Sunday",
        position = Position(17604, 17355, 6),
        monsterName = "Orshabaal",
        respawnTime = 6, -- hour
        messageOnSpawn = "Orshabaal is awakening... demonic entities are spawning in the arena.",
        messageOnDeath = "Orshabaal has been defeated, this demonic spawn will reveal himself in the arena in 6 hours.",
        creatureId = 0, -- don't touch
        lastKilledTime = 0 -- don't touch
    },
    {
        dayToSpawn = "Any",
        position = Position(17604, 17355, 6),
        monsterName = "Morgaroth",
        respawnTime = 6, -- hour
        messageOnSpawn = "Morgaroth is awakening... demonic entities are spawning in the the arena.",
        messageOnDeath = "Morgaroth has been defeated, this demonic spawn will reveal himself in the arena in 6 hours.",
        creatureId = 0, -- don't touch
        lastKilledTime = 0 -- don't touch
    },
}

local day -- don't touch

local function respawnBoss(index)
    local spawn = raidBossInformation[index]
    local monster = Game.createMonster(spawn.monsterName, spawn.position, false, true)
    if monster then
        spawn.creatureId = monster:getId()
        monster:setMasterPosition(spawn.position)
        monster:registerEvent("raidBossDeath")
        Game.broadcastMessage(spawn.messageOnSpawn, MESSAGE_EVENT_ADVANCE)
    else
        print("Failed to respawn index: " .. index .. " -> " .. spawn.monsterName .. "")
    end
end

local globalevent = GlobalEvent("raidBosses")

function globalevent.onStartup()
    day = os.date('%A')
    for index, spawn in pairs(raidBossInformation) do
        if spawn.dayToSpawn == day or spawn.dayToSpawn == "Any" then
            local monster = Game.createMonster(spawn.monsterName, spawn.position, false, true)
            if monster then
                spawn.creatureId = monster:getId()
                monster:setMasterPosition(spawn.position)
                monster:registerEvent("raidBossDeath")
            else
                print("Failed to spawn index: " .. index .. " -> " .. spawn.monsterName .. "")
            end
        end
    end
    return true
end

globalevent:register()


local creatureevent = CreatureEvent("raidBossDeath")

function creatureevent.onDeath(creature, corpse, killer, mostDamageKiller, lastHitUnjustified, mostDamageUnjustified)
    local bossId = creature:getId()
    for i = 1, #raidBossInformation do
        if raidBossInformation[i].creatureId == bossId then
            raidBossInformation[i].creatureId = 0
            raidBossInformation[i].lastKilledTime = os.time()
            Game.broadcastMessage(raidBossInformation[i].messageOnDeath, MESSAGE_EVENT_ADVANCE)
            addEvent(respawnBoss, 1000 * 60 * 60 * raidBossInformation[i].respawnTime, i)
            return true
        end
    end
    print("Something went wrong in raidBossDeath script.")
    return true
end

creatureevent:register()


local talk = TalkAction("/bosscheck", "!bosscheck")

function talk.onSay(player, words, param)
    local text = ""
    for i = 1, #raidBossInformation do
        if text ~= "" then
            text = text .. "\n"
        end
        text = text .. raidBossInformation[i].monsterName
        text = text .. " " .. (raidBossInformation[i].dayToSpawn == "Any" and " [" .. day .. "]" or " [" .. raidBossInformation[i].dayToSpawn .. "]") .. "\n    "
        if raidBossInformation[i].creatureId == 0 then
            if raidBossInformation[i].lastKilledTime == 0 then
                text = text .. "Unavailable"
            else
                text = text .. "Dead -> respawning in " .. os.date("!%Hh %Mm %Ss", (raidBossInformation[i].lastKilledTime + (60 * 60 * raidBossInformation[i].respawnTime)) - os.time())
            end
        else
            text = text .. "Alive"
        end
    end
    player:showTextDialog(2239, text, false)
    return false
end

talk:separator(" ")
talk:register()