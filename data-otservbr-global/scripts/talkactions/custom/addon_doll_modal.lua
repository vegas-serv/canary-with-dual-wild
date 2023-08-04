local outfits = {
 
    -- Config
        dollID = 28895, -- Change this to your dolls or items, item ID
     
        -- Main Window Messages (The first window the player sees)
        mainTitle = "Choose an outfit",
        mainMsg = "You will recieve both addons aswell as the outfit you choose.",
     
        -- Already Owned Window (The window that appears when the player already owns the addon)
        ownedTitle = "Whoops!",
        ownedMsg = "You already have this addon. Please choose another.",
     
        -- No Doll in Backpack (The window that appears when the player doesnt have the doll in their backpack)
        dollTitle = "Whoops!",
        dollMsg = "The addon doll must be in your backpack.",
    -- End Config

    -- Outfit Table
        [1] = {name = "Rift Warrior", male = 846, female = 845},
        [2] = {name = "Winter Warden", male = 853, female = 852},
        [3] = {name = "Retro Warrior", male = 962, female = 963},
        [4] = {name = "Retro Summoner", male = 964, female = 965},
        [5] = {name = "Retro Noblewoman", male = 966, female = 967},
        [6] = {name = "Retro Mage", male = 968, female = 969},
        [7] = {name = "Retro Knight", male = 970, female = 971},
        [8] = {name = "Retro Hunter", male = 972, female = 973},
        [9] = {name = "Retro Citizen", male = 974, female = 975},
        [10] = {name = "Herbalist", male = 1021, female = 1020},
        [11] = {name = "Sun Priest", male = 1023, female = 1024},
        [12] = {name = "Mercenary", male = 1056, female = 1057},
        [13] = {name = "Battle Mage", male = 1069, female = 1070},
        [14] = {name = "Sinister Archer", male = 1102, female = 1103},
        [15] = {name = "Guidon Bearer", male = 1186, female = 1187},
        [16] = {name = "Void Master", male = 1202, female = 1203},
        [17] = {name = "Veteran Paladin", male = 1204, female = 1205},
        [18] = {name = "Breezy Garb", male = 1245, female = 1246},
        [19] = {name = "Herder", male = 1279, female = 1280},
        [20] = {name = "Dragon Slayer", male = 1288, female = 1289},
        [21] = {name = "Trailblazer", male = 1292, female = 1293},
        [22] = {name = "Jouster", male = 1331, female = 1332},
        [23] = {name = "Moth Cape", male = 1338, female = 1339},
        [24] = {name = "Merry Garb", male = 1382, female = 1383},
        [25] = {name = "Rune Master", male = 1384, female = 1385},
        [26] = {name = "Deepling", male = 463, female = 464},
        [27] = {name = "Insectoid", male = 465, female = 466},
        [28] = {name = "Entrepreneur", male = 472, female = 471},
        [29] = {name = "Crystal Warlord", male = 512, female = 513},
        [30] = {name = "Soil Guardian", male = 516, female = 514},
        [31] = {name = "Forest Warden", male = 1415, female = 1416},
        [32] = {name = "Cave Explorer", male = 574, female = 575},
        [33] = {name = "Dream Warden", male = 577, female = 578},
        [34] = {name = "Champion", male = 633, female = 632},
        [35] = {name = "Conjurer", male = 634, female = 635},
        [36] = {name = "Beastmaster", male = 637, female = 636},
        [37] = {name = "Chaos Acolyte", male = 665, female = 664},
        [38] = {name = "Death Herald", male = 667, female = 666},
        [39] = {name = "Ranger", male = 684, female = 683},
        [40] = {name = "Ceremonial Garb", male = 695, female = 694},
        [41] = {name = "Puppeteer", male = 697, female = 696},
        [42] = {name = "Spirit Caller", male = 699, female = 698},
        [43] = {name = "Evoker", male = 725, female = 724},
        [44] = {name = "Seaweaver", male = 733, female = 732},
        [45] = {name = "Recruiter", male = 746, female = 745},
        [46] = {name = "Sea Dog", male = 750, female = 749},
        [47] = {name = "Royal Pumpkin", male = 760, female = 759},
    }

local addonsDollModal = TalkAction("!addondoll")

    function addonsDollModal.onSay(player, words, param)
        player:sendAddonWindow(outfits)
        return true
    end

addonsDollModal:separator(" ")
addonsDollModal:register()