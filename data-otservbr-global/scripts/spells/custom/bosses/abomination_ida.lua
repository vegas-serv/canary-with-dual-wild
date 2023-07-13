local vocation = {
	VOCATION.BASE_ID.SORCERER,
	VOCATION.BASE_ID.DRUID,
	VOCATION.BASE_ID.PALADIN,
	VOCATION.BASE_ID.KNIGHT
}

area = {
	{0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0},
	{0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0},
	{0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0},
	{0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0},
	{0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0},
	{0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0},
	{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
	{1, 1, 1, 1, 1, 1, 1, 3, 1, 1, 1, 1, 1, 1, 1},
	{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
	{0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0},
	{0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0},
	{0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0},
	{0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0},
	{0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0},
	{0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0}
}

local createArea = createCombatArea(area)

local combat = Combat()
combat:setArea(createArea)

function onTargetTile(cid, pos)
	local creature = Creature(cid)
	if not creature then
		return true
	end
	
	local tile = Tile(pos)
	if tile then
		local creatures = tile:getCreatures()
		if creatures then
			for k, tmpCreature in pairs(creatures) do
				if creature:getId() ~= tmpCreature:getId() then
					local min = 5000
					local max = 12500
					if tmpCreature:isPlayer() then
						if table.contains(vocation, tmpCreature:getVocation():getBaseId()) then
							doTargetCombatHealth(cid, tmpCreature, COMBAT_HOLYDAMAGE, -min, -max, CONST_ME_FATAL)
						end
					elseif tmpCreature:isMonster() then
						doTargetCombatHealth(cid, tmpCreature, COMBAT_HOLYDAMAGE, -min, -max, CONST_ME_FATAL)
					end
				end
			end
		end
	end
	
	pos:sendMagicEffect(CONST_ME_MORTAREA)
	return true
end

combat:setCallback(CALLBACK_PARAM_TARGETTILE, "onTargetTile")

local function delayedCastSpell(cid, var)
	local creature = Creature(cid)
	if not creature then
		return
	end
	if creature:getHealth() >= 1 then
		creature:setMoveLocked(false)
		return combat:execute(creature, positionToVariant(creature:getPosition()))
	end
	return
end

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	local roomCenterPosition = Position(33906, 31288, 15)
	for _, spec in pairs(Game.getSpectators(roomCenterPosition, false, false, 12, 12, 12, 12)) do
		if spec:isPlayer() then
			if not spec:getPosition():compare(roomCenterPosition) then
				spec:teleportTo(roomCenterPosition)
			end
		elseif spec:getName():lower() == 'the abomination' then
			if not spec:getPosition():compare(roomCenterPosition) then
				spec:teleportTo(roomCenterPosition)
			end
			spec:setMoveLocked(true)
		end
	end
	
	creature:say("The Abomination BEGINS TO CHANNEL A POWERFULL SPELL! TAKE COVER!", TALKTYPE_MONSTER_YELL)
	addEvent(delayedCastSpell, 4000, creature:getId(), var)
	return true
end

spell:name("abomination ida")
spell:words("###1430")
spell:isAggressive(true)
spell:blockWalls(true)
spell:needLearn(true)
spell:register()