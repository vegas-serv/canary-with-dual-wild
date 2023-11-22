function Container.isContainer(self)
	return true
end

---@alias LootItems table<number, {count: number, subType?: number, text?: string, actionId?: number, gut?: boolean, childLoot: LootItems}>

---@param loot LootItems
function Container:addLoot(loot)
	for itemId, item in pairs(loot) do
		local iType = ItemType(itemId)
		if not iType then
			logger.warn("Container:addLoot: invalid item type: {}", itemId)
			goto continue
		end
		if iType:isStackable() or iType:getCharges() ~= 0 then
			local stackSize = iType:getStackSize()
			local remainingCount = item.count

			while remainingCount > 0 do
				local countToAdd = math.min(remainingCount, stackSize)
				local tmpItem = self:addItem(itemId, countToAdd, INDEX_WHEREEVER, FLAG_NOLIMIT)
				if not tmpItem then
					logger.warn("Container:addLoot: failed to add stackable item: {}, to corpse {} with id {}", ItemType(itemId):getName(), self:getName(), self:getId())
					goto continue
				end

				remainingCount = remainingCount - countToAdd
			end
		else
			for i = 1, item.count do
				local tmpItem = self:addItem(itemId, 1, INDEX_WHEREEVER, FLAG_NOLIMIT)
				if not tmpItem then
					logger.warn("Container:addLoot: failed to add item: {}, to corpse {} with id {}", ItemType(itemId):getName(), self:getName(), self:getId())
					goto continue
				end

				if tmpItem:isContainer() and item.childLoot then
					if not tmpItem:addLoot(item.childLoot) then
						tmpItem:remove()
						goto continue
					end
				end

				if item.subType ~= -1 then
					tmpItem:transform(itemId, item.subType)
				elseif iType:isFluidContainer() then
					tmpItem:transform(itemId, 0)
				end

				if item.actionId ~= -1 then
					tmpItem:setActionId(item.actionId)
				end

				if item.text and item.text ~= "" then
					tmpItem:setText(item.text)
				end
			end
		end

		::continue::
	end
end
