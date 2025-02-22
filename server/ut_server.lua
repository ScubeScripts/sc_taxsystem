ESX = exports["es_extended"]:getSharedObject()

function removeColorCodes(text)
    return text:gsub("~[a-zA-Z0-9]~", "")
end

Citizen.CreateThread(function()
    while true do
        function BankTax(AllUser)
            local AllUser = ESX.GetPlayers()
            for i = 1, #AllUser, 1 do
                local xPlayer = ESX.GetPlayerFromId(AllUser[i])
                if xPlayer ~= nil then
                    local bank = xPlayer.getAccount("bank").money
                    local tax = 0

                    if (bank > Config.HoboClassLimit) and (bank < Config.PoorClassLimit) then --Poor Class
                        local taxpercent = Config.PoorClassTax
                        tax = (bank * taxpercent) / 1000
                    elseif (bank < Config.LowerClassLimit) then --Lower Class
                        local taxpercent = Config.LowerClassTax
                        tax = (bank * taxpercent) / 1000
                    elseif (bank < Config.LowerMiddleClassLimit) then --Lower Middle Class
                        local taxpercent = Config.LowerMiddleClassTax
                        tax = (bank * taxpercent) / 1000
                    elseif (bank < Config.MiddleClassLimit) then --Middle Class
                        local taxpercent = Config.MiddleClassTax
                        tax = (bank * taxpercent) / 1000
                    elseif (bank < Config.UpperMiddleClassLimit) then --Upper Middle Class
                        local taxpercent = Config.UpperMiddleClassTax
                        tax = (bank * taxpercent) / 1000
                    elseif (bank < Config.LowerHigherClassLimit) then --Lower Higher Class
                        local taxpercent = Config.LowerHigherClassTax
                        tax = (bank * taxpercent) / 1000
                    elseif (bank < Config.HigherClassLimit) then --Higher Class
                        local taxpercent = Config.HigherClassTax
                        tax = (bank * taxpercent) / 1000
                    else
                        local taxpercent = Config.UpperHigherClassTax
                        tax = (bank * taxpercent) / 1000
                    end

                    if tax ~= 0 then
                        xPlayer.removeAccountMoney('bank', ESX.Math.Round(tax), Config.UtName)
                        for _, notifyModule in ipairs(Config.Notify) do
                            if notifyModule.enabled then
                                local notificationText = Translation[Config.Locale]['text'] .. ESX.Math.Round(tax) .. Translation[Config.Locale]['text1']
                                
                                if notifyModule.name == "ox_lib" then
                                    notificationText = removeColorCodes(notificationText)
                                end
        
                                if notifyModule.name == "bulletin" then
                                    TriggerClientEvent('bulletin:sendAdvanced', xPlayer.source, notificationText, Config.UtName, Translation[Config.Locale]['pay_text'], Config.UtChar, Config.Delay, Config.Position, Config.Progress, Config.Theme, Config.exitAnim)
                                elseif notifyModule.name == "default" then
                                    TriggerClientEvent('sc_taxsystem:picturemsg', xPlayer.source, Config.UtChar, notificationText, Config.UtName, Translation[Config.Locale]['pay_text'])
                                elseif notifyModule.name == "ox_lib" then
                                    TriggerClientEvent('ox_lib:notify', xPlayer.source, {
                                        title = Config.UtName,
                                        description = notificationText,
                                        duration = 5000,
                                        icon = 'building-columns'
                                    })
                                end
                            end
                        end
                    end
                end
            end
        end
        BankTax(AllUser)
        Citizen.Wait(Config.UtTime * 60000)
    end
end)