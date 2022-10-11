


LoadedTime = tick()

local LocalPlayer = game.Players.LocalPlayer

function Alive(Player)
    if Player and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") ~= nil and Player.Character:FindFirstChild("Humanoid") ~= nil and Player.Character:FindFirstChild("Head") ~= nil then
        return true
    end
    return false
end

 settings = {
   enabled = false; -- / true / false
   minCameraDistance = 1; -- / any number
   hatTransparency = .35; -- / 0 - 1 (0 being invisible)
   circleTransparency = 1; -- / 0 - 1 (0 being invisible)
   height = .75; -- / any number
   radius = 1; -- /-- any number
   sides = 25; -- / any number
   rainbow = false; -- / true / false
   color = Color3.fromRGB(128,18,255); -- / 0-255,0-255,0-255
   offset = Vector3.new(0,.75,0); -- / number,number,number (studs offset from head center)
}

local runservice = game:GetService('RunService');
local lplr = game:GetService('Players').LocalPlayer
local camera = workspace.CurrentCamera;
local tau = math.pi*2
local drawings = {};

for i = 1,settings.sides do
   drawings[i] = {Drawing.new('Line'),Drawing.new('Triangle')}
   drawings[i][1].ZIndex = 2;
   drawings[i][1].Thickness = 2;
   drawings[i][2].ZIndex = 1;
   drawings[i][2].Filled = true;
end

