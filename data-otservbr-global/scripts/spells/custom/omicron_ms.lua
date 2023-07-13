local config = {
    type = COMBAT_ENERGYDAMAGE,
    effect = 48, --
    effect2 = 23, --
    distance = 36, -- Distance effect
    rounds = 4, -- How many rounds
    time = 250 -- How fast it should be
}

local combat = Combat()
local combat2 = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MORTAREA)
combat2:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat2:setParameter(COMBAT_PARAM_EFFECT, CONST_ANI_CAKE)

local area = {
{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
{ 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0 },
{ 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0 },
{ 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0 },
{ 0, 0, 1, 0, 0, 3, 0, 0, 1, 0, 0 },
{ 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0 },
{ 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0 },
{ 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0 },
{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
}

local area2 = {
{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
{ 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0 },
{ 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0 },
{ 0, 0, 0, 1, 1, 3, 1, 1, 0, 0, 0 },
{ 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0 },
{ 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0 },
{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
}

combat:setArea(createCombatArea(area))
combat2:setArea(createCombatArea(area2))

function onGetFormulaValues(player, level, magicLevel) -- DISTANCE EFFECT FORMULAS
    local min = (level / 5) + (magicLevel * 2) + 10
    local max = (level / 5) + (magicLevel * 3.2) + 15
    return -min, -max
end

function onGetFormulaValues2(player, level, magicLevel) -- INSIDE OF AURA EFFECT FORMULAS
    local min = (level / 5) + (magicLevel * 2) + 10
    local max = (level / 5) + (magicLevel * 3.2) + 15
    return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")
combat2:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues2")

local function effecto(cid, variant)
    local player = Player(cid)
    if player then
        local pos = player:getPosition()
        Position(pos.x+3, pos.y+1, pos.z):sendDistanceEffect(Position(pos.x+3, pos.y-1, pos.z), config.distance)
        Position(pos.x+3, pos.y-1, pos.z):sendDistanceEffect(Position(pos.x+1, pos.y-3, pos.z), config.distance)
        Position(pos.x+1, pos.y-3, pos.z):sendDistanceEffect(Position(pos.x-1, pos.y-3, pos.z), config.distance)
        Position(pos.x-1, pos.y-3, pos.z):sendDistanceEffect(Position(pos.x-3, pos.y-1, pos.z), config.distance)
        Position(pos.x-3, pos.y-1, pos.z):sendDistanceEffect(Position(pos.x-3, pos.y+1, pos.z), config.distance)
        Position(pos.x-3, pos.y+1, pos.z):sendDistanceEffect(Position(pos.x-1, pos.y+3, pos.z), config.distance)
        Position(pos.x-1, pos.y+3, pos.z):sendDistanceEffect(Position(pos.x+1, pos.y+3, pos.z), config.distance)
        Position(pos.x+1, pos.y+3, pos.z):sendDistanceEffect(Position(pos.x+3, pos.y+1, pos.z), config.distance)
        combat:execute(player, variant)
        combat2:execute(player, variant)
    end
end

local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
    local cid = creature:getId()
    for i = 1, config.rounds do
        addEvent(effecto, config.time * (i -1), cid, variant)
    end
    return true
end

spell:group("attack")
spell:id(154)
spell:name("Flame Omicron")
spell:words("exevo omicron flame")
spell:level(300)
spell:mana(650)
spell:isPremium(true)
spell:blockWalls(true)
spell:cooldown(3 * 1000)
spell:groupCooldown(2 * 1000)
spell:needLearn(false)
spell:vocation("sorcerer;true", "master sorcerer;true")
spell:register()