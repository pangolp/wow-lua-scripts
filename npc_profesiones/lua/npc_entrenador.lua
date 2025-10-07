-- Acá iría el entry del npc que pongas en la DB
local NPC_ENTRY = 200004
local SMSG_NPC_TEXT_UPDATE = 384
local MAX_GOSSIP_TEXT_OPTIONS = 8

local ALQUIMIA = 171
local DESUELLO = 393
local ENCANTAMIENTO = 333
local HERRERIA = 164
local INGENIERIA = 202
local INSCRIPCION = 773
local JOYERIA = 755
local MINERIA = 186
local PELETERIA = 165
local SASTRERIA = 197
local HERBORISTERIA = 182
local COCINA = 185
local PESCA = 356
local PRIMEROS_AUXILIOS = 129

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
		player:GossipSetText("Hola $n, soy Oscar Isidro Parrilli, actual senador nacional de la Argentina. Como tengo algo de tiempo libre en el Senado, el servidor de Wow, al que estás jugando me pidió que se ayude a subir aquellas profesiones que te dan pereza. $B$BEs SIMPLE, solamente debes ir, tomar la profesión esa que te da pereza subir y volver a hablar conmigo. Yo me encargare de subirte la profesión a 450. Eso sí, no te daré ninguna receta.")
		if (player:GetLevel() == 80) then
			if ((player:HasSkill(ALQUIMIA) and (player:GetSkillValue(ALQUIMIA) ~= 450))) then
				player:GossipMenuAddItem(0, '  æ Alquimia 450 æ', 1, 10)
			end
			if ((player:HasSkill(DESUELLO) and (player:GetSkillValue(DESUELLO) ~= 450))) then
				player:GossipMenuAddItem(0, '  æ Desuello 450 æ', 1, 11)
			end
			if ((player:HasSkill(ENCANTAMIENTO) and (player:GetSkillValue(ENCANTAMIENTO) ~= 450))) then
				player:GossipMenuAddItem(0, '  æ Encantamiento 450 æ', 1, 12)
			end
			if ((player:HasSkill(HERRERIA) and (player:GetSkillValue(HERRERIA) ~= 450))) then
				player:GossipMenuAddItem(0, '  æ Herrería 450 æ', 1, 13)
			end
			if ((player:HasSkill(INGENIERIA) and (player:GetSkillValue(INGENIERIA) ~= 450))) then
				player:GossipMenuAddItem(0, '  æ Ingeniería 450 æ', 1, 14)
			end
			if ((player:HasSkill(INSCRIPCION) and (player:GetSkillValue(INSCRIPCION) ~= 450))) then
				player:GossipMenuAddItem(0, '  æ Inscripción 450 æ', 1, 15)
			end
			if ((player:HasSkill(JOYERIA) and (player:GetSkillValue(JOYERIA) ~= 450))) then
				player:GossipMenuAddItem(0, '  æ Joyería 450 æ', 1, 16)
			end
			if ((player:HasSkill(MINERIA) and (player:GetSkillValue(MINERIA) ~= 450))) then
				player:GossipMenuAddItem(0, '  æ Minería 450 æ', 1, 17)
			end
			if ((player:HasSkill(PELETERIA) and (player:GetSkillValue(PELETERIA) ~= 450))) then
				player:GossipMenuAddItem(0, '  æ Peletería 450 æ', 1, 18)
			end
			if ((player:HasSkill(SASTRERIA) and (player:GetSkillValue(SASTRERIA) ~= 450))) then
				player:GossipMenuAddItem(0, '  æ Sastrería 450 æ', 1, 19)
			end
			if ((player:HasSkill(HERBORISTERIA) and (player:GetSkillValue(HERBORISTERIA) ~= 450))) then
				player:GossipMenuAddItem(0, '  æ Herboristería 450 æ', 1, 20)
			end
			if ((player:HasSkill(COCINA) and (player:GetSkillValue(COCINA) ~= 450))) then
				player:GossipMenuAddItem(0, '  æ Cocina 450 æ', 1, 21)
			end
			if ((player:HasSkill(PESCA) and (player:GetSkillValue(PESCA) ~= 450))) then
				player:GossipMenuAddItem(0, '  æ Pesca 450 æ', 1, 22)
			end
			if ((player:HasSkill(PRIMEROS_AUXILIOS) and (player:GetSkillValue(PRIMEROS_AUXILIOS) ~= 450))) then
				player:GossipMenuAddItem(0, '  æ Primeros auxilios 450 æ', 1, 23)
			end
			-- player:GossipSendMenu(NPC_ENTRY, object)
			player:GossipSendMenu(0x7FFFFFFF, object)
		end
	end
end

