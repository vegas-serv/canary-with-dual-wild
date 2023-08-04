local config = {
	{fromPos = Position(32397, 32202, 7), toPos = Position(32402, 32205, 7), townId = 8}
}

local itemboss = Action()

local bosses = {
	[30367] = {bossName = 'ferumbras', bossPosition = Position(32396, 32193, 7)},
	[30365] = {bossName = 'morgaroth',  bossPosition = Position(32396, 32193, 7)},
	[30366] = {bossName = 'chayenne',  bossPosition = Position(32396, 32193, 7)}
	}

function itemboss.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local playerPos, isInTemple, temple, townId = player:getPosition(), false
	for i = 1, #config do
		temple = config[i]
		if isInRange(playerPos, temple.fromPos, temple.toPos) then
			if Tile(playerPos):hasFlag(TILESTATE_PROTECTIONZONE) then
				isInTemple, townId = true, temple.townId
				break
			end
		end
	end

	if not isInTemple then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Para criar o boss voce tera que fica na area de bosses.')
		return true
	end

	local boss = bosses[item.itemid]
	if not boss then
		return true
	end

	local monster = Game.createMonster(boss.bossName, boss.bossPosition)
	if not monster then
		return true
	end
	Game.broadcastMessage("O player ["..player:getName().."] acabou de criar um BOSS.", MESSAGE_EVENT_ADVANCE)
	player:getPosition():sendMagicEffect(CONST_ME_FIREWORK_BLUE)
	item:remove()
	return true
end

itemboss:id(35197, 35198, 35199)
itemboss:register()