runservice.RenderStepped:Connect(function()
   local pass = settings.enabled and lplr.Character and lplr.Character:FindFirstChild('Head') ~= nil and (camera.CFrame.p - camera.Focus.p).magnitude > settings.minCameraDistance and lplr.Character.Humanoid.Health > 0
   for i = 1,#drawings do
       local line,triangle = drawings[i][1], drawings[i][2];
       if pass then
           local color = settings.rainbow and Color3.fromHSV((tick() % 5 / 5 - (i / #drawings)) % 1,.5,1) or settings.color;
           local pos = lplr.Character.Head.Position + settings.offset;
           local topWorld = pos + Vector3.new(0,settings.height,0);

           local last, next = (i/settings.sides)*tau, ((i+1)/settings.sides)*tau;
           local lastWorld = pos + (Vector3.new(math.cos(last),0,math.sin(last))*settings.radius);
           local nextWorld = pos + (Vector3.new(math.cos(next),0,math.sin(next))*settings.radius);
           local lastScreen = camera:WorldToViewportPoint(lastWorld);
           local nextScreen = camera:WorldToViewportPoint(nextWorld);
           local topScreen = camera:WorldToViewportPoint(topWorld);

           line.From = Vector2.new(lastScreen.X,lastScreen.Y);
           line.To = Vector2.new(nextScreen.X,nextScreen.Y);
           line.Color = color;
           line.Transparency = settings.circleTransparency;
           line.Visible = true;

           triangle.PointA = Vector2.new(topScreen.X,topScreen.Y);
           triangle.PointB = line.From;
           triangle.PointC = line.To;
           triangle.Color = color;
           triangle.Transparency = settings.hatTransparency;
           triangle.Visible = true;
       else
           line.Visible = false;
           triangle.Visible = false;
       end
   end
end)


local kbot = { 
    Target = { 
        Enabled = false,
        Toggle = false,
        Prediction = 1.1621,
        Key = "q",
        Part = 'HumanoidRootPart',
        Notifications = false,
        DrawFOV = false,
        Radius = 60
    },
    Misc = { 
        CFrameSpeed = false,
        CFrameValue = 0.50,
        AutoReload = false,
        AntiStomp = false,
        NoJumpCD = false,
        Ambient = false,
        AmbientColor = Color3.fromRGB(255,255,255),
        AutoStomp = false
    },
    HvH = { 
        BlatantAA = false,
        SpinBotAA = false,
        JitterAA = false,
        JitterAngle = 50,
        LegitAA = false,
        LegitAASpeed = 0.10,
        SlingShotAA = false
    },
    Aimbot = { 
        Enabled = false,
        Smoothness = 0.005,
        Smoothing = false,
        AirshotFunc = false,
        AirshotPart = "RightFoot",
        AimPart = "HumanoidRootPart",
        Predicting = 1.2,
        Key = Enum.KeyCode.Q,
        Toggled
    },
    MouseAssist = { 
        Locking = false,
        Key = 'q',
        Prediction = 1.3,
        Part = 'HumanoidRootPart',
        Enabled = false
    }
}



local Settings = { 
    SilentAim = { 
        Key = "C",
        AimAt = "HumanoidRootPart",
        PredictionAmount = 0.140,

        FOVEnabled = false,
        FOVShow = false,
        FOVSize = 0,

        Enabled = false,
        KeyToLockOn = false
    }
}






local localPlayer = game:GetService("Players").LocalPlayer
local currentCamera = game:GetService("Workspace").CurrentCamera
local guiService = game:GetService("GuiService")
local runService = game:GetService("RunService")
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
local GetGuiInset = game:GetService("GuiService"):GetGuiInset().Y


local userInput = game:GetService('UserInputService')
local runService = game:GetService('RunService')


local getGuiInset = guiService.GetGuiInset
local Inset = game:GetService("GuiService"):GetGuiInset().Y
local mouse = localPlayer:GetMouse()
local Mouse = localPlayer:GetMouse()

local silentAimed = false
local silentVictim
local victimMan

local FOVCircle = Drawing.new("Circle")
FOVCircle.Filled = false
FOVCircle.Transparency = 1
FOVCircle.Thickness = 2
FOVCircle.Color = Color3.fromRGB(255, 255, 255)
function updateFOV()
    if (FOVCircle) then
        if (Settings.SilentAim.FOVEnabled) then
            FOVCircle.Radius = Settings.SilentAim.FOVSize * 2
            FOVCircle.Visible = Settings.SilentAim.FOVShow
            FOVCircle.Position = Vector2.new(Mouse.X, Mouse.Y + Inset)

            return FOVCircle
        elseif (not Settings.SilentAim.FOVEnabled) then
            FOVCircle.Visible = false
        end
    end
end



runService.RenderStepped:Connect(function()
    updateFOV()
    victimMan = getClosestPlayerToCursor()
end)

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

function sendNotification(text)
    game.StarterGui:SetCore("SendNotification", {
        Title = "killbot",
        Text = text,
        Duration = 5
    })
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

                sendNotification('Unlocked!')
            end
        end
    end
end)

local mt = getrawmetatable(game)
local old = mt.__namecall
setreadonly(mt, false)
mt.__namecall = newcclosure(function(...)
    local args = {...}

    if Settings.SilentAim.Enabled and Settings.SilentAim.KeyToLockOn and silentAimed and getnamecallmethod() == "FireServer" and args[2] == "UpdateMousePos" then
        args[3] = silentVictim.Character[Settings.SilentAim.AimAt].Position+(silentVictim.Character[Settings.SilentAim.AimAt].Velocity*Settings.SilentAim.PredictionAmount / 10 )
        return old(unpack(args))
    elseif Settings.SilentAim.Enabled and not Settings.SilentAim.KeyToLockOn and getnamecallmethod() == "FireServer" and args[2] == "UpdateMousePos" then
        args[3] = victimMan.Character[Settings.SilentAim.AimAt].Position+(victimMan.Character[Settings.SilentAim.AimAt].Velocity*Settings.SilentAim.PredictionAmount / 10 )
        return old(unpack(args))
    end

    return old(...)
end)




local lplr = game.Players.LocalPlayer
local camera = game:GetService("Workspace").CurrentCamera
local CurrentCamera = workspace.CurrentCamera
local worldToViewportPoint = CurrentCamera.worldToViewportPoint
local mouse = game.Players.LocalPlayer:GetMouse()
local UserInput = game:GetService("UserInputService")

function AttachChams(parent, face)
	local SurfaceGui = Instance.new("SurfaceGui",parent) 
	SurfaceGui.Parent = parent
	SurfaceGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	SurfaceGui.Face = Enum.NormalId[face]
	SurfaceGui.LightInfluence = 0
	SurfaceGui.ResetOnSpawn = false
	SurfaceGui.Name = "Body"
	SurfaceGui.AlwaysOnTop = true
	local Frame = Instance.new("Frame",SurfaceGui)
	Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Frame.Size = UDim2.new(1,0,1,0)
end

getgenv().PikaESPSettings = {
    Box = false,
    Name = false,
    Tracers = false,
    Chams = false,
    Font = 3,
    Teammates = false,
    VisibleOnly = false,
    UnlockTracers = false,
    TextSize = 16
}

local function PikaESP(v)
    local BoxOutline = Drawing.new("Square")
    BoxOutline.Visible = false
    BoxOutline.Color = Color3.new(0,0,0)
    BoxOutline.Thickness = 3
    BoxOutline.Transparency = 1
    BoxOutline.Filled = false

    local Box = Drawing.new("Square")
    Box.Visible = false
    Box.Color = Color3.new(1,1,1)
    Box.Thickness = 1
    Box.Transparency = 1
    Box.Filled = false

    local HealthBarOutline = Drawing.new("Square")
    HealthBarOutline.Thickness = 3
    HealthBarOutline.Filled = false
    HealthBarOutline.Color = Color3.new(0,0,0)
    HealthBarOutline.Transparency = 1
    HealthBarOutline.Visible = false

    local HealthBar = Drawing.new("Square")
    HealthBar.Thickness = 1
    HealthBar.Filled = false
    HealthBar.Transparency = 1
    HealthBar.Visible = false
    
    local Tracer = Drawing.new("Line")
    Tracer.Visible = false
    Tracer.Color = Color3.new(1,1,1)
    Tracer.Thickness = 1
    Tracer.Transparency = 1
    
    local Name = Drawing.new("Text")
    Name.Transparency = 1
    Name.Visible = false
    Name.Color = Color3.new(1,1,1)
    Name.Size = 12
    Name.Center = true
    Name.Outline = true
    

    local Gun = Drawing.new("Text")
    Gun.Transparency = 1
    Gun.Visible = false
    Gun.Color = Color3.new(1,1,1)
    Gun.Size = 12
    Gun.Center = true
    Gun.Outline = true

    game:GetService("RunService").RenderStepped:Connect(function()
        if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= lplr and v.Character.Humanoid.Health > 0 then
            local Vector, onScreen = camera:worldToViewportPoint(v.Character.HumanoidRootPart.Position)
            local Distance = (CurrentCamera.CFrame.p - v.Character.HumanoidRootPart.Position).Magnitude
            local RootPart = v.Character.HumanoidRootPart
            local Head = v.Character.Head
            local RootPosition, RootVis = worldToViewportPoint(CurrentCamera, RootPart.Position)
            local HeadPosition = worldToViewportPoint(CurrentCamera, Head.Position + Vector3.new(0,0.5,0))
            local LegPosition = worldToViewportPoint(CurrentCamera, RootPart.Position - Vector3.new(0,3,0))
                
            if PikaESPSettings.Chams and v.Character.Head:FindFirstChild("Body") == nil then
                for i,v in pairs(v.Character:GetChildren()) do
                    if v:IsA("MeshPart") or v.Name == "Head" then
                        AttachChams(v, "Back")
                        AttachChams(v, "Front")
                        AttachChams(v, "Top")
                        AttachChams(v, "Bottom")
                        AttachChams(v, "Right")
                        AttachChams(v, "Left")
                    end
                end
            end

            if onScreen then
                if PikaESPSettings.Box then
                    BoxOutline.Size = Vector2.new(2500 / RootPosition.Z, HeadPosition.Y - LegPosition.Y)
                    BoxOutline.Position = Vector2.new(RootPosition.X - BoxOutline.Size.X / 2, RootPosition.Y - BoxOutline.Size.Y / 2)
                    BoxOutline.Visible = true
    
                    Box.Size = Vector2.new(2500 / RootPosition.Z, HeadPosition.Y - LegPosition.Y)
                    Box.Position = Vector2.new(RootPosition.X - Box.Size.X / 2, RootPosition.Y - Box.Size.Y / 2)
                    Box.Visible = true
                        
                    HealthBarOutline.Size = Vector2.new(2, HeadPosition.Y - LegPosition.Y)
                    HealthBarOutline.Position = BoxOutline.Position - Vector2.new(6,0)
                    HealthBarOutline.Visible = true
    
                    HealthBar.Size = Vector2.new(2, (HeadPosition.Y - LegPosition.Y) / (v.Character.Humanoid.MaxHealth / math.clamp(v.Character.Humanoid.Health, 0,v.Character.Humanoid.MaxHealth)))
                    HealthBar.Position = Vector2.new(Box.Position.X - 6, Box.Position.Y + (1 / HealthBar.Size.Y))
                    HealthBar.Color = Color3.fromRGB(255 - 255 / (v.Character.Humanoid.MaxHealth / v.Character.Humanoid.Health), 255 / (v.Character.Humanoid.MaxHealth / v.Character.Humanoid.Health), 0)
                    HealthBar.Visible = true
                else
                    BoxOutline.Visible = false
                    Box.Visible = false
                    HealthBarOutline.Visible = false
                    HealthBar.Visible = false
                end
                if PikaESPSettings.Tracers then
                    if PikaESPSettings.UnlockTracers then
                        Tracer.From = Vector2.new(mouse.X, mouse.Y + 36)
                    else
                        Tracer.From = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 1)
                    end
                    Tracer.To = Vector2.new(Vector.X, Vector.Y)
                    Tracer.Visible = true
                else
                    Tracer.Visible = false
                end
                if PikaESPSettings.Name then
                    Name.Text = tostring(v.Name)
                    Name.Position = Vector2.new(workspace.Camera:WorldToViewportPoint(v.Character.Head.Position).X, workspace.Camera:WorldToViewportPoint(v.Character.Head.Position).Y - 30)
                    Name.Visible = true
                    Name.Size = PikaESPSettings.TextSize
                    if PikaESPSettings.Font == "UI" then
                        Name.Font = 0
                        Gun.Font = 0
                    elseif PikaESPSettings.Font == "System" then
                        Name.Font = 1
                        Gun.Font = 1
                    elseif PikaESPSettings.Font == "Plex" then
                        Name.Font = 2
                        Gun.Font = 2
                    elseif PikaESPSettings.Font == "Monospace" then
                        Name.Font = 3
                        Gun.Font = 3
                    end
                    Gun.Size = PikaESPSettings.TextSize
                    Gun.Text = tostring("killbot")
                    Gun.Position = Vector2.new(LegPosition.X, LegPosition.Y + 10)
                    Gun.Visible = true
                else
                    Name.Visible = false
                    Gun.Visible = false
                end
            else
                BoxOutline.Visible = false
                Box.Visible = false
                HealthBarOutline.Visible = false
                HealthBar.Visible = false
                Tracer.Visible = false
                Name.Visible = false
                Gun.Visible = false
            end
        else
            BoxOutline.Visible = false
            Box.Visible = false
            HealthBarOutline.Visible = false
            HealthBar.Visible = false
            Tracer.Visible = false
            Name.Visible = false
            Gun.Visible = false
        end
    end)
end



for i,v in pairs(game.Players:GetChildren()) do
    PikaESP(v)
end

game.Players.PlayerAdded:Connect(function(v)
    PikaESP(v)
end)



-->> anticheat bypass -->>
local old = nil
old = hookmetamethod(game, "__namecall", function(Self,...)
    local args = {...}
    if not checkcaller() and Self == 'Kick' then
        return
    end
    return old(Self,...)
end)


local RunService = game:GetService("RunService")
local Mouse = game.Players.LocalPlayer:GetMouse()
local Inset = game:GetService("GuiService"):GetGuiInset().Y
local Circle = Drawing.new("Circle")




-->> Variables -->>
local CurrentCamera = game:GetService("Workspace").CurrentCamera
local Mouse = game.Players.LocalPlayer:GetMouse()
local RunService = game:GetService("RunService")
local Plr = game.Players.LocalPlayer
local lp = game.Players.LocalPlayer
local CurrentCamera = game:GetService("Workspace").CurrentCamera
local Inset = game:GetService("GuiService"):GetGuiInset().Y
local RunService = game:GetService("RunService")

local Mouse = game.Players.LocalPlayer:GetMouse()
local LocalPlayer = game.Players.LocalPlayer

-->> Checks if key is down -->>
Mouse.KeyDown:Connect(function(KeyPressed)
    if KeyPressed == (kbot.Target.Key) then
        if kbot.Target.Toggle then 
        if kbot.Target.Enabled == true then
            kbot.Target.Enabled = false
            if kbot.Target.Notifications == true then
                Plr = FindClosestUser()
                game.StarterGui:SetCore("SendNotification", {
                    Title = "killbot private",
                    Text = "Target Unadded"
                })
            end
        else
            Plr = FindClosestUser()
            kbot.Target.Enabled = true
            if kbot.Target.Notifications == true then
                game.StarterGui:SetCore("SendNotification", {
                    Title = "killbot private",
                    Text = "Target Added :" .. tostring(Plr.Character.Humanoid.DisplayName)
                })
            end
        end
        end
end
end)


-->> Get Closest Player -->>
function FindClosestUser()
    local ClosestDistance, ClosestPlayer = math.huge, nil;
    for _, Player in next, game:GetService("Players"):GetPlayers() do
        local ISNTKNOCKED = Player.Character:WaitForChild("BodyEffects")["K.O"].Value ~= true
        local ISNTGRABBED = Player.Character:FindFirstChild("GRABBING_COINSTRAINT") == nil

        if Player ~= LocalPlayer then
            local Character = Player.Character
            if Character and Character.Humanoid.Health > 1 and ISNTKNOCKED and ISNTGRABBED then
                local Position, IsVisibleOnViewPort = CurrentCamera:WorldToViewportPoint(Character.HumanoidRootPart
                                                                                             .Position)
                if IsVisibleOnViewPort then
                    local Distance = (Vector2.new(Mouse.X, Mouse.Y) - Vector2.new(Position.X, Position.Y)).Magnitude
                    if Distance < ClosestDistance then
                        ClosestPlayer = Player
                        ClosestDistance = Distance
                    end
                end
            end
        end
    end
    return ClosestPlayer, ClosestDistance
end


RunService.Heartbeat:Connect(function()
    if kbot.Target.Enabled then
    local Vector = CurrentCamera:WorldToViewportPoint(Plr.Character[kbot.Target.Part].Position +
    (Plr.Character[kbot.Target.Part].Velocity *
    kbot.Target.Prediction))

    Circle.Position = Vector2.new(Mouse.X, Mouse.Y + Inset)
    Circle.Visible = kbot.Target.DrawFOV
    Circle.Thickness = 1.5
    Circle.Thickness = 2
    Circle.Radius = kbot.Target.Radius
    Circle.Color = Color3.fromRGB(255,255,255)
    
elseif kbot.Target.DrawFOV and kbot.Target.Enabled == true then
    Circle.Visible = true
else
    Circle.Visible = false
    end
end)







-->> Main Target -->>
local gmt = getrawmetatable(game)
setreadonly(gmt, false)
local oldnamecall = gmt.__namecall

gmt.__namecall = newcclosure(function(...)
    local args = {...} 
    local method = getnamecallmethod() 
    if kbot.Target.Enabled and method == 'FireServer' and args[2] == 'UpdateMousePos' then
        args[3] = Plr.Character[kbot.Target.Part].Position + Plr.Character[kbot.Target.Part].Velocity * kbot.Target.Prediction / 10 
        return oldnamecall(unpack(args))
    end
    return oldnamecall(...)
end)











local CurrentCamera = game:GetService("Workspace").CurrentCamera
local RunService = game:GetService("RunService")
local Mouse = game.Players.LocalPlayer:GetMouse()
local LocalPlayer = game.Players.LocalPlayer
local Plr

function FindClosestPlayer()
    local ClosestDistance, ClosestPlayer = math.huge, nil;
    for _, Player in next, game:GetService("Players"):GetPlayers() do
        local ISNTKNOCKED = Player.Character:WaitForChild("BodyEffects")["K.O"].Value ~= true
        local ISNTGRABBED = Player.Character:FindFirstChild("GRABBING_COINSTRAINT") == nil

        if Player ~= LocalPlayer then
            local Character = Player.Character
            if Character and Character.Humanoid.Health > 1 and ISNTKNOCKED and ISNTGRABBED then
                local Position, IsVisibleOnViewPort = CurrentCamera:WorldToViewportPoint(Character.HumanoidRootPart
                                                                                             .Position)
                if IsVisibleOnViewPort then
                    local Distance = (Vector2.new(Mouse.X, Mouse.Y) - Vector2.new(Position.X, Position.Y)).Magnitude
                    if Distance < ClosestDistance then
                        ClosestPlayer = Player
                        ClosestDistance = Distance
                    end
                end
            end
        end
    end
    return ClosestPlayer, ClosestDistance
end



    game:GetService("UserInputService").InputBegan:Connect(function(keygo)
           if (keygo.KeyCode == kbot.Aimbot.Key) then
               Toggled = not Toggled
               if Toggled then
               Plr =  FindClosestPlayer()
end
         end
           
end)
game:GetService("RunService").RenderStepped:Connect(function()
if kbot.Aimbot.Smoothing and kbot.Aimbot.Enabled and Toggled == true then
    local Main = CFrame.new(workspace.CurrentCamera.CFrame.p, Plr.Character[kbot.Aimbot.AimPart].Position + Plr.Character[kbot.Aimbot.AimPart].Velocity*kbot.Aimbot.Predicting/10)
                                 workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame:Lerp(Main, kbot.Aimbot.Smoothness, Enum.EasingStyle.Elastic, Enum.EasingDirection.InOut)
                            elseif kbot.Aimbot.Smoothing == false and kbot.Aimbot.Enabled and Toggled == true then
    workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, Plr.Character[kbot.Aimbot.AimPart].Position + Plr.Character[kbot.Aimbot.AimPart].Velocity*kbot.Aimbot.Predicting/10)
                            end

end)

