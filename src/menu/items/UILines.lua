local SettingsButton = {
    Rectangle = { Y = 0, Width = 100, Height = 38 },
    Text = { X = 65, Y = 17.5, Scale = 0.05 },
}

function RageUI.line()
    local CurrentMenu = RageUI.CurrentMenu
    if CurrentMenu ~= nil then
        if CurrentMenu() then
            local Option = RageUI.Options + 1
            if CurrentMenu.Pagination.Minimum <= Option and CurrentMenu.Pagination.Maximum >= Option then
                RenderSprite("RageUIline", "", CurrentMenu.X + SettingsButton.Text.X, CurrentMenu.Y + SettingsButton.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 300, 3, 255, 210, 210, 210, 255)
                RageUI.ItemOffset = RageUI.ItemOffset + SettingsButton.Rectangle.Height
                if (CurrentMenu.Index == Option) then
                    if (RageUI.LastControl) then
                        CurrentMenu.Index = Option - 1
                        if (CurrentMenu.Index < 1) then
                            CurrentMenu.Index = RageUI.CurrentMenu.Options
                        end
                    else
                        CurrentMenu.Index = Option + 1
                    end
                end
            end
            RageUI.Options = RageUI.Options + 1
        end
    end
end