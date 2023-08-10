local mounts = {

    -- Config
        dollID = 9145, -- Change this to your dolls or items, item ID
     
        -- Main Window Messages (The first window the player sees)
        mainTitle = "Choose a Mount!",
        mainMsg = "Choose a mount to unlock.",
     
        -- Already Owned Window (The window that appears when the player already owns the addon)
        ownedTitle = "Whoops!",
        ownedMsg = "You already have this mount. Please choose another.",
     
        -- No Doll in Backpack (The window that appears when the player doesnt have the doll in their backpack)
        dollTitle = "Whoops!",
        dollMsg = "The mount doll must be in your backpack.",
    -- End Config

    -- Mounts Table
        [1] = {name = "Tourney Horse", ID = 205},
        [2] = {name = "Jousting Horse", ID = 204},
        [3] = {name = "Parade Horse", ID = 203},
        [4] = {name = "Cinnamon ibex", ID = 200},
        [5] = {name = "Mint ibex", ID = 199},
        [6] = {name = "Poppy ibex", ID = 198},
        [7] = {name = "Obsidian Shrine", ID = 197},
        [8] = {name = "Jade Shrine", ID = 196},
        [9] = {name = "Topaz Shrine", ID = 195},
        [10] = {name = "Gloothomotive", ID = 194},
        [11] = {name = "Radiant Raven", ID = 193},
        [12] = {name = "Mystic Raven", ID = 192},
        [13] = {name = "Emerald Raven", ID = 191},
        [14] = {name = "Gloomwurm", ID = 190},
        [15] = {name = "Bogwurm", ID = 189},
        [16] = {name = "Rustwurm", ID = 188},
        [17] = {name = "Dandelion", ID = 187},
        [18] = {name = "Peony", ID = 186},
        [19] = {name = "Hyacinth", ID = 185},
        [20] = {name = "Rift Watcher", ID = 181},
        [21] = {name = "Rune Watcher", ID = 180},
        [22] = {name = "Void Watcher", ID = 179},
        [23] = {name = "Armoured War Horse", ID = 23},
        [24] = {name = "Shadow Draptor", ID = 24},
        [25] = {name = "Rented Horse gray", ID = 25},
        [26] = {name = "Rented Horse brow", ID = 26},
        [27] = {name = "Festive Mammoth", ID = 178},
        [28] = {name = "Holiday Mammoth", ID = 177},
        [29] = {name = "Merry Mammoth", ID = 176},
        [30] = {name = "Scruffy Hyaena", ID = 173},
        [31] = {name = "Cunning Hyaena", ID = 172},
        [32] = {name = "Voracious Hyaena", ID = 171},
        [33] = {name = "Eventide Nandu", ID = 170},
        [34] = {name = "Coral Rhea", ID = 169},
        [35] = {name = "Savanna Ostrich", ID = 168},
        [36] = {name = "Tombstinger", ID = 36},
        [37] = {name = "Platesaurian", ID = 37},
        [38] = {name = "Dawn Strayer", ID = 166},
        [39] = {name = "Dusk Pryer", ID = 165},
        [40] = {name = "Snow Strider", ID = 164},
        [41] = {name = "Floating Augur", ID = 161},
        [42] = {name = "Floating Scholar", ID = 160},
        [43] = {name = "Floating Sage", ID = 159},
        [44] = {name = "Azudocus", ID = 44},
        [45] = {name = "Carpacosaurus", ID = 45},
        [46] = {name = "Death Crawler", ID = 46},
        [47] = {name = "Flamesteed", ID = 47},
        [48] = {name = "Jade Lion", ID = 48},
        [49] = {name = "Jade Pincer", ID = 49},
        [50] = {name = "Nethersteed", ID = 50},
        [51] = {name = "Tempest", ID = 51},
        [52] = {name = "Winter King", ID = 52},
        [53] = {name = "Doombringer", ID = 53},
        [54] = {name = "Woodland Prince", ID = 54},
        [55] = {name = "Hailtorm Fury", ID = 55},
        [56] = {name = "Siegebreaker", ID = 56},
        [57] = {name = "Poisonbane", ID = 57},
        [58] = {name = "Blackpelt", ID = 58},
        [59] = {name = "Golden Dragonfly", ID = 59},
        [60] = {name = "Steel Bee", ID = 60},
        [61] = {name = "Copper Fly", ID = 61},
        [62] = {name = "Tundra Rambler", ID = 62},
        [63] = {name = "Highland Yak", ID = 63},
        [64] = {name = "Glacier Vagabond", ID = 64},
        [65] = {name = "Glooth Glider", ID = 65},
        [66] = {name = "Shadow Hart", ID = 66},
        [67] = {name = "Black Stag", ID = 67},
        [68] = {name = "Emperor Deer", ID = 68},
        [69] = {name = "Flying Divan", ID = 69},
        [70] = {name = "Magic Carpet", ID = 70},
        [71] = {name = "Floating Kashmir", ID = 71},
        [72] = {name = "Ringtail Wazzoon", ID = 72},
        [73] = {name = "Night Wazzoon", ID = 73},
        [74] = {name = "Emerald Waccoon", ID = 74},
        [75] = {name = "Flitterkatzen", ID = 75},
        [76] = {name = "Venompaw", ID = 76},
        [77] = {name = "Batcat", ID = 77},
        [78] = {name = "Sea Devil", ID = 78},
        [79] = {name = "Coralripper", ID = 79},
        [80] = {name = "Plumfish", ID = 80},
        [81] = {name = "Gorongra", ID = 81},
        [82] = {name = "Noctungra", ID = 82},
        [83] = {name = "Silverneck", ID = 83},
        [84] = {name = "Zaoan Badger", ID = 155},
        [85] = {name = "Swamp Crocovile", ID = 142},
        [86] = {name = "Muffled Snowman", ID = 136},		
    }
     
local mountsDollModal = TalkAction("!mountdoll")

function mountsDollModal.onSay(player, words, param)
        player:sendMountWindow(mounts)
    end

mountsDollModal:separator(" ")
mountsDollModal:register()
    