if kbot.Aimbot.AirshotFunc == true then
    
                if Plr.Character.Humanoid.Jump == true and Plr.Character.Humanoid.FloorMaterial == Enum.Material.Air then
                    kbot.Aimbot.AimPart = kbot.Aimbot.AirshotPart
                else
                    Plr.Character:WaitForChild("Humanoid").StateChanged:Connect(function(old,new)
                        if new == Enum.HumanoidStateType.Freefall then
                        kbot.Aimbot.AimPart = kbot.Aimbot.AirshotPart
                        else
                            kbot.Aimbot.AimPart = kbot.Aimbot.AimPart
                        end
                    end)
                end
            end







            local CurrentCamera = game:GetService("Workspace").CurrentCamera
            local RunService = game:GetService("RunService")
            local Mouse = game.Players.LocalPlayer:GetMouse()
            local Plr
            
            function FindClosestPlayer()
                local closestPlayer
                local shortestDistance = math.huge
            
                for i, v in pairs(game.Players:GetPlayers()) do
                    if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") and
                        v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild("HumanoidRootPart") then
                        local pos = CurrentCamera:WorldToViewportPoint(v.Character.PrimaryPart.Position)
                        local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(Mouse.X, Mouse.Y)).magnitude
                        if magnitude < shortestDistance then
                            closestPlayer = v
                            shortestDistance = magnitude
                        end
                    end
                end
                return closestPlayer
            end
            
            Mouse.KeyDown:Connect(function(KeyPressed)
                if KeyPressed == (kbot.MouseAssist.Key) then
                    if kbot.MouseAssist.Enabled then
                    if kbot.MouseAssist.Locking == true then
                        kbot.MouseAssist.Locking = false
                        Plr = FindClosestPlayer()
                    else
                        Plr = FindClosestPlayer()
                        kbot.MouseAssist.Locking = true
            
                    end
                end
            end
            end)
            
            RunService.Stepped:connect(function()
                if kbot.MouseAssist.Locking == true then
                    local Vector = CurrentCamera:WorldToScreenPoint(Plr.Character[kbot.MouseAssist.Part].Position +
                                                                        (Plr.Character[kbot.MouseAssist.Part].Velocity *
                                                                        kbot.MouseAssist.Prediction / 10))
                    mousemoverel(Vector.X - Mouse.X, Vector.Y - Mouse.Y)
                end
            
            end)











