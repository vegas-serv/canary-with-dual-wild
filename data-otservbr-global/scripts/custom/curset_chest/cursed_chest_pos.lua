local curseSpawn = GlobalEvent("curseSpawn")

CURSED_CHESTS_AID = 9000

CURSED_CHESTS_SPAWNS = {
	[1] = {
		pos = Position(32369, 32221, 9),
		size = 30,
		chests = {1}
	},
	[2] = {
		pos = Position(32356, 32149, 7),
		size = 30,
		chests = {1}
	},
	[3] = {
		pos = Position(32268, 32267, 7),
		size = 30,
		chests = {1}
	},
	[4] = {
		pos = Position(32348, 32292, 7),
		size = 30,
		chests = {1}
	},
	[5] = {
		pos = Position(32444, 32223, 7),
		size = 30,
		chests = {1}
	},
	[6] = {
		pos = Position(32622, 31950, 7),
		size = 30,
		chests = {1}
	},
	[7] = {
		pos = Position(32841, 32122, 7),
		size = 30,
		chests = {1}
	},
	[8] = {
		pos = Position(32341, 31741, 7),
		size = 30,
		chests = {1}
	},
	[9] = {
		pos = Position(32641, 31717, 7),
		size = 30,
		chests = {1}
	},
	[10] = {
		pos = Position(32389, 32809, 6),
		size = 30,
		chests = {1}
	},
	[11] = {
		pos = Position(32618, 32699, 7),
		size = 25,
		chests = {1}
	},
	[12] = {
		pos = Position(33150, 32733, 7),
		size = 25,
		chests = {1}
	},
	[13] = {
		pos = Position(33224, 32423, 7),
		size = 25,
		chests = {1}
	},
	[14] = {
		pos = Position(6365, 6212, 7),
		size = 25,
		chests = {1}
	},
	[15] = {
		pos = Position(33927, 31565, 7),
		size = 30,
		chests = {1}
	},
	[16] = {
		pos = Position(33572, 32007, 7),
		size = 25,
		chests = {1}
	},
	[17] = {
		pos = Position(33532, 32516, 5),
		size = 25,
		chests = {1}
	},
	[18] = {
		pos = Position(32716, 31209, 6),
		size = 5,
		chests = {1}
	},
	[19] = {
		pos = Position(32234, 31081, 5),
		size = 25,
		chests = {1}
	},
	[20] = {
		pos = Position(33449, 31274, 7),
		size = 25,
		chests = {1}
	}
}

function curseSpawn.onThink(cid, interval, lastExecution)
	for spawnId, data in ipairs(CURSED_CHESTS_SPAWNS) do
		if not data.spawned then
			local from = Position(data.pos.x - data.size, data.pos.y - data.size, data.pos.z)
			local to = Position(data.pos.x + data.size, data.pos.y + data.size, data.pos.z)
			local chestId = math.random(1, #data.chests)
			local spawnPos = Position(math.random(from.x, to.x), math.random(from.y, to.y), data.pos.z)
			local tile = Tile(spawnPos)
			local spawnTest = 0

			while spawnTest < 100 do
				if isBadTile(tile) then
					spawnPos = Position(math.random(from.x, to.x), math.random(from.y, to.y), data.pos.z)
					tile = Tile(spawnPos)
					spawnTest = spawnTest + 1
				else
					break
				end
			end

			if spawnTest < 100 then
				local rarity = nil
				for i = #CURSED_CHESTS_TIERS, 1, -1 do
					rarity = CURSED_CHESTS_TIERS[i]
					if math.random(1, 100) <= rarity.chance then
						break
					end
				end
				if rarity ~= nil then
					local chest = Game.createItem(rarity.item, 1, spawnPos)
					chest:setActionId(CURSED_CHESTS_AID)
					spawnPos:sendMagicEffect(CONST_ME_GROUNDSHAKER)
					local chestData = {}
					chestData.pos = spawnPos
					chestData.spawnId = spawnId
					chestData.wave = 0
					chestData.monsters = {}
					chestData.active = 0
					chestData.finished = false
					chestData.container = chest
					chestData.chest = CURSED_CHESTS_CONFIG[chestId]
					chestData.rarity = rarity
					CURSED_CHESTS_DATA[#CURSED_CHESTS_DATA + 1] = chestData
					data.spawned = true
				end
			end

		end
	end
	return true
end

curseSpawn:interval(14400000) 
curseSpawn:register()