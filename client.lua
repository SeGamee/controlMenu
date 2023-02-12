ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

-- Création du menu
function openControlMenu()
    local controlMenu = RageUI.CreateMenu(Config.title, Config.subtitle)
    RageUI.Visible(controlMenu, not RageUI.Visible(controlMenu))
    while controlMenu do
        Citizen.Wait(0)
        RageUI.IsVisible(controlMenu, true, false, true, function()
            for k,v in pairs(Config.Control) do
                RageUI.ButtonWithStyle(v.name, nil, {RightLabel = Config.keyColor .. v.key}, true)
            end
        end, function()
        end)
        if not RageUI.Visible(controlMenu) then
            controlMenu = RMenu:DeleteType("controlMenu", true)
        end
    end
end

-- Ouverture du menu
Keys.Register(Config.openMenu, 'openkeymenu', Config.openMenuText, function()
    openControlMenu()
end)