local Jit = math.random(30, 90)


-->> non loop toggles -->>

local a;
a = hookfunction(wait, function(b) if b == 1.5 and kbot.Misc.NoJumpCD then return a() end return a(b) end)

RunService.Heartbeat:Connect(function()
    if kbot.Misc.CFrameSpeed then
        for _, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if v:IsA("Script") and v.Name ~= "Health" and v.Name ~= "Sound" and v:FindFirstChild("LocalScript") then
                v:Destroy()
            end
        end
        game.Players.LocalPlayer.CharacterAdded:Connect(function(char)
            repeat
                wait()
            until game.Players.LocalPlayer.Character
            char.ChildAdded:Connect(function(child)
                if child:IsA("Script") then 
                    wait(0.1)
                    if child:FindFirstChild("LocalScript") then
                        child.LocalScript:FireServer()
                    end
                end
            end)
        end)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame +
        game.Players.LocalPlayer.Character.Humanoid.MoveDirection * kbot.Misc.CFrameValue
    end


    if kbot.HvH.BlatantAA then
        game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity =
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * -250
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(555), 0)
    end

    if kbot.HvH.SpinBotAA then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(555), 0)
    end

    if kbot.HvH.JitterAA then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
        CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position) *
        CFrame.Angles(0, math.rad(kbot.HvH.JitterAngle) + math.rad((math.random(1, 2) == 1 and Jit or -Jit)), 0)
    end

    if kbot.HvH.LegitAA then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = 
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + 
        -game.Players.LocalPlayer.Character.Humanoid.MoveDirection * kbot.HvH.LegitAASpeed
    end

    if kbot.HvH.SlingShotAA then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,getgenv().slingshotcframe, 0)
        wait(0.2)
    end

    if kbot.Misc.AutoReload then
        if game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool") then
            if game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool"):FindFirstChild("Ammo") then
                if game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool"):FindFirstChild("Ammo").Value <= 0 then
                    game:GetService("ReplicatedStorage").MainEvent:FireServer("Reload", game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool")) 
                    wait(1)
                end
            end
        end
    end


    if kbot.Misc.AntiStomp then 
        if game.Players.LocalPlayer.Character.Humanoid.Health <= 5 then
            for i, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                if v:IsA("BasePart") then
                    v:Destroy()
                end
            end
        end
    end

    if kbot.Misc.Ambient then
        game.Lighting.ColorCorrection.TintColor = kbot.Misc.AmbientColor
    else
        game.Lighting.ColorCorrection.TintColor = Color3.fromRGB(255,255,255)
    end

    if kbot.Misc.AutoStomp then
        game:GetService('ReplicatedStorage').MainEvent:FireServer('Stomp')
    end
end)


--URLS
local library =
    loadstring(game:HttpGet("https://raw.githubusercontent.com/vozoid/ui-libraries/main/drawing/void/source.lua"))()
local AkaliNotif = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/Dynissimo/main/Scripts/AkaliNotif.lua"))();
--URLS--


--tick load--
game.StarterGui:SetCore("SendNotification", {
    Title = "killbot private";
    Text = "Loaded in "..tostring(LoadedTime);
    Duration = 5;
    Callback = NotificationBindable;
})
--hi :3--

