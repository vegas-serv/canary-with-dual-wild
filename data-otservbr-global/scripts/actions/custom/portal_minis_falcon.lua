local config = {
	[1] = {
		teleportPosition = {x = 33373, y = 31309, z = 7},
		bossName = "Grand Canon Dominus",
		requiredLevel = 250,
		timeToFightAgain = 5, -- In hour
		timeToDefeatBoss = 10, -- In minutes
		destination = Position(33382, 31292, 7),
		bossPosition = Position(33384, 31281, 6),
		specPos = {
			from = Position(33381, 31279, 6),
			to = Position(33390, 31294, 7)
		},
		exitPosition = Position(33374, 31310, 7),
		storage = Storage.Quest.U10_80.Grimvale.DominusTimer
	},
	[2] = {
		teleportPosition = {x = 33372, y = 31319, z = 2},
		bossName = "Grand Commander Soeren",
		requiredLevel = 250,
		timeToFightAgain = 5, -- In hour
		timeToDefeatBoss = 10, -- In minutes
		destination = Position(33377, 31322, 2),
		bossPosition = Position(33376, 31320, 2),
		specPos = {
			from = Position(33373, 31316, 2),
			to = Position(3380, 31323, 2)
		},
		exitPosition = Position(33370, 31319, 2),
		storage = Storage.Quest.U10_80.Grimvale.SoerenTimer
	},
	[3] = {
		teleportPosition = {x = 33362, y = 31328, z = 5},
		bossName = "Grand Chaplain Gaunder",
		requiredLevel = 250,
		timeToFightAgain = 5, -- In hour
		timeToDefeatBoss = 10, -- In minutes
		destination = Position(33377, 31322, 1),
		bossPosition = Position(33377, 31318, 1),
		specPos = {
			from = Position(33373, 31315, 1),
			to = Position(33380, 31323, 1)
		},
		exitPosition = Position(33363, 31323, 5),
		storage = Storage.Quest.U10_80.Grimvale.GaunderTimer
	},
	[4] = {
		teleportPosition = {x = 33378, y = 31345, z = 3},
		bossName = "Preceptor Lazare",
		requiredLevel = 250,
		timeToFightAgain = 5, -- In hour
		timeToDefeatBoss = 10, -- In minutes
		destination = Position(33370, 31348, 8),
		bossPosition = Position(33372, 31344, 8),
		specPos = {
			from = Position(33366, 31342, 8),
			to = Position(33375, 31350, 8)
		},
		exitPosition = Position(33373, 31347, 3),
		storage = Storage.Quest.U10_80.Grimvale.LazareTimer
	},
}

local teleportsBoss = MoveEvent()
function teleportsBoss.onStepIn(creature, item, position, fromPosition)
	if not creature or not creature:isPlayer() then
		return false
	end
	for index, value in pairs(config) do
		if Tile(position) == Tile(value.teleportPosition) then
			if not value.specPos then
				creature:teleportTo(value.exitPosition)
				creature:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				return true
			end
			local spec = Spectators()
			spec:setOnlyPlayer(false)
			spec:setRemoveDestination(value.exitPosition)
			spec:setCheckPosition(value.specPos)
			spec:check()
			if spec:getPlayers() > 0 then
				creature:teleportTo(fromPosition, true)
				creature:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				creature:say("There's someone fighting with " .. value.bossName .. ".", TALKTYPE_MONSTER_SAY)
				return true
			end
			if creature:getLevel() < value.requiredLevel then
				creature:teleportTo(fromPosition, true)
				creature:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				creature:sendTextMessage(MESSAGE_EVENT_ADVANCE, "All the players need to be level " .. value.requiredLevel .. " or higher.")
				return true
			end
			if creature:getStorageValue(value.storage) > os.time() then
				creature:teleportTo(fromPosition, true)
				creature:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				creature:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have to wait " .. value.timeToFightAgain .. " hours to face ".. value.bossName .. " again!")
				return true
			end
			spec:removeMonsters()
			local monster = Game.createMonster(value.bossName, value.bossPosition, true, true)
			if not monster then
				return true
			end
			creature:teleportTo(value.destination)
			creature:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			creature:setStorageValue(value.storage, os.time() + value.timeToFightAgain * 3600)
			addEvent(function()
				spec:clearCreaturesCache()
				spec:setOnlyPlayer(true)
				spec:check()
				spec:removePlayers()
			end, value.timeToDefeatBoss * 60 * 1000)
		end
	end
end

for index, value in pairs(config) do
	teleportsBoss:position(value.teleportPosition)
end

teleportsBoss:type("stepin")
teleportsBoss:register()
