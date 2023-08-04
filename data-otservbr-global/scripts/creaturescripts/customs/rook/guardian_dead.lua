local rookDeath = CreatureEvent("rookDeath")

function rookDeath.onDeath(creature, corpse, killer, mostDamage, unjustified, mostDamage_unjustified)
	local damageMap = creature:getMonster():getDamageMap()

	for key, value in pairs(damageMap) do
		local player = Player(key)
		if player and player:getStorageValue(79911) < 1 then
			player:setStorageValue(79911, 1) -- Access to rook
		end
	end
end

rookDeath:register()