-----------------------------------
-- Spell: Whirl of Rage
-- Delivers an area attack that stuns enemies. Damage varies with TP.
-- Spell cost: 73 MP
-- Monster Type: Weapons 
-- Spell Type: Physical (Slashing)
-- Blue Magic Points: 2
-- Stat Bonus: STR+2 DEX+2
-- Level: 83
-- Casting Time: 1 seconds
-- Recast Time: 19.75 seconds
-- Skillchain Element(s): Earth (can open Liquefaction, Detonation, or Reverberation can close Scission or Distortion)
-- Combos: Zanshin.
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
    params.tpmod = TPMOD_ATTACK
    params.attackType = tpz.attackType.PHYSICAL
    params.damageType = tpz.damageType.SLASHING
    params.scattr = SC_SCISSION
    params.numhits = 2
    params.multiplier = 3.0
    params.tp150 = 3.50
    params.tp300 = 4.0
    params.azuretp = 1.4375
    params.duppercap = 69
    params.str_wsc = 0.3
    params.dex_wsc = 0.3
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.0
    params.mnd_wsc = 0.3
    params.chr_wsc = 0.0
    damage = BluePhysicalSpell(caster, target, spell, params)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    return damage
end

return spell_object
