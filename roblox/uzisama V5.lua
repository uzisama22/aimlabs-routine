--[[
    This source is free to use and hopefully a good source for new script developers to learn how to make an aimlock or silent aim.
    * If this is used in any script, please credit me for it.
    * Please do not use this in a paid script.
    
    Sorry for the really ugly code, I didn't think I would be releasing the source, lmao.
--]]

-- *NOTE: If the script doesn't start, remove the code in line 70.
-- Aka: repeat wait() until LP.Character:FindFirstChild("FULLY_LOADED_CHAR");


--// Settings

local Settings = {
    Aimlock = {
        AimPart = "LowerTorso",
        AimlockKey = "Q",
        Prediction = 0.143,

        FOVEnabled = false,
        FOVShow = false,
        FOVSize = 30,

        Enabled = false
    },
    SilentAim = {
        Key = "C",
        AimAt = "LowerTorso",
        PredictionAmount = 0.139,

        FOVEnabled = false,
        FOVShow = false,
        FOVSize = 0,

        Enabled = false,
        KeyToLockOn = false
    },
    CFSpeed = {
        Speed = 2,
        
        Enabled = false,
        Toggled = false,

        Key = "Z"
    }
}

--// Variables (Service)

local Players = game:GetService("Players")
local RS = game:GetService("RunService")
local WS = game:GetService("Workspace")
local GS = game:GetService("GuiService")
local SG = game:GetService("StarterGui")
local UIS = game:GetService("UserInputService")

--// Variables (regular)

local LP = Players.LocalPlayer
local Mouse = LP:GetMouse()
local Camera = WS.CurrentCamera
local GetGuiInset = GS.GetGuiInset

local AimlockState = false
local aimLocked
local lockVictim

--// Anti-Cheat

repeat wait() until LP.Character:FindFirstChild("FULLY_LOADED_CHAR");

for _,ac in pairs(LP.Character:GetChildren()) do
    if (ac:IsA("Script") and ac.Name ~= "Animate" and ac.Name ~= "Health") then
        ac:Destroy();
    end;
end;

LP.Character.ChildAdded:Connect(function(child)
    if (child:IsA("Script") and child.Name ~= "Animate" and ac.Name ~= "Health") then
        child:Destroy();
    end;
end);

--// CFrame Speed

local userInput = game:GetService('UserInputService')
local runService = game:GetService('RunService')

Mouse.KeyDown:connect(function(Key)
    local cfKey = Settings.CFSpeed.Key:lower()
    if (Key == cfKey) then
        if (Settings.CFSpeed.Toggled) then
            Settings.CFSpeed.Enabled = not Settings.CFSpeed.Enabled
            if (Settings.CFSpeed.Enabled == true) then
                repeat
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + game.Players.LocalPlayer.Character.Humanoid.MoveDirection * Settings.CFSpeed.Speed
                    game:GetService("RunService").Stepped:wait()
                until Settings.CFSpeed.Enabled == false
            end
        end
    end
end)

--// FOV Circle

local fov = Drawing.new("Circle")
fov.Filled = false
fov.Transparency = 1
fov.Thickness = 1
fov.Color = Color3.fromRGB(255, 255, 0)

--// Functions

function updateLock()
    if Settings.Aimlock.FOVEnabled == true and Settings.Aimlock.FOVShow == true then
        if fov then
            fov.Radius = Settings.Aimlock.FOVSize * 2
            fov.Visible = Settings.Aimlock.FOVShow
            fov.Position = Vector2.new(Mouse.X, Mouse.Y + GetGuiInset(GS).Y)

            return fov
        end
    else
        Settings.Aimlock.FOVShow = false
        fov.Visible = false
    end
end

function WTVP(arg)
    return Camera:WorldToViewportPoint(arg)
end

function WTSP(arg)
    return Camera.WorldToScreenPoint(Camera, arg)
end

