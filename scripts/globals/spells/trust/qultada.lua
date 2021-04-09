-----------------------------------
-- Trust: Qultada
-----------------------------------
require("scripts/globals/trust")
-----------------------------------
local spell_object = {}

local message_page_offset = 15 -- needs changing

spell_object.onMagicCastingCheck = function(caster, target, spell)
    return tpz.trust.canCast(caster, spell)
end

spell_object.onSpellCast = function(caster, target, spell)
    return tpz.trust.spawn(caster, spell)
end

spell_object.onMobSpawn = function(mob)
    tpz.trust.message(mob, message_page_offset, tpz.trust.message_offset.SPAWN)

    -- TODO: Better logic than this
    mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, tpz.effect.CHAOS_ROLL, ai.r.JA, ai.s.SPECIFIC, tpz.jobAbility.CHAOS_ROLL, 60)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, tpz.effect.CORSAIRS_ROLL, ai.r.JA, ai.s.SPECIFIC, tpz.jobAbility.CORSAIRS_ROLL, 60)

    -- Ranged Attack as much as possible (limited by "weapon" delay)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.ALWAYS, 0, ai.r.RATTACK, 0, 0)
end

spell_object.onMobDespawn = function(mob)
    tpz.trust.message(mob, message_page_offset, tpz.trust.message_offset.DESPAWN)
end

spell_object.onMobDeath = function(mob)
    tpz.trust.message(mob, message_page_offset, tpz.trust.message_offset.DEATH)
end

return spell_object
