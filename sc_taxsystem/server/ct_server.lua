ESX = exports["es_extended"]:getSharedObject()

if Config.CtAllow then
    ESX.RegisterServerCallback('sc_taxsystem:getOwnedVehicles', function(source, cb)
        local xPlayer = ESX.GetPlayerFromId(source)
        local identifier = xPlayer.getIdentifier()

        MySQL.query('SELECT plate, insurance FROM owned_vehicles WHERE owner = @owner', {
            ['@owner'] = identifier
        }, function(result)
            if not result or #result == 0 then
                cb({})
            else
                for _, vehicle in pairs(result) do
                    vehicle.insurance = tonumber(vehicle.insurance)
                end
                cb(result)
            end
        end)
    end)

    ESX.RegisterServerCallback('sc_taxsystem:getUninsuredVehicles', function(source, cb)
        local xPlayer = ESX.GetPlayerFromId(source)
        if not xPlayer then
            print("[ERROR] Spieler konnte nicht gefunden werden!")
            cb({})
            return
        end

        local identifier = xPlayer.getIdentifier()
        if not identifier then
            print("[ERROR] Spieler hat keine gültige Identifier!")
            cb({})
            return
        end

        MySQL.query('SELECT plate FROM owned_vehicles WHERE owner = @owner AND insurance = 0', {
            ['@owner'] = identifier
        }, function(result)
            if result and #result > 0 then
                local uninsuredVehicles = {}
                for _, row in ipairs(result) do
                    if row.plate then
                        table.insert(uninsuredVehicles, { plate = row.plate })
                    else
                        print("[ERROR] Fahrzeug ohne Kennzeichen gefunden!")
                    end
                end
                cb(uninsuredVehicles)
            else
                cb({})
            end
        end)
    end)

    RegisterServerEvent('sc_taxsystem:insureVehicle')
    AddEventHandler('sc_taxsystem:insureVehicle', function(plate)
        local xPlayer = ESX.GetPlayerFromId(source)
        if not xPlayer then
            print("[ERROR] Spieler konnte nicht gefunden werden!")
            return
        end

        local identifier = xPlayer.getIdentifier()
        if not identifier then
            print("[ERROR] Spieler hat keine gültige Identifier!")
            return
        end

        if not plate or plate == "" then
            print("[ERROR] Kein Kennzeichen übergeben!")
            return
        end

        -- Aktualisieren der Versicherung
        MySQL.update('UPDATE owned_vehicles SET insurance = 1 WHERE owner = @owner AND plate = @plate', {
            ['@owner'] = identifier,
            ['@plate'] = plate
        }, function(affectedRows)
            if affectedRows > 0 then
                TriggerClientEvent('ox_lib:notify', xPlayer.source, {
                    title = 'Erfolg',
                    description = 'Das Fahrzeug mit dem Kennzeichen ' .. plate .. ' wurde erfolgreich versichert.',
                    type = 'success'
                })
            else
                TriggerClientEvent('ox_lib:notify', xPlayer.source, {
                    title = 'Fehler',
                    description = 'Das Fahrzeug konnte nicht versichert werden.',
                    type = 'error'
                })
            end
        end)
    end)

    ESX.RegisterServerCallback('sc_taxsystem:getInsuredVehicles', function(source, cb)
        local xPlayer = ESX.GetPlayerFromId(source)
        if not xPlayer then
            print("[ERROR] Spieler konnte nicht gefunden werden!")
            cb({})
            return
        end

        local identifier = xPlayer.getIdentifier()
        if not identifier then
            print("[ERROR] Spieler hat keine gültige Identifier!")
            cb({})
            return
        end

        MySQL.query('SELECT plate FROM owned_vehicles WHERE owner = @owner AND insurance = 1', {
            ['@owner'] = identifier
        }, function(result)
            if result and #result > 1 then
                local uninsuredVehicles = {}
                for _, row in ipairs(result) do
                    if row.plate then
                        table.insert(uninsuredVehicles, { plate = row.plate })
                    else
                        print("[ERROR] Fahrzeug ohne Kennzeichen gefunden!")
                    end
                end
                cb(uninsuredVehicles)
            else
                cb({})
            end
        end)
    end)

    RegisterServerEvent('sc_taxsystem:removeInsurance')
    AddEventHandler('sc_taxsystem:removeInsurance', function(plate)
        local xPlayer = ESX.GetPlayerFromId(source)
        if not xPlayer then
            print("[ERROR] Spieler konnte nicht gefunden werden!")
            return
        end

        local identifier = xPlayer.getIdentifier()
        if not identifier then
            print("[ERROR] Spieler hat keine gültige Identifier!")
            return
        end

        if not plate or plate == "" then
            print("[ERROR] Kein Kennzeichen übergeben!")
            return
        end

        MySQL.update('UPDATE owned_vehicles SET insurance = 0 WHERE owner = @owner AND plate = @plate', {
            ['@owner'] = identifier,
            ['@plate'] = plate
        }, function(affectedRows)
            if affectedRows > 0 then
                TriggerClientEvent('ox_lib:notify', xPlayer.source, {
                    title = 'Erfolg',
                    description = 'Die Versicherung des Fahrzeugs mit dem Kennzeichen ' .. plate .. ' wurde erfolgreich aufgehoben.',
                    type = 'success'
                })
            else
                TriggerClientEvent('ox_lib:notify', xPlayer.source, {
                    title = 'Fehler',
                    description = 'Das Fahrzeug konnte nicht entversichert werden.',
                    type = 'error'
                })
            end
        end)
    end)


    function removeColorCodes(text)
        return text:gsub("~[a-zA-Z0-9]~", "")
    end
    
    Citizen.CreateThread(function()
        while true do
            function CarsTax(AllUser)
                MySQL.query('SELECT * FROM owned_vehicles WHERE insurance = 1', {}, function(AllCars)
                    local AllUser = ESX.GetPlayers()
                    local taxMultiplier = Config.CtPrice
                    for i = 1, #AllUser, 1 do
                        local xPlayer = ESX.GetPlayerFromId(AllUser[i])

                        if xPlayer then
                            local carCount = 0
                            for a = 1, #AllCars, 1 do
                                if xPlayer.getIdentifier() == AllCars[a].owner and (AllCars[a].job ~= 'police' and AllCars[a].job ~= 'ambulance') then
                                    carCount = carCount + 1
                                end
                            end
                            if carCount > 0 then
                                local tax = carCount * taxMultiplier
                                xPlayer.removeAccountMoney('bank', ESX.Math.Round(tax), Config.CtName)
                                for _, notifyModule in ipairs(Config.Notify) do
                                    if notifyModule.enabled then
                                        local notificationText = Translation[Config.Locale]['cttext'] .. tax .. Translation[Config.Locale]['cttext1']

                                        if notifyModule.name == "ox_lib" then
                                            notificationText = removeColorCodes(notificationText)
                                        end
                                    
                                        if notifyModule.name == "bulletin" then
                                            TriggerClientEvent('bulletin:sendAdvanced', xPlayer.source, notificationText, Config.CtName, Translation[Config.Locale]['pay_cttext'], Config.CtChar, Config.Delay, Config.Position, Config.Progress, Config.Theme, Config.exitAnim)
                                        elseif notifyModule.name == "default" then
                                            TriggerClientEvent('sc_taxsystem:picturemsg', xPlayer.source, Config.CtChar, notificationText, Config.CtName, Translation[Config.Locale]['pay_cttext'])
                                        elseif notifyModule.name == "ox_lib" then
                                            TriggerClientEvent('ox_lib:notify', xPlayer.source, {
                                                title = Translation[Config.Locale]['pay_cttext'],
                                                description = notificationText,
                                                duration = 5000,
                                                icon = 'car'
                                            })
                                        end
                                    end
                                end
                            end
                        end
                    end
                end)
            end
            CarsTax(AllUser)
            Citizen.Wait(Config.CtTime * 60000)
        end
    end)
else
    print("[TAX SYSTEM] CAR-TAX IS OFF")
end