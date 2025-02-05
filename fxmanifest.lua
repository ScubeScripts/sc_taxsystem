fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name "sc_taxsystem"
author "ScubeScripts"
description "Three of my best tax systems."
version "1.0.2"

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/*.lua'
  }
  
  client_scripts {
    'client/*.lua'
  }
  
  shared_script {
    '@ox_lib/init.lua',
    'config.lua'
  }
  
  dependencies {
    'es_extended',
    'ox_lib',
    'oxmysql'
  }
