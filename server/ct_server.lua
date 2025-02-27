ESX = exports["es_extended"]:getSharedObject()

if Config.CtAllow then
    function sendNotification(xPlayer, title, description, duration, icon)
        TriggerEvent('sc_taxsystem:sendNotification', xPlayer.source, title, description, duration, icon)
    end

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
            print(Translation[Config.Locale]['er_player']) 
            cb({})
            return
        end

        local identifier = xPlayer.getIdentifier()
        if not identifier then
            print(Translation[Config.Locale]['er_ident'])
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
                        print(Translation[Config.Locale]['er_lp'])
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
            print(Translation[Config.Locale]['er_player'])
            return
        end

        local identifier = xPlayer.getIdentifier()
        if not identifier then
            print(Translation[Config.Locale]['er_ident'])
            return
        end

        if not plate or plate == "" then
            print(Translation[Config.Locale]['er_lpc'])
            return
        end

        MySQL.update('UPDATE owned_vehicles SET insurance = 1 WHERE owner = @owner AND plate = @plate', {
            ['@owner'] = identifier,
            ['@plate'] = plate
        }, function(affectedRows)
            if affectedRows > 0 then
                TriggerClientEvent('ox_lib:notify', xPlayer.source, {
                    title = Translation[Config.Locale]['success'],
                    description = Translation[Config.Locale]['cwp'] .. plate .. Translation[Config.Locale]['cwp_1'],
                    type = 'success'
                })
            else
                TriggerClientEvent('ox_lib:notify', xPlayer.source, {
                    title = Translation[Config.Locale]['error'],
                    description = Translation[Config.Locale]['er_ins'],
                    type = 'error'
                })
            end
        end)
    end)

    ESX.RegisterServerCallback('sc_taxsystem:getInsuredVehicles', function(source, cb)
        local xPlayer = ESX.GetPlayerFromId(source)
        if not xPlayer then
            print(Translation[Config.Locale]['er_player'])
            cb({})
            return
        end

        local identifier = xPlayer.getIdentifier()
        if not identifier then
            print(Translation[Config.Locale]['er_ident'])
            cb({})
            return
        end

        MySQL.query('SELECT plate FROM owned_vehicles WHERE owner = @owner AND insurance = 1', {
            ['@owner'] = identifier
        }, function(result)
            if result and #result > 0 then -- CODE FIX
                local insuredVehicles = {}
                for _, row in ipairs(result) do
                    if row.plate then
                        table.insert(insuredVehicles, { plate = row.plate })
                    else
                        print(Translation[Config.Locale]['er_lp'])
                    end
                end
                cb(insuredVehicles)
            else
                cb({})
            end
        end)
    end)

    RegisterServerEvent('sc_taxsystem:removeInsurance')
    AddEventHandler('sc_taxsystem:removeInsurance', function(plate)
        local xPlayer = ESX.GetPlayerFromId(source)
        if not xPlayer then
            print(Translation[Config.Locale]['er_player'])
            return
        end

        local identifier = xPlayer.getIdentifier()
        if not identifier then
            print(Translation[Config.Locale]['er_ident'])
            return
        end

        if not plate or plate == "" then
            print(Translation[Config.Locale]['er_lpc'])
            return
        end

        MySQL.update('UPDATE owned_vehicles SET insurance = 0 WHERE owner = @owner AND plate = @plate', {
            ['@owner'] = identifier,
            ['@plate'] = plate
        }, function(affectedRows)
            if affectedRows > 0 then
                TriggerClientEvent('ox_lib:notify', xPlayer.source, {
                    title = Translation[Config.Locale]['success'],
                    description = Translation[Config.Locale]['insc'] .. plate .. Translation[Config.Locale]['insc_1'],
                    type = 'success'
                })
            else
                TriggerClientEvent('ox_lib:notify', xPlayer.source, {
                    title = Translation[Config.Locale]['error'],
                    description = Translation[Config.Locale]['er_rins'],
                    type = 'error'
                })
            end
        end)
    end)
    
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
                                local amount = tax
                                local label = Config.CtName
                                local societyAccount = Config.Society            
                                exports.sc_taxsystem:handleTaxPayment(xPlayer, amount, label, societyAccount)
                                if Config.useBilling then

                                else
                                    sendNotification(xPlayer, Config.CtName, Translation[Config.Locale]['cttext'] .. tax .. Translation[Config.Locale]['cttext1'], 5000, 'car')
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