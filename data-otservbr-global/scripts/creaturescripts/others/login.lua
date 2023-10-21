local function onMovementRemoveProtection(cid, oldPos, time)
	local player = Player(cid)
	if not player then
		return true
	end

	local playerPos = player:getPosition()
	if (playerPos.x ~= oldPos.x or playerPos.y ~= oldPos.y or playerPos.z ~= oldPos.z) or player:getTarget() then
		player:setStorageValue(Global.Storage.CombatProtectionStorage, 0)
		return true
	end

	addEvent(onMovementRemoveProtection, 1000, cid, oldPos, time - 1)
end

local function protectionZoneCheck(playerName)
	doRemoveCreature(playerName)
	return true
end

local playerLogin = CreatureEvent("PlayerLogin")

function playerLogin.onLogin(player)
	local items = {
		{ 3003, 1 },
		{ 3457, 1 },
	}
	if player:getLastLoginSaved() == 0 then
		player:sendOutfitWindow()
		local backpack = player:addItem(2854)
		if backpack then
			for i = 1, #items do
				backpack:addItem(items[i][1], items[i][2])
			end
		end
		player:addItem(2920, 1, true, 1, CONST_SLOT_AMMO)
		db.query("UPDATE `players` SET `istutorial` = 0 where `id`=" .. player:getGuid())
		-- Open channels
		if table.contains({ TOWNS_LIST.DAWNPORT, TOWNS_LIST.DAWNPORT_TUTORIAL }, player:getTown():getId()) then
			player:openChannel(3) -- World chat
		else
			player:openChannel(3) -- World chat
			player:openChannel(5) -- Advertsing main
		end
	else
		player:sendTextMessage(MESSAGE_STATUS, SERVER_MOTD)
		player:sendTextMessage(MESSAGE_LOGIN, string.format("Your last visit in " .. SERVER_NAME .. ": %s.", os.date("%d. %b %Y %X", player:getLastLoginSaved())))
	end

	-- Reset bosstiary time
	local lastSaveServerTime = GetDailyRewardLastServerSave()
	if lastSaveServerTime >= player:getLastLoginSaved() then
		player:setRemoveBossTime(1)
	end

	if isPremium(player) then
		player:setStorageValue(Storage.PremiumAccount, 1)
	end
	-- Premium Ends Teleport to Temple, change addon (citizen) houseless
	local defaultTown = "Thais" -- default town where player is teleported if his home town is in premium area
	local freeTowns = { "Ab'Dendriel", "Carlin", "Kazordoon", "Thais", "Venore", "Rookgaard", "Dawnport", "Dawnport Tutorial", "Island of Destiny" } -- towns in free account area

	if isPremium(player) == false and table.contains(freeTowns, player:getTown():getName()) == false then
		local town = player:getTown()
		local sex = player:getSex()
		local home = getHouseByPlayerGUID(getPlayerGUID(player))
		town = table.contains(freeTowns, town:getName()) and town or Town(defaultTown)
		player:teleportTo(town:getTemplePosition())
		player:setTown(town)
		player:sendTextMessage(MESSAGE_FAILURE, "Your premium time has expired.")
		player:setStorageValue(Storage.PremiumAccount, 0)
		if sex == 1 then
			player:setOutfit({ lookType = 128, lookFeet = 114, lookLegs = 134, lookHead = 114, lookAddons = 0 })
		elseif sex == 0 then
			player:setOutfit({ lookType = 136, lookFeet = 114, lookLegs = 134, lookHead = 114, lookAddons = 0 })
		end
		if home ~= nil and not isPremium(player) then
			setHouseOwner(home, 0)
			player:sendTextMessage(MESSAGE_GAME_HIGHLIGHT, "You've lost your house because you are not premium anymore.")
			player:sendTextMessage(MESSAGE_GAME_HIGHLIGHT, "Your items from house are send to your inbox.")
		end
	end
	-- End 'Premium Ends Teleport to Temple'

	-- Promotion
	local vocation = player:getVocation()
	local promotion = vocation:getPromotion()
	if player:isPremium() then
		local hasPromotion = player:kv():get("promoted")
		if not player:isPromoted() and hasPromotion then
			player:setVocation(promotion)
		end
	elseif player:isPromoted() then
		player:setVocation(vocation:getDemotion())
	end

	-- Recruiter system
	local resultId = db.storeQuery("SELECT `recruiter` from `accounts` where `id`=" .. getAccountNumberByPlayerName(getPlayerName(player)))
	local recruiterStatus = Result.getNumber(resultId, "recruiter")
	local sex = player:getSex()
	if recruiterStatus >= 1 then
		if sex == 1 then
			local outfit = player:hasOutfit(746)
			if outfit == false then
				player:addOutfit(746)
			end
		else
			local outfit = player:hasOutfit(745)
			if outfit == false then
				player:addOutfit(745)
			end
		end
	end
	if recruiterStatus >= 3 then
		if sex == 1 then
			local outfit = player:hasOutfit(746, 1)
			if outfit == false then
				player:addOutfitAddon(746, 1)
			end
		else
			local outfit = player:hasOutfit(745, 1)
			if outfit == false then
				player:addOutfit(745, 1)
			end
		end
	end
	if recruiterStatus >= 10 then
		if sex == 1 then
			local outfit = player:hasOutfit(746, 2)
			if outfit == false then
				player:addOutfitAddon(746, 2)
			end
		else
			local outfit = player:hasOutfit(745, 2)
			if outfit == false then
				player:addOutfit(745, 2)
			end
		end
	end
	-- End recruiter system

	local playerId = player:getId()
	DailyReward.init(playerId)

	player:loadSpecialStorage()

	if player:getGroup():getId() >= GROUP_TYPE_GAMEMASTER then
		player:setGhostMode(true)
	end

	-- Boosted creature
	player:sendTextMessage(MESSAGE_BOOSTED_CREATURE, "Today's boosted creature: " .. Game.getBoostedCreature() .. " \
	Boosted creatures yield more experience points, carry more loot than usual and respawn at a faster rate.")

	-- Boosted boss
	player:sendTextMessage(MESSAGE_BOOSTED_CREATURE, "Today's boosted boss: " .. Game.getBoostedBoss() .. " \
	Boosted bosses contain more loot and count more kills for your Bosstiary.")

	if SCHEDULE_EXP_RATE ~= 100 then
		if SCHEDULE_EXP_RATE > 100 then
			player:sendTextMessage(
				MESSAGE_BOOSTED_CREATURE,
				"Exp Rate Event! Monsters yield more experience points than usual \
			Happy Hunting!"
			)
		else
			player:sendTextMessage(MESSAGE_BOOSTED_CREATURE, "Exp Rate Decreased! Monsters yield less experience points than usual.")
		end
	end

	if SCHEDULE_SPAWN_RATE ~= 100 then
		if SCHEDULE_SPAWN_RATE > 100 then
			player:sendTextMessage(
				MESSAGE_BOOSTED_CREATURE,
				"Spawn Rate Event! Monsters respawn at a faster rate \
			Happy Hunting!"
			)
		else
			player:sendTextMessage(MESSAGE_BOOSTED_CREATURE, "Spawn Rate Decreased! Monsters respawn at a slower rate.")
		end
	end

	if SCHEDULE_LOOT_RATE ~= 100 then
		if SCHEDULE_LOOT_RATE > 100 then
			player:sendTextMessage(
				MESSAGE_BOOSTED_CREATURE,
				"Loot Rate Event! Monsters carry more loot than usual \
			Happy Hunting!"
			)
		else
			player:sendTextMessage(MESSAGE_BOOSTED_CREATURE, "Loot Rate Decreased! Monsters carry less loot than usual.")
		end
	end

	if SCHEDULE_SKILL_RATE ~= 100 then
		if SCHEDULE_SKILL_RATE > 100 then
			player:sendTextMessage(
				MESSAGE_BOOSTED_CREATURE,
				"Skill Rate Event! Your skills progresses at a higher rate \
			Happy Hunting!"
			)
		else
			player:sendTextMessage(MESSAGE_BOOSTED_CREATURE, "Skill Rate Decreased! Your skills progresses at a lower rate.")
		end
	end

	-- Loyalty system
	player:initializeLoyaltySystem()

	-- Stamina
	nextUseStaminaTime[playerId] = 1

	-- EXP Stamina
	nextUseXpStamina[playerId] = 1

	-- Concoction Duration
	nextUseConcoctionTime[playerId] = 1

	if player:getAccountType() == ACCOUNT_TYPE_TUTOR then
		local msg = [[:: Tutor Rules
		1 *> 3 Warnings you lose the job.
		2 *> Without parallel conversations with players in Help, if the player starts offending, you simply mute it.
		3 *> Be educated with the players in Help and especially in the Private, try to help as much as possible.
		4 *> Always be on time, if you do not have a justification you will be removed from the staff.
		5 *> Help is only allowed to ask questions related to tibia.
		6 *> It is not allowed to divulge time up or to help in quest.
		7 *> You are not allowed to sell items in the Help.
		8 *> If the player encounters a bug, ask to go to the website to send a ticket and explain in detail.
		9 *> Always keep the Tutors Chat open. (required).
		10 *> You have finished your schedule, you have no tutor online, you communicate with some CM in-game
		or ts and stay in the help until someone logs in, if you can.
		11 *> Always keep a good Portuguese in the Help, we want tutors who support, not that they speak a satanic ritual.
		12 *> If you see a tutor doing something that violates the rules, take a print and send it to your superiors. "
		- Commands -
		Mute Player: /mute nick, 90 (90 seconds)
		Unmute Player: /unmute nick.
		- Commands -]]
		player:popupFYI(msg)
	end

	-- Rewards
	local rewards = #player:getRewardList()
	if rewards > 0 then
		player:sendTextMessage(MESSAGE_LOGIN, string.format("You have %d %s in your reward chest.", rewards, rewards > 1 and "rewards" or "reward"))
	end

	-- Update player id
	local stats = player:inBossFight()
	if stats then
		stats.playerId = player:getId()
	end

	if player:getStorageValue(Global.Storage.CombatProtectionStorage) < 1 then
		player:setStorageValue(Global.Storage.CombatProtectionStorage, 1)
		onMovementRemoveProtection(playerId, player:getPosition(), 10)
	end

	-- Set Client XP Gain Rate --
	if configManager.getBoolean(configKeys.XP_DISPLAY_MODE) then
		local baseRate = player:getFinalBaseRateExperience()
		baseRate = baseRate * 100
		if configManager.getBoolean(configKeys.VIP_SYSTEM_ENABLED) then
			local vipBonusExp = configManager.getNumber(configKeys.VIP_BONUS_EXP)
			if vipBonusExp > 0 and player:isVip() then
				vipBonusExp = (vipBonusExp > 100 and 100) or vipBonusExp
				baseRate = baseRate * (1 + (vipBonusExp / 100))
				player:sendTextMessage(MESSAGE_BOOSTED_CREATURE, "Normal base xp is: " .. baseRate .. "%, because you are VIP, bonus of " .. vipBonusExp .. "%")
			end
		end
		player:setBaseXpGain(baseRate)
	end

	local staminaBonus = player:getFinalBonusStamina()
	player:setStaminaXpBoost(staminaBonus * 100)

	player:getFinalLowLevelBonus()

	if onExerciseTraining[player:getId()] then
		-- onLogin & onLogout
		stopEvent(onExerciseTraining[player:getId()].event)
		onExerciseTraining[player:getId()] = nil
		player:setTraining(false)
	end
	return true
end

playerLogin:register()
