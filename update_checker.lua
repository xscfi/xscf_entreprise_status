local resourceName = GetCurrentResourceName()
local currentVersion = GetResourceMetadata(resourceName, 'version', 0)
local repoVersionURL = 'https://raw.githubusercontent.com/xscfi/xscf_entreprise_status/main/version.txt'

PerformHttpRequest(repoVersionURL, function(err, text, headers)
    if not text or text == '' then
        print(('^1[script:%s]^0 Impossible de vérifier la version.'):format(resourceName))
        return
    end

    local latestVersion = text:gsub("%s+", "") -- clean espaces et sauts de ligne
    if currentVersion == latestVersion then
        print(('^2[script:%s]^0 La ressource est à jour ! (v%s)'):format(resourceName, currentVersion))
    else
        print(('^3[script:%s]^0 Une mise à jour est disponible !'):format(resourceName))
        print(('^3[script:%s]^0 Version actuelle : %s / Dernière version : %s'):format(resourceName, currentVersion, latestVersion))
        print(('^3[script:%s]^0 Téléchargez-la ici : https://github.com/xscfi/xscf_entreprise_status/releases'):format(resourceName))
    end
end)
