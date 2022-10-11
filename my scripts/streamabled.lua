-- silent aim
    
    local nigger = loadstring(game:HttpGet("https://pastebin.com/raw/WxvxQKNQ"))() -- local nigger K
    nigger.TeamCheck(false)
     
    local Workspace = game:GetService("Workspace")
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local UserInputService = game:GetService("UserInputService")
     
    local LocalPlayer = Players.LocalPlayer
    local Mouse = LocalPlayer:GetMouse()
    local CurrentCamera = Workspace.CurrentCamera
     
    local skid = {
        SilentAim = true,
        AimLock = false,
        Prediction = 0.157,
        AimLockKeybind = Enum.KeyCode.E
    }
    getgenv().skid = skid
     
    function nigger.Check()
        if not (nigger.Enabled == true and nigger.Selected ~= LocalPlayer and nigger.SelectedPart ~= nil) then
            return false
        end
     
        local Character = nigger.Character(nigger.Selected)
        local KOd = Character:WaitForChild("BodyEffects")["K.O"].Value
        local Grabbed = Character:FindFirstChild("GRABBING_CONSTRAINT") ~= nil
     
        if (KOd or Grabbed) then
            return false
        end
     
        return true
    end
     
    local __index
    __index = hookmetamethod(game, "__index", function(t, k)
        if (t:IsA("Mouse") and (k == "Hit" or k == "Target") and nigger.Check()) then
            local SelectedPart = nigger.SelectedPart
     
            if (skid.SilentAim and (k == "Hit" or k == "Target")) then
                local Hit = SelectedPart.CFrame + (SelectedPart.Velocity * skid.Prediction)
     
                return (k == "Hit" and Hit or SelectedPart)
            end
        end
     
        return __index(t, k)
    end)
     
    RunService:BindToRenderStep("AimLock", 0, function()
        if (skid.AimLock and nigger.Check() and UserInputService:IsKeyDown(skid.AimLockKeybind)) then
            local SelectedPart = nigger.SelectedPart
     
            local Hit = SelectedPart.CFrame + (SelectedPart.Velocity * skid.Prediction)
     
            CurrentCamera.CFrame = CFrame.lookAt(CurrentCamera.CFrame.Position, Hit.Position)
        end
        end)