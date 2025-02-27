fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name "sc_taxsystem"
author "ScubeScripts"
description "Three of my best tax systems."
version "1.0.6"

server_scripts {
    '@es_extended/imports.lua',
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
