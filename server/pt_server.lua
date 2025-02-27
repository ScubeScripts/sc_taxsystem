ESX = exports["es_extended"]:getSharedObject()

if Config.PtAllow then
    function sendNotification(xPlayer, title, description, duration, icon)
        TriggerEvent('sc_taxsystem:sendNotification', xPlayer.source, title, description, duration, icon)
    end

    local price = Config.PtPrice

    Citizen.CreateThread(function()
        while true do
            for _, playerid in pairs(GetPlayers()) do
                local xPlayer = ESX.GetPlayerFromId(playerid)
                
                if xPlayer then
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
                        local amount = totalPrice
                        local label = Config.PtName
                        local societyAccount = Config.Society
                        exports.sc_taxsystem:handleTaxPayment(xPlayer, amount, label, societyAccount)
                        if Config.useBilling then

                        else
                            sendNotification(xPlayer, Config.PtName, Translation[Config.Locale]['pttext'] .. totalPrice .. Translation[Config.Locale]['pttext_2'], 5000, 'mobile-screen')
                        end
                    end
                end
            end
            Citizen.Wait(Config.PtTime * 60000)
        end
    end)
else
    print("[TAX SYSTEM] PHONE-TAX IS OFF")
end