local watermark = library:Watermark("killbot | private build")
-- watermark:Set("Watermark Set")
-- watermark:Hide() -- toggles watermark

local main =
    library:Load {
    Name = "kill-bot",
    SizeX = 753,
    SizeY = 456,
    Theme = "Default",
    Extension = "json", -- config file extension
    Folder = "killbot configurations" -- config folder name
}

-- library.Extension = "txt" (config file extension)
-- library.Folder = "config folder name"

local tab2 = main:Tab("Legit")
local tab3 = main:Tab("Rage")
local tab5 = main:Tab("Misc")
local tab4 = main:Tab("Visuals")



local section =
    tab2:Section {
    Name = "Bullet Redirection",
    Side = "Left"
}
local section1 =
    tab2:Section {
    Name = "Camera Assist",
    Side = "Right"
}
local section2 =
    tab2:Section {
    Name = "Mouse Assist",
    Side = "Right"
}
local section12 =
    tab2:Section {
    Name = "Field Of View",
    Side = "Left"
}
local section3 =
    tab3:Section {
    Name = "Target Prioritys",
    Side = "Left"
}

local section5 =
    tab3:Section {
    Name = "Configurations",
    Side = "Right"
}


local section10 =
    tab3:Section {
    Name = "Field Of View",
    Side = "Right"
}

local section6 =
    tab5:Section {
    Name = "Anti Aim",
    Side = "Left"
}

local section7 =
    tab5:Section {
    Name = "Anti Aim Configuration",
    Side = "Right"
}

local section8 =
    tab5:Section {
    Name = "Cheats",
    Side = "Left"
}

local section9 =
    tab5:Section {
    Name = "Configuration",
    Side = "Right"
}

local section11 =
    tab5:Section {
    Name = "Recoil Control",
    Side = "Left"
}


local section69 =
    tab4:Section {
    Name = "EyeSight",
    Side = "Left"
}



local section71 =
    tab4:Section {
    Name = "Map Visuals",
    Side = "Right"
}


local section72 =
    tab4:Section {
    Name = "China",
    Side = "Left"
}


local section73 =
    tab4:Section {
    Name = "Damage Indicator",
    Side = "Right"
}





section:Toggle{
    Name = "Enabled", --stg if u touch this IMA DO IT RETARD
    Flag = "Toggle 2",
    --Default = true,
    Callback  = function(bool)
        Settings.SilentAim.Enabled = bool
    end
}


local dropdown = section:Dropdown{
    Name = "Part",
    --Default = "Option 1",
    Scrollable = true,
    ScrollingMax = 5,
    Content = {
        "Head",
        "HumanoidRootPart",
        "UpperTorso",
        "LowerTorso"
        
    },
    Flag = "Scrolling Dropdown 1",
    Callback = function(option)
        Settings.SilentAim.AimAt = option
    end
}

section:Toggle{
    Name = "Redirection Control",
    Flag = "Toggle 2",
    --Default = true,
    Callback  = function(bool)

    end
}

section:Toggle{
    Name = "Auto Setup",
    Flag = "Toggle 2",
    --Default = true,
    Callback  = function(bool)

    end
}

section:Toggle{
    Name = "Use Hitchance",
    Flag = "Toggle 2",
    --Default = true,
    Callback  = function(bool)

    end
}


section:Slider{
    Text = "Hitchance",
    --Default = 5,
    Min = 0,
    Max = 1,
    Float = 0.01,
    Flag = "beg1",
    Callback = function(value)

    end
}



section1:Toggle{
    Name = "Enabled", --stg if u touch this IMA DO IT RETARD
    Flag = "Toggle 2",
    --Default = true,
    Callback  = function(bool)
        kbot.Aimbot.Enabled = bool
    end
}
section1:Toggle{
    Name = "Smoothing", --stg if u touch this IMA DO IT RETARD
    Flag = "Toggle 2",
    --Default = true,
    Callback  = function(bool)
        kbot.Aimbot.Smoothing = bool
    end
}



local dropdown = section1:Dropdown{
    Name = "Part",
    --Default = "Option 1",
    Scrollable = true,
    ScrollingMax = 5,
    Content = {
        "Head",
        "HumanoidRootPart",
        "UpperTorso",
        "LowerTorso"
        
    },
    Flag = "Scrolling Dropdown 1",
    Callback = function(option)
        kbot.Aimbot.AimPart = option
    end
}


section1:Keybind{
    Default = Enum.KeyCode.Q,
    Blacklist = {Enum.UserInputType.MouseButton1},
    Name = "Aimbot Keybind",
    Flag = "Toggle 2 Keybind 1",
    Mode = "Toggle", -- mode to nil if u dont want it to toggle the toggle
    Callback = function(key)
        kbot.Aimbot.Key = key
    end
}

section1:Slider{
    Text = "Smoothness [value]",
    --Default = 5,
    Min = 0,
    Max = 1,
    Float = 0.0001,
    Flag = "beg1",
    Callback = function(value)
        kbot.Aimbot.Smoothness = value
    end
}

section1:Slider{
    Text = "Prediction [value]",
    --Default = 5,
    Min = 1,
    Max = 3,
    Float = 0.0001,
    Flag = "beg1",
    Callback = function(value)
        kbot.Aimbot.Prediction = value
    end
}

section2:Toggle{
    Name = "Enabled", --stg if u touch this IMA DO IT RETARD
    Flag = "Toggle 2",
    --Default = true,
    Callback  = function(bool)
        kbot.MouseAssist.Enabled = bool
    end
}


local dropdown = section2:Dropdown{
    Name = "Part",
    --Default = "Option 1",
    Scrollable = true,
    ScrollingMax = 5,
    Content = {
        "Head",
        "HumanoidRootPart",
        "UpperTorso",
        "LowerTorso"
        
    },
    Flag = "Scrolling Dropdown 1",
    Callback = function(option)
        kbot.MouseAssist.Part = option
    end
}
section2:Slider{
    Text = "Prediction [value]",
    --Default = 5,
    Min = 1,
    Max = 4,
    Float = 0.001,
    Flag = "beg1",
    Callback = function(value)
        kbot.MouseAssist.Prediction = value
    end
}

local box = section2:Box{
    Name = "Key",
    Default = "q",
    Placeholder = "q",
    Flag = "Box 1",
    Callback = function(text)
        kbot.MouseAssist.Key = text 
    end
}

local script1 = section8:Toggle{
    Name = "CFrame Speed",
    Flag = "script1",
    --Default = true,
    Callback  = function(bool)
        kbot.Misc.CFrameSpeed = bool
    end


}

local script2 = section8:Toggle{
    Name = "Auto Reload",
    Flag = "script2",
    --Default = true,
    Callback  = function(bool)
        kbot.Misc.AutoReload = bool
    end


}


local script3 = section8:Toggle{
    Name = "Anti Stomp",
    Flag = "script3",
    --Default = true,
    Callback  = function(bool)
        kbot.Misc.AntiStomp = bool
    end


}




