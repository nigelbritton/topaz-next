-----------------------------------
-- Trust: Kupofried
-----------------------------------
require("scripts/globals/gambits")
require("scripts/globals/magic")
require("scripts/globals/status")
require("scripts/globals/trust")
require("scripts/globals/utils")
-----------------------------------
local spell_object = {}

spell_object.onMagicCastingCheck = function(caster, target, spell)
    return tpz.trust.canCast(caster, spell)
end

spell_object.onMobSpawn = function(mob)
    mob:addMod(tpz.mod.EXP_BONUS, 20) -- Might need to reference the player/caster but cannot reference on dealth or depspawn
end

spell_object.onSpellCast = function(caster, target, spell)
    return tpz.trust.spawn(caster, spell)
end

spell_object.onMobDespawn = function(mob)
    mob:delMod(tpz.mod.EXP_BONUS, 20)
    tpz.trust.message(mob, message_page_offset, tpz.trust.message_offset.DESPAWN)
end

spell_object.onMobDeath = function(mob)
    mob:delMod(tpz.mod.EXP_BONUS, 20)
    tpz.trust.message(mob, message_page_offset, tpz.trust.message_offset.DEATH)
end

return spell_object


