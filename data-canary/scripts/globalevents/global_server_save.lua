local function ServerSave()
	if configManager.getBoolean(configKeys.GLOBAL_SERVER_SAVE_CLEAN_MAP) then
		cleanMap()
	end
	if configManager.getBoolean(configKeys.GLOBAL_SERVER_SAVE_CLOSE) then
		Game.setGameState(GAME_STATE_CLOSED)
	end
	if configManager.getBoolean(configKeys.GLOBAL_SERVER_SAVE_SHUTDOWN) then
		Game.setGameState(GAME_STATE_SHUTDOWN)
	end
	-- Updating daily reward next server save
	UpdateDailyRewardGlobalStorage(DailyReward.storages.lastServerSave, os.time())
end

local function ServerSaveWarning(time)
	-- minus one minutes
	local remainingTime = tonumber(time) - 60000
	if configManager.getBoolean(configKeys.GLOBAL_SERVER_SAVE_NOTIFY_MESSAGE) then
		local message = "Server is saving game in " .. (remainingTime / 60000) .. " minute(s). Please logout."
		Webhook.sendMessage("Server save", message, WEBHOOK_COLOR_WARNING)
		Game.broadcastMessage(message, MESSAGE_GAME_HIGHLIGHT)
	end
	-- if greater than one minute, schedule another warning
	-- else the next event will be the server save
	if remainingTime > 60000 then
		addEvent(ServerSaveWarning, 60000, remainingTime)
	else
		addEvent(ServerSave, 60000)
	end
end

-- Function that is called by the global events when it reaches the time configured
-- interval is the time between the event start and the the effective save, it will send an notify message every minute
local serversave = GlobalEvent("serversave")
function serversave.onTime(interval)
	local remainingTime = configManager.getNumber(configKeys.GLOBAL_SERVER_SAVE_NOTIFY_DURATION) * 60000
	if configManager.getBoolean(configKeys.GLOBAL_SERVER_SAVE_NOTIFY_MESSAGE) then
		local message = "Server is saving game in " .. (remainingTime / 60000) .. " minute(s). Please logout."
		Webhook.sendMessage("Server save", message, WEBHOOK_COLOR_WARNING)
		Game.broadcastMessage(message, MESSAGE_GAME_HIGHLIGHT)
	end
	addEvent(ServerSaveWarning, 60000, remainingTime) -- Schedule next event in 1 minute(60000)
	return not configManager.getBoolean(configKeys.GLOBAL_SERVER_SAVE_SHUTDOWN)
end

serversave:time(configManager.getString(configKeys.GLOBAL_SERVER_SAVE_TIME))
serversave:register()
