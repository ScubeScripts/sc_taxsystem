ESX = exports["es_extended"]:getSharedObject()

local price = Config.PtPrice

function removeColorCodes(text)
    return text:gsub("~[a-zA-Z0-9]~", "")
end

Citizen.CreateThread(function()
    while true do
        for _, playerid in pairs(GetPlayers()) do
            local xPlayer = ESX.GetPlayerFromId(playerid)
            
            local totalPrice = 0
            
            for _, itemToCheck in ipairs(Config.ItemsToCheck) do
                if xPlayer.getInventoryItem(itemToCheck.name) ~= nil then
                    local itemCount = xPlayer.getInventoryItem(itemToCheck.name).count
                    if itemCount >= itemToCheck.minimumCount then 
                        totalPrice = totalPrice + price
                    end
                end    
            end

            if totalPrice > 0 then
                xPlayer.removeAccountMoney('bank', totalPrice, Config.PtName)

                for _, notifyModule in ipairs(Config.Notify) do
                    if notifyModule.enabled then
                        local notificationText = Translation[Config.Locale]['pttext'] .. totalPrice .. Translation[Config.Locale]['pttext_2']
                        
                        if notifyModule.name == "ox_lib" then
                            notificationText = removeColorCodes(notificationText)
                        end

                        if notifyModule.name == "bulletin" then
                            TriggerClientEvent('bulletin:sendAdvanced', xPlayer.source, notificationText, Translation[Config.Locale]['handy'], Translation[Config.Locale]['pay_pttext'], Config.PtChar, Config.Delay, Config.Position, Config.Progress, Config.Theme, Config.exitAnim)
                        elseif notifyModule.name == "default" then
                            TriggerClientEvent('sc_taxsystem:picturemsg', xPlayer.source, Config.PtChar, notificationText, Translation[Config.Locale]['handy'], Translation[Config.Locale]['pay_pttext'])
                        elseif notifyModule.name == "ox_lib" then
                            TriggerClientEvent('ox_lib:notify', xPlayer.source, {
                                id = 'phone_notify',
                                title = Translation[Config.Locale]['pay_pttext'],
                                description = notificationText,
                                duration = 5000,
                                icon = 'mobile-screen',
                                iconAnimation = 'shake'
                            })
                        end
                    end
                end
            end
        end
        Citizen.Wait(Config.PtTime * 60000)
    end
end)




