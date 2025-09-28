local resourceName = GetCurrentResourceName()
local currentVersion = GetResourceMetadata(resourceName, 'version', 0)
local repoVersionURL = 'https://raw.githubusercontent.com/xscfi/xscf_entreprise_status/main/version.txt'
local githubLink = 'https://github.com/xscfi/xscf_entreprise_status/releases'

local function printUpdate(message, color)
    print(('^%s[script:%s]^0 %s'):format(color, resourceName, message))
end

PerformHttpRequest(repoVersionURL, function(err, text, headers)
    if not text or text == '' then
        printUpdate('Impossible de vérifier la version.', '1')
        return
    end

    local latestVersion = text:gsub("%s+", "") 

    if currentVersion == latestVersion then
        print("^2─────────────────────────────────────────────^0")
        printUpdate(('La ressource est à jour ! (v%s)'):format(currentVersion), '2')
        print("^2─────────────────────────────────────────────^0")
    else
        print("^3─────────────────────────────────────────────^0")
        printUpdate(('🚨 Une mise à jour est disponible ! 🚨'), '3')
        printUpdate(('Version actuelle : ^1' .. currentVersion .. '^0 / Dernière version : ^2' .. latestVersion), '3')
        printUpdate(('Téléchargez-la ici : ^5' .. githubLink), '3')
        print("^3─────────────────────────────────────────────^0")
    end
end)