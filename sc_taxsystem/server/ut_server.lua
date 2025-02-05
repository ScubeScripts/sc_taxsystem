ESX = exports["es_extended"]:getSharedObject()

if Config.UtAllow then

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
                        local cash = xPlayer.getMoney()
                        local totalMoney = bank + cash
                        local tax = 0
    
                        if (totalMoney > Config.HoboClassLimit) and (totalMoney < Config.PoorClassLimit) then -- Poor Class
                            local taxpercent = Config.PoorClassTax
                            tax = (totalMoney * taxpercent) / 1000
                        elseif (totalMoney < Config.LowerClassLimit) then -- Lower Class
                            local taxpercent = Config.LowerClassTax
                            tax = (totalMoney * taxpercent) / 1000
                        elseif (totalMoney < Config.LowerMiddleClassLimit) then -- Lower Middle Class
                            local taxpercent = Config.LowerMiddleClassTax
                            tax = (totalMoney * taxpercent) / 1000
                        elseif (totalMoney < Config.MiddleClassLimit) then -- Middle Class
                            local taxpercent = Config.MiddleClassTax
                            tax = (totalMoney * taxpercent) / 1000
                        elseif (totalMoney < Config.UpperMiddleClassLimit) then -- Upper Middle Class
                            local taxpercent = Config.UpperMiddleClassTax
                            tax = (totalMoney * taxpercent) / 1000
                        elseif (totalMoney < Config.LowerHigherClassLimit) then -- Lower Higher Class
                            local taxpercent = Config.LowerHigherClassTax
                            tax = (totalMoney * taxpercent) / 1000
                        elseif (totalMoney < Config.HigherClassLimit) then -- Higher Class
                            local taxpercent = Config.HigherClassTax
                            tax = (totalMoney * taxpercent) / 1000
                        else
                            local taxpercent = Config.UpperHigherClassTax
                            tax = (totalMoney * taxpercent) / 1000
                        end
    
                        if tax ~= 0 then
                            if tax <= bank then
                                -- Wenn genug Geld vorhanden ist, Steuern vom Spieler abziehen
                                xPlayer.removeAccountMoney('bank', ESX.Math.Round(tax), Config.UtName)

                                exports.pefcl:addBankBalanceByIdentifier(xPlayer.source, {
                                    identifier = "government",
                                    amount = ESX.Math.Round(tax * 2),
                                    message = "Tax payment"
                                })
                            else
                                local remainingTax = tax - bank
                                local invoiceMessage = Translation[Config.Locale]['text'] .. ESX.Math.Round(remainingTax) .. Translation[Config.Locale]['text1']
    
                                if bank > 0 then
                                    xPlayer.removeAccountMoney('bank', bank, Config.UtName)
                                end
    
                                -- Rechnung erstellen
                                local invoiceCreated = exports.pefcl:createInvoice(xPlayer.source, {
                                    to = xPlayer.getName(),
                                    toIdentifier = xPlayer.identifier,
                                    from = Config.UtName,
                                    fromIdentifier = "government",
                                    amount = ESX.Math.Round(remainingTax),
                                    message = removeColorCodes(invoiceMessage),
                                    receiverAccountIdentifier = "government"  -- "government" Konto wird hier als Empfänger festgelegt
                                })
    
                                -- Steuerbetrag dem "government"-Konto hinzufügen
                                exports.pefcl:addBankBalanceByIdentifier(xPlayer.source, {
                                    identifier = "government",  -- Empfänger des Betrags ist das "government"-Konto
                                    amount = ESX.Math.Round(remainingTax),  -- Steuermenge, die überwiesen wird
                                    message = "Tax payment"  -- Nachricht zur Transaktion
                                })
                            end
    
                            -- Benachrichtigungen verschicken
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
else 
    print("[TAX SYSTEM] PLAYER-TAX IS OFF")
end    