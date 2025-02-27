ESX = exports["es_extended"]:getSharedObject()

local markerPosition = Config.Marker
local markerType = 1
local markerSize = vector3(1.0, 1.0, 0.3)
local blip

Citizen.CreateThread(function()
    blip = AddBlipForCoord(markerPosition.x, markerPosition.y, markerPosition.z)
    SetBlipSprite(blip, 487)
    SetBlipColour(blip, 1)
    SetBlipScale(blip, 0.8)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(Config.CtName)
    EndTextCommandSetBlipName(blip)
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        local playerPed = PlayerPedId()
        local playerPos = GetEntityCoords(playerPed)
        local distance = #(playerPos - markerPosition)

        if distance < 5.0 then
            DrawMarker(markerType, markerPosition.x, markerPosition.y, markerPosition.z - 1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, markerSize.x, markerSize.y, markerSize.z, 255, 0, 0, 100, false, true, 2, false, nil, nil, false)

            if distance < 1.5 then
                DisplayHelpText(Translation[Config.Locale]['ct_open'])

                if IsControlJustPressed(0, 38) then
                    lib.showContext('ct_menu')
                end
            end
        end
    end
end)

function DisplayHelpText(text)
    SetTextComponentFormat("STRING")
    AddTextComponentString(text)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

lib.registerContext({
    id = 'ct_menu',
    title = Config.CtName,
    options = {
      {
        title = Translation[Config.Locale]['ct_insur'],
        description = '',
        icon = 'list-check',
        onSelect = function()
            ESX.TriggerServerCallback('sc_taxsystem:getOwnedVehicles', function(vehicles)
                if #vehicles == 0 then
                    lib.notify({
                        title = Translation[Config.Locale]['ct_noveh'],
                        description = Translation[Config.Locale]['ct_novehl'],
                        type = 'error'
                    })
                    return
                end

                local vehicleOptions = {}
                for _, vehicle in pairs(vehicles) do
                    table.insert(vehicleOptions, {
                        title = vehicle.plate,
                        icon = 'car',
                        disabled = (vehicle.insurance == 0)
                    })
                end

                lib.registerContext({
                    id = 'vehicle_list',
                    title = Translation[Config.Locale]['ct_insur'],
                    menu = 'ct_menu',
                    options = vehicleOptions
                })

                lib.showContext('vehicle_list')
            end)
        end,
      },
      {
        title = Translation[Config.Locale]['ct_insurc'],
        description = '',
        icon = 'file-circle-plus',
        onSelect = function()
            ESX.TriggerServerCallback('sc_taxsystem:getUninsuredVehicles', function(uninsuredVehicles)
                if #uninsuredVehicles == 0 then
                    lib.notify({
                        title = Translation[Config.Locale]['ct_noveh'],
                        description = Translation[Config.Locale]['ct_novehi'],
                        type = 'error'
                    })
                    return
                end
        
                local plates = {}
                for _, vehicle in pairs(uninsuredVehicles) do
                    table.insert(plates, { value = vehicle.plate, label = vehicle.plate })
                end
        
                local input = lib.inputDialog(Translation[Config.Locale]['ct_insurc'], {
                    {
                        type = 'select',
                        label = Translation[Config.Locale]['ct_plate'],
                        options = plates
                    }
                })
        
                if input then
                    local selectedPlate = input[1]
                    TriggerServerEvent('sc_taxsystem:insureVehicle', selectedPlate)
                end
            end)
        end,        
      },
      {
        title = Translation[Config.Locale]['ct_revinsur'],
        description = '',
        icon = 'file-circle-xmark',
        onSelect = function()
            ESX.TriggerServerCallback('sc_taxsystem:getInsuredVehicles', function(insuredVehicles)
                if #insuredVehicles == 0 then -- CODE FIX
                    lib.notify({
                        title = Translation[Config.Locale]['ct_noveh'],
                        description = Translation[Config.Locale]['ct_novehui'],
                        type = 'error'
                    })
                    return
                end                
        
                local plates = {}
                for _, vehicle in pairs(insuredVehicles) do
                    table.insert(plates, { value = vehicle.plate, label = vehicle.plate })
                end
        
                local input = lib.inputDialog(Translation[Config.Locale]['ct_revinsur'], {
                    {
                        type = 'select',
                        label = Translation[Config.Locale]['ct_plate'],
                        options = plates
                    }
                })
        
                if input then
                    local selectedPlate = input[1]
                    TriggerServerEvent('sc_taxsystem:removeInsurance', selectedPlate)
                end
            end)
        end,
      }
    }
})
