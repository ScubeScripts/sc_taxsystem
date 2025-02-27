ESX = exports["es_extended"]:getSharedObject()

if Config.UtAllow then
    function sendNotification(xPlayer, title, description, duration, icon)
        TriggerEvent('sc_taxsystem:sendNotification', xPlayer.source, title, description, duration, icon)
    end

    Citizen.CreateThread(function()
        while true do
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

                    local label = Config.UtName
                    local societyAccount = Config.Society
                    exports.sc_taxsystem:handleTaxPayment(xPlayer, tax, label, societyAccount)
                    if Config.useBilling then

                    else
                        sendNotification(xPlayer, Config.UtName, Translation[Config.Locale]['text'] .. ESX.Math.Round(tax) .. Translation[Config.Locale]['text1'], 5000, 'building-columns')
                    end
                end
            end

            Citizen.Wait(Config.UtTime * 60000)
        end
    end)
else 
    print("[TAX SYSTEM] PLAYER-TAX IS OFF")
end    