local script4 = section8:Toggle{
    Name = "No Jump Cooldown",
    Flag = "script4",
    --Default = true,
    Callback  = function(bool)
        kbot.Misc.NoJumpCD = bool
    end


}











local Ambient = section8:Toggle{
    Name = "Ambient",
    Flag = "script5",
    --Default = true,
    Callback  = function(bool)
        kbot.Misc.Ambient = bool
    end


}






local script6 = section8:Toggle{
    Name = "Auto Stomp",
    Flag = "script6",
    --Default = true,
    Callback  = function(bool)
        kbot.Misc.AutoStomp = bool
    end


}



section9:Slider{
    Text = "[value] | CFrame Speed",
    --Default = 5,
    Min = 0,
    Max = 1,
    Float = 0.01,
    Flag = "beg1",
    Callback = function(value)
        kbot.Misc.CFrameValue = value
    end
}

section9:Slider{
    Text = "Auto Stomp Delay",
    --Default = 5,
    Min = 0,
    Max = 1,
    Float = 0.01,
    Flag = "beg1",
    Callback = function(value)
        kbot.Misc.CFrameValue = value
    end
}
section9:Slider{
    Text = "Anti Stomp Delay",
    --Default = 5,
    Min = 0,
    Max = 1,
    Float = 0.01,
    Flag = "beg1",
    Callback = function(value)
        kbot.Misc.CFrameValue = value
    end
}


Ambient:ColorPicker{
    Name = "Ambient Color",
    Default = Color3.fromRGB(255, 255, 255),
    Flag = "Color picker 1",
    Callback = function(color)
        if kbot.Misc.Ambient then
            kbot.Misc.AmbientColor = color
        end
        
    end
}
























local togglee = section3:Toggle{
    Name = "Enabled",
    Flag = "Toggle 1",
    --Default = true,
    Callback  = function(bool)
        kbot.Target.Toggle = bool 
    end
}


section7:Slider{
    Text = "[value] | Reverse AA Speed",
    --Default = 5,
    Min = 1,
    Max = 3,
    Float = 0.0001,
    Flag = "Slider 2",
    Callback = function(value)
        kbot.HvH.LegitAASpeed = value
    end
}



section7:Slider{
    Text = "[value] | Jitter Angle",
    --Default = 5,
    Min = 1,
    Max = 3,
    Float = 0.0001,
    Flag = "Slider 1",
    Callback = function(value)
        kbot.HvH.JitterAngle = value
    end
}

section7:Slider{
    Text = "SlingShot Cframe",
    --Default = 5,
    Min = 2,
    Max = 10,
    Float = 0.0001,
    Flag = "Slider 1",
    Callback = function(value)
getgenv().slingshotcframe = value
    end
}

local toggleeeee = section6:Toggle{
    Name = "Blatant AA",
    Flag = "Toggle 53",
    --Default = true,
    Callback  = function(bool)
        kbot.HvH.BlatantAA = bool 
    end
}

local toggleeeee1 = section6:Toggle{
    Name = "Spinbot AA",
    Flag = "Toggle 54",
    --Default = true,
    Callback  = function(bool)
        kbot.HvH.SpinBotAA = bool 
    end
}

local toggleeeee2 = section6:Toggle{
    Name = "Jitter AA",
    Flag = "Toggle 55",
    --Default = true,
    Callback  = function(bool)
        kbot.HvH.JitterAA = bool 
    end
}

local toggleeeee3 = section6:Toggle{
    Name = "Reverse AA",
    Flag = "Toggle 56",
    --Default = true,
    Callback  = function(bool)
        kbot.HvH.LegitAA = bool 
    end
}

local toggleeeee4 = section6:Toggle{
    Name = "SlingShot AA",
    Flag = "Toggle 57",
    --Default = true,
    Callback  = function(bool)
        kbot.HvH.SlingShotAA = bool 
    end
}

local toggleee = section3:Toggle{
    Name = "Notifications",
    Flag = "Toggle 2",
    --Default = true,
    Callback  = function(bool)
        kbot.Target.Notifications = bool 
    end
}


local box = section3:Box{
    Name = "Key",
    Default = "q",
    Placeholder = "q",
    Flag = "Box 1",
    Callback = function(text)
        kbot.Target.Key = text
    end
}

local dropdown = section3:Dropdown{
    Name = "Bone Priority",
    --Default = "Option 1",
    Scrollable = true,
    ScrollingMax = 5,
    Content = {
        "Head",
        "HumanoidRootPart",
        "UpperTorso",
        "LowerTorso"
     
    },
    Flag = "Scrolling Dropdown 1",
    Callback = function(option)
        kbot.Target.Part = option
    end
}

local toggleee = section3:Toggle{
    Name = "Blacklisted Part",
    Flag = "Toggle 2",
    --Default = true,
    Callback  = function(bool)

    end
}


local hi1 = section69:Toggle{
    Name = "Enable Boxes",
    Flag = "hi1",
    --Default = true,
    Callback  = function(bool)
        PikaESPSettings.Box = bool
    end


}

local hi2 = section69:Toggle{
    Name = "Enable Names",
    Flag = "hi2",
    --Default = true,
    Callback  = function(bool)
        PikaESPSettings.Name = bool
    end


}


local hi3 = section69:Toggle{
    Name = "Enable Tracers",
    Flag = "hi3",
    --Default = true,
    Callback  = function(bool)
        PikaESPSettings.Tracers = bool
    end


}


local dropdown = section3:Dropdown{
    Name = "Blacklisted Priority",
    --Default = "Option 1",
    Scrollable = true,
    ScrollingMax = 5,
    Content = {
        "Head",
        "HumanoidRootPart",
        "UpperTorso",
        "LowerTorso"
     
    },
    Flag = "Scrolling Dropdown 1",
    Callback = function(option)
        kbot.Target.Part = option
    end
}

local toggleee = section3:Toggle{
    Name = "Disable Prediction",
    Flag = "Toggle 2",
    --Default = true,
    Callback  = function(bool)

    end
}
local toggleee = section5:Toggle{
    Name = "Use Prediction",
    Flag = "Toggle 2",
    --Default = true,
    Callback  = function(bool)

    end
}
local toggleee = section5:Toggle{
    Name = "Auto Setup",
    Flag = "Toggle 2",
    --Default = true,
    Callback  = function(bool)

    end
}

section5:Slider{
    Text = "[value]",
    --Default = 5,
    Min = 1,
    Max = 3,
    Float = 0.0001,
    Flag = "Slider 1",
    Callback = function(value)
        kbot.Target.Prediction = value
    end
}

local toggleeee = section10:Toggle{
    Name = "Draw FOV On Locked",
    Flag = "Toggle 2",
    --Default = true,
    Callback  = function(bool)
        kbot.Target.DrawFOV = bool
    end
}

section10:Slider{
    Text = "Amount [value]",
    --Default = 5,
    Min = 50,
    Max = 100,
    Float = 0.0001,
    Flag = "Slider 1",
    Callback = function(value)
        kbot.Target.Radius = value
    end
}



