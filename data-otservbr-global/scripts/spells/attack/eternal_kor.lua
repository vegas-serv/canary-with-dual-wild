local config = {
    combat = COMBAT_PHYSICALDAMAGE,
    distanceEffect = 32,
    rounds = 4,
    delay = 250,
    firstEffect = 74,
    secondEffect = 36
}

local acombat, combat = createCombatObject(), createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, config.combat)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, config.combat)

local arr1 = {
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
}

setCombatArea(combat2, createCombatArea(arr1))
setCombatArea(acombat, createCombatArea(arr1))

function onGetFormulaValues(player, skill, attack, factor)
    local min = 500
    local max = 700
    return -(min), -(max)
end

setCombatCallback(combat2, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

function onGetFormulaValues(player, skill, attack, factor)
    local min = 0
    local max = 0
    return -min, -max
end

setCombatCallback(combat, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local effect = {config.firstEffect,config.secondEffect}
function onTargetTile(cid, pos)
    return math.random(2) == 1 and pos:sendMagicEffect(effect[math.random(#effect)]) and  doSendDistanceShoot({ x = pos.x - 7, y = pos.y - 7, z = pos.z}, pos, 36) and doCombat(cid, combat, positionToVariant(pos))
end

setCombatCallback(acombat, CALLBACK_PARAM_TARGETTILE, "onTargetTile")

local function doTimeCombat(cid, combat, var)
     if isPlayer(cid) then
         doCombat(cid, combat, var)
         doCombat(cid, combat2, var)
     end
     return true
end

local spell = Spell("instant")

function spell.onCastSpell(cid, var)
    local player = Player(cid)
     for x = 1, config.rounds do
         addEvent(doTimeCombat, (x-1) * config.delay, cid.uid, acombat, var)
     end
     return true
end

spell:group("attack")
spell:id(80)
spell:name("Berserk Kor")
spell:words("exevo mas ico")
spell:level(500)
spell:mana(350)
spell:isPremium(true)
spell:needWeapon(true)
spell:cooldown(7 * 1000)
spell:groupCooldown(4 * 1000, 4 * 1000)
spell:needLearn(false)
spell:vocation("knight;true", "elite knight;true")
spell:register()