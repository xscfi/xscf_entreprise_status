ESX = exports["es_extended"]:getSharedObject()

local lastAction = {}
local EntrepriseStatus = {} 

function GetPlayerEntreprise(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return nil, "Tu n'es pas dans une entreprise valide." end

    local jobName = xPlayer.getJob().name
    local jobGrade = xPlayer.getJob().grade

    for name, data in pairs(Config.Entreprises) do
        for _, job in ipairs(data.jobs) do
            if jobName == job then
                if jobGrade >= (data.minGrade or 0) then
                    return name, data, nil
                else
                    return nil, nil, "Tu n'as pas le grade requis pour envoyer une notification."
                end
            end
        end
    end

    return nil, nil, "Tu n'as pas accès à cette commande."
end

function CanNotify(source)
    local now = os.time()
    if lastAction[source] and now - lastAction[source] < Config.Cooldown then
        return false
    end
    lastAction[source] = now
    return true
end

RegisterCommand("open", function(source)
    local entreprise, data, errorMsg = GetPlayerEntreprise(source)
    if errorMsg then
        TriggerClientEvent("chat:addMessage", source, { args = { "[SYSTEM]", errorMsg } })
        return
    end

    if EntrepriseStatus[entreprise] == "open" then
        TriggerClientEvent("chat:addMessage", source, { args = { "[SYSTEM]", data.label .. " est déjà ouvert !" } })
        return
    end

    if not CanNotify(source) then
        TriggerClientEvent("chat:addMessage", source, { args = { "[SYSTEM]", "Attends avant de réutiliser la commande." } })
        return
    end

    EntrepriseStatus[entreprise] = "open"

    local msg = data.icon .. " " .. data.label .. " est maintenant ~g~OUVERT~s~ !"
    TriggerClientEvent("entreprise_status:notify", -1, msg, data.duration, data.position)
end)

RegisterCommand("close", function(source)
    local entreprise, data, errorMsg = GetPlayerEntreprise(source)
    if errorMsg then
        TriggerClientEvent("chat:addMessage", source, { args = { "[SYSTEM]", errorMsg } })
        return
    end

    if EntrepriseStatus[entreprise] ~= "open" then
        TriggerClientEvent("chat:addMessage", source, { args = { "[SYSTEM]", data.label .. " est déjà fermé !" } })
        return
    end

    if not CanNotify(source) then
        TriggerClientEvent("chat:addMessage", source, { args = { "[SYSTEM]", "Attends avant de réutiliser la commande." } })
        return
    end

    EntrepriseStatus[entreprise] = "closed"

    local msg = data.icon .. " " .. data.label .. " est maintenant ~r~FERMÉ~s~ !"
    TriggerClientEvent("entreprise_status:notify", -1, msg, data.duration, data.position)
end)
