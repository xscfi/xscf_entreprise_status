RegisterNetEvent("entreprise:notifyAll")
AddEventHandler("entreprise:notifyAll", function(data)
    SendNUIMessage({
        action = "showNotification",
        title = data.title,
        message = data.message,
        icon = data.icon
    })
end)
