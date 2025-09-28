fx_version 'cerulean'
game 'gta5'

author 'xscfi'
description 'Notifications entreprises'
version '1.4.4'

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/script.js'
}

shared_script 'config.lua'

server_scripts {
    'server.lua',
    'update_checker.lua'
}

client_scripts {
    'client.lua'
}

