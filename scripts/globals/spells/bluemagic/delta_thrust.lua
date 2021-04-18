-----------------------------------
-- Spell: Delta Thrust
-- Delivers a threefold attack on a single target. Additional effect: Plague
-- Spell cost: 28 MP
-- Monster Type: Lizards
-- Spell Type: Physical (SLASHING)
-- Blue Magic Points: 2
-- Stat Bonus: None
-- Level: 89
-- Casting Time: 0.5 seconds
-- Recast Time: 15 seconds
-- Skillchain Element(s): Liquefaction / Detonation
-- Combos: Dual Weild
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
    params.tpmod = TPMOD_ACC
    params.attackType = tpz.attackType.PHYSICAL
    params.damageType = tpz.damageType.SLASHING
    params.scattr = SC_LIQUEFACTION
    params.numhits = 3
    params.multiplier = 1.125
    params.tp150 = 1.2
    params.tp300 = 1.4
    params.azuretp = 1.5
    params.duppercap = 39 --guesstimated acc % bonuses
    params.str_wsc = 0.2
    params.dex_wsc = 0.0
    params.vit_wsc = 0.5
    params.agi_wsc = 0.0
    params.int_wsc = 0.0
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0
    damage = BluePhysicalSpell(caster, target, spell, params)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    -- APPLY STATUS EFFECT
    local resist = applyResistance(caster, target, spell, params)
    local multi = 1.08
    local HP = caster:getHP()
    local LVL = caster:getMainLvl()
    local damage = (HP / 10) + (LVL / 1.25)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    if (caster:hasStatusEffect(tpz.effect.AZURE_LORE)) then
        multi = multi + 0.50
    end

    if (damage > 0 and resist > 0.3) then
        local typeEffect = tpz.effect.PLAGUE
        target:delStatusEffect(typeEffect)
        target:addStatusEffect(typeEffect, 4, 0, getBlueEffectDuration(caster, resist, typeEffect))
    end

    return damage
end

return spell_object
