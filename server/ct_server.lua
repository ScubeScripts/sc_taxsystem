ESX = exports["es_extended"]:getSharedObject()

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


