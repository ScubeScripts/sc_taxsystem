ESX = exports["es_extended"]:getSharedObject()

local markerPosition = vector3(-836.84, -273.28, 39.0)  -- Position des Markers
local markerType = 1  -- Art des Markers (z.B. 1 für einen einfachen Marker)
local markerSize = vector3(1.0, 1.0, 0.3)  -- Größe des Markers
local blip

-- Blip erstellen
Citizen.CreateThread(function()
    blip = AddBlipForCoord(markerPosition.x, markerPosition.y, markerPosition.z)
    SetBlipSprite(blip, 487)  -- Blip-Symbol (1 ist das Standard-Ziel-Icon)
    SetBlipColour(blip, 1)  -- Blip-Farbe (2 ist grün)
    SetBlipScale(blip, 0.8)  -- Blip-Größe
    SetBlipAsShortRange(blip, true)  -- Blip nur im näheren Umkreis anzeigen
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("MORS MUTUAL")  -- Blip-Beschriftung
    EndTextCommandSetBlipName(blip)
end)

-- Haupt-Loop für das DrawMarker und Interaktionen
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        -- Marker zeichnen
        DrawMarker(markerType, markerPosition.x, markerPosition.y, markerPosition.z - 1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, markerSize.x, markerSize.y, markerSize.z, 255, 0, 0, 100, false, true, 2, false, nil, nil, false)

        -- Spieler in der Nähe des Markers
        local playerPed = PlayerPedId()
        local playerPos = GetEntityCoords(playerPed)
        local distance = #(playerPos - markerPosition)

        -- Wenn der Spieler in der Nähe des Markers ist und 'E' drückt
        if distance < 1.5 then
            DisplayHelpText("Drücke ~INPUT_CONTEXT~ um das Menü zu öffnen.")  -- Hilfetext anzeigen

            if IsControlJustPressed(0, 38) then  -- 38 ist die Taste 'E'
                lib.showContext('ct_menu')  -- Menü anzeigen
            end
        end
    end
end)

-- Hilfetext anzeigen
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
        title = 'Versicherte Fahrzeuge',
        description = '',
        icon = 'list-check',
        onSelect = function()
            ESX.TriggerServerCallback('sc_taxsystem:getOwnedVehicles', function(vehicles)
                if #vehicles == 0 then
                    lib.notify({
                        title = 'Keine Fahrzeuge',
                        description = 'Es sind keine Fahrzeuge vorhanden.',
                        type = 'error'
                    })
                    return
                end

                local vehicleOptions = {}
                for _, vehicle in pairs(vehicles) do
                    table.insert(vehicleOptions, {
                        title = vehicle.plate,
                        icon = 'car',
                        disabled = (vehicle.insurance == 0) -- Disabled, wenn nicht versichert
                    })
                end

                lib.registerContext({
                    id = 'vehicle_list',
                    title = 'Versicherte Fahrzeuge',
                    options = vehicleOptions
                })

                lib.showContext('vehicle_list')
            end)
        end,
      },
      {
        title = 'Fahrzeug Versichern',
        description = '',
        icon = 'file-circle-plus',
        onSelect = function()
            ESX.TriggerServerCallback('sc_taxsystem:getUninsuredVehicles', function(uninsuredVehicles)
                if #uninsuredVehicles == 0 then
                    lib.notify({
                        title = 'Keine Fahrzeuge',
                        description = 'Es gibt keine Fahrzeuge, die versichert werden können.',
                        type = 'error'
                    })
                    return
                end
        
                -- Fahrzeug-Auswahl-Dialog
                local plates = {}
                for _, vehicle in pairs(uninsuredVehicles) do
                    table.insert(plates, { value = vehicle.plate, label = vehicle.plate }) -- Label und Value für die Auswahl
                end
        
                local input = lib.inputDialog('Fahrzeug versichern', {
                    {
                        type = 'select',
                        label = 'Kennzeichen',
                        options = plates -- Optionen korrekt übergeben
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
        title = 'Versicherung Aufheben',
        description = '',
        icon = 'file-circle-xmark',
        onSelect = function()
            ESX.TriggerServerCallback('sc_taxsystem:getInsuredVehicles', function(uninsuredVehicles)
                if #uninsuredVehicles == 1 then
                    lib.notify({
                        title = 'Keine Fahrzeuge',
                        description = 'Es gibt keine Fahrzeuge, die versichert werden können.',
                        type = 'error'
                    })
                    return
                end
        
                -- Fahrzeug-Auswahl-Dialog
                local plates = {}
                for _, vehicle in pairs(uninsuredVehicles) do
                    table.insert(plates, { value = vehicle.plate, label = vehicle.plate }) -- Label und Value für die Auswahl
                end
        
                local input = lib.inputDialog('Fahrzeug versichern', {
                    {
                        type = 'select',
                        label = 'Kennzeichen',
                        options = plates -- Optionen korrekt übergeben
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
