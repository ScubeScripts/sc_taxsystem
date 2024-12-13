local curVersion = GetResourceMetadata(GetCurrentResourceName(), "version")
local resourceName = "sc_taxsystem"

CreateThread(function()
    if GetCurrentResourceName() ~= "sc_taxsystem" then
        resourceName = "sc_taxsystem (" .. GetCurrentResourceName() .. ")"
    end
end)
CreateThread(function()
    while true do
        PerformHttpRequest("https://api.github.com/repos/ScubeScripts/sc_taxsystem/releases/latest", CheckVersion, "GET")
        Wait(3600000)
    end
end)
function CheckVersion()
    local repoVersion, repoURL = GetRepoInformations()
    CreateThread(function()
        if curVersion ~= repoVersion then
            Wait(4000)
            print("^0[^3WARNING^0] " .. resourceName .. " is ^1NOT ^0up to date!")
            print("^0[^3WARNING^0] Your Version: ^1" .. curVersion .. "^0")
            print("^0[^3WARNING^0] Latest Version: ^2" .. repoVersion .. "^0")
            print("^0[^3WARNING^0] Get the latest Version from: ^2" .. repoURL .. "^0")
        else
            Wait(4000)
            print("^0[^2INFO^0] " .. resourceName .. " is up to date! (^2" .. curVersion .. "^0)")
        end
    end)
end
function GetRepoInformations()
    local repoVersion, repoURL, repoBody = nil, nil, nil
    PerformHttpRequest("https://api.github.com/repos/ScubeScripts/sc_taxsystem/releases/latest", function(err, response)
        if err == 200 then
            local data = json.decode(response)
            repoVersion = data.tag_name
            repoURL = data.html_url
            repoBody = data.body
        else
            repoVersion = curVersion
            repoURL = "https://github.com/ScubeScripts/sc_taxsystem"
        end
    end, "GET")
    repeat
        Wait(50)
    until repoVersion and repoURL and repoBody
    return repoVersion, repoURL, repoBody
end