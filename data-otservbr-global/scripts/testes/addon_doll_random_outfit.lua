--local actionId = 8000
local itemDollId = 35692
local outfits = {
   {1207, 1206, "Lion of War"},
    {1205, 1204, "Veteran Paladin"},
    {1203, 1202, "Void Master"}
}

local randsOutfit = Action()

function randsOutfit.onUse(player, item, fromPosition, target, toPosition, isHotkey)
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

randsOutfit:id(itemDollId)
randsOutfit:register()