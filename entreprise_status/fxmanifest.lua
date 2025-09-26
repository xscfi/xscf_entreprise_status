fx_version 'cerulean'
game 'gta5'

author 'xscfi'
description 'Notifications GTA custom entreprises'
version '1.4.0'

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/script.js'
}

shared_script 'config.lua'

server_scripts {
    'server.lua'
}

client_scripts {
    'client.lua'
}
