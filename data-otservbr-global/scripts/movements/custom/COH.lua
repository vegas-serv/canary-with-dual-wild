local castlecoh = MoveEvent()
function castlecoh.onStepIn(cid, item, pos, fromPosition)
 local pos = {x = 32369, y = 32241, z = 7}
	local config = {
	msgDenied = "[World-Castle] Você não pertence á guild dominante "..getGlobalStorageValue(COH_STATUS)..".",
	msgWelcome = "Welcome to Castle!"
	}

 if item.actionid == 16203 then 
  if not isPlayer(cid) then
     return true
  end 
  if getGlobalStorageValue(COH_STATUS) == getPlayerGuildName(cid) then
   doSendMagicEffect(getThingfromPos(cid), 14)
   doPlayerSendTextMessage(cid, 4, "[World-Castle] Membros da guild dominante "..getGlobalStorageValue(COH_STATUS).." possuem o privilegio de passar por aqui!")
  else
	doTeleportThing(cid, pos)
	doPlayerPopupFYI(cid, config.msgDenied)
   doPlayerSendCancel(cid, "[World-Castle] Você não pertence á guild dominante "..getGlobalStorageValue(COH_STATUS)..".")
   end
  return true
 end

    if item.actionid == 16202 then
    if not isPlayer(cid) then
     return true
  end
  if getPlayerGuildLevel(cid, 0) then
   if (getGlobalStorageValue(COH_STATUS) ~= getPlayerGuildName(cid)) then
          doPlayerSendTextMessage(cid, 20, "[World-Castle] Você e sua guild estão no comando, os antigos donos ["..tostring(getGlobalStorageValue(COH_STATUS)).."] podem se vingar!")
     setGlobalStorageValue(COH_PREPARE1, -1)
       setGlobalStorageValue(COH_PREPARE2, -1)
     setGlobalStorageValue(COH_STATUS, getPlayerGuildName(cid))
     doCastleRemoveEnemies()
    broadcastMessage("[World-Castle] O jogador ["..getCreatureName(cid).."] e sua guild ["..getPlayerGuildName(cid).."] estão agora no comando do castelo. Tente dominar o Castle ou os aceite como governantes!", MESSAGE_EVENT_ADVANCE)
      end
    else
   doSendMagicEffect(getThingfromPos(cid), 2)
      doTeleportThing(cid, fromPosition, false)
   doPlayerSendCancel(cid, "[World-Castle] Você não possui uma guild.")
   end
    return true
 end

    if item.actionid == 16200 then
  if not isPlayer(cid) then
     return true
  end
  if getPlayerGuildLevel(cid, 0) then
   doPlayerSendTextMessage(cid, 4, "World-Castle Invasion Camp!")
   if (getGlobalStorageValue(COH_PREPARE1) ~= getPlayerGuildName(cid)) and ((getGlobalStorageValue(COH_PREPARE2) ~= getPlayerGuildName(cid))) then
    setGlobalStorageValue(COH_PREPARE1, getPlayerGuildName(cid))
    broadcastMessage("[World-Castle] Atenção! A guild "..getPlayerGuildName(cid).." está indo em direção ao Castelo. Guild dominante preparem-se!", MESSAGE_EVENT_ADVANCE)
   end
  else
   doSendMagicEffect(getThingfromPos(cid), 2)
      doTeleportThing(cid, fromPosition, false)
   doPlayerSendCancel(cid, "[World-Castle] Você não possui uma guild.")  
   return true
  end  
 end

 if item.actionid == 16201 then
  if not isPlayer(cid) then
     return true
  end
  doPlayerSendTextMessage(cid, 4, "World-Castle Invasion Castle!")
  if (getGlobalStorageValue(COH_PREPARE2) ~= getPlayerGuildName(cid)) then
   setGlobalStorageValue(COH_PREPARE2, getPlayerGuildName(cid))
   broadcastMessage("[World-Castle] Atenção! A guild "..getPlayerGuildName(cid).." está próxima do domínio do Castle. Guild dominanete defenda o Castle para não perde-lo!", MESSAGE_EVENT_ADVANCE)
  end
 end
 return true
end

castlecoh:type("stepin")
castlecoh:aid(16200, 16201, 16202, 16203)
castlecoh:register()