local go = TalkAction("!go")

function go.onSay(player, words, param)
    local places, options =
        {"Kazordoon", "venore","thais", "carlin","Ab'Dendriel", "liberty bay","Port Hope", "ankrahmun","darashia", "edron","svargrond", "yalahar","farmine", "gray island","roshamuul", "oramond", "krailos", "feyrist", "issavi", "marapur", "etheno", "gnomprona", "Ingol"}, -- places
        {"go", "Cancel"} -- options

    local modalWindow = ModalWindow(4597, "List of places", "Select your destiny:")
    for w = 1, #places do
        modalWindow:addChoice(w, places[w])
    end

    -- Select
    modalWindow:addButton(1, options[1])
    modalWindow:setDefaultEnterButton(1)

    -- Cancel
    modalWindow:addButton(2, options[2])
    modalWindow:setDefaultEscapeButton(2)

    -- Send window
    modalWindow:sendToPlayer(player)
    return false
end

go:register()