function OnGossipSelect(event, player, object, sender, intid, code, menuid)
	if (intid == 10) then
		-- 3101 - ALQUIMIA RANGO 2
		-- 3464 - ALQUIMIA RANGO 3
		-- 11611 - ALQUIMIA RANGO 4
		-- 28596 - ALQUIMIA RANGO 5
		-- 51304 - ALQUIMIA RANGO 6
		spells = {3101, 3464, 11611, 28596, 51304}
		for i, spell in ipairs(spells) do
			if (player:HasSpell(spell) == false) then
				player:LearnSpell(spell)
			end
		end
		maxSkill = player:GetMaxSkillValue(ALQUIMIA)
		player:AdvanceSkill(ALQUIMIA, maxSkill)
	end
	if (intid == 11) then
		-- 8617 - DESUELLO RANGO 2
		-- 8618 - DESUELLO RANGO 3
		-- 10768 - DESUELLO RANGO 4
		-- 32678 - DESUELLO RANGO 5
		-- 50305 - DESUELLO RANGO 6
		spells = {8617, 8618, 10768, 32678, 50305}
		for i, spell in ipairs(spells) do
			if (player:HasSpell(spell) == false) then
				player:LearnSpell(spell)
			end
		end
		maxSkill = player:GetMaxSkillValue(DESUELLO)
		player:AdvanceSkill(DESUELLO, maxSkill)
	end
	if (intid == 12) then
		-- 7412 - ENCANTAMIENTO RANGO 2
		-- 7413 - ENCANTAMIENTO RANGO 3
		-- 13920 - ENCANTAMIENTO RANGO 4
		-- 28029 - ENCANTAMIENTO RANGO 5
		-- 51313 - ENCANTAMIENTO RANGO 6
		spells = {7412, 7413, 13920, 28029, 51313}
		for i, spell in ipairs(spells) do
			if (player:HasSpell(spell) == false) then
				player:LearnSpell(spell)
			end
		end
		maxSkill = player:GetMaxSkillValue(ENCANTAMIENTO)
		player:AdvanceSkill(ENCANTAMIENTO, maxSkill)
	end
	if (intid == 13) then
		-- 3100 - HERRERIA RANGO 2
		-- 3538 - HERRERIA RANGO 3
		-- 9785 - HERRERIA RANGO 4
		-- 29844 - HERRERIA RANGO 5
		-- 51300 - HERRERIA RANGO 6
		spells = {3100, 3538, 9785, 29844, 51300}
		for i, spell in ipairs(spells) do
			if (player:HasSpell(spell) == false) then
				player:LearnSpell(spell)
			end
		end
		maxSkill = player:GetMaxSkillValue(HERRERIA)
		player:AdvanceSkill(HERRERIA, maxSkill)
	end
	if (intid == 14) then
		-- 4037 - INGENIERIA RANGO 2
		-- 4038 - INGENIERIA RANGO 3
		-- 12656 - INGENIERIA RANGO 4
		-- 30350 - INGENIERIA RANGO 5
		-- 51306 - INGENIERIA RANGO 6
		spells = {4037, 4038, 12656, 30350, 51306}
		for i, spell in ipairs(spells) do
			if (player:HasSpell(spell) == false) then
				player:LearnSpell(spell)
			end
		end
		maxSkill = player:GetMaxSkillValue(INGENIERIA)
		player:AdvanceSkill(INGENIERIA, maxSkill)
	end
	if (intid == 15) then
		-- 45358 - INSCRIPCION RANGO 2
		-- 45359 - INSCRIPCION RANGO 3
		-- 45360 - INSCRIPCION RANGO 4
		-- 45361 - INSCRIPCION RANGO 5
		-- 45363 - INSCRIPCION RANGO 6
		spells = {45358, 45359, 45360, 45361, 45363}
		for i, spell in ipairs(spells) do
			if (player:HasSpell(spell) == false) then
				player:LearnSpell(spell)
			end
		end
		maxSkill = player:GetMaxSkillValue(INSCRIPCION)
		player:AdvanceSkill(INSCRIPCION, maxSkill)
	end
	if (intid == 16) then
		-- 25230 - JOYERIA RANGO 2
		-- 28894 - JOYERIA RANGO 3
		-- 28895 - JOYERIA RANGO 4
		-- 28897 - JOYERIA RANGO 5
		-- 51311 - JOYERIA RANGO 6
		spells = {25230, 28894, 28895, 28897, 51311}
		for i, spell in ipairs(spells) do
			if (player:HasSpell(spell) == false) then
				player:LearnSpell(spell)
			end
		end
		maxSkill = player:GetMaxSkillValue(JOYERIA)
		player:AdvanceSkill(JOYERIA, maxSkill)
	end
	if (intid == 17) then
		-- 2576 - MINERIA RANGO 2
		-- 3564 - MINERIA RANGO 3
		-- 10248 - MINERIA RANGO 4
		-- 29354 - MINERIA RANGO 5
		-- 50310 - MINERIA RANGO 6
		spells = {2576, 3564, 10248, 29354, 50310}
		for i, spell in ipairs(spells) do
			if (player:HasSpell(spell) == false) then
				player:LearnSpell(spell)
			end
		end
		maxSkill = player:GetMaxSkillValue(MINERIA)
		player:AdvanceSkill(MINERIA, maxSkill)
	end
	if (intid == 18) then
		-- 3104 - PELETERIA RANGO 2
		-- 3811 - PELETERIA RANGO 3
		-- 10662 - PELETERIA RANGO 4
		-- 32549 - PELETERIA RANGO 5
		-- 51302 - PELETERIA RANGO 6
		spells = {3104, 3811, 10662, 32549, 51302}
		for i, spell in ipairs(spells) do
			if (player:HasSpell(spell) == false) then
				player:LearnSpell(spell)
			end
		end
		maxSkill = player:GetMaxSkillValue(PELETERIA)
		player:AdvanceSkill(PELETERIA, maxSkill)
	end
	if (intid == 19) then
		-- 3909 - SASTRERIA RANGO 2
		-- 3910 - SASTRERIA RANGO 3
		-- 12180 - SASTRERIA RANGO 4
		-- 26790 - SASTRERIA RANGO 5
		-- 51309 - SASTRERIA RANGO 6
		spells = {3909, 3910, 12180, 26790, 51309}
		for i, spell in ipairs(spells) do
			if (player:HasSpell(spell) == false) then
				player:LearnSpell(spell)
			end
		end
		maxSkill = player:GetMaxSkillValue(SASTRERIA)
		player:AdvanceSkill(SASTRERIA, maxSkill)
	end
	if (intid == 20) then
		-- 2368 - HERBORISTERIA RANGO 2
		-- 3570 - HERBORISTERIA RANGO 3
		-- 11993 - HERBORISTERIA RANGO 4
		-- 28695 - HERBORISTERIA RANGO 5
		-- 50300 - HERBORISTERIA RANGO 6
		spells = {2368, 3570, 11993, 28695, 50300}
		for i, spell in ipairs(spells) do
			if (player:HasSpell(spell) == false) then
				player:LearnSpell(spell)
			end
		end
		maxSkill = player:GetMaxSkillValue(HERBORISTERIA)
		player:AdvanceSkill(HERBORISTERIA, maxSkill)
	end
	if (intid == 21) then
		-- 3102 - COCINA RANGO 2
		-- 3413 - COCINA RANGO 3
		-- 18260 - COCINA RANGO 4
		-- 33359 - COCINA RANGO 5
		-- 51296 - COCINA RANGO 6
		spells = {3102, 3413, 18260, 33359, 51296}
		for i, spell in ipairs(spells) do
			if (player:HasSpell(spell) == false) then
				player:LearnSpell(spell)
			end
		end
		maxSkill = player:GetMaxSkillValue(COCINA)
		player:AdvanceSkill(COCINA, maxSkill)
	end
	if (intid == 22) then
		-- 7731 - PESCA RANGO 2
		-- 7732 - PESCA RANGO 3
		-- 18248 - PESCA RANGO 4
		-- 33095 - PESCA RANGO 5
		-- 51294 - PESCA RANGO 6
		spells = {7731, 7732, 18248, 33095, 51294}
		for i, spell in ipairs(spells) do
			if (player:HasSpell(spell) == false) then
				player:LearnSpell(spell)
			end
		end
		maxSkill = player:GetMaxSkillValue(PESCA)
		player:AdvanceSkill(PESCA, maxSkill)
	end
	if (intid == 23) then
		-- 3274 - PRIMEROS AUXILIOS RANGO 2
		-- 7924 - PRIMEROS AUXILIOS RANGO 3
		-- 10846 - PRIMEROS AUXILIOS RANGO 4
		-- 27028 - PRIMEROS AUXILIOS RANGO 5
		-- 45542 - PRIMEROS AUXILIOS RANGO 6
		spells = {3274, 7924, 10846, 27028, 45542}
		for i, spell in ipairs(spells) do
			if (player:HasSpell(spell) == false) then
				player:LearnSpell(spell)
			end
		end
		maxSkill = player:GetMaxSkillValue(PRIMEROS_AUXILIOS)
		player:AdvanceSkill(PRIMEROS_AUXILIOS, maxSkill)
	end
	player:GossipComplete()
end

RegisterCreatureGossipEvent(NPC_ENTRY, 1, OnGossipHello)
RegisterCreatureGossipEvent(NPC_ENTRY, 2, OnGossipSelect)