local toggleeee = section12:Toggle{
    Name = "Draw",
    Flag = "Toggle 2",
    --Default = true,
    Callback  = function(bool)
        Settings.SilentAim.FOVEnabled = bool
        Settings.SilentAim.FOVShow = bool
    end
}

section:Slider{
    Text = "Prediction Amount | [value]",
    --Default = 5,
    Min = 1,
    Max = 3,
    Float = 0.0001,
    Flag = "Slider 1",
    Callback = function(value)
        Settings.SilentAim.PredictionAmount = value 
    end
}


toggleeee:ColorPicker{
    Name = "Color",
    Default = Color3.fromRGB(128, 18, 255),
    Flag = "Color picker 1",
    Callback = function(color)
       FOVCircle.Color = color
        
    end
}

local dropdown = section12:Dropdown{
    Name = "Function Type",
    --Default = "Option 1",
    Scrollable = true,
    ScrollingMax = 5,
    Content = {
        "Closest to player",
        "Distance Based"
        
    },
    Flag = "Scrolling Dropdown 1",
    Callback = function(option)

    end
}
local dropdown = section12:Dropdown{
    Name = "Circle Type",
    --Default = "Option 1",
    Scrollable = true,
    ScrollingMax = 5,
    Content = {
        "Regular",
        "Outline"
        
    },
    Flag = "Scrolling Dropdown 1",
    Callback = function(option)

    end
}



section12:Slider{
    Text = "FOV Size | [value]",
    --Default = 5,
    Min = 50,
    Max = 100,
    Float = 0.0001,
    Flag = "Slider 1",
    Callback = function(value)
        Settings.SilentAim.FOVSize = value 
    end
}

section11:Toggle{
    Name = "Enabled",
    Flag = "Toggle 2",
    --Default = true,
    Callback  = function(bool)

    end
}


section11:Slider{
    Text = "Kick Amount",
    --Default = 5,
    Min = 50,
    Max = 100,
    Float = 0.0001,
    Flag = "Slider 1",
    Callback = function(value)

    end
}



local MapLightingJmp = Instance.new("ColorCorrectionEffect")
MapLightingJmp.Parent = game:GetService("Lighting")
MapLightingJmp.Enabled = false
MapLightingJmp.Brightness = 0
MapLightingJmp.Contrast = 0
MapLightingJmp.Saturation = 0
MapLightingJmp.TintColor = Color3.fromRGB(255, 255, 255)



section71:Toggle{
    Name = "Color Correction",
    Flag = "Toggle 2",
    --Default = true,
    Callback  = function(val)
   MapLightingJmp.Enabled = val
    end
}

section71:ColorPicker{
    Name = "World Accent",
    Default = Color3.fromRGB(128, 18, 255),
    Flag = "Color picker 1",
    Callback = function(color)
        MapLightingJmp.TintColor = color
    end
}







section71:Slider{
    Text = "Saturation | [value]",
    --Default = 5,
    Min = 0,
    Max = 10,
    Float = 0.0001,
    Flag = "Slider 1",
    Callback = function(vacK)
      MapLightingJmp.Saturation = vacK
    end
}


section71:Slider{
    Text = "Contrast | [value]",
    --Default = 5,
    Min = 0,
    Max = 500,
    Float = 0.0001,
    Flag = "Slider 1",
    Callback = function(vacK)
       MapLightingJmp.Contrast = vacK
  
    end
}



local vachotngl =
section72:Toggle{
    Name = "Enabled",
    Flag = "Toggle 2",
    --Default = true,
    Callback  = function(val)
   settings.enabled = val
    end
}


vachotngl:ColorPicker{
    Name = "Color",
    Default = Color3.fromRGB(128, 18, 255),
    Flag = "Color picker 1",
    Callback = function(color)
   settings.color = color
    end
}


section72:Toggle{
    Name = "Rainbow",
    Flag = "Toggle 2",
    --Default = true,
    Callback  = function(val)
   settings.enabled = val
    end
}

section72:Slider{
    Text = "Radius | [value]",
    --Default = 5,
    Min = 0,
    Max = 50,
    Float = 0.0001,
    Flag = "Slider 1",
    Callback = function(vacK)
  settings.radius = vacK
  
    end
}

section72:Slider{
    Text = "Sides | [value]",
    --Default = 5,
    Min = 0,
    Max = 50,
    Float = 0.0001,
    Flag = "Slider 1",
    Callback = function(vacK)
settings.sides = vacK
  
    end
}

section73:Toggle{
    Name = "Enabled",
    Flag = "Toggle 2",
    --Default = true,
    Callback  = function(val)
getgenv().vacimsorryforusinggetgenv = val
    end
}

local dropdown = section73:Dropdown{
    Name = "Blood Image",
    --Default = "Option 1",
    Scrollable = true,
    ScrollingMax = 5,
    Content = {
        "illuminati",
        "Violet",
        "Asuka",
        "Rem",
        "Astolfo",
          "Blank"
     
    },

   Flag = "Scrolling Dropdown 1",
    Callback = function(Option)


if Option == "illuminati" then
          game.ReplicatedStorage.DMGIndicator.Image = "http://www.roblox.com/asset/?id=487518317"
     elseif Option == "Violet" then
          game.ReplicatedStorage.DMGIndicator.Image = "http://www.roblox.com/asset/?id=10025463033" 
     elseif Option == "Asuka" then
          game.ReplicatedStorage.DMGIndicator.Image =  "http://www.roblox.com/asset/?id=10025498995"
     elseif Option == "Rem" then
          game.ReplicatedStorage.DMGIndicator.Image = "http://www.roblox.com/asset/?id=10025524529"
     elseif Option == "Astolfo" then
          game.ReplicatedStorage.DMGIndicator.Image = "http://www.roblox.com/asset/?id=10025538975"
     elseif Option == "Blank" then
          game.ReplicatedStorage.DMGIndicator.Image = "http://www.roblox.com/asset/?id=8968805098"
     end
    end
}
--kept it unmessy C:

--library:SaveConfig("config", true) -- universal config
--library:SaveConfig("config") -- game specific config
--library:DeleteConfig("config", true) -- universal config
--library:DeleteConfig("config") -- game specific config
--library:GetConfigs(true) -- return universal and game specific configs (table)
--library:GetConfigs() -- return game specific configs (table)
--library:LoadConfig("config", true) -- load universal config
--library:LoadConfig("config") -- load game specific config

local configs = main:Tab("Configuration")

local themes = configs:Section {Name = "Theme", Side = "Left"}

local themepickers = {}

local themelist =
    themes:Dropdown {
    Name = "Theme",
    Default = library.currenttheme,
    Content = library:GetThemes(),
    Flag = "Theme Dropdown",
    Callback = function(option)
        if option then
            library:SetTheme(option)

            for option, picker in next, themepickers do
                picker:Set(library.theme[option])
            end
        end
    end
}

library:ConfigIgnore("Theme Dropdown")

local namebox =
    themes:Box {
    Name = "Custom Theme Name",
    Placeholder = "Custom Theme",
    Flag = "Custom Theme"
}

library:ConfigIgnore("Custom Theme")

themes:Button {
    Name = "Save Custom Theme",
    Callback = function()
        if library:SaveCustomTheme(library.flags["Custom Theme"]) then
            themelist:Refresh(library:GetThemes())
            themelist:Set(library.flags["Custom Theme"])
            namebox:Set("")
        end
    end
}

local customtheme = configs:Section {Name = "Custom Theme", Side = "Right"}

themepickers["Accent"] =
    customtheme:ColorPicker {
    Name = "Accent",
    Default = library.theme["Accent"],
    Flag = "Accent",
    Callback = function(color)
        library:ChangeThemeOption("Accent", color)
    end
}

library:ConfigIgnore("Accent")

themepickers["Window Background"] =
    customtheme:ColorPicker {
    Name = "Window Background",
    Default = library.theme["Window Background"],
    Flag = "Window Background",
    Callback = function(color)
        library:ChangeThemeOption("Window Background", color)
    end
}

library:ConfigIgnore("Window Background")

themepickers["Window Border"] =
    customtheme:ColorPicker {
    Name = "Window Border",
    Default = library.theme["Window Border"],
    Flag = "Window Border",
    Callback = function(color)
        library:ChangeThemeOption("Window Border", color)
    end
}

library:ConfigIgnore("Window Border")

themepickers["Tab Background"] =
    customtheme:ColorPicker {
    Name = "Tab Background",
    Default = library.theme["Tab Background"],
    Flag = "Tab Background",
    Callback = function(color)
        library:ChangeThemeOption("Tab Background", color)
    end
}

library:ConfigIgnore("Tab Background")

themepickers["Tab Border"] =
    customtheme:ColorPicker {
    Name = "Tab Border",
    Default = library.theme["Tab Border"],
    Flag = "Tab Border",
    Callback = function(color)
        library:ChangeThemeOption("Tab Border", color)
    end
}

library:ConfigIgnore("Tab Border")

themepickers["Tab Toggle Background"] =
    customtheme:ColorPicker {
    Name = "Tab Toggle Background",
    Default = library.theme["Tab Toggle Background"],
    Flag = "Tab Toggle Background",
    Callback = function(color)
        library:ChangeThemeOption("Tab Toggle Background", color)
    end
}

library:ConfigIgnore("Tab Toggle Background")

themepickers["Section Background"] =
    customtheme:ColorPicker {
    Name = "Section Background",
    Default = library.theme["Section Background"],
    Flag = "Section Background",
    Callback = function(color)
        library:ChangeThemeOption("Section Background", color)
    end
}

library:ConfigIgnore("Section Background")

themepickers["Section Border"] =
    customtheme:ColorPicker {
    Name = "Section Border",
    Default = library.theme["Section Border"],
    Flag = "Section Border",
    Callback = function(color)
        library:ChangeThemeOption("Section Border", color)
    end
}

library:ConfigIgnore("Section Border")

themepickers["Text"] =
    customtheme:ColorPicker {
    Name = "Text",
    Default = library.theme["Text"],
    Flag = "Text",
    Callback = function(color)
        library:ChangeThemeOption("Text", color)
    end
}

library:ConfigIgnore("Text")

themepickers["Disabled Text"] =
    customtheme:ColorPicker {
    Name = "Disabled Text",
    Default = library.theme["Disabled Text"],
    Flag = "Disabled Text",
    Callback = function(color)
        library:ChangeThemeOption("Disabled Text", color)
    end
}

library:ConfigIgnore("Disabled Text")

themepickers["Object Background"] =
    customtheme:ColorPicker {
    Name = "Object Background",
    Default = library.theme["Object Background"],
    Flag = "Object Background",
    Callback = function(color)
        library:ChangeThemeOption("Object Background", color)
    end
}

library:ConfigIgnore("Object Background")

themepickers["Object Border"] =
    customtheme:ColorPicker {
    Name = "Object Border",
    Default = library.theme["Object Border"],
    Flag = "Object Border",
    Callback = function(color)
        library:ChangeThemeOption("Object Border", color)
    end
}

library:ConfigIgnore("Object Border")

themepickers["Dropdown Option Background"] =
    customtheme:ColorPicker {
    Name = "Dropdown Option Background",
    Default = library.theme["Dropdown Option Background"],
    Flag = "Dropdown Option Background",
    Callback = function(color)
        library:ChangeThemeOption("Dropdown Option Background", color)
    end
}

library:ConfigIgnore("Dropdown Option Background")

local configsection = configs:Section {Name = "Configs", Side = "Left"}

local configlist =
    configsection:Dropdown {
    Name = "Configs",
    Content = library:GetConfigs(), -- GetConfigs(true) if you want universal configs
    Flag = "Config Dropdown"
}

library:ConfigIgnore("Config Dropdown")

local loadconfig =
    configsection:Button {
    Name = "Load Config",
    Callback = function()
        library:LoadConfig(library.flags["Config Dropdown"]) -- LoadConfig(library.flags["Config Dropdown"], true)  if you want universal configs
    end
}

local delconfig =
    configsection:Button {
    Name = "Delete Config",
    Callback = function()
        library:DeleteConfig(library.flags["Config Dropdown"]) -- DeleteConfig(library.flags["Config Dropdown"], true)  if you want universal configs
        configlist:Refresh(library:GetConfigs())
    end
}




local configbox =
    configsection:Box {
    Name = "Config Name",
    Placeholder = "Config Name",
    Flag = "Config Name"
}

library:ConfigIgnore("Config Name")

local save =
    configsection:Button {
    Name = "Save Config",
    Callback = function()
        library:SaveConfig(library.flags["Config Dropdown"] or library.flags["Config Name"]) -- SaveConfig(library.flags["Config Name"], true) if you want universal configs
        configlist:Refresh(library:GetConfigs())
    end
}

local keybindsection = configs:Section {Name = "UI Toggle Keybind", Side = "Left"}

keybindsection:Keybind {
    Name = "UI Toggle",
    Flag = "UI Toggle",
    Default = Enum.KeyCode.RightShift,
    Blacklist = {Enum.UserInputType.MouseButton1, Enum.UserInputType.MouseButton2, Enum.UserInputType.MouseButton3},
    Callback = function(_, fromsetting)
        if not fromsetting then
            library:Close()
        end
    end
}

local scrolling = main:Tab("Columns")

for i = 1, 20 do
    local sec =
        scrolling:Section {
        Name = tostring(math.random(2000, 20000000)),
        Side = math.random(1, 2) == 1 and "Left" or "Right"
    }

    for i = 1, math.random(3, 10) do
        if math.random(1, 2) == 1 then
            sec:Label(tostring(math.random(2000, 20000000)))
        else
            sec:Button {Name = tostring(math.random(2000, 20000000))}
        end
    end
end







--library:Close()
--library:Unload()