function getClosest()
    local closestPlayer
    local shortestDistance = math.huge

    for i, v in pairs(game.Players:GetPlayers()) do
        local notKO = v.Character:WaitForChild("BodyEffects")["K.O"].Value ~= true
        local notGrabbed = v.Character:FindFirstChild("GRABBING_COINSTRAINT") == nil
        
        if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild(Settings.Aimlock.AimPart) and notKO and notGrabbed then
            local pos = Camera:WorldToViewportPoint(v.Character.PrimaryPart.Position)
            local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(Mouse.X, Mouse.Y)).magnitude
            
            if (Settings.Aimlock.FOVEnabled) then
                if (fov.Radius > magnitude and magnitude < shortestDistance) then
                    closestPlayer = v
                    shortestDistance = magnitude
                end
            else
                if (magnitude < shortestDistance) then
                    closestPlayer = v
                    shortestDistance = magnitude
                end
            end
        end
    end
    return closestPlayer
end

function sendNotification(text)
    game.StarterGui:SetCore("SendNotification", {
        Title = "hakan.software",
        Text = text,
        Duration = 5
    })
end

--// Checks if key is down

Mouse.KeyDown:Connect(function(k)
    local actualKey = Settings.Aimlock.AimlockKey:lower()
    if (k == actualKey) then
        if Settings.Aimlock.Enabled == true then
            aimLocked = not aimLocked
            if aimLocked then
                lockVictim = getClosest()

                sendNotification("Locked onto: "..tostring(lockVictim.Character.Humanoid.DisplayName))
            else
                if lockVictim ~= nil then
                    lockVictim = nil

                    sendNotification("Unlocked!")
                end
            end
        end
    end
end)

--// Loop update FOV and loop camera lock onto target

local localPlayer = game:GetService("Players").LocalPlayer
local currentCamera = game:GetService("Workspace").CurrentCamera
local guiService = game:GetService("GuiService")
local runService = game:GetService("RunService")

local getGuiInset = guiService.GetGuiInset
local mouse = localPlayer:GetMouse()

local silentAimed = false
local silentVictim
local victimMan

local FOVCircle = Drawing.new("Circle")
FOVCircle.Filled = false
FOVCircle.Transparency = 1
FOVCircle.Thickness = 2
FOVCircle.Color = Color3.fromRGB(200, 255, 128)
function updateFOV()
    if (FOVCircle) then
        if (Settings.SilentAim.FOVEnabled) then
            FOVCircle.Radius = Settings.SilentAim.FOVSize * 2
            FOVCircle.Visible = Settings.SilentAim.FOVShow
            FOVCircle.Position = Vector2.new(mouse.X, mouse.Y + getGuiInset(guiService).Y)

            return FOVCircle
        elseif (not Settings.SilentAim.FOVEnabled) then
            FOVCircle.Visible = false
        end
    end
end

function getClosestPlayerToCursor()
    local closestPlayer
    local shortestDistance = math.huge

    for i, v in pairs(game.Players:GetPlayers()) do
        if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild(Settings.SilentAim.AimAt) then
            local pos = currentCamera:WorldToViewportPoint(v.Character.PrimaryPart.Position)
            local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(mouse.X, mouse.Y)).magnitude
            
            if (Settings.SilentAim.FOVEnabled == true) then
                if (FOVCircle.Radius > magnitude and magnitude < shortestDistance) then
                    closestPlayer = v
                    shortestDistance = magnitude
                end
            else
                if (magnitude < shortestDistance) then
                    closestPlayer = v
                    shortestDistance = magnitude
                end
            end
        end
    end
    return closestPlayer
end

Mouse.KeyDown:Connect(function(k)
    local actualKey = Settings.SilentAim.Key:lower()
    if (k == actualKey) then
        if (Settings.SilentAim.KeyToLockOn == false) then
            return
        end
        if (Settings.SilentAim.Enabled) then
            silentAimed = not silentAimed
                
            if silentAimed then
                silentVictim = getClosestPlayerToCursor()
                sendNotification("Locked onto: " .. tostring(silentVictim.Character.Humanoid.DisplayName))
            elseif not silentAimed and silentVictim ~= nil then
                silentVictim = nil

                sendNotification('Unlocked')
            end
        end
    end
end)

runService.RenderStepped:Connect(function()
    updateFOV()
    updateLock()
    victimMan = getClosestPlayerToCursor()
    if Settings.Aimlock.Enabled == true then
        if lockVictim ~= nil then
            Camera.CFrame = CFrame.new(Camera.CFrame.p, lockVictim.Character[Settings.Aimlock.AimPart].Position + lockVictim.Character[Settings.Aimlock.AimPart].Velocity*Settings.Aimlock.Prediction)
        end
    end
end)

