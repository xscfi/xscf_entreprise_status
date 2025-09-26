fx_version 'cerulean'
game 'gta5'

author 'xscfi'
description 'Notifications GTA custom entreprises'
version '1.3.0'

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/script.js'
}

shared_script 'config.lua'   -- 👈 config chargée automatiquement côté serveur et client

server_scripts {
    'server.lua'
}

client_scripts {
    'client.lua'
}
