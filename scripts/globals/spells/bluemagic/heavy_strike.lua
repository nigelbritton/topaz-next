-----------------------------------
-- Spell: Heavy Strike
-- Damage varies with TP
-- Spell cost: 32 MP
-- Monster Type: Golem
-- Spell Type: Physical (SLASHING)
-- Blue Magic Points: ??
-- Stat Bonus: CHR+1, HP+5
-- Level: 92
-- Casting Time: 1.0 seconds
-- Recast Time: 30 seconds
-- Skillchain Property: Fragmentation / Transfixion
-- Combos: 	Double Attack / Triple Attack
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
    params.tpmod = TPMOD_DAMAGE
    params.attackType = tpz.attackType.PHYSICAL
    params.damageType = tpz.damageType.SLASHING
    params.scattr = SC_TRANSFIXION
    params.numhits = 1
    params.multiplier = 2.25
    params.tp150 = 3.5
    params.tp300 = 4.0
    params.azuretp = 2.125
    params.duppercap = 19
    params.str_wsc = 0.5
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.0
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0
    damage = BluePhysicalSpell(caster, target, spell, params)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    return damage
end

return spell_object
