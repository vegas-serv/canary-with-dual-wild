--local actionId = 8000
local itemDollId = 12044
local outfits = {
   {1576, 1575, "Fencer"},
    {1582, 1581, "Shadowlotus Disciple"},
    {1613, 1612, "Frost Tracer"},
    {1619, 1618, "Armoured Archers"}
}

local randOutfit = Action()

function randOutfit.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local outfit = outfits[math.random(1, #outfits)]
    local addon = math.random(1, 2)
    if player:hasOutfit(outfit[1], addon) and player:hasOutfit(outfit[2], addon) then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You already have this outfit.")
        return true
    end

    player:addOutfitAddon(outfit[1], addon)
    player:addOutfitAddon(outfit[2], addon)
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("You obtained the %s outfit with addon %d.", outfit[3], addon))
    item:remove(1)
    return true
end

randOutfit:id(itemDollId)
--randOutfit:aid(actionId)
randOutfit:register()