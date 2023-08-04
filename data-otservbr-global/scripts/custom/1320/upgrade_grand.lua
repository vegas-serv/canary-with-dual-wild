---- string of mending id "22542"-----
local ITEMS = {
    [43882] = { -----Broken Ring Id "13877" Ring of ending "22516"
        {"Grand Sanguine Coil", 80.99} ----- 1.97 es la probabilidad de crear el item
	},
	[43885] = { -----Broken Ring Id "13877" Ring of ending "22516"
        {"Grand Sanguine Rod", 80.99} ----- 1.97 es la probabilidad de crear el item
	},
	[43879] = { -----Broken Ring Id "13877" Ring of ending "22516"
        {"Grand Sanguine Crossbow", 80.99} ----- 1.97 es la probabilidad de crear el item
	},
	[43877] = { -----Broken Ring Id "13877" Ring of ending "22516"
        {"Grand Sanguine Bow", 80.99} ----- 1.97 es la probabilidad de crear el item
	},
	[43868] = { -----Broken Ring Id "13877" Ring of ending "22516"
        {"Grand Sanguine Hatchet", 80.99} ----- 1.97 es la probabilidad de crear el item
	},
	[43866] = { -----Broken Ring Id "13877" Ring of ending "22516"
        {"Grand Sanguine Cudgel", 80.99}
		
    },
	[43870] = { -----Broken Ring Id "13877" Ring of ending "22516"
        {"Grand Sanguine Razor", 80.99}
		
    },
	[43874] = { -----Broken Ring Id "13877" Ring of ending "22516"
        {"Grand Sanguine Battleaxe", 80.99}
		
    },
	[43872] = { -----Broken Ring Id "13877" Ring of ending "22516"
        {"Grand Sanguine Bludgeon", 80.99}
		
    },
	[43864] = { -----Broken Ring Id "13877" Ring of ending "22516"
        {"Grand Sanguine Blade", 80.99}
		
    }
}

local upgradeplas = Action()
function upgradeplas.onUse(cid, item, fromPosition, itemEx, toPosition)
    local cadena = ITEMS[itemEx.itemid]
    if cadena == nil then
        return false
    end
 
    local iEx = Item(itemEx.uid)
    local random, chance = math.random() * 100, 0
 
    for i = 1, #cadena do
        chance = chance + cadena[i][2]
        if random <= chance then
            iEx:transform(cadena[i][1])
            iEx:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
            Item(item.uid):remove(1)
            return true
        end
    end
 
    iEx:getPosition():sendMagicEffect(CONST_ME_BLOCKHIT)
    Item(item.uid):remove(1)
	iEx:remove()
	doCreatureSay(cid, "20% chance, the item was broken.", TALKTYPE_ORANGE_1)
    return true
end
upgradeplas:id(23573)
upgradeplas:register()