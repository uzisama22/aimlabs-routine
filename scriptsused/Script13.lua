--Earth Fake Macro Leaked
local name = 500
local keybind = "z"

--Script

gv = false
    plr = game.Players.LocalPlayer
    mouse = plr:GetMouse()
    mouse.KeyDown:connect(function(key)
        if key == keybind and gv == false then
            gv = true
            game.Players.LocalPlayer.Character.Humanoid.Name = "Humz"
            game.Players.LocalPlayer.Character.Humz.WalkSpeed = name
            game.Players.LocalPlayer.Character.Humz.JumpPower = 50
        elseif key == keybind and gv == true then
            gv = false
            game.Players.LocalPlayer.Character.Humz.WalkSpeed = 16
            game.Players.LocalPlayer.Character.Humz.JumpPower = 50
            game.Players.LocalPlayer.Character.Humz.Name = "Humanoid"
        end
    end)