/**
 * Canary - A free and open-source MMORPG server emulator
 * Copyright (©) 2019-2022 OpenTibiaBR <opentibiabr@outlook.com>
 * Repository: https://github.com/opentibiabr/canary
 * License: https://github.com/opentibiabr/canary/blob/main/LICENSE
 * Contributors: https://github.com/opentibiabr/canary/graphs/contributors
 * Website: https://docs.opentibiabr.com/
 */

#include "pch.hpp"

#include "config/configmanager.hpp"
#include "declarations.hpp"
#include "game/game.hpp"
#include "server/network/webhook/webhook.hpp"

#if LUA_VERSION_NUM >= 502
	#undef lua_strlen
	#define lua_strlen lua_rawlen
#endif

bool ConfigManager::load() {
	lua_State* L = luaL_newstate();
	if (!L) {
		throw std::ios_base::failure("Failed to allocate memory");
	}

	luaL_openlibs(L);

	if (luaL_dofile(L, configFileLua.c_str())) {
		g_logger().error("[ConfigManager::load] - {}", lua_tostring(L, -1));
		lua_close(L);
		return false;
	}

#ifndef DEBUG_LOG
	g_logger().setLevel(loadStringConfig(L, LOGLEVEL, "logLevel", "info"));
#endif

	// Parse config
	// Info that must be loaded one time (unless we reset the modules involved)
	if (!loaded) {
		loadBoolConfig(L, BIND_ONLY_GLOBAL_ADDRESS, "bindOnlyGlobalAddress", false);
		loadBoolConfig(L, OPTIMIZE_DATABASE, "startupDatabaseOptimization", true);
		loadBoolConfig(L, TOGGLE_MAP_CUSTOM, "toggleMapCustom", true);
		loadBoolConfig(L, TOGGLE_MAINTAIN_MODE, "toggleMaintainMode", false);
		loadBoolConfig(L, RANDOM_MONSTER_SPAWN, "randomMonsterSpawn", false);
		loadStringConfig(L, MAINTAIN_MODE_MESSAGE, "maintainModeMessage", "");

		loadStringConfig(L, IP, "ip", "127.0.0.1");
		loadStringConfig(L, MAP_NAME, "mapName", "canary");
		loadStringConfig(L, MAP_DOWNLOAD_URL, "mapDownloadUrl", "");
		loadStringConfig(L, MAP_AUTHOR, "mapAuthor", "Eduardo Dantas");

		loadStringConfig(L, MAP_CUSTOM_NAME, "mapCustomName", "");
		loadStringConfig(L, MAP_CUSTOM_AUTHOR, "mapCustomAuthor", "OTServBR");

		loadStringConfig(L, HOUSE_RENT_PERIOD, "houseRentPeriod", "never");
		loadFloatConfig(L, HOUSE_PRICE_RENT_MULTIPLIER, "housePriceRentMultiplier", 1.0);
		loadFloatConfig(L, HOUSE_RENT_RATE, "houseRentRate", 1.0);
		loadStringConfig(L, MYSQL_HOST, "mysqlHost", "127.0.0.1");
		loadStringConfig(L, MYSQL_USER, "mysqlUser", "root");
		loadStringConfig(L, MYSQL_PASS, "mysqlPass", "");
		loadStringConfig(L, MYSQL_DB, "mysqlDatabase", "canary");
		loadStringConfig(L, MYSQL_SOCK, "mysqlSock", "");

		loadStringConfig(L, AUTH_TYPE, "authType", "password");
		loadBoolConfig(L, RESET_SESSIONS_ON_STARTUP, "resetSessionsOnStartup", false);

		loadIntConfig(L, SQL_PORT, "mysqlPort", 3306);
		loadIntConfig(L, GAME_PORT, "gameProtocolPort", 7172);
		loadIntConfig(L, LOGIN_PORT, "loginProtocolPort", 7171);
		loadIntConfig(L, STATUS_PORT, "statusProtocolPort", 7171);

		loadIntConfig(L, MARKET_OFFER_DURATION, "marketOfferDuration", 30 * 24 * 60 * 60);

		loadIntConfig(L, FREE_DEPOT_LIMIT, "freeDepotLimit", 2000);
		loadIntConfig(L, PREMIUM_DEPOT_LIMIT, "premiumDepotLimit", 8000);
		loadIntConfig(L, DEPOT_BOXES, "depotBoxes", 20);
		loadIntConfig(L, STASH_ITEMS, "stashItemCount", 5000);

		loadBoolConfig(L, OLD_PROTOCOL, "allowOldProtocol", true);
	}

	loadBoolConfig(L, ALLOW_CHANGEOUTFIT, "allowChangeOutfit", true);
	loadIntConfig(L, MAX_PLAYERS_PER_ACCOUNT, "maxPlayersOnlinePerAccount", 1);
	loadIntConfig(L, MAX_PLAYERS_OUTSIDE_PZ_PER_ACCOUNT, "maxPlayersOutsidePZPerAccount", 1);
	loadBoolConfig(L, AIMBOT_HOTKEY_ENABLED, "hotkeyAimbotEnabled", true);
	loadBoolConfig(L, REMOVE_RUNE_CHARGES, "removeChargesFromRunes", true);
	loadBoolConfig(L, EXPERIENCE_FROM_PLAYERS, "experienceByKillingPlayers", false);
	loadBoolConfig(L, FREE_PREMIUM, "freePremium", false);
	loadBoolConfig(L, REPLACE_KICK_ON_LOGIN, "replaceKickOnLogin", true);
	loadBoolConfig(L, MARKET_PREMIUM, "premiumToCreateMarketOffer", true);
	loadBoolConfig(L, EMOTE_SPELLS, "emoteSpells", false);
	loadBoolConfig(L, STAMINA_SYSTEM, "staminaSystem", true);
	loadBoolConfig(L, WARN_UNSAFE_SCRIPTS, "warnUnsafeScripts", true);
	loadBoolConfig(L, CONVERT_UNSAFE_SCRIPTS, "convertUnsafeScripts", true);
	loadBoolConfig(L, CLASSIC_ATTACK_SPEED, "classicAttackSpeed", false);
	loadBoolConfig(L, TOGGLE_ATTACK_SPEED_ONFIST, "toggleAttackSpeedOnFist", false);
	loadIntConfig(L, MULTIPLIER_ATTACKONFIST, "multiplierSpeedOnFist", 5);
	loadIntConfig(L, MAX_SPEED_ATTACKONFIST, "maxSpeedOnFist", 500);
	loadBoolConfig(L, SCRIPTS_CONSOLE_LOGS, "showScriptsLogInConsole", true);
	loadBoolConfig(L, STASH_MOVING, "stashMoving", false);
	loadBoolConfig(L, ALLOW_BLOCK_SPAWN, "allowBlockSpawn", true);
	loadBoolConfig(L, REMOVE_WEAPON_AMMO, "removeWeaponAmmunition", true);
	loadBoolConfig(L, REMOVE_WEAPON_CHARGES, "removeWeaponCharges", true);
	loadBoolConfig(L, REMOVE_BEGINNING_WEAPON_AMMO, "removeBeginningWeaponAmmunition", true);
	loadBoolConfig(L, REFUND_BEGINNING_WEAPON_MANA, "refundBeginningWeaponMana", false);
	loadBoolConfig(L, REMOVE_POTION_CHARGES, "removeChargesFromPotions", true);
	loadBoolConfig(L, GLOBAL_SERVER_SAVE_NOTIFY_MESSAGE, "globalServerSaveNotifyMessage", true);
	loadBoolConfig(L, GLOBAL_SERVER_SAVE_CLEAN_MAP, "globalServerSaveCleanMap", false);
	loadBoolConfig(L, GLOBAL_SERVER_SAVE_CLOSE, "globalServerSaveClose", false);
	loadBoolConfig(L, FORCE_MONSTERTYPE_LOAD, "forceMonsterTypesOnLoad", true);
	loadBoolConfig(L, HOUSE_OWNED_BY_ACCOUNT, "houseOwnedByAccount", false);
	loadBoolConfig(L, CLEAN_PROTECTION_ZONES, "cleanProtectionZones", false);
	loadBoolConfig(L, GLOBAL_SERVER_SAVE_SHUTDOWN, "globalServerSaveShutdown", true);
	loadBoolConfig(L, PUSH_WHEN_ATTACKING, "pushWhenAttacking", false);

	loadBoolConfig(L, WEATHER_RAIN, "weatherRain", false);
	loadBoolConfig(L, WEATHER_THUNDER, "thunderEffect", false);
	loadBoolConfig(L, ALL_CONSOLE_LOG, "allConsoleLog", false);
	loadBoolConfig(L, TOGGLE_FREE_QUEST, "toggleFreeQuest", true);
	loadBoolConfig(L, AUTOLOOT, "autoLoot", false);
	loadBoolConfig(L, AUTOBANK, "autoBank", false);
	loadBoolConfig(L, STAMINA_TRAINER, "staminaTrainer", false);
	loadBoolConfig(L, STAMINA_PZ, "staminaPz", false);
	loadBoolConfig(L, SORT_LOOT_BY_CHANCE, "sortLootByChance", false);
	loadBoolConfig(L, TOGGLE_SAVE_INTERVAL, "toggleSaveInterval", false);
	loadBoolConfig(L, TOGGLE_SAVE_INTERVAL_CLEAN_MAP, "toggleSaveIntervalCleanMap", false);
	loadBoolConfig(L, TELEPORT_SUMMONS, "teleportSummons", false);
	loadBoolConfig(L, ALLOW_RELOAD, "allowReload", false);

	loadBoolConfig(L, ONLY_PREMIUM_ACCOUNT, "onlyPremiumAccount", false);
	loadBoolConfig(L, RATE_USE_STAGES, "rateUseStages", false);
	loadBoolConfig(L, TOGGLE_IMBUEMENT_SHRINE_STORAGE, "toggleImbuementShrineStorage", true);
	loadBoolConfig(L, TOGGLE_IMBUEMENT_NON_AGGRESSIVE_FIGHT_ONLY, "toggleImbuementNonAggressiveFightOnly", false);

	loadBoolConfig(L, TOGGLE_DOWNLOAD_MAP, "toggleDownloadMap", false);
	loadBoolConfig(L, USE_ANY_DATAPACK_FOLDER, "useAnyDatapackFolder", false);
	loadBoolConfig(L, INVENTORY_GLOW, "inventoryGlowOnFiveBless", false);
	loadBoolConfig(L, XP_DISPLAY_MODE, "experienceDisplayRates", true);

	loadStringConfig(L, DEFAULT_PRIORITY, "defaultPriority", "high");
	loadStringConfig(L, SERVER_NAME, "serverName", "");
	loadStringConfig(L, SERVER_MOTD, "serverMotd", "");
	loadStringConfig(L, OWNER_NAME, "ownerName", "");
	loadStringConfig(L, OWNER_EMAIL, "ownerEmail", "");
	loadStringConfig(L, URL, "url", "");
	loadStringConfig(L, LOCATION, "location", "");
	loadStringConfig(L, WORLD_TYPE, "worldType", "pvp");
	loadStringConfig(L, STORE_IMAGES_URL, "coinImagesURL", "");
	loadStringConfig(L, DISCORD_WEBHOOK_URL, "discordWebhookURL", "");
	loadStringConfig(L, SAVE_INTERVAL_TYPE, "saveIntervalType", "");
	loadStringConfig(L, GLOBAL_SERVER_SAVE_TIME, "globalServerSaveTime", "06:00");
	loadStringConfig(L, DATA_DIRECTORY, "dataPackDirectory", "data-otservbr-global");
	loadStringConfig(L, CORE_DIRECTORY, "coreDirectory", "data");

	loadStringConfig(L, FORGE_FIENDISH_INTERVAL_TYPE, "forgeFiendishIntervalType", "hour");
	loadStringConfig(L, FORGE_FIENDISH_INTERVAL_TIME, "forgeFiendishIntervalTime", "1");
	
	loadIntConfig(L, REBORN_LEVEL, "rebornLevel", 700000);
	loadIntConfig(L, REBORN_STATBONUS, "rebornStats", 5);
	loadIntConfig(L, REBORN_DMGBONUS, "rebornDmg", 10);

	loadIntConfig(L, MAX_PLAYERS, "maxPlayers", 0);
	loadIntConfig(L, PZ_LOCKED, "pzLocked", 60000);
	loadIntConfig(L, DEFAULT_DESPAWNRANGE, "deSpawnRange", 2);
	loadIntConfig(L, DEFAULT_DESPAWNRADIUS, "deSpawnRadius", 50);
	loadIntConfig(L, RATE_EXPERIENCE, "rateExp", 1);
	loadIntConfig(L, RATE_SKILL, "rateSkill", 1);
	loadIntConfig(L, RATE_LOOT, "rateLoot", 1);
	loadIntConfig(L, RATE_MAGIC, "rateMagic", 1);
	loadIntConfig(L, RATE_SPAWN, "rateSpawn", 1);
	loadIntConfig(L, RATE_KILLING_IN_THE_NAME_OF_POINTS, "rateKillingInTheNameOfPoints", 1);

	loadIntConfig(L, HOUSE_PRICE_PER_SQM, "housePriceEachSQM", 1000);
	loadIntConfig(L, HOUSE_BUY_LEVEL, "houseBuyLevel", 0);
	loadIntConfig(L, HOUSE_LOSE_AFTER_INACTIVITY, "houseLoseAfterInactivity", 0);
	loadBoolConfig(L, HOUSE_PURSHASED_SHOW_PRICE, "housePurchasedShowPrice", false);
	loadBoolConfig(L, ONLY_INVITED_CAN_MOVE_HOUSE_ITEMS, "onlyInvitedCanMoveHouseItems", true);

	loadIntConfig(L, ACTIONS_DELAY_INTERVAL, "timeBetweenActions", 200);
	loadIntConfig(L, EX_ACTIONS_DELAY_INTERVAL, "timeBetweenExActions", 1000);
	loadIntConfig(L, MAX_MESSAGEBUFFER, "maxMessageBuffer", 4);
	loadIntConfig(L, KICK_AFTER_MINUTES, "kickIdlePlayerAfterMinutes", 15);
	loadIntConfig(L, PROTECTION_LEVEL, "protectionLevel", 1);
	loadIntConfig(L, DEATH_LOSE_PERCENT, "deathLosePercent", -1);
	loadIntConfig(L, STATUSQUERY_TIMEOUT, "statusTimeout", 5000);
	loadIntConfig(L, FRAG_TIME, "timeToDecreaseFrags", 24 * 60 * 60 * 1000);
	loadIntConfig(L, WHITE_SKULL_TIME, "whiteSkullTime", 15 * 60 * 1000);
	loadIntConfig(L, STAIRHOP_DELAY, "stairJumpExhaustion", 2000);
	loadIntConfig(L, MAX_CONTAINER, "maxContainer", 500);
	loadIntConfig(L, MAX_CONTAINER_ITEM, "maxItem", 5000);
	loadIntConfig(L, EXP_FROM_PLAYERS_LEVEL_RANGE, "expFromPlayersLevelRange", 75);
	loadIntConfig(L, CHECK_EXPIRED_MARKET_OFFERS_EACH_MINUTES, "checkExpiredMarketOffersEachMinutes", 60);
	loadIntConfig(L, MAX_MARKET_OFFERS_AT_A_TIME_PER_PLAYER, "maxMarketOffersAtATimePerPlayer", 100);
	loadIntConfig(L, MAX_PACKETS_PER_SECOND, "maxPacketsPerSecond", 25);
	loadIntConfig(L, COMPRESSION_LEVEL, "packetCompressionLevel", 6);
	loadIntConfig(L, STORE_COIN_PACKET, "coinPacketSize", 25);
	loadIntConfig(L, DAY_KILLS_TO_RED, "dayKillsToRedSkull", 3);
	loadIntConfig(L, WEEK_KILLS_TO_RED, "weekKillsToRedSkull", 5);
	loadIntConfig(L, MONTH_KILLS_TO_RED, "monthKillsToRedSkull", 10);
	loadIntConfig(L, RED_SKULL_DURATION, "redSkullDuration", 30);
	loadIntConfig(L, BLACK_SKULL_DURATION, "blackSkullDuration", 45);
	loadIntConfig(L, ORANGE_SKULL_DURATION, "orangeSkullDuration", 7);
	loadIntConfig(L, GLOBAL_SERVER_SAVE_NOTIFY_DURATION, "globalServerSaveNotifyDuration", 5);
	
	loadFloatConfig(L, MLVL_BONUSDMG, "monsterBonusDamage", 0);
	loadFloatConfig(L, MLVL_BONUSSPEED, "monsterBonusSpeed", 0);
	loadFloatConfig(L, MLVL_BONUSHP, "monsterBonusHealth", 0);
	
	loadIntConfig(L, PARTY_LIST_MAX_DISTANCE, "partyListMaxDistance", 0);

	loadIntConfig(L, PUSH_DELAY, "pushDelay", 1000);
	loadIntConfig(L, PUSH_DISTANCE_DELAY, "pushDistanceDelay", 1500);

	loadIntConfig(L, STAMINA_ORANGE_DELAY, "staminaOrangeDelay", 1);
	loadIntConfig(L, STAMINA_GREEN_DELAY, "staminaGreenDelay", 5);
	loadIntConfig(L, STAMINA_PZ_GAIN, "staminaPzGain", 1);
	loadIntConfig(L, STAMINA_TRAINER_DELAY, "staminaTrainerDelay", 5);
	loadIntConfig(L, STAMINA_TRAINER_GAIN, "staminaTrainerGain", 1);
	loadIntConfig(L, SAVE_INTERVAL_TIME, "saveIntervalTime", 1);
	loadIntConfig(L, MAX_ALLOWED_ON_A_DUMMY, "maxAllowedOnADummy", 1);
	loadIntConfig(L, FREE_QUEST_STAGE, "freeQuestStage", 1);
	loadIntConfig(L, DEPOTCHEST, "depotChest", 4);
	loadIntConfig(L, CRITICALCHANCE, "criticalChance", 10);

	loadIntConfig(L, ADVENTURERSBLESSING_LEVEL, "adventurersBlessingLevel", 21);
	loadIntConfig(L, FORGE_MAX_ITEM_TIER, "forgeMaxItemTier", 10);
	loadIntConfig(L, FORGE_COST_ONE_SLIVER, "forgeCostOneSliver", 20);
	loadIntConfig(L, FORGE_SLIVER_AMOUNT, "forgeSliverAmount", 3);
	loadIntConfig(L, FORGE_CORE_COST, "forgeCoreCost", 50);
	loadIntConfig(L, FORGE_MAX_DUST, "forgeMaxDust", 225);
	loadIntConfig(L, FORGE_FUSION_DUST_COST, "forgeFusionCost", 100);
	loadIntConfig(L, FORGE_TRANSFER_DUST_COST, "forgeTransferCost", 100);
	loadIntConfig(L, FORGE_BASE_SUCCESS_RATE, "forgeBaseSuccessRate", 50);
	loadIntConfig(L, FORGE_BONUS_SUCCESS_RATE, "forgeBonusSuccessRate", 15);
	loadIntConfig(L, FORGE_TIER_LOSS_REDUCTION, "forgeTierLossReduction", 50);
	loadIntConfig(L, FORGE_AMOUNT_MULTIPLIER, "forgeAmountMultiplier", 3);
	loadIntConfig(L, FORGE_MIN_SLIVERS, "forgeMinSlivers", 3);
	loadIntConfig(L, FORGE_MAX_SLIVERS, "forgeMaxSlivers", 7);
	loadIntConfig(L, FORGE_INFLUENCED_CREATURES_LIMIT, "forgeInfluencedLimit", 300);
	loadIntConfig(L, FORGE_FIENDISH_CREATURES_LIMIT, "forgeFiendishLimit", 3);
	loadIntConfig(L, DISCORD_WEBHOOK_DELAY_MS, "discordWebhookDelayMs", Webhook::DEFAULT_DELAY_MS);

	loadFloatConfig(L, BESTIARY_RATE_CHARM_SHOP_PRICE, "bestiaryRateCharmShopPrice", 1.0);
	loadFloatConfig(L, RATE_HEALTH_REGEN, "rateHealthRegen", 1.0);
	loadFloatConfig(L, RATE_HEALTH_REGEN_SPEED, "rateHealthRegenSpeed", 1.0);
	loadFloatConfig(L, RATE_MANA_REGEN, "rateManaRegen", 1.0);
	loadFloatConfig(L, RATE_MANA_REGEN_SPEED, "rateManaRegenSpeed", 1.0);
	loadFloatConfig(L, RATE_SOUL_REGEN, "rateSoulRegen", 1.0);
	loadFloatConfig(L, RATE_SOUL_REGEN_SPEED, "rateSoulRegenSpeed", 1.0);
	loadFloatConfig(L, RATE_SPELL_COOLDOWN, "rateSpellCooldown", 1.0);
	loadFloatConfig(L, RATE_ATTACK_SPEED, "rateAttackSpeed", 1.0);
	loadFloatConfig(L, RATE_OFFLINE_TRAINING_SPEED, "rateOfflineTrainingSpeed", 1.0);
	loadFloatConfig(L, RATE_EXERCISE_TRAINING_SPEED, "rateExerciseTrainingSpeed", 1.0);

	loadFloatConfig(L, RATE_MONSTER_HEALTH, "rateMonsterHealth", 1.0);
	loadFloatConfig(L, RATE_MONSTER_ATTACK, "rateMonsterAttack", 1.0);
	loadFloatConfig(L, RATE_MONSTER_DEFENSE, "rateMonsterDefense", 1.0);
	loadFloatConfig(L, RATE_BOSS_HEALTH, "rateBossHealth", 1.0);
	loadFloatConfig(L, RATE_BOSS_ATTACK, "rateBossAttack", 1.0);
	loadFloatConfig(L, RATE_BOSS_DEFENSE, "rateBossDefense", 1.0);
	loadIntConfig(L, BOSS_DEFAULT_TIME_TO_FIGHT_AGAIN, "bossDefaultTimeToFightAgain", 20 * 60 * 60);
	loadIntConfig(L, BOSS_DEFAULT_TIME_TO_DEFEAT, "bossDefaultTimeToDefeat", 20 * 60);

	loadFloatConfig(L, RATE_NPC_HEALTH, "rateNpcHealth", 1.0);
	loadFloatConfig(L, RATE_NPC_ATTACK, "rateNpcAttack", 1.0);
	loadFloatConfig(L, RATE_NPC_DEFENSE, "rateNpcDefense", 1.0);

	loadBoolConfig(L, PREY_ENABLED, "preySystemEnabled", true);
	loadBoolConfig(L, PREY_FREE_THIRD_SLOT, "preyFreeThirdSlot", false);
	loadIntConfig(L, PREY_REROLL_PRICE_LEVEL, "preyRerollPricePerLevel", 200);
	loadIntConfig(L, PREY_SELECTION_LIST_PRICE, "preySelectListPrice", 5);
	loadIntConfig(L, PREY_BONUS_TIME, "preyBonusTime", 7200);
	loadIntConfig(L, PREY_BONUS_REROLL_PRICE, "preyBonusRerollPrice", 1);
	loadIntConfig(L, PREY_FREE_REROLL_TIME, "preyFreeRerollTime", 72000);

	loadBoolConfig(L, TASK_HUNTING_ENABLED, "taskHuntingSystemEnabled", true);
	loadBoolConfig(L, TASK_HUNTING_FREE_THIRD_SLOT, "taskHuntingFreeThirdSlot", false);
	loadIntConfig(L, TASK_HUNTING_LIMIT_EXHAUST, "taskHuntingLimitedTasksExhaust", 72000);
	loadIntConfig(L, TASK_HUNTING_REROLL_PRICE_LEVEL, "taskHuntingRerollPricePerLevel", 200);
	loadIntConfig(L, TASK_HUNTING_SELECTION_LIST_PRICE, "taskHuntingSelectListPrice", 5);
	loadIntConfig(L, TASK_HUNTING_BONUS_REROLL_PRICE, "taskHuntingBonusRerollPrice", 1);
	loadIntConfig(L, TASK_HUNTING_FREE_REROLL_TIME, "taskHuntingFreeRerollTime", 72000);

	loadIntConfig(L, BESTIARY_KILL_MULTIPLIER, "bestiaryKillMultiplier", 1);
	loadIntConfig(L, BOSSTIARY_KILL_MULTIPLIER, "bosstiaryKillMultiplier", 1);
	loadBoolConfig(L, BOOSTED_BOSS_SLOT, "boostedBossSlot", true);
	loadIntConfig(L, BOOSTED_BOSS_LOOT_BONUS, "boostedBossLootBonus", 250);
	loadIntConfig(L, BOOSTED_BOSS_KILL_BONUS, "boostedBossKillBonus", 3);

	loadIntConfig(L, FAMILIAR_TIME, "familiarTime", 30);

	loadBoolConfig(L, TOGGLE_GOLD_POUCH_ALLOW_ANYTHING, "toggleGoldPouchAllowAnything", false);
	loadBoolConfig(L, TOGGLE_GOLD_POUCH_QUICKLOOT_ONLY, "toggleGoldPouchQuickLootOnly", false);
	loadBoolConfig(L, TOGGLE_SERVER_IS_RETRO, "toggleServerIsRetroPVP", false);
	loadBoolConfig(L, TOGGLE_TRAVELS_FREE, "toggleTravelsFree", false);
	loadIntConfig(L, BUY_AOL_COMMAND_FEE, "buyAolCommandFee", 0);
	loadIntConfig(L, BUY_BLESS_COMMAND_FEE, "buyBlessCommandFee", 0);
	loadBoolConfig(L, TELEPORT_PLAYER_TO_VOCATION_ROOM, "teleportPlayerToVocationRoom", true);

	loadBoolConfig(L, TOGGLE_HAZARDSYSTEM, "toogleHazardSystem", true);
	loadIntConfig(L, HAZARD_CRITICAL_INTERVAL, "hazardCriticalInterval", 2000);
	loadIntConfig(L, HAZARD_CRITICAL_CHANCE, "hazardCriticalChance", 750);
	loadIntConfig(L, HAZARD_CRITICAL_MULTIPLIER, "hazardCriticalMultiplier", 25);
	loadIntConfig(L, HAZARD_DAMAGE_MULTIPLIER, "hazardDamageMultiplier", 200);
	loadIntConfig(L, HAZARD_DODGE_MULTIPLIER, "hazardDodgeMultiplier", 85);
	loadIntConfig(L, HAZARD_PODS_DROP_MULTIPLIER, "hazardPodsDropMultiplier", 87);
	loadIntConfig(L, HAZARD_PODS_TIME_TO_DAMAGE, "hazardPodsTimeToDamage", 2000);
	loadIntConfig(L, HAZARD_PODS_TIME_TO_SPAWN, "hazardPodsTimeToSpawn", 4000);
	loadIntConfig(L, HAZARD_EXP_BONUS_MULTIPLIER, "hazardExpBonusMultiplier", 2);
	loadIntConfig(L, HAZARD_LOOT_BONUS_MULTIPLIER, "hazardLootBonusMultiplier", 2);
	loadIntConfig(L, HAZARD_PODS_DAMAGE, "hazardPodsDamage", 5);
	loadIntConfig(L, HAZARD_SPAWN_PLUNDER_MULTIPLIER, "hazardSpawnPlunderMultiplier", 25);
	loadIntConfig(L, LOW_LEVEL_BONUS_EXP, "lowLevelBonusExp", 50);

	loadBoolConfig(L, LOYALTY_ENABLED, "loyaltyEnabled", true);
	loadIntConfig(L, LOYALTY_POINTS_PER_CREATION_DAY, "loyaltyPointsPerCreationDay", 1);
	loadIntConfig(L, LOYALTY_POINTS_PER_PREMIUM_DAY_SPENT, "loyaltyPointsPerPremiumDaySpent", 0);
	loadIntConfig(L, LOYALTY_POINTS_PER_PREMIUM_DAY_PURCHASED, "loyaltyPointsPerPremiumDayPurchased", 0);
	loadFloatConfig(L, LOYALTY_BONUS_PERCENTAGE_MULTIPLIER, "loyaltyBonusPercentageMultiplier", 1.0);

	loadBoolConfig(L, TOGGLE_WHEELSYSTEM, "wheelSystemEnabled", true);
	loadIntConfig(L, WHEEL_POINTS_PER_LEVEL, "wheelPointsPerLevel", 1);

	loadBoolConfig(L, PARTY_AUTO_SHARE_EXPERIENCE, "partyAutoShareExperience", true);
	loadBoolConfig(L, PARTY_SHARE_LOOT_BOOSTS, "partyShareLootBoosts", true);
	loadFloatConfig(L, PARTY_SHARE_LOOT_BOOSTS_DIMINISHING_FACTOR, "partyShareLootBoostsDimishingFactor", 0.7f);
	loadIntConfig(L, TIBIADROME_CONCOCTION_COOLDOWN, "tibiadromeConcoctionCooldown", 24 * 60 * 60);
	loadIntConfig(L, TIBIADROME_CONCOCTION_DURATION, "tibiadromeConcoctionDuration", 1 * 60 * 60);
	loadStringConfig(L, TIBIADROME_CONCOCTION_TICK_TYPE, "tibiadromeConcoctionTickType", "online");

	loadStringConfig(L, M_CONST, "memoryConst", "1<<16");
	loadIntConfig(L, T_CONST, "temporaryConst", 2);
	loadIntConfig(L, PARALLELISM, "parallelism", 2);

	// Vip System
	loadBoolConfig(L, VIP_SYSTEM_ENABLED, "vipSystemEnabled", false);
	loadIntConfig(L, VIP_BONUS_EXP, "vipBonusExp", 0);
	loadIntConfig(L, VIP_BONUS_LOOT, "vipBonusLoot", 0);
	loadIntConfig(L, VIP_BONUS_SKILL, "vipBonusSkill", 0);
	loadBoolConfig(L, VIP_AUTOLOOT_VIP_ONLY, "vipAutoLootVipOnly", false);
	loadBoolConfig(L, VIP_KEEP_HOUSE, "vipKeepHouse", false);
	loadBoolConfig(L, VIP_STAY_ONLINE, "vipStayOnline", false);
	loadIntConfig(L, VIP_FAMILIAR_TIME_COOLDOWN_REDUCTION, "vipFamiliarTimeCooldownReduction", 0);

	loadBoolConfig(L, REWARD_CHEST_COLLECT_ENABLED, "rewardChestCollectEnabled", true);
	loadIntConfig(L, REWARD_CHEST_MAX_COLLECT_ITEMS, "rewardChestMaxCollectItems", 200);

	// PVP System
	loadFloatConfig(L, PVP_RATE_DAMAGE_TAKEN_PER_LEVEL, "pvpRateDamageTakenPerLevel", 0.0);
	loadFloatConfig(L, PVP_RATE_DAMAGE_REDUCTION_PER_LEVEL, "pvpRateDamageReductionPerLevel", 0.0);
	loadIntConfig(L, PVP_MAX_LEVEL_DIFFERENCE, "pvpMaxLevelDifference", 0);

	loadBoolConfig(L, TOGGLE_MOUNT_IN_PZ, "toggleMountInProtectionZone", false);

	loadBoolConfig(L, TOGGLE_HOUSE_TRANSFER_ON_SERVER_RESTART, "togglehouseTransferOnRestart", false);

	loadBoolConfig(L, TOGGLE_RECEIVE_REWARD, "toggleReceiveReward", false);

	loadBoolConfig(L, METRICS_ENABLE_PROMETHEUS, "metricsEnablePrometheus", false);
	loadStringConfig(L, METRICS_PROMETHEUS_ADDRESS, "metricsPrometheusAddress", "localhost:9464");

	loadBoolConfig(L, METRICS_ENABLE_OSTREAM, "metricsEnableOstream", false);
	loadIntConfig(L, METRICS_OSTREAM_INTERVAL, "metricsOstreamInterval", 1000);

	loaded = true;
	lua_close(L);
	return true;
}

bool ConfigManager::reload() {
	const bool result = load();
	if (transformToSHA1(getString(SERVER_MOTD, __FUNCTION__)) != g_game().getMotdHash()) {
		g_game().incrementMotdNum();
	}
	return result;
}

std::string ConfigManager::loadStringConfig(lua_State* L, const ConfigKey_t &key, const char* identifier, const std::string &defaultValue) {
	std::string value = defaultValue;
	lua_getglobal(L, identifier);
	if (lua_isstring(L, -1)) {
		value = lua_tostring(L, -1);
	}
	configs[key] = value;
	lua_pop(L, 1);
	return value;
}

int32_t ConfigManager::loadIntConfig(lua_State* L, const ConfigKey_t &key, const char* identifier, const int32_t &defaultValue) {
	int32_t value = defaultValue;
	lua_getglobal(L, identifier);
	if (lua_isnumber(L, -1)) {
		value = static_cast<int32_t>(lua_tointeger(L, -1));
	}
	configs[key] = value;
	lua_pop(L, 1);
	return value;
}

bool ConfigManager::loadBoolConfig(lua_State* L, const ConfigKey_t &key, const char* identifier, const bool &defaultValue) {
	bool value = defaultValue;
	lua_getglobal(L, identifier);
	if (lua_isboolean(L, -1)) {
		value = static_cast<bool>(lua_toboolean(L, -1));
	}
	configs[key] = value;
	lua_pop(L, 1);
	return value;
}

