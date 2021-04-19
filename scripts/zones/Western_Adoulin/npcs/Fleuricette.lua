-----------------------------------
-- Area: Western Adoulin
--  NPC: Fleuricette
-- Type: Gate NPC
-- !pos -153 4 -16 256
-----------------------------------
require("scripts/globals/missions")
require("scripts/globals/quests")
require("scripts/globals/keyitems")
require("scripts/globals/status")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local SOA_Mission = player:getCurrentMission(SOA)
    local bayld = player:getCurrency("bayld");

    if SOA_Mission >= tpz.mission.id.soa.ONWARD_TO_ADOULIN and player:hasKeyItem(tpz.ki.PIONEERS_BADGE) then
        player:startEvent(1201, bayld)
    else
        -- Dialogue prior to joining colonization effort
        player:startEvent(1200)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if (csid == 1201) then
        player:delCurrency("bayld", 10)
        player:addStatusEffect(tpz.effect.IONIS, 0, 0, 9000)
    end
end

return entity
