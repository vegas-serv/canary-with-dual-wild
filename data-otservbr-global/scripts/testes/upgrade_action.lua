local itemUpgrader = Action()

local conf = {
    ["level"] = {
      [1] = {successPercent = 100, downgradeLevel = 1},
        [2] = {successPercent = 100, downgradeLevel = 1},
        [3] = {successPercent = 99, downgradeLevel = 2},
        [4] = {successPercent = 99, downgradeLevel = 3},
        [5] = {successPercent = 98, downgradeLevel = 4},
        [6] = {successPercent = 98, downgradeLevel = 5},
        [7] = {successPercent = 97, downgradeLevel = 6},
        [8] = {successPercent = 97, downgradeLevel = 7},
        [9] = {successPercent = 96, downgradeLevel = 8},
		[10] = {successPercent = 96, downgradeLevel = 9},
		[11] = {successPercent = 95, downgradeLevel = 10},
		[12] = {successPercent = 95, downgradeLevel = 10},
		[13] = {successPercent = 94, downgradeLevel = 11},
		[14] = {successPercent = 94, downgradeLevel = 12},
		[15] = {successPercent = 93, downgradeLevel = 14},
		[16] = {successPercent = 93, downgradeLevel = 13},
		[17] = {successPercent = 92, downgradeLevel = 15},
		[18] = {successPercent = 92, downgradeLevel = 16},
		[19] = {successPercent = 91, downgradeLevel = 17},
		[20] = {successPercent = 91, downgradeLevel = 20},
		[21] = {successPercent = 90, downgradeLevel = 20},
		[22] = {successPercent = 90, downgradeLevel = 21},
		[23] = {successPercent = 91, downgradeLevel = 22},
		[24] = {successPercent = 91, downgradeLevel = 23},
		[25] = {successPercent = 92, downgradeLevel = 24},
		[26] = {successPercent = 92, downgradeLevel = 25},
		[27] = {successPercent = 89, downgradeLevel = 26},
		[28] = {successPercent = 89, downgradeLevel = 26},
		[29] = {successPercent = 88, downgradeLevel = 28},
		[30] = {successPercent = 88, downgradeLevel = 30},
		[31] = {successPercent = 87, downgradeLevel = 30},
		[32] = {successPercent = 87, downgradeLevel = 31},
		[33] = {successPercent = 86, downgradeLevel = 31},
		[34] = {successPercent = 86, downgradeLevel = 32},
		[35] = {successPercent = 85, downgradeLevel = 35},
		[36] = {successPercent = 85, downgradeLevel = 34},
		[37] = {successPercent = 84, downgradeLevel = 35},
		[38] = {successPercent = 84, downgradeLevel = 35},
		[39] = {successPercent = 83, downgradeLevel = 36},
		[40] = {successPercent = 83, downgradeLevel = 40},
		[41] = {successPercent = 82, downgradeLevel = 38},
		[42] = {successPercent = 82, downgradeLevel = 39},
		[43] = {successPercent = 81, downgradeLevel = 40},
		[44] = {successPercent = 81, downgradeLevel = 41},
		[45] = {successPercent = 80, downgradeLevel = 45},
		[46] = {successPercent = 70, downgradeLevel = 45},
		[47] = {successPercent = 60, downgradeLevel = 45},
		[48] = {successPercent = 50, downgradeLevel = 45},
		[49] = {successPercent = 40, downgradeLevel = 46},
		[50] = {successPercent = 30, downgradeLevel = 45}
    },
 
    ["upgrade"] = { -- how many percent attributes are rised?
      attack = 1, -- attack %
      defense = 1, -- defense %
      extraDefense = 1, -- extra defense %
      armor = 1, -- armor %
      hitChance = 1, -- hit chance %
    }
 }

local quantOre = 100

 -- // do not touch // --
 -- Upgrading system by Azi [Ersiu] --
 -- Edited for TFS 1.1 by Zbizu --

 local upgrading = {
   upValue = function (value, level, percent)
   if value < 0 then return 0 end
      if level == 0 then return value end
      local nVal = value
      for i = 1, level do
        nVal = nVal + (math.ceil((nVal/100*percent)))
      end
   return nVal > 0 and nVal or value
   end,
 
   getLevel = function (item)
   local name = Item(item):getName():split('+')
      if (#name == 1) then
        return 0
      end
   
      return math.abs(name[2])
   end,
 }


 local normalUpgrade = {
	maxLevel = 500,
	experiencePerLevel = 75, 
	storage = {
		level = 61114,
		experience = 61115
	},
}


local function giveNormalUpgradeExperience(playerId, amount)
  local player = Player(playerId)
  if not player then
      print("Error in function giveNormalUpgradeExperience -> player does not exist (check to ensure playerId being passed to function is correct)")
      return false
  end

  local NormalUpgradeLevel = player:getStorageValue(normalUpgrade.storage.level)
  NormalUpgradeLevel = NormalUpgradeLevel >= 0 and NormalUpgradeLevel or 0

  local NormalUpgradeExperience = player:getStorageValue(normalUpgrade.storage.experience)
  NormalUpgradeExperience = NormalUpgradeExperience >= 0 and NormalUpgradeExperience or 0

  
  NormalUpgradeExperience = NormalUpgradeExperience + amount

  if NormalUpgradeLevel < normalUpgrade.maxLevel then
      repeat    
          local ExperienceRequiredForNextLevel = NormalUpgradeLevel * normalUpgrade.experiencePerLevel
          if NormalUpgradeExperience >= ExperienceRequiredForNextLevel then
              NormalUpgradeExperience = NormalUpgradeExperience - ExperienceRequiredForNextLevel
              NormalUpgradeLevel = NormalUpgradeLevel + 1
              local text = "You have advanced to Upgrade Skill level " .. NormalUpgradeLevel .. "."
              if NormalUpgradeLevel == normalUpgrade.maxLevel then
                  text = "You have reached the maximum Upgrade Skill level."
              end
              player:sendTextMessage(MESSAGE_EVENT_ADVANCE, text)
          else
              break
          end
      until (NormalUpgradeLevel == normalUpgrade.maxLevel)
  end

  player:setStorageValue(normalUpgrade.storage.level, NormalUpgradeLevel)
  player:setStorageValue(normalUpgrade.storage.experience, NormalUpgradeExperience)
  return true
end


 function itemUpgrader.onUse(cid, item, fromPosition, itemEx, toPosition)

  local levels = {
		expgainmin = 75, -- DO NOT CHANGE !
		expgainmax = 115, -- DO NOT CHANGE !
	}

  if item.itemid == 20138 then
    local it = ItemType(itemEx.itemid)
    if ((it:getWeaponType() > 0 or getItemAttribute(itemEx.uid, ITEM_ATTRIBUTE_ARMOR) > 0) and not isItemStackable(itemEx.itemid)) then
   local level = upgrading.getLevel(itemEx.uid)
   if doPlayerRemoveItem(cid, 8192, quantOre) then
   if(level < #conf["level"]) and level < 50 then
   local nLevel = (conf["level"][(level+1)].successPercent >= math.random(1,100)) and (level+1) or conf["level"][level].downgradeLevel
   if(nLevel > level)then
    local experienceRan = math.random(levels.expgainmin, levels.expgainmax)
    if giveNormalUpgradeExperience(cid:getId(), experienceRan) then
      cid:sendTextMessage(MESSAGE_INFO_DESCR, "You have gained "..experienceRan.." experience on Upgrade skill.")
      
    end
   doSendMagicEffect(cid:getPosition(), 244)
   doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Upgrade your " .. it:getName() .. " to level " .. nLevel .. " successful!")
   else
   doSendMagicEffect(cid:getPosition(), 249)
   doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Upgrade failed. Your " .. it:getName() .. " is now on level " .. nLevel .. "")
   end
   doItemSetAttribute(itemEx.uid, ITEM_ATTRIBUTE_NAME, it:getName()..((nLevel>0) and " +"..nLevel or ""))
   doItemSetAttribute(itemEx.uid, ITEM_ATTRIBUTE_ATTACK,  upgrading.upValue(it:getAttack(), nLevel, conf["upgrade"].attack))
   doItemSetAttribute(itemEx.uid, ITEM_ATTRIBUTE_DEFENSE, upgrading.upValue(it:getDefense(), nLevel, conf["upgrade"].defense))
   doItemSetAttribute(itemEx.uid, ITEM_ATTRIBUTE_EXTRADEFENSE, upgrading.upValue(it:getExtraDefense(), nLevel, conf["upgrade"].extraDefense))
   doItemSetAttribute(itemEx.uid, ITEM_ATTRIBUTE_ARMOR, upgrading.upValue(it:getArmor(), nLevel, conf["upgrade"].armor))
   doItemSetAttribute(itemEx.uid, ITEM_ATTRIBUTE_HITCHANCE, upgrading.upValue(it:getHitChance(), nLevel, conf["upgrade"].hitChance))
   --doItemSetAttribute(itemEx.uid, ITEM_ATTRIBUTE_DESCRIPTION, it:getDescription().."\nRefined by "..cid:getName()..".")
   doRemoveItem(item.uid, 1)
   else
   doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Your " .. it:getName() .. " is on max level or you cannot use this scroll on this item.")
   end
   else
   doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce nao tem vampire lord tokens o suficiente. Voce precisa de "..quantOre.." vampire lord tokens.")
end
  else
   doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You cannot upgrade this item.")
end
end
end
itemUpgrader:id(20138)
itemUpgrader:register()