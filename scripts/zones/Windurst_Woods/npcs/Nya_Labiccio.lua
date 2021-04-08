-----------------------------------
-- Area: Windurst Woods
--  NPC: Nya Labiccio
-- Only sells when Windurst controlls Gustaberg Region // Modified to sell Ciphers
-- Confirmed shop stock, August 2013
-----------------------------------
local ID = require("scripts/zones/Windurst_Woods/IDs")
require("scripts/globals/shop")
require("scripts/globals/zone")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local RegionOwner = GetRegionOwner(tpz.region.GUSTABERG)
    if RegionOwner ~= tpz.nation.WINDURST then
        player:showText(npc, ID.text.NYALABICCIO_CLOSED_DIALOG)
    else
        player:showText(npc, ID.text.NYALABICCIO_OPEN_DIALOG)

        local stock =
        {
            1108,  703, -- Sulfur
            619,    43, -- Popoto
            611,    36, -- Rye Flour
            4388,   40  -- Eggplant
        }

        local Cipher_Value = 20000 -- Cipher base sell price (Fame will change price)
        local TOTD = VanadielTOTD() -- Get time of day

        if TOTD == tpz.time.MIDNIGHT or TOTD == tpz.time.NEW_DAY or TOTD == tpz.time.DAWN then
            -- Midnight till dawn
            table.insert(stock, 10133) --cipher_f._coffin
            table.insert(stock, Cipher_Value) 
            table.insert(stock, 10142) --cipher_karaha
            table.insert(stock, Cipher_Value) 
            table.insert(stock, 10154) --cipher_amchuchu
            table.insert(stock, Cipher_Value) 
            table.insert(stock, 10122) --cipher_mnejing
            table.insert(stock, Cipher_Value) 
            table.insert(stock, 10139) --cipher_rahal
            table.insert(stock, Cipher_Value) 
            table.insert(stock, 10145) --cipher_rughadjeen
            table.insert(stock, Cipher_Value) 
            table.insert(stock, 10129) --cipher_domina
            table.insert(stock, Cipher_Value) 
            table.insert(stock, 10146) --cipher_kukki
            table.insert(stock, Cipher_Value) 
            table.insert(stock, 10165) --cipher_kayeel
            table.insert(stock, Cipher_Value) 
            table.insert(stock, 10163) --cipher_leonoyne
            table.insert(stock, Cipher_Value) 
            table.insert(stock, 10177) --cipher_mumor_ii
            table.insert(stock, Cipher_Value) 
            table.insert(stock, 10121) --cipher_ovjang
            table.insert(stock, Cipher_Value) 
            table.insert(stock, 10166) --cipher_robel-akbel
            table.insert(stock, Cipher_Value) 
        elseif TOTD == tpz.time.DAY then
            -- Day time
            table.insert(stock, 10187) --cipher_shantotto_ii
            table.insert(stock, Cipher_Value) 
            table.insert(stock, 10178) --cipher_ullegore
            table.insert(stock, Cipher_Value) 
            table.insert(stock, 10130) --cipher_elivira
            table.insert(stock, Cipher_Value) 
            table.insert(stock, 10180) --cipher_makki
            table.insert(stock, Cipher_Value) 
            table.insert(stock, 10147) --cipher_margret
            table.insert(stock, Cipher_Value) 
            table.insert(stock, 10125) --cipher_najelith
            table.insert(stock, Cipher_Value) 
            table.insert(stock, 10181) --cipher_king
            table.insert(stock, Cipher_Value) 
            table.insert(stock, 10152) --cipher_qultada
            table.insert(stock, Cipher_Value) 
            table.insert(stock, 10140) --cipher_koru-moru
            table.insert(stock, Cipher_Value) 
            table.insert(stock, 10155) --cipher_brygid
            table.insert(stock, Cipher_Value) 
            table.insert(stock, 10162) --cipher_kupofried
            table.insert(stock, Cipher_Value) 
            table.insert(stock, 10141) --cipher_kuyin
            table.insert(stock, Cipher_Value) 
            table.insert(stock, 10127) --cipher_moogle
            table.insert(stock, Cipher_Value) 
        elseif TOTD == tpz.time.DUSK or TOTD == tpz.time.EVENING then
            -- Dusk to evening
            table.insert(stock, 10123) --cipher_sakura
            table.insert(stock, Cipher_Value) 
            table.insert(stock, 10144) --cipher_abenzio
            table.insert(stock, Cipher_Value) 
            table.insert(stock, 10126) --cipher_aldo
            table.insert(stock, Cipher_Value) 
            table.insert(stock, 10149) --cipher_areuhat
            table.insert(stock, Cipher_Value) 
            table.insert(stock, 10143) --cipher_babban
            table.insert(stock, Cipher_Value) 
            table.insert(stock, 10138) --cipher_cid
            table.insert(stock, Cipher_Value) 
            table.insert(stock, 10183) --cipher_darrcuiln
            table.insert(stock, Cipher_Value) 
            table.insert(stock, 10128) --cipher_fablinix
            table.insert(stock, Cipher_Value) 
            table.insert(stock, 10148) --cipher_gilgamesh
            table.insert(stock, Cipher_Value) 
            table.insert(stock, 10174) --cipher_ingrid_ii
            table.insert(stock, Cipher_Value) 
            table.insert(stock, 10120) --cipher_lehko
            table.insert(stock, Cipher_Value) 
            table.insert(stock, 10150) --cipher_lhe
            table.insert(stock, Cipher_Value) 
            table.insert(stock, 10132) --cipher_lhu
            table.insert(stock, Cipher_Value) 
        elseif TOTD == tpz.time.NIGHT then
            -- Night time until midnight
            table.insert(stock, 10113) --cipher_lion
            table.insert(stock, Cipher_Value) 
            table.insert(stock, 10124) --cipher_luzaf
            table.insert(stock, Cipher_Value) 
            table.insert(stock, 10164) --cipher_maximilian
            table.insert(stock, Cipher_Value) 
            table.insert(stock, 10151) --cipher_mayakov
            table.insert(stock, Cipher_Value) 
            table.insert(stock, 10156) --cipher_mildaurion
            table.insert(stock, Cipher_Value) 
            table.insert(stock, 10182) --cipher_morimar
            table.insert(stock, Cipher_Value) 
            table.insert(stock, 10135) --cipher_mumor
            table.insert(stock, Cipher_Value) 
            table.insert(stock, 10118) --cipher_naja
            table.insert(stock, Cipher_Value) 
            table.insert(stock, 10131) --cipher_noillurie
            table.insert(stock, Cipher_Value) 
            table.insert(stock, 10161) --cipher_rongelouts
            table.insert(stock, Cipher_Value) 
            table.insert(stock, 10179) --cipher_teodor
            table.insert(stock, Cipher_Value) 
            table.insert(stock, 10136) --cipher_uka
            table.insert(stock, Cipher_Value) 
            table.insert(stock, 10112) --cipher_zeid
            table.insert(stock, Cipher_Value) 
        else
            table.insert(stock, 10127) --cipher_moogle
            table.insert(stock, Cipher_Value) 
        end

        tpz.shop.general(player, stock, WINDURST)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity