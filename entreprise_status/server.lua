ESX = exports["es_extended"]:getSharedObject()

-- Vérifie si le joueur a le job requis
function PlayerHasJob(source, jobList)
    -- Exemple pour ESX (à adapter si tu utilises QBCore)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return false end

    for _, job in ipairs(jobList) do
        if xPlayer.getJob().name == job then
            return true
        end
    end
    return false
end

RegisterCommand("open", function(source, args)
    local job = args[1]
    if job and Config.Entreprises[job] then
        if PlayerHasJob(source, Config.Entreprises[job].jobs) then
            local data = {
                title = Config.Entreprises[job].label,
                message = Config.Entreprises[job].label .. " est maintenant OUVERT ! Venez nombreux 🚀",
                icon = Config.Entreprises[job].icon
            }
            TriggerClientEvent("entreprise:notifyAll", -1, data)
        else
            TriggerClientEvent("chat:addMessage", source, { args = { "SYSTEM", "Tu n'as pas accès à cette commande !" } })
        end
    else
        TriggerClientEvent("chat:addMessage", source, { args = { "SYSTEM", "Entreprise invalide." } })
    end
end, false)

RegisterCommand("close", function(source, args)
    local job = args[1]
    if job and Config.Entreprises[job] then
        if PlayerHasJob(source, Config.Entreprises[job].jobs) then
            local data = {
                title = Config.Entreprises[job].label,
                message = Config.Entreprises[job].label .. " est maintenant FERMÉ. Merci de votre visite 🙏",
                icon = Config.Entreprises[job].icon
            }
            TriggerClientEvent("entreprise:notifyAll", -1, data)
        else
            TriggerClientEvent("chat:addMessage", source, { args = { "SYSTEM", "Tu n'as pas accès à cette commande !" } })
        end
    else
        TriggerClientEvent("chat:addMessage", source, { args = { "SYSTEM", "Entreprise invalide." } })
    end
end, false)