local mt = getrawmetatable(game)
local old = mt.__namecall
setreadonly(mt, false)
mt.__namecall = newcclosure(function(...)
    local args = {...}

    if Settings.SilentAim.Enabled and Settings.SilentAim.KeyToLockOn and silentAimed and getnamecallmethod() == "FireServer" and args[2] == "UpdateMousePos" then
        args[3] = silentVictim.Character[Settings.SilentAim.AimAt].Position+(silentVictim.Character[Settings.SilentAim.AimAt].Velocity*Settings.SilentAim.PredictionAmount)
        return old(unpack(args))
    elseif Settings.SilentAim.Enabled and not Settings.SilentAim.KeyToLockOn and getnamecallmethod() == "FireServer" and args[2] == "UpdateMousePos" then
        args[3] = victimMan.Character[Settings.SilentAim.AimAt].Position+(victimMan.Character[Settings.SilentAim.AimAt].Velocity*Settings.SilentAim.PredictionAmount)
        return old(unpack(args))
    end

    return old(...)
end)

----------------------------------------
local lib = loadstring(game:HttpGet("https://pastebin.com/raw/mSwV3R8V"))()
local main = lib:Init()
----------------------------------------

----------------------------------------
local Home = main:CreateTab("Home")
local Config = main:CreateTab("Config", "rbxassetid://6793572208")
local Misc = main:CreateTab("Misc", "rbxassetid://3192519002")
----------------------------------------

----------------------------------------
Home:CreateLabel("Welcome back!", false)
----------------------------------------

----------------------------------------
Config:CreateLabel("Config - Aimlock", true)
Config:CreateToggle("Enabled", function(state)
    Settings.Aimlock.Enabled = state
end)
Config:CreateBox("Prediction", 0.143, function(arg)
    Settings.Aimlock.Prediction = tonumber(arg)
end)
Config:CreateDropdown("AimPart", {'Head', 'UpperTorso', 'HumanoidRootPart', 'LowerTorso'}, 'LowerTorso', function(arg)
    Settings.Aimlock.AimPart = tostring(arg)
end)
Config:CreateToggle("FOV", function(state)
    Settings.Aimlock.FOVEnabled = state
end)
Config:CreateToggle("Show FOV", function(state)
    Settings.Aimlock.FOVShow = state
end)
Config:CreateSlider("FOV Size", 30, 0, 400, 1, function(arg)
    Settings.Aimlock.FOVSize = tonumber(arg)
end)
Config:CreateBind("Keybind", Enum.KeyCode.Q, function(arg)
    Settings.Aimlock.AimlockKey = arg
end)
----------------------------------------

----------------------------------------
Config:CreateLabel("Config - Silent", false)
Config:CreateToggle("Enabled", function(state)
    Settings.SilentAim.Enabled = state
end)
Config:CreateToggle("Key to lock on", function(state)
    Settings.SilentAim.KeyToLockOn = state
end)
Config:CreateBox("Prediction", 0.143, function(arg)
    Settings.SilentAim.PredictionAmount = tonumber(arg)
end)
Config:CreateDropdown("AimPart", {'Head', 'UpperTorso', 'HumanoidRootPart', 'LowerTorso'}, 'LowerTorso', function(arg)
    Settings.SilentAim.AimAt = tostring(arg)
end)
Config:CreateToggle("FOV", function(state)
    Settings.SilentAim.FOVEnabled = state
end)
Config:CreateToggle("Show FOV", function(state)
    Settings.SilentAim.FOVShow = state
end)
Config:CreateSlider("FOV Size", 30, 0, 400, 1, function(arg)
    Settings.SilentAim.FOVSize = tonumber(arg)
end)
Config:CreateBind("Keybind", Enum.KeyCode.Q, function(arg)
    Settings.SilentAim.Key = arg
end)
----------------------------------------

----------------------------------------
Misc:CreateLabel("Miscellaneous", false)
Misc:CreateToggle("CFS State", function(state)
    Settings.CFSpeed.Toggled = state
end)
Misc:CreateSlider("CFrame Speed", 2, 0, 10, 0.1, function(arg)
    Settings.CFSpeed.Speed = tonumber(arg)
end)
Misc:CreateBind("CFS Key", Enum.KeyCode.Z, function(arg)
    Settings.CFSpeed.Key = arg
end)
----------------------------------------