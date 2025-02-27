local function handleTaxPayment(xPlayer, amount, label, societyAccount)
    local bank = xPlayer.getAccount('bank').money

    if Config.useBilling then
        local invoiceMessage = label
        local invoiceData = {
            identifier = xPlayer.identifier,
            sender = xPlayer.identifier,
            target_type = 'society',
            target = societyAccount,
            label = invoiceMessage,
            amount = amount
        }

        MySQL.Async.execute('INSERT INTO billing (identifier, sender, target_type, target, label, amount) VALUES (@identifier, @sender, @target_type, @target, @label, @amount)', {
            ['@identifier'] = invoiceData.identifier,
            ['@sender'] = invoiceData.sender,
            ['@target_type'] = invoiceData.target_type,
            ['@target'] = invoiceData.target,
            ['@label'] = invoiceData.label,
            ['@amount'] = invoiceData.amount
        }, function(rowsChanged)
            if rowsChanged > 0 then
                TriggerClientEvent('ox_lib:notify', xPlayer.source, {
                    title = 'Bank',
                    description = Translation[Config.Locale]['ct_payment'],
                    duration = 5000,
                    icon = 'receipt'
                })
            end
        end)
    else
        if amount <= bank then
            xPlayer.removeAccountMoney('bank', amount, label)
            TriggerEvent('sc_taxsystem:sendNotification', xPlayer.source, title, description, duration, icon)

            TriggerEvent('esx_addonaccount:getSharedAccount', societyAccount, function(account)
                if account then
                    account.addMoney(amount)
                end
            end)
        else
            local remainingAmount = amount - bank
            local invoiceMessage = label

            if bank > 0 then
                xPlayer.removeAccountMoney('bank', bank, label)
            end

            local invoiceData = {
                identifier = xPlayer.identifier,
                sender = xPlayer.identifier,
                target_type = 'society',
                target = societyAccount,
                label = invoiceMessage,
                amount = remainingAmount
            }

            MySQL.Async.execute('INSERT INTO billing (identifier, sender, target_type, target, label, amount) VALUES (@identifier, @sender, @target_type, @target, @label, @amount)', {
                ['@identifier'] = invoiceData.identifier,
                ['@sender'] = invoiceData.sender,
                ['@target_type'] = invoiceData.target_type,
                ['@target'] = invoiceData.target,
                ['@label'] = invoiceData.label,
                ['@amount'] = invoiceData.amount
            }, function(rowsChanged)
                if rowsChanged > 0 then
                    TriggerClientEvent('ox_lib:notify', xPlayer.source, {
                        title = 'Bank',
                        description = Translation[Config.Locale]['ct_payment'],
                        duration = 5000,
                        icon = 'receipt'
                    })
                end
            end)

            TriggerEvent('esx_addonaccount:getSharedAccount', societyAccount, function(account)
                if account then
                    account.addMoney(remainingAmount)
                end
            end)
        end
    end
end

RegisterServerEvent('sc_taxsystem:sendNotification')
AddEventHandler('sc_taxsystem:sendNotification', function(playerId, title, description, duration, icon)
    TriggerClientEvent('ox_lib:notify', playerId, {
        title = title,
        description = description,
        duration = duration,
        icon = icon
    })
end)

exports('handleTaxPayment', handleTaxPayment)
