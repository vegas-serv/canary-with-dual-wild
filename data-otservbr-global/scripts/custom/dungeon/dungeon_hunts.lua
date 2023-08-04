local function roomIsOccupied(centerPosition, rangeX, rangeY)
	local spectators = Game.getSpectators(centerPosition, false, true, rangeX, rangeX, rangeY, rangeY)
	if #spectators ~= 0 then
		return true
	end
	return false
end

local function clearBossRoom(playerId, bossId, centerPosition, rangeX, rangeY, exitPosition)
	local spectators = Game.getSpectators(centerPosition, false, false, rangeX, rangeX, rangeY, rangeY)
	local spectator
	for i = 1, #spectators do
		spectator = spectators[i]
		if spectator:isPlayer() and spectator.uid == playerId then
			spectator:teleportTo(exitPosition)
			exitPosition:sendMagicEffect(CONST_ME_TELEPORT)
		end
		if spectator:isMonster() and spectator.uid == bossId then
			spectator:remove()
		end
	end
end

local bosses = {
	{
		bossName = 'dungeon dark torturer',
		storage = 341002,
		teleportPosition = {x = 16878, y = 17088, z = 7},
		playerPosition = Position(16878, 17086, 7),
		bossPosition = Position(16877, 17079, 7),
		centerPosition = Position(16877, 17080, 7),
		rangeX = 6, rangeY = 7
	},
	{
		bossName = 'Dungeon Demon',
		storage = 3410131,
		teleportPosition = {x = 16893, y = 17087, z = 7},
		playerPosition = Position(16894, 17085, 7),
		bossPosition = Position(16897, 17077, 7),
		centerPosition = Position(16897, 17079, 7),
		rangeX = 6, rangeY = 7
	},
	{
		bossName = 'Dungeon Fury',
		storage = 341024,
		teleportPosition = {x = 16901, y = 17105, z = 7},
		playerPosition = Position(16903, 17105, 7),
		bossPosition = Position(16908, 17100, 7),
		centerPosition = Position(16908, 17103, 7),
		rangeX = 6, rangeY = 7
	},
	{
		bossName = 'Dungeon Grimeleech',
		storage = 341035,
		teleportPosition = {x = 16893, y = 17122, z = 7},
		playerPosition = Position(16893, 17124, 7),
		bossPosition = Position(16895, 17134, 7),
		centerPosition = Position(16895, 17129, 7),
		rangeX = 6, rangeY = 7
	},
	{
		bossName = 'Dungeon Hellflayer',
		storage = 341046,
		teleportPosition = {x = 16877, y = 17123, z = 7},
		playerPosition = Position(16876, 17125, 7),
		bossPosition = Position(16874, 17135, 7),
		centerPosition = Position(16874, 17130, 7),
		rangeX = 6, rangeY = 7
	},
	{
		bossName = 'Dungeon Many Faces',
		storage = 341057,
		teleportPosition = {x = 16863, y = 17114, z = 7},
		playerPosition = Position(16861, 17114, 7),
		bossPosition = Position(16857, 17118, 7),
		centerPosition = Position(16857, 17118, 7),
		rangeX = 6, rangeY = 7
	},
	{
		bossName = 'Dungeon Vexclaw',
		storage = 341068,
		teleportPosition = {x = 16865, y = 17098, z = 7},
		playerPosition = Position(16863, 17096, 7),
		bossPosition = Position(16859, 17092, 7),
		centerPosition = Position(16859, 17092, 7),
		rangeX = 6, rangeY = 7
	}
}

local Dungeonboss = MoveEvent()

function Dungeonboss.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end
	for a = 1, #bosses do
		if player:getPosition() == Position(bosses[a].teleportPosition) then
			if player:getStorageValue(bosses[a].storage) ~= 1 or roomIsOccupied(bosses[a].centerPosition, bosses[a].rangeX, bosses[a].rangeY) then
				player:teleportTo(fromPosition)
				player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				return true
			end
			player:setStorageValue(bosses[a].storage, 2)
			player:teleportTo(bosses[a].playerPosition)
			bosses[a].playerPosition:sendMagicEffect(CONST_ME_TELEPORT)
			local monster
			if player:getPosition() == Position({x = 0, y = 0, z = 0}) then
				local randomBoss = math.random(4)
				monster = Game.createMonster(bosses[a].bossName[randomBoss], bosses[a].bossPosition)
			else
				monster = Game.createMonster(bosses[a].bossName, bosses[a].bossPosition)
			end
			if not monster then
				return true
			end
			addEvent(clearBossRoom, 720 * 60 * 1000, player.uid, monster.uid, bosses[a].centerPosition, bosses[a].rangeX, bosses[a].rangeY, fromPosition)
			--addEvent(clearBossRoom, 60 * 1 * 1000, player.uid, monster.uid, bosses[a].centerPosition, bosses[a].rangeX, bosses[a].rangeY, fromPosition)
			player:say("you have 12 hours of hunting, if you leave or die you don't enter anymore.", TALKTYPE_MONSTER_SAY)
		end
	end
	return true
end

for index = 1, #bosses do
	Dungeonboss:position(bosses[index].teleportPosition)
end
Dungeonboss:register()
