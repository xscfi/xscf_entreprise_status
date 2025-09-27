ESX = exports["es_extended"]:getSharedObject()

local lastAction = {}

-- Vérifie si le joueur appartient à une entreprise et a le grade suffisant
function GetPlayerEntreprise(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return nil end
    local jobName = xPlayer.getJob().name
    local jobGrade = xPlayer.getJob().grade

    for name, data in pairs(Config.Entreprises) do
        for _, job in ipairs(data.jobs) do
            if jobName == job then
                if jobGrade >= (data.minGrade or 0) then
                    return name, data
                else
                    return nil, nil, "Tu n'as pas le grade requis pour faire une annonce."
                end
            end
        end
    end
    return nil, nil, "Tu n'as pas le grade requis pour faire une annonce."
end

-- Cooldown
function CanNotify(source)
    local now = os.time()
    if lastAction[source] and now - lastAction[source] < Config.Cooldown then
        return false
    end
    lastAction[source] = now
    return true
end

-- Commandes
RegisterCommand("open", function(source)
    local entreprise, data = GetPlayerEntreprise(source)
    if not entreprise then
        TriggerClientEvent("chat:addMessage", source, { args = { "[SYSTEM]", "Tu n'as pas accès à cette commande." } })
        return
    end

    if not CanNotify(source) then
        TriggerClientEvent("chat:addMessage", source, { args = { "[SYSTEM]", "Attends avant de réutiliser la commande." } })
        return
    end

    local msg = data.icon .. " " .. data.label .. " est maintenant ~g~OUVERT~s~ !"
    TriggerClientEvent("entreprise_status:notify", -1, msg, data.duration, data.position)
end)

RegisterCommand("close", function(source)
    local entreprise, data = GetPlayerEntreprise(source)
    if not entreprise then
        TriggerClientEvent("chat:addMessage", source, { args = { "[SYSTEM]", "Tu n'as pas accès à cette commande." } })
        return
    end

    if not CanNotify(source) then
        TriggerClientEvent("chat:addMessage", source, { args = { "[SYSTEM]", "Attends avant de réutiliser la commande." } })
        return
    end

    local msg = data.icon .. " " .. data.label .. " est maintenant ~r~FERMÉ~s~ !"
    TriggerClientEvent("entreprise_status:notify", -1, msg, data.duration, data.position)
end)
