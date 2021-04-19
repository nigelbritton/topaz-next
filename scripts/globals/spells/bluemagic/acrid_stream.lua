-----------------------------------
-- Spell: Acrid Stream
-- Deals water damage to enemies within a fan-shaped area originating from the caster. Additional effect: Lowers target's Magic Defense.
-- Spell cost: 89 MP
-- Monster Type: Clionid
-- Spell Type: Magical (Water)
-- Blue Magic Points: 3
-- Stat Bonus: DEX +2 MND +2
-- Level: 77
-- Casting Time: 4 seconds
-- Recast Time: 23 seconds
-----------------------------------
-- Combos: Clear Mind
-----------------------------------
require("scripts/globals/bluemagic")
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------
local spell_object = {}

spell_object.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spell_object.onSpellCast = function(caster, target, spell)
    local params = {}
    -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
    local multi = 2.125
    if (caster:hasStatusEffect(tpz.effect.AZURE_LORE)) then
        multi = multi + 0.50
    end
    params.attackType = tpz.attackType.MAGICAL
    params.damageType = tpz.damageType.WATER
    params.multiplier = multi
    params.tMultiplier = 2.0
    params.duppercap = 69
    params.str_wsc = 0.0
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 2.0
    params.mnd_wsc = 0.3
    params.chr_wsc = 0.0
    damage = BlueMagicalSpell(caster, target, spell, params, INT_BASED)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    local params = {}

    params.diff = caster:getStat(tpz.mod.INT) - target:getStat(tpz.mod.INT)

    params.attribute = tpz.mod.INT

    params.skillType = tpz.skill.BLUE_MAGIC

    params.bonus = 1.0

    local resist = applyResistance(caster, target, spell, params)
    local typeEffectOne = tpz.effect.MAGIC_DEF_DOWN
    -- local typeEffectTwo = tpz.effect.ATTACK_DOWN
    local duration = 60

    if (damage > 0 and resist > 0.3) then
        target:addStatusEffect(typeEffectOne, 5, 0, duration)
        -- target:addStatusEffect(typeEffectTwo, 5, 0, duration)
    end

    return damage
end

return spell_object