float ConfigManager::loadFloatConfig(lua_State* L, const ConfigKey_t &key, const char* identifier, const float &defaultValue) {
	float value = defaultValue;
	lua_getglobal(L, identifier);
	if (lua_isnumber(L, -1)) {
		value = static_cast<float>(lua_tonumber(L, -1));
	}
	configs[key] = value;
	lua_pop(L, 1);
	return value;
}

const std::string &ConfigManager::getString(const ConfigKey_t &key, std::string_view context) const {
	static const std::string dummyStr;
	if (configs.contains(key) && std::holds_alternative<std::string>(configs.at(key))) {
		return std::get<std::string>(configs.at(key));
	}
	g_logger().warn("[ConfigManager::getString] - Accessing invalid or wrong type index: {}[{}], Function: {}", magic_enum::enum_name(key), fmt::underlying(key), context);
	return dummyStr;
}

int32_t ConfigManager::getNumber(const ConfigKey_t &key, std::string_view context) const {
	if (configs.contains(key) && std::holds_alternative<int32_t>(configs.at(key))) {
		return std::get<int32_t>(configs.at(key));
	}
	g_logger().warn("[ConfigManager::getNumber] - Accessing invalid or wrong type index: {}[{}], Function: {}", magic_enum::enum_name(key), fmt::underlying(key), context);
	return 0;
}

bool ConfigManager::getBoolean(const ConfigKey_t &key, std::string_view context) const {
	if (configs.contains(key) && std::holds_alternative<bool>(configs.at(key))) {
		return std::get<bool>(configs.at(key));
	}
	g_logger().warn("[ConfigManager::getBoolean] - Accessing invalid or wrong type index: {}[{}], Function: {}", magic_enum::enum_name(key), fmt::underlying(key), context);
	return false;
}

float ConfigManager::getFloat(const ConfigKey_t &key, std::string_view context) const {
	if (configs.contains(key) && std::holds_alternative<float>(configs.at(key))) {
		return std::get<float>(configs.at(key));
	}
	g_logger().warn("[ConfigManager::getFloat] - Accessing invalid or wrong type index: {}[{}], Function: {}", magic_enum::enum_name(key), fmt::underlying(key), context);
	return 0.0f;
}
