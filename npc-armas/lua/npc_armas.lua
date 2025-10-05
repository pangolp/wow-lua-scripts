-- Acá iría el entry del npc que pongas en la DB
local NPC_ENTRY = 200005
local SMSG_NPC_TEXT_UPDATE = 384
local MAX_GOSSIP_TEXT_OPTIONS = 8

local ARCOS_SPELL = 264
local ARCOS_SKILL = 45

local DAGAS_SPELL = 1180
local DAGAS_SKILL = 173

local DEFENSA_SPELL = 204
local DEFENSA_SKILL = 95

local ARMA_DE_ASTA_SKILL = 229
local ARMA_DE_ASTA_SPELL = 200

local MAZAS_SKILL = 54
local MAZAS_SPELL = 198

local MAZAS_DE_DOS_MANOS_SKILL = 160
local MAZAS_DE_DOS_MANOS_SPELL = 199

local ARMAS_DE_FUEGO_SKILL = 46
local ARMAS_DE_FUEGO_SPELL = 266

local ESPADAS_SKILL = 43
local ESPADAS_SPELL = 201

local ESPADAS_DE_DOS_MANOS_SKILL = 55
local ESPADAS_DE_DOS_MANOS_SPELL = 202

local VARITAS_SKILL = 228
local VARITAS_SPELL = 5009

local HACHAS_SKILL = 44
local HACHAS_SPELL = 196

local HACHAS_DE_DOS_MANOS_SKILL = 172
local HACHAS_DE_DOS_MANOS_SPELL = 197

local BASTONES_SKILL = 136
local BASTONES_SPELL = 227

local BALLESTAS_SKILL = 226
local BALLESTAS_SPELL = 5011

local ARMAS_ARROJADIZAS_SKILL = 176
local ARMAS_ARROJADIZAS_SPELL = 2567

local SIN_ARMAS_SKILL = 162
local SIN_ARMAS_SPELL = 203

function Player:GossipSetText(text, textID)
    local data = CreatePacket(SMSG_NPC_TEXT_UPDATE, 100);
    data:WriteULong(textID or 0x7FFFFFFF)
    for i = 1, MAX_GOSSIP_TEXT_OPTIONS do
        data:WriteFloat(0) -- Probability
        data:WriteString(text) -- Text
        data:WriteString(text) -- Text
        data:WriteULong(0) -- language
        data:WriteULong(0) -- emote
        data:WriteULong(0) -- emote
        data:WriteULong(0) -- emote
        data:WriteULong(0) -- emote
        data:WriteULong(0) -- emote
        data:WriteULong(0) -- emote
    end
    self:SendPacket(data)
end

function OnGossipHello(event, player, object)
    if (player:IsInCombat() == false) then
        player:GossipClearMenu()
        player:GossipSetText("Saludos |c990B0Bee$n|h|r. Bienvenido al Servidor. Mi objetivo es subirte la habilidad de armas hasta el 400. Pero primero necesitas visitar el instructor para aprender dicha habilidad si no la conoces.")
        if (player:GetLevel() == 80) then
            if ((player:HasSpell(ARCOS_SPELL) and (player:GetSkillValue(ARCOS_SKILL) ~= 400))) then
                player:GossipMenuAddItem(0, '  æ Arcos 400 æ  ', 1, 10)
            end
            if ((player:HasSpell(DAGAS_SPELL) and (player:GetSkillValue(DAGAS_SKILL) ~= 400))) then
                player:GossipMenuAddItem(0, '  æ Dagas 400 æ  ', 1, 11)
            end
            if ((player:HasSpell(ESPADAS_SPELL) and (player:GetSkillValue(ESPADAS_SKILL) ~= 400))) then
                player:GossipMenuAddItem(0, '  æ Espadas de 1 mano 400 æ  ', 1, 12)
            end
            if ((player:HasSpell(ESPADAS_DE_DOS_MANOS_SPELL) and (player:GetSkillValue(ESPADAS_DE_DOS_MANOS_SKILL) ~= 400))) then
                player:GossipMenuAddItem(0, '  æ Espadas de 2 manos 400 æ  ', 1, 13)
            end
            if ((player:HasSpell(HACHAS_SPELL) and (player:GetSkillValue(HACHAS_SKILL) ~= 400))) then
                player:GossipMenuAddItem(0, '  æ Hachas de 1 mano 400 æ  ', 1, 14)
            end
            if ((player:HasSpell(HACHAS_DE_DOS_MANOS_SPELL) and (player:GetSkillValue(HACHAS_DE_DOS_MANOS_SKILL) ~= 400))) then
                player:GossipMenuAddItem(0, '  æ Hachas de 2 manos 400 æ  ', 1, 15)
            end
            if ((player:HasSpell(DEFENSA_SPELL) and (player:GetSkillValue(DEFENSA_SKILL) ~= 400))) then
                player:GossipMenuAddItem(0, '  æ Defensa 400 æ  ', 1, 16)
            end
            if ((player:HasSpell(ARMA_DE_ASTA_SPELL) and (player:GetSkillValue(ARMA_DE_ASTA_SKILL) ~= 400))) then
                player:GossipMenuAddItem(0, '  æ Arma de asta 400 æ  ', 1, 17)
            end
            if ((player:HasSpell(BALLESTAS_SPELL) and (player:GetSkillValue(BALLESTAS_SKILL) ~= 400))) then
                player:GossipMenuAddItem(0, '  æ Ballestas 400 æ  ', 1, 18)
            end
            if ((player:HasSpell(BASTONES_SPELL) and (player:GetSkillValue(BASTONES_SKILL) ~= 400))) then
                player:GossipMenuAddItem(0, '  æ Bastones 400 æ  ', 1, 19)
            end
            if ((player:HasSpell(ARMAS_DE_FUEGO_SPELL) and (player:GetSkillValue(ARMAS_DE_FUEGO_SKILL) ~= 400))) then
                player:GossipMenuAddItem(0, '  æ Armas de fuego 400 æ  ', 1, 20)
            end
            if ((player:HasSpell(ARMAS_ARROJADIZAS_SPELL) and (player:GetSkillValue(ARMAS_ARROJADIZAS_SKILL) ~= 400))) then
                player:GossipMenuAddItem(0, '  æ Armas arrojadizas 400 æ  ', 1, 21)
            end
            if ((player:HasSpell(MAZAS_SPELL) and (player:GetSkillValue(MAZAS_SKILL) ~= 400))) then
                player:GossipMenuAddItem(0, '  æ Mazas de 1 mano 400 æ  ', 1, 22)
            end
            if ((player:HasSpell(MAZAS_DE_DOS_MANOS_SPELL) and (player:GetSkillValue(MAZAS_DE_DOS_MANOS_SKILL) ~= 400))) then
                player:GossipMenuAddItem(0, '  æ Mazas de 2 manos 400 æ  ', 1, 23)
            end
            if ((player:HasSpell(VARITAS_SPELL) and (player:GetSkillValue(VARITAS_SKILL) ~= 400))) then
                player:GossipMenuAddItem(0, '  æ Varitas manos 400 æ  ', 1, 25)
            end
            if ((player:HasSpell(SIN_ARMAS_SPELL) and (player:GetSkillValue(SIN_ARMAS_SKILL) ~= 400))) then
                player:GossipMenuAddItem(0, '  æ Sin armas 400 æ  ', 1, 26)
            end
            player:GossipSendMenu(0x7FFFFFFF, object)
        end
    end
