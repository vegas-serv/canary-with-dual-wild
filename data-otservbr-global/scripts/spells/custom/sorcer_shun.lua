local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_BIGCLOUDS)

AREA_PALLISH_SAN = {
{0, 0, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 0, 1, 1, 1, 0, 0, 0},
{0, 0, 0, 0, 3, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 1, 0, 1, 0, 0, 0}
 }

combat:setArea(createCombatArea(AREA_PALLISH_SAN))
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_CAKE)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)



function onGetFormulaValues(player, level, maglevel)
    local min = (level / 4.5) + (maglevel * 4) + 25
    local max = (level / 4.5) + (maglevel * 6) + 45
    return -min, -max
end

function onTargetTile(creature, position)
    if creature then
        creature:getPosition():sendDistanceEffect(position, CONST_ANI_CAKE)
    end
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")
combat:setCallback(CALLBACK_PARAM_TARGETTILE, "onTargetTile")

local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
    return combat:execute(creature, variant)
end

spell:group("attack")
spell:id(151)
spell:name("Strong Shun Strike")
spell:words("exevo shun strike")
spell:level(200)
spell:mana(500)
spell:isPremium(true)
spell:blockWalls(true)
spell:cooldown(5 * 1000)
spell:groupCooldown(2 * 1000)
spell:needLearn(false)
spell:vocation("sorcerer;true", "master sorcerer;true")
spell:register()