end

function OnGossipSelect(event, player, object, sender, intid, code, menuid)
    if (intid == 10) then
        maxSkill = player:GetMaxSkillValue(ARCOS_SKILL)
        player:AdvanceSkill(ARCOS_SKILL, maxSkill)
    end
    if (intid == 11) then
        maxSkill = player:GetMaxSkillValue(DAGAS_SKILL)
        player:AdvanceSkill(DAGAS_SKILL, maxSkill)
    end
    if (intid == 12) then
        maxSkill = player:GetMaxSkillValue(ESPADAS_SKILL)
        player:AdvanceSkill(ESPADAS_SKILL, maxSkill)
    end
    if (intid == 13) then
        maxSkill = player:GetMaxSkillValue(ESPADAS_DE_DOS_MANOS_SKILL)
        player:AdvanceSkill(ESPADAS_DE_DOS_MANOS_SKILL, maxSkill)
    end
    if (intid == 14) then
        maxSkill = player:GetMaxSkillValue(HACHAS_SKILL)
        player:AdvanceSkill(HACHAS_SKILL, maxSkill)
    end
    if (intid == 15) then
        maxSkill = player:GetMaxSkillValue(HACHAS_DE_DOS_MANOS_SKILL)
        player:AdvanceSkill(HACHAS_DE_DOS_MANOS_SKILL, maxSkill)
    end
    if (intid == 16) then
        maxSkill = player:GetMaxSkillValue(DEFENSA_SKILL)
        player:AdvanceSkill(DEFENSA_SKILL, maxSkill)
    end
    if (intid == 17) then
        maxSkill = player:GetMaxSkillValue(ARMA_DE_ASTA_SKILL)
        player:AdvanceSkill(ARMA_DE_ASTA_SKILL, maxSkill)
    end
    if (intid == 18) then
        maxSkill = player:GetMaxSkillValue(BALLESTAS_SKILL)
        player:AdvanceSkill(BALLESTAS_SKILL, maxSkill)
    end
    if (intid == 19) then
        maxSkill = player:GetMaxSkillValue(BASTONES_SKILL)
        player:AdvanceSkill(BASTONES_SKILL, maxSkill)
    end
    if (intid == 20) then
        maxSkill = player:GetMaxSkillValue(ARMAS_DE_FUEGO_SKILL)
        player:AdvanceSkill(ARMAS_DE_FUEGO_SKILL, maxSkill)
    end
    if (intid == 21) then
        maxSkill = player:GetMaxSkillValue(ARMAS_ARROJADIZAS_SKILL)
        player:AdvanceSkill(ARMAS_ARROJADIZAS_SKILL, maxSkill)
    end
    if (intid == 22) then
        maxSkill = player:GetMaxSkillValue(MAZAS_SKILL)
        player:AdvanceSkill(MAZAS_SKILL, maxSkill)
    end
    if (intid == 23) then
        maxSkill = player:GetMaxSkillValue(MAZAS_DE_DOS_MANOS_SKILL)
        player:AdvanceSkill(MAZAS_DE_DOS_MANOS_SKILL, maxSkill)
    end
    if (intid == 25) then
        maxSkill = player:GetMaxSkillValue(VARITAS_SKILL)
        player:AdvanceSkill(VARITAS_SKILL, maxSkill)
    end
    if (intid == 26) then
        maxSkill = player:GetMaxSkillValue(SIN_ARMAS_SKILL)
        player:AdvanceSkill(SIN_ARMAS_SKILL, maxSkill)
    end
    player:GossipComplete()
end

RegisterCreatureGossipEvent(NPC_ENTRY, 1, OnGossipHello)
RegisterCreatureGossipEvent(NPC_ENTRY, 2, OnGossipSelect)
