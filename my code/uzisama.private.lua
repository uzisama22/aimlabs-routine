
--//Airs

if fraudloaded == true then
    return
end

pcall(function() getgenv().fraudloaded = true end)

local scriptversion = "3.2.1"--3.2.1
local invite = "uzisama.private"

local repo = 'https://raw.githubusercontent.com/Notaskid/storage/main/'


--//The script 



if not isfile('uzisama.private config') then 
    writefile('uzisama.private configs','')
end

local ispremium = loadstring(game:HttpGet(repo .. 'premium.lua'))()

function loadscript() 
    local load = tick()
--[[local scriptversion = "2.1.2"
    local invite = "fraudz"]]

    local rainbowcolor = Color3.new(1,1,1)
    
    local Library = loadstring(game:HttpGet(repo .. 'library.lua'))()--//Library
    local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()--//Theme Manager
    local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()--//Save Manager
    local EspLibrary = loadstring(game:HttpGet(repo .. 'esplibv2.lua'))() --//Newer ESP
    loadstring(game:HttpGet(repo .. 'acbypass.lua'))() --// discord.gg/fraudz ;) (ac bypass)
    loadstring(game:HttpGet(repo .. 'aimingapi.lua'))() --//silent aiming
    --[[loadstring(game:HttpGet(repo .. 'targetlockapi.lua'))() --//target aiming]]


    --//Lib Sets
    Aiming.TargetPart = {"Head"}
    Aiming.FOVColour = Color3.fromRGB(255,255,255)
    Aiming.VisibleCheck = false
    AimingSettings.SilentAim = false
    Aiming.FOV = 100
    
    function notify(text) 
        Library:Notify(text)
    end
    
    function formatNumber(number)
        number = tostring(number)
        return number:reverse():gsub("%d%d%d", "%1,"):reverse():gsub("^,", "")
    end

    function Alive(Player)
        if Player and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") ~= nil and Player.Character:FindFirstChild("Humanoid") ~= nil and Player.Character:FindFirstChild("Head") ~= nil then
            return true
        end
        return false
    end
    function Network(Data) 
        if Data and Data.Character and Data.Character:FindFirstChild("HumanoidRootPart") ~= nil and Data.Character:FindFirstChild("Humanoid") ~= nil and Data.Character:FindFirstChild("Head") ~= nil then
            return true
        end
        return false
    end

    function spin() 
        if Alive(game.Players.LocalPlayer) then 
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(Options.spinspeed.Value), 0)
        end
    end

    function tp(pos) 
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
    end

    local function DeleteChar()
        for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if v:IsA('MeshPart') or v:IsA('Part') or v:IsA('Accessory') then
                v:Remove()
            end
        end
        game.Players.LocalPlayer.Character.Name = 'Deleted'
    end

    local function DeleteHum()
        game.Players.LocalPlayer.Character.Humanoid:Remove()
        game.Players.LocalPlayer.Character.Name = 'Deleted'
    end

    NamePos = CFrame.new(0,0,0)
    
    notify('loading uzisama.private')
    
    local Window = Library:CreateWindow({
        Title = 'uzisama.private',
        Center = true, 
        AutoShow = true,
    })

    Library:UpdateColorsUsingRegistry()
    
    local Tabs = {
        Aiming = Window:AddTab('Aiming'), 
        ESP = Window:AddTab('Visuals'),
        Scripts = Window:AddTab('Scripts'),
        Scripts2 = Window:AddTab('Misc'),
        Teleports = Window:AddTab('Teleports'),
        Settings = Window:AddTab('Settings'),
    }
    
    local AimingMethods = Tabs.Aiming:AddLeftTabbox('Aiming')
    local FOV = Tabs.Aiming:AddRightGroupbox('FOV Settings')
    local Settings = Tabs.Aiming:AddLeftGroupbox('Settings')
    
    local ESPToggles = Tabs.ESP:AddLeftGroupbox('ESP')
    local ESPSettings = Tabs.ESP:AddRightGroupbox('ESP Settings')
    local Cross = Tabs.ESP:AddLeftGroupbox('Crosshair Visuals')
    local Vis = Tabs.ESP:AddRightGroupbox('Visuals')
    
    local ButtonScripts = Tabs.Scripts:AddLeftGroupbox('Scripts')
    local Buttons = Tabs.Scripts:AddLeftGroupbox('Character Changers')
    local Toggle = Tabs.Scripts:AddRightGroupbox('Toggles')
    local blatantaa = Tabs.Scripts:AddRightGroupbox('Blatant AA')
    local MoreScripts = Tabs.Scripts:AddRightGroupbox('More')

    local More = Tabs.Scripts2:AddLeftGroupbox('Script Values')
    local More2 = Tabs.Scripts2:AddRightGroupbox('Script Settings')

    local gtps = Tabs.Teleports:AddLeftGroupbox('General Locations')
    local gl = Tabs.Teleports:AddRightGroupbox('Gun Locations')
    local gls = Tabs.Teleports:AddRightGroupbox('Glitched Locations')
    local cl = Tabs.Teleports:AddRightGroupbox('Camping Locations (use noclip)')

    --//Code

    gtps:AddButton('Bank Vault', function()
        tp(CFrame.new(-504, 23, -286))
    end)

    gtps:AddButton('Bank Outside', function()
        tp(CFrame.new(-423, 23, -285))
    end)


    gl:AddButton('Downhill Gunz', function()
        tp(CFrame.new(-568, 8, -736))
    end)

    gl:AddButton('Uphill Gunz', function()
        tp(CFrame.new(482, 48, -608))
    end)

    gtps:AddButton('Hood Fitness', function()
        tp(CFrame.new(-76, 22, -604))
    end)
    
    gtps:AddButton("Jeff's Tacos", function()
        tp(CFrame.new(584, 51, -480))
    end)

    gtps:AddButton("Church", function()
        tp(CFrame.new(207, 22, -86))
    end)
    
    gtps:AddButton("Subway Entrance", function()
        tp(CFrame.new(-421, -2, -60))
    end)
        
    gls:AddButton("Glitch Location #1", function()
        tp(CFrame.new(-218, 24, -476))
    end)

    gls:AddButton("Glitch Location #2", function()
        tp(CFrame.new(-991, 24, -222))
    end)
        
    gtps:AddButton("Kool Klub", function()
        tp(CFrame.new(-265, 49, -457))
    end)

    gtps:AddButton("Basket Ball Court", function()
        tp(CFrame.new(-932, 22, -482))
    end)

    gtps:AddButton("Casino", function()
        tp(
            CFrame.new(-866, 22, -105) 
        )
    end)

    gtps:AddButton("Playground", function()
        tp(
            CFrame.new(-264, 22, -759) 
        )
    end)

    
    gtps:AddButton("Phone Store", function()
        tp(
            CFrame.new(-118, 22, -871) 
        )
    end)

    gtps:AddButton("UFO", function()
        tp(
            CFrame.new(73, 139, -678) 
        )
    end)

    gtps:AddButton("Da Central High School", function()
        tp(
            CFrame.new(-656, 22, 233) 
        )
    end)
    gtps:AddButton("Da Boxing Club", function()
        tp(
            CFrame.new(-210, 22, -1119) 
        )
    end)
    gtps:AddButton("Carnival", function()
        tp(
            CFrame.new(77, 25, -961) 
        )
    end)
    gtps:AddButton("Klips", function()
        tp(
            CFrame.new(9, 22, -119) 
        )
    end)

    --//pp

    cl:AddButton("Camping Spot #1", function()
        tp(
            CFrame.new(-425, 23, -222)
        )
    end)

    cl:AddButton("Camping Spot #2", function()
        tp(
            CFrame.new(-272, 23, -400)
        )
    end)

    cl:AddButton("Camping Spot #3", function()
        tp(
            CFrame.new(-1067, 21, -186)
        )
    end)

    gl:AddButton("Revolver", function()
        tp(
            CFrame.new(-643, 22, -124)
        )
    end)

    
    gl:AddButton("Gernade Launcher", function()
        tp(
            CFrame.new(-964, -1, 469)
        )
    end)

    
    gl:AddButton("RPG", function()
        tp(
            CFrame.new(-787, -40, -935)
        )
    end)

    
    gl:AddButton("Admin Guns", function()
        tp(
            CFrame.new(-878, -33, -534)
        )
    end)

    
    gl:AddButton("Flame Thrower", function()
        tp(
            CFrame.new(-153, 54, -103)
        )
    end)

    
    gl:AddButton("Double Barrel SG", function()
        tp(
            CFrame.new(-1041, 22, -261)
        )
    end)

    
    gl:AddButton("LMG", function()
        tp(
            CFrame.new(-625, 23, -300)
        )
    end)

    gl:AddButton("Drum Gun",function()
        tp(
            CFrame.new(-81, 23, -86)
        )
    end)

    
    gtps:AddButton("Admin Base", function()
        tp(
            CFrame.new(-503, -15, -886)
        )
    end)
    
    gtps:AddButton("Fire Station", function()
        tp(
            CFrame.new(-165, 23, -118)
        )
    end)

    gtps:AddButton("Da Theatre", function()
        tp(
            CFrame.new(-1006, 25, -117)
        )
    end)




    local smoothplastic = Enum.Material.SmoothPlastic
    local objects = {}

    local function scan(object)
        local objectlist = object:GetChildren()
        for i = 1, #objectlist do
            if objectlist[i]:IsA('BasePart') then
                objects[objectlist[i]] = objectlist[i].Material
            end
            scan(objectlist[i])
        end
    end

    scan(workspace)

    Toggle:AddToggle('lowgx', {
        Text = 'Low Graphics',
        Default = false,
        Tooltip = 'Enable/Disable Low Graphics', 
    }):AddKeyPicker("lowgfxshit", { Default = 'None', NoUI = false, SyncToggleState = true, Text = 'Low GFX' }) 
    Toggles.lowgx:OnChanged(function()
        if not Toggles.lowgx.Value then
            game.Lighting.GlobalShadows = true
            for i in pairs(objects) do
                i.Material = objects[i]
            end
        else
            game.Lighting.GlobalShadows = false
            for i in pairs(objects) do
                i.Material = smoothplastic
                --wait()
            end
        end
    end)

    Toggle:AddToggle('muteboombox', {
        Text = 'Loop Mute Boomboxes',
        Default = false,
        Tooltip = 'Mutes all boomboxes (FE)', 
    }):AddKeyPicker("muteboomboxesbind", { Default = 'None', NoUI = false, SyncToggleState = true, Text = 'Mute Boomboxes' }) 

    Toggle:AddToggle('eshittalk', {
        Text = 'Shit Talk',
        Default = false,
        Tooltip = 'Enable/Disable Shit Talk', 
    }):AddKeyPicker("enableshittalkbind", { Default = 'None', NoUI = false, SyncToggleState = true, Text = 'Shit Talk' }) 

    blatantaa:AddToggle('spinbot', {
        Text = 'Spin Bot',
        Default = false,
    }):AddKeyPicker("spinbotkeybind", { Default = 'None', NoUI = false, SyncToggleState = true, Text = 'SpinBot' }) 

    Toggle:AddToggle('cframespeed', {
        Text = 'CFrame Speed',
        Default = false,
    }):AddKeyPicker("cframekeybind", { Default = 'None', NoUI = false, SyncToggleState = true, Text = 'CFrame Speed' }) 

    Toggle:AddToggle('antistomp', {
        Text = 'Anti Stomp',
        Default = false,
        Tooltip = 'Deletes your character when you are knocked', 
    }):AddKeyPicker("antistompkeybind", { Default = 'None', NoUI = false, SyncToggleState = true, Text = 'Anti Stomp' }) 

    Toggle:AddToggle('autostomp', {
        Text = 'Auto Stomp',
        Default = false,
    }):AddKeyPicker("autostompkeybind", { Default = 'None', NoUI = false, SyncToggleState = true, Text = 'Auto Stomp' }) 

    Toggle:AddToggle('noclip', {
        Text = 'Noclip',
        Default = false,
    }):AddKeyPicker("noclipkeybind", { Default = 'None', NoUI = false, SyncToggleState = true, Text = 'Noclip' }) 

    
    Toggle:AddToggle('fakelag', {
        Text = 'Fake Lag',
        Default = false,
    }):AddKeyPicker("fakelagkeybinbd", { Default = 'None', NoUI = false, SyncToggleState = true, Text = 'Fake Lag' }) 

        
    Toggle:AddToggle('hideuser', {
        Text = 'Hide User',
        Default = false,
    }):AddKeyPicker("hideusebind", { Default = 'None', NoUI = false, SyncToggleState = true, Text = 'Hide User' }) 
    
    Toggle:AddToggle('cashesp', {
        Text = 'Cash Esp',
        Default = false,
    }):AddKeyPicker("cashespbuind", { Default = 'None', NoUI = false, SyncToggleState = true, Text = 'Cash Esp' }) 

    Toggle:AddToggle('autoreload', {
        Text = 'Auto Reload',
        Default = false,
    }):AddKeyPicker("autoreloadkbind", { Default = 'None', NoUI = false, SyncToggleState = true, Text = 'Auto Reload' }) 

    blatantaa:AddToggle('antilock', {
        Text = 'Reverse',
        Default = false,
    }):AddKeyPicker("aintilockkeybind", { Default = 'None', NoUI = false, SyncToggleState = true, Text = 'Anti Lock' }) 

    Toggle:AddToggle('reach', {
        Text = 'Reach',
        Default = false,
    }):AddKeyPicker("reachkeybind", { Default = 'None', NoUI = false, SyncToggleState = true, Text = 'Reach' }) 
    Toggle:AddToggle('antibag',{
        Text = 'Anti Bag',
        Default = false,
    })

    
    blatantaa:AddToggle('slingshot', {
        Text = 'Slingshot',
        Default = false,
    }):AddKeyPicker("slingshotantiaim", { Default = 'None', NoUI = false, SyncToggleState = true, Text = 'Slingshot Anti Aim' }) 

    Toggles.cashesp:OnChanged(function()
        if Toggles.cashesp.Value == false then 
            for i,v in pairs(game.Workspace.Ignored.Drop:GetChildren()) do
                if v.Name == 'MoneyDrop' then
                    v.BillboardGui.AlwaysOnTop = false
                    v.BillboardGui.Size = UDim2.new(1,0,1,0)
                end
            end
        end
    end)


    local Noclipping = nil
Clip = true

    Toggles.noclip:OnChanged(function()
        if Toggles.noclip.Value == true then 
            Clip = false
            local function NoclipLoop()
                if Clip == false and game.Players.LocalPlayer.Character ~= nil then
                    for _, child in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                        if child:IsA("BasePart") and child.CanCollide == true and child.Name ~= floatName then
                            child.CanCollide = false
                        end
                    end
                end
            end
            Noclipping = game:GetService('RunService').Stepped:Connect(NoclipLoop)
        else
            Clip = false
            if Noclipping then
                Noclipping:Disconnect()
            end
        end
    end)


    Vis:AddToggle('mgun', {
        Text = 'Gun Chams',
        Default = false,
    }):AddColorPicker('guncolor', {
        Default = Color3.new(1, 1, 1), 
    })
    Options.guncolor:OnChanged(function()
        for _,v in pairs(game:GetService('Players').LocalPlayer.Character:GetChildren()) do
            if v.ClassName == 'Tool' then
                if v:FindFirstChild('Default') then 
                    v.Default.Color = Options.guncolor.Value
                end
            end
        end
    end)

    --[[Vis:AddDropdown('mgunmat', {
        Values = {'ForceField','Neon'},
        Default = 1, 
        Multi = false, -- true / false, allows multiple choices to be selected
    
        Text = 'Gun Material',
    })]]

    local plrcharacter = game.Players.LocalPlayer.Character
    local bodycolors = plrcharacter['Body Colors']


    Vis:AddToggle('mchar', {
        Text = 'Character Chams',
        Default = false,
    }):AddColorPicker('charcolor', {
        Default = bodycolors.HeadColor3, 
    })
    Options.charcolor:OnChanged(function()
        for _,v in pairs(game:GetService('Players').LocalPlayer.Character:GetChildren()) do
            if v.ClassName == 'MeshPart' then
                --v.Material = 'ForceField'
                v.Color = Options.charcolor.Value
                end
            end
            
            for _,v in pairs(game:GetService('Players').LocalPlayer.Character:GetChildren()) do
            if v.ClassName == 'Accessory' then
                --v.Handle.Material = 'ForceField'
                if v:FindFirstChild("Handle") then 
                v.Handle.Color = Options.charcolor.Value
                end
                end
            end
    end)
    

    Vis:AddToggle('rgun', {
        Text = 'Rainbow Gun',
        Default = false,
    }):AddKeyPicker("gaygun", { Default = 'None', NoUI = false, SyncToggleState = true, Text = 'Rainbow Gun' }) 

    Vis:AddToggle('rchar', {
        Text = 'Rainbow Character',
        Default = false,
    }):AddKeyPicker("gaychar", { Default = 'None', NoUI = false, SyncToggleState = true, Text = 'Rainbow Character' }) 

    Vis:AddToggle('discomode', {
        Text = 'Disco Mode',
        Default = false,
    }):AddKeyPicker("discomodebind", { Default = 'None', NoUI = false, SyncToggleState = true, Text = 'Disco Mode' }) 
    
    ButtonScripts:AddButton('Reset Character Colors', function()
        local v1 = game.Players.LocalPlayer.Character
        local v2 = v1['Body Colors']
        v1.Head.Color = v2.HeadColor3
        v1.LeftUpperArm.Color = v2.LeftArmColor3
        v1.LeftUpperLeg.Color = v2.LeftLegColor3
        v1.RightUpperArm.Color = v2.RightArmColor3
        v1.RightUpperLeg.Color = v2.RightLegColor3
        v1.UpperTorso.Color = v2.TorsoColor3
    end)
    ButtonScripts:AddButton('Show Masked Users', function()
        for i,v in pairs(game.Workspace.Players:GetChildren()) do
            v:FindFirstChildWhichIsA('Humanoid').DisplayDistanceType = 'Subject'
        end
    end)
    ButtonScripts:AddButton('No Recoil', function()
        function isframework(scriptInstance)
            if tostring(scriptInstance) == "Framework" then
                return true
            end
            return false
        end
        
        function checkArgs(instance,index)
            if tostring(instance):lower():find("camera") and tostring(index) == "CFrame" then
                return true
            end
            return false
        end
        
        newindex = hookmetamethod(game, "__newindex", function(self,index,value)
            local callingScr = getcallingscript()
        
            if isframework(callingScr) and checkArgs(self,index) then
               return;
            end
        
            return newindex(self,index,value)
        end)
    end)

    ButtonScripts:AddButton('Unjail', function()
        if game:GetService("Players").LocalPlayer.DataFolder.Currency.Value >= 125 then
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-270.94, 20.327, -242.38)
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-270.94, 20.327, -242.38)
            wait()
            fireclickdetector(game:GetService("Workspace").Ignored.Shop["[Key] - $125"].ClickDetector)
            wait(.1)
            fireclickdetector(game:GetService("Workspace").Ignored.Shop["[Key] - $125"].ClickDetector)
            fireclickdetector(game:GetService("Workspace").Ignored.Shop["[Key] - $125"].ClickDetector)
            repeat
                wait()
            until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("[Key]")
            local Hum = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if Hum.Health > 0 then
                key1 = game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("[Key]")
                if key1 then
                    Hum:EquipTool(key1)
                    for i, v in pairs(game:GetService"Players".LocalPlayer.Character:GetChildren()) do
                        if v:isA("Tool") then
                            game:GetService("Players").LocalPlayer.Character.Humanoid:EquipTool(key1)
                            v:Activate()
                        end
                    end
                end
            end
        end
    end)
    
    Buttons:AddButton('Headless (Client)', function()
        game.Players.LocalPlayer.Character.Head.Transparency = 1
        for i,v in pairs(game.Players.LocalPlayer.Character.Head:GetChildren()) do
            if (v:IsA("Decal")) then
                v:Destroy()
            end
        end
    end)
    
    Buttons:AddButton('Korblox (Client)', function()
        local ply = game.Players.LocalPlayer
        local chr = ply.Character
        chr.RightLowerLeg.MeshId = "902942093"
        chr.RightLowerLeg.Transparency = "1"
        chr.RightUpperLeg.MeshId = "http://www.roblox.com/asset/?id=902942096"
        chr.RightUpperLeg.TextureID = "http://roblox.com/asset/?id=902843398"
        chr.RightFoot.MeshId = "902942089"
        chr.RightFoot.Transparency = "1"
    end)

    Buttons:AddButton('Blizzard Beast Mode (Client)', function()
        local L_406_ = game.Players.LocalPlayer.Character
        local L_407_ = L_406_:WaitForChild("Head")
        local L_408_ = L_407_:WaitForChild("face")
        L_408_.Texture = "rbxassetid://209712379"
    end)

    Buttons:AddButton('Super Super Happy Face (Client)', function()
        local L_406_ = game.Players.LocalPlayer.Character
        local L_407_ = L_406_:WaitForChild("Head")
        local L_408_ = L_407_:WaitForChild("face")
        L_408_.Texture = "rbxassetid://494290547"
    end)

    Buttons:AddButton('Beast Mode (Client)', function()
        local L_406_ = game.Players.LocalPlayer.Character
        local L_407_ = L_406_:WaitForChild("Head")
        local L_408_ = L_407_:WaitForChild("face")
        L_408_.Texture = "rbxassetid://127959433"
    end)
    
    Buttons:AddButton('Playful Vampire (Client)', function()
        local L_406_ = game.Players.LocalPlayer.Character
        local L_407_ = L_406_:WaitForChild("Head")
        local L_408_ = L_407_:WaitForChild("face")
        L_408_.Texture = "rbxassetid://2409281591"
    end)

    Buttons:AddButton('Punk Face (Client)', function()
        local L_406_ = game.Players.LocalPlayer.Character
        local L_407_ = L_406_:WaitForChild("Head")
        local L_408_ = L_407_:WaitForChild("face")
        L_408_.Texture = "rbxassetid://119768621"
    end)

    Buttons:AddButton('Madness Face (Client)', function()
        local L_406_ = game.Players.LocalPlayer.Character
        local L_407_ = L_406_:WaitForChild("Head")
        local L_408_ = L_407_:WaitForChild("face")
        L_408_.Texture = "rbxassetid://129900258"
    end)

    Buttons:AddButton("Grandma's Lipstick (Client)", function()
        local L_406_ = game.Players.LocalPlayer.Character
        local L_407_ = L_406_:WaitForChild("Head")
        local L_408_ = L_407_:WaitForChild("face")
        L_408_.Texture = "rbxassetid://51241479"
    end)

    Buttons:AddButton('Bandage (Client)', function()
        local L_406_ = game.Players.LocalPlayer.Character
        local L_407_ = L_406_:WaitForChild("Head")
        local L_408_ = L_407_:WaitForChild("face")
        L_408_.Texture = "rbxassetid://20418584"
    end)

    Buttons:AddButton('Troublemaker (Client)', function()
        local L_406_ = game.Players.LocalPlayer.Character
        local L_407_ = L_406_:WaitForChild("Head")
        local L_408_ = L_407_:WaitForChild("face")
        L_408_.Texture = "rbxassetid://22920500"
    end)

    Buttons:AddButton('Yum (Client)', function()
        local L_406_ = game.Players.LocalPlayer.Character
        local L_407_ = L_406_:WaitForChild("Head")
        local L_408_ = L_407_:WaitForChild("face")
        L_408_.Texture = "rbxassetid://26018945"
    end)


    
    local garbage = {
        'lol',
        'ez',
        'so sad',
        'my grandma has better aim than you',
        'seed',
        'ill 5-0',
        'just quit.',
        'run 1s',
        'salty',
        'rodent',
        'LLL',
        'suprised you havent quit yet',
        'no skill bozo',
        'bozo',
        'absolute 0 skill',
        'LOL',
        'sit son',
        'so bad',
        'look whos mad',
        'keep crying',
        'cry more',
        'rodent',
        'log',
        '.gg/'..invite,
    }

    local garbage2 = {
        'get back into your cage monkey',
        'to busy eating watermelon?',
        'heres a banana',
        'even cops have better aim',
        'bro ur black',
        'was popeyes good',
        'monkey',
        'this aint no zoo',
        'i didnt know black people could grow real eyebrows',
        'do you have a mom AND dad',
        'do you snack dry bones?',
        'where is your water at',
        'is your blood black too???'
    }


    More2:AddDropdown('shittalkmode', {
        Values = {'Normal','Racist'},
        Default = 1, 
        Multi = false, -- true / false, allows multiple choices to be selected
    
        Text = 'Shit Talk Mode',
    })

    More2:AddLabel('Shit Talk Key'):AddKeyPicker('shittalk', {
        Default = 'J', -- String as the name of the keybind (MB1, MB2 for mouse buttons)  
        SyncToggleState = false, 
        -- You can define custom Modes but I have never had a use for it.
        Mode = 'Toggle', -- Modes: Always, Toggle, Hold
    
        Text = 'Shit Talk', -- Text to display in the keybind menu
        NoUI = true, -- Set to true if you want to hide from the Keybind menu,
    })
    
    Options.shittalk:OnClick(function()
        if Toggles.eshittalk.Value == true then 
            if Options.shittalkmode.Value == "Normal" then 
                game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(garbage[math.random(1,#garbage)],"All")
            elseif Options.shittalkmode.Value == "Racist" then 
                game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(garbage2[math.random(1,#garbage2)],"All")
            end
        end
    end)

    More2:AddDropdown('antistompmode', {
        Values = {'Delete Character','Delete Humanoid'},
        Default = 1, 
        Multi = false, -- true / false, allows multiple choices to be selected
    
        Text = 'Anti Stomp',
    })


    MoreScripts:AddSlider('camfov', {
        Text = 'Camera FOV',
    
        Default = 70,
        Min = 30,
        Max = 120,
        Rounding = 0,
    
        Compact = false, -- If set to true, then it will hide the label
    })

    Options.camfov:OnChanged(function()
        workspace.CurrentCamera.FieldOfView = Options.camfov.Value
    end)
    
    More:AddSlider('spinspeed', {
        Text = 'Spin Speed',
    
        Default = 100,
        Min = 1,
        Max = 100,
        Rounding = 0,
    
        Compact = false, -- If set to true, then it will hide the label
    })

    More:AddSlider('cframespeedvalue', {
        Text = 'CFrame Speed Value',
    
        Default = 1,
        Min = 1,
        Max = 10,
        Rounding = 1,
    
        Compact = false, -- If set to true, then it will hide the label
    })

    
    More:AddSlider('fakelagamount', {
        Text = 'Fake Lag Intensity',
    
        Default = 0.05,
        Min = 0,
        Max = 1,
        Rounding = 2,
    
        Compact = false, -- If set to true, then it will hide the label
    })

    More:AddSlider('antiaimspeed', {
        Text = 'Reverse AA Speed',
    
        Default = 0.6,
        Min = 0,
        Max = 1,
        Rounding = 3,
    
        Compact = false, -- If set to true, then it will hide the label
    })

    More:AddSlider('slingshotaaspeed', {
        Text = 'Slingshot AA Speed',
    
        Default = 0.999,
        Min = 0.1,
        Max = 0.999,
        Rounding = 3,
    
        Compact = false, -- If set to true, then it will hide the label
    })



    
    
    
    --[[More:AddSlider('fakecash', {
        Text = 'Fake Cash',
    
        Default = 0,
        Min = 0,
        Max = 1000000000000,
        Rounding = 0,
    
        Compact = false, -- If set to true, then it will hide the label
    })
    
    
    Options.fakecash:OnChanged(function()
        game.Players.LocalPlayer.PlayerGui.Framework.CurrencySound:Play()
        game.Players.LocalPlayer.DataFolder.Currency.Value = formatNumber(Options.fakecash.Value))
        game.Players.LocalPlayer.PlayerGui.MainScreenGui.MoneyText.Text = "$"..formatNumber(Options.fakecash.Value))
        if game.Players.LocalPlayer.Backpack:FindFirstChild("Wallet") then
            game.Players.LocalPlayer.Backpack.Wallet.Handle.BillboardGui.TextLabel.Text = "$"..formatNumber(Options.fakecash.Value))
        else
            game.Players.LocalPlayer.Character.Wallet.Handle.BillboardGui.TextLabel.Text = "$"..formatNumber(Options.fakecash.Value))
        end
        formatNumber()
    end)
    ]]
    Cross:AddLabel('Crosshair Color'):AddColorPicker('crosscolor', {
        Default = Color3.new(1, 1, 1), 
        Title = 'Crosshair Color', -- Optional. Allows you to have a custom color picker title (when you open it)
    })

    Cross:AddToggle('rainbowcross', {
        Text = 'Rainbow Crosshair',
        Default = false,
    })
    
    game:GetService("RunService").Heartbeat:Connect(function()
        if Toggles.rainbowcross.Value == false then 
            game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.BackgroundColor3 = Options.crosscolor.Value
            game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Top.BackgroundColor3 = Options.crosscolor.Value
            game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Left.BackgroundColor3 = Options.crosscolor.Value
            game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Right.BackgroundColor3 = Options.crosscolor.Value
            game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Bottom.BackgroundColor3 = Options.crosscolor.Value
        else
            game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.BackgroundColor3 = rainbowcolor
            game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Top.BackgroundColor3 = rainbowcolor
            game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Left.BackgroundColor3 = rainbowcolor
            game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Right.BackgroundColor3 = rainbowcolor
            game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Bottom.BackgroundColor3 = rainbowcolor
        end
    end)
    
    
    Cross:AddToggle('topcross', {
        Text = 'Top Crosshair',
        Default = true,
        Tooltip = 'Enable/Disable Top Crosshair', 
    })
    Toggles.topcross:OnChanged(function()
        game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Top.Visible = Toggles.topcross.Value
    end)
    
    Cross:AddToggle('bottomcross', {
        Text = 'Bottom Crosshair',
        Default = true,
        Tooltip = 'Enable/Disable Bottom Crosshair', 
    })
    Toggles.bottomcross:OnChanged(function()
        game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Bottom.Visible = Toggles.bottomcross.Value
    end)
    
    
    Cross:AddToggle('leftcross', {
        Text = 'Left Crosshair',
        Default = true,
        Tooltip = 'Enable/Disable Left Crosshair', 
    })
    Toggles.leftcross:OnChanged(function()
        game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Left.Visible = Toggles.leftcross.Value
    end)
    
    
    Cross:AddToggle('rightcross', {
        Text = 'Right Crosshair',
        Default = true,
        Tooltip = 'Enable/Disable Right Crosshair', 
    })
    Toggles.rightcross:OnChanged(function()
        game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Aim.Right.Visible = Toggles.rightcross.Value
    end)
    
    
    
    
    ESPSettings:AddLabel('Names Color'):AddColorPicker('namesc', {
        Default = Color3.new(1, 1, 1), 
    })
    Options.namesc:OnChanged(function()
        EspLibrary.settings.namescolor = Options.namesc.Value
    end)

    ESPSettings:AddLabel('Distance Color'):AddColorPicker('distancec', {
        Default = Color3.new(1, 1, 1), 
    })
    Options.distancec:OnChanged(function()
        EspLibrary.settings.distancecolor = Options.distancec.Value
    end)

    ESPSettings:AddLabel('Boxes Color'):AddColorPicker('boxesc', {
        Default = Color3.new(1, 1, 1), 
    })
    Options.boxesc:OnChanged(function()
        EspLibrary.settings.boxescolor = Options.boxesc.Value
    end)

    ESPSettings:AddLabel('Tracers Color'):AddColorPicker('tracerscolor', {
        Default = Color3.new(1, 1, 1), 
    })
    Options.tracerscolor:OnChanged(function()
        EspLibrary.settings.tracerscolor = Options.tracerscolor.Value
    end)

    ESPSettings:AddLabel('Boxes Fill Color'):AddColorPicker('boxefsc', {
        Default = Color3.new(1, 1, 1), 
    })
    Options.boxefsc:OnChanged(function()
        EspLibrary.settings.boxesfillcolor = Options.boxesc.Value
    end)

    ESPSettings:AddToggle('resp', {
        Text = 'Rainbow Esp',
        Default = false,
        Tooltip = 'Toggles all esp rainbow', 
    }):AddKeyPicker("rainboweshpbidn", { Default = 'None', NoUI = false, SyncToggleState = true, Text = 'Rainbow Esp' }) 

    
    
    ESPToggles:AddToggle('espenabled', {
        Text = 'Enabled',
        Default = false,
        Tooltip = 'Toggles all esp', 
    }):AddKeyPicker("enabledespbind", { Default = 'None', NoUI = false, SyncToggleState = true, Text = 'ESP Enabled' }) 
    Toggles.espenabled:OnChanged(function()
        EspLibrary.settings.enabled = Toggles.espenabled.Value
    end)

    ESPSettings:AddSlider('maxdistance', {
        Text = 'Max Distance',
    
        Default = 2500,
        Min = 1,
        Max = 2500,
        Rounding = 0,
        Compact = false, -- If set to true, then it will hide the label
    })

    Options.maxdistance:OnChanged(function()
        EspLibrary.settings.maxdistance = Options.maxdistance.Value
    end)

    ESPSettings:AddSlider('refreshrate', {
        Text = 'Refresh Rate',
    
        Default = 5,
        Min = 1,
        Max = 1000,
        Rounding = 0,
        Suffix = "ms",
        Compact = false, -- If set to true, then it will hide the label
    })

    Options.refreshrate:OnChanged(function()
        EspLibrary.settings.refreshrate = Options.refreshrate.Value
    end)

    
    ESPToggles:AddToggle('names', {
        Text = 'Names',
        Default = false,
        Tooltip = 'Toggles names', 
    })
    
    Toggles.names:OnChanged(function()
        EspLibrary.settings.names = Toggles.names.Value
    end)

        
    ESPToggles:AddToggle('nameso', {
        Text = 'Names Outline',
        Default = false,
        Tooltip = 'Toggles names outline', 
    })
    
    Toggles.nameso:OnChanged(function()
        EspLibrary.settings.namesoutline = Toggles.nameso.Value
    end)
    
    ESPToggles:AddToggle('distance', {
        Text = 'Distance',
        Default = false,
        Tooltip = 'Toggles distance', 
    })
    
    Toggles.distance:OnChanged(function()
        EspLibrary.settings.distance = Toggles.distance.Value
    end)

        
    ESPToggles:AddToggle('distanceo', {
        Text = 'Distance Outline',
        Default = false,
        Tooltip = 'Toggles distance outline', 
    })
    
    Toggles.distanceo:OnChanged(function()
        EspLibrary.settings.distanceoutline = Toggles.distanceo.Value
    end)

    ESPToggles:AddToggle('boxes', {
        Text = 'Boxes',
        Default = false,
        Tooltip = 'Toggles boxes', 
    })
    
    Toggles.boxes:OnChanged(function()
        EspLibrary.settings.boxes = Toggles.boxes.Value
    end)
    
    ESPToggles:AddToggle('boxeso', {
        Text = 'Boxes Outline',
        Default = false,
        Tooltip = 'Toggles boxes outline', 
    })
    
    Toggles.boxeso:OnChanged(function()
        EspLibrary.settings.boxesoutline = Toggles.boxeso.Value
    end)
        
    ESPToggles:AddToggle('boxesf', {
        Text = 'Boxes Fill',
        Default = false,
        Tooltip = 'Toggles boxes fill', 
    })
    
    Toggles.boxesf:OnChanged(function()
        EspLibrary.settings.boxesfill = Toggles.boxesf.Value
    end)
            
    ESPToggles:AddToggle('healthbars', {
        Text = 'Healthbars',
        Default = false,
        Tooltip = 'Toggles healthbars', 
    })
    
    Toggles.healthbars:OnChanged(function()
        EspLibrary.settings.healthbars = Toggles.healthbars.Value
    end)

                
    ESPToggles:AddToggle('healthbarso', {
        Text = 'Healthbars Outline',
        Default = false,
        Tooltip = 'Toggles healthbars outline', 
    })
    
    Toggles.healthbarso:OnChanged(function()
        EspLibrary.settings.healthbarsoutline = Toggles.healthbarso.Value
    end)
                
    ESPSettings:AddSlider('xoffset', {
        Text = 'Healthbar X Offset',
    
        Default = 2,
        Min = 0,
        Max = 10,
        Rounding = 0,
        Suffix = "px",
        Compact = false, -- If set to true, then it will hide the label
    })

    Options.xoffset:OnChanged(function()
        EspLibrary.settings.healthbarsoffset = Options.xoffset.Value
    end)

    ESPToggles:AddToggle('tracers', {
        Text = 'Tracers',
        Default = false,
        Tooltip = 'Toggles tracers', 
    })
    
    Toggles.tracers:OnChanged(function()
        EspLibrary.settings.tracers = Toggles.tracers.Value
    end)

    ESPSettings:AddDropdown('tracerorgin', {
        Values = {"Top", "Left", "Right", "Bottom", "Center", "Mouse"},
        Default = 4, 
        Multi = false, -- true / false, allows multiple choices to be selected
    
        Text = 'Tracer Orgin',
    })

    Options.tracerorgin:OnChanged(function()
        EspLibrary.settings.tracersorigin = Options.tracerorgin.Value
    end)

    ESPSettings:AddDropdown('font', {
        Values = {"UI", "System", "Plex", "Monospace"},
        Default = 1, 
        Multi = false, -- true / false, allows multiple choices to be selected
    
        Text = 'Text Font',
    })

    Options.font:OnChanged(function()
        EspLibrary.settings.textfont = Drawing.Fonts[Options.font.Value]
    end)
    
    

    EspLibrary:Init()
    EspLibrary.settings.limitdistance = true

    --//Aimlock

    local thesilentaimshit = AimingMethods:AddTab('Silent Aim')
    local theaimlockshit = AimingMethods:AddTab('Aimlock')

    theaimlockshit:AddToggle('alenabled', {
        Text = 'Aimlock',
        Default = false,
    }):AddKeyPicker('aimlockkey', { Default = 'Q', NoUI = true, Text = 'Aimlock Key' }) 

    Toggles.alenabled:OnChanged(function()
        AimingSettings.AimLock = Toggles.alenabled.Value
    end)


    --//Target Lock


    --//Silent Aim
    thesilentaimshit:AddToggle('saenabled', {
        Text = 'Silent Aim',
        Default = false,
        Tooltip = 'Toggles if silent aim is enabled', 
    })

    
    Settings:AddToggle('wallcheck', {
        Text = 'Wall Check',
        Default = false,
        Tooltip = 'Checks if target is behind a wall', 
    })

    Settings:AddToggle('saairshot', {
        Text = 'Airshot Function',
        Default = false,
    })

    Settings:AddToggle('autopredict', {
        Text = 'Auto Prediction',
        Default = false,
        Tooltip = 'Auto Sets prediction depending on your ping (not recommended)', 
    })

    Settings:AddDropdown('autopredictmode', {
        Values = {"V1","V2"},
        Default = 2,
        Multi = false, -- true / false, allows multiple choices to be selected
        Tooltip = 'V1 was tested and works V2 is untested and unknown if working well', -- Information shown when you hover over the textbox
        Text = 'Auto Predict Mode',
    })

    Settings:AddInput('velocity', {
        Default = '0.157',
        Numeric = true, -- true / false, only allows numbers
        Finished = true, -- true / false, only calls callback when you press enter
    
        Text = 'Custom Prediction',
        Tooltip = 'Prediction Velocity check #settings to get settings for your ping', -- Information shown when you hover over the textbox
    
        Placeholder = '(default: 0.157)', -- placeholder text when the box is empty
        -- MaxLength is also an option which is the max length of the text
    })
    Options.velocity:OnChanged(function() 
        if string.match(Options.velocity.Value,"0.") then 
            AimingSettings.Prediction = tonumber(Options.velocity.Value)
            notify("Prediction - "..tostring(AimingSettings.Prediction))
        else
            notify("You must input number value with 0. infront of it\n(EX:0.157)")
        end
    end)
    
    Settings:AddSlider('hitchance', {
        Text = 'Hit Chance',
    
        Default = 100,
        Min = 0,
        Max = 100,
        Rounding = 1,
        Suffix = "%",
    
        Compact = false, -- If set to true, then it will hide the label
    })
    
    
    Options.hitchance:OnChanged(function()
        Aiming.HitChance = tonumber(Options.hitchance.Value)
    end)
    
    FOV:AddToggle('showfov', {
        Text = 'Visible',
        Default = false,
        Tooltip = 'Draws FOV', 
    }):AddColorPicker('fovcolor', {
        Default = Color3.new(1, 1, 1), 
        Title = 'FOV Color', -- Optional. Allows you to have a custom color picker title (when you open it)
    })

    FOV:AddToggle('filledfov', {
        Text = 'Filled',
        Default = false,
    })

    FOV:AddToggle('rfov', {
        Text = 'Rainbow',
        Default = false,
        Tooltip = 'Makes your FOV Circle Rainbow', 
    })
    
    
    FOV:AddSlider('fovsize', {
        Text = 'Radius',
    
        Default = 100,
        Min = 1,
        Max = 300,
        Rounding = 2,
    
        Compact = false, -- If set to true, then it will hide the label
    })
    
    Options.fovsize:OnChanged(function()
        Aiming.FOV = tonumber(Options.fovsize.Value)
    end)
    
    
    FOV:AddSlider('fovsides', {
        Text = 'Sides',
    
        Default = 100,
        Min = 3,
        Max = 100,
        Rounding = 0,
    
        Compact = false, -- If set to true, then it will hide the label
    })
    
    Options.fovsides:OnChanged(function()
        Aiming.FOVSides = tonumber(Options.fovsides.Value)
    end)

    FOV:AddSlider('thick', {
        Text = 'Thickness',
    
        Default = 2,
        Min = 1,
        Max = 100,
        Rounding = 0,
    
        Compact = false, -- If set to true, then it will hide the label
    })
    
    Options.thick:OnChanged(function()
        Aiming.Thickness = tonumber(Options.thick.Value)
    end)

    FOV:AddSlider('vis', {
        Text = 'Transparecy',
    
        Default = 0.9,
        Min = 0.1,
        Max = 1,
        Rounding = 1,
    
        Compact = false, -- If set to true, then it will hide the label
    })
    
    Options.vis:OnChanged(function()
        Aiming.Transparency = tonumber(Options.vis.Value)
    end)
    

    
    Options.fovcolor:OnChanged(function()
        Aiming.FOVColour = Options.fovcolor.Value
    end)
    
    Settings:AddDropdown('targetpart', {
        Values = {"Head", "UpperTorso", "HumanoidRootPart", "LowerTorso","Random"},
        Default = 1, 
        Multi = false, -- true / false, allows multiple choices to be selected
    
        Text = 'Target Part',
        Tooltip = 'Body Parts you can lock onto', -- Information shown when you hover over the textbox
    })

    Options.targetpart:OnChanged(function()
        if Options.targetpart.Value ~= "Random" then 
            Aiming.TargetPart = Options.targetpart.Value
            Aiming.OldTargetPart = Options.targetpart.Value
        else
            Aiming.TargetPart = {"Head", "UpperTorso", "HumanoidRootPart", "LowerTorso"}
            Aiming.OldTargetPart = {"Head", "UpperTorso", "HumanoidRootPart", "LowerTorso"}
        end
    end)
    
    
    Library:SetWatermarkVisibility(false)
    Library.KeybindFrame.Visible = false; -- todo: add a function for this
    
    Library:SetWatermark('uzisama.private')
    
    
    
    --//Toggles
    Toggles.saenabled:OnChanged(function()
        AimingSettings.SilentAim = Toggles.saenabled.Value
    end)

    coroutine.resume(coroutine.create(function()
        while wait() do
            if Toggles.fakelag.Value == true then 
                if Alive(game.Players.LocalPlayer) then 
                    game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Anchored = true 
                    wait(Options.fakelagamount.Value)
                    game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Anchored = false 
                end
            end
        end
    end))

    local Hum = game.Players.LocalPlayer.Character.Humanoid
    Toggles.hideuser:OnChanged(function()
        NamePos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    end)

    game:GetService("RunService").RenderStepped:Connect(function()
        AimingSettings.AimLockKeybind = Options.aimlockkey.Value
        if Toggles.antibag.Value == true then 
            if game.Players.LocalPlayer.Character:FindFirstChild('Christmas_Sock') then
                game.Players.LocalPlayer.Character:FindFirstChild('Christmas_Sock'):Remove() 
             end
        end
        if Toggles.slingshot.Value == true then 
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, Options.slingshotaaspeed.Value, 0)
            wait(0.2)
        end
        if Toggles.reach.Value == true then 
            local success, err = pcall(function()
                if game.Players.LocalPlayer.Character.BodyEffects.Attacking.Value == true then
                    for i,v in pairs(game:GetService('Players'):GetChildren()) do
                        if (v.Character.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.LeftHand.Position).Magnitude <= 50 then
                            if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then
                                if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool"):FindFirstChild('Handle') then
                                    firetouchinterest(game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Handle, v.Character.UpperTorso, 0)
                                else
                                    firetouchinterest(game.Players.LocalPlayer.Character['RightHand'], v.Character.UpperTorso, 0)
                                    firetouchinterest(game.Players.LocalPlayer.Character['LeftHand'], v.Character.UpperTorso, 0)
                                    firetouchinterest(game.Players.LocalPlayer.Character['RightFoot'], v.Character.UpperTorso, 0)
                                    firetouchinterest(game.Players.LocalPlayer.Character['LeftFoot'], v.Character.UpperTorso, 0)
                                    firetouchinterest(game.Players.LocalPlayer.Character['RightLowerLeg'], v.Character.UpperTorso, 0)
                                    firetouchinterest(game.Players.LocalPlayer.Character['LeftLowerLeg'], v.Character.UpperTorso, 0)
                                end
                            end
                        end
                    end
                end
            end)
        end
        if Toggles.saairshot.Value == true then 
            if game.Players:FindFirstChild(tostring(Aiming.Selected)) then 
                if game.Players:FindFirstChild(tostring(Aiming.Selected)).Character.Humanoid.FloorMaterial == Enum.Material.Air then
                    Aiming.TargetPart = {"UpperTorso"}
                else
                    Aiming.TargetPart = Aiming.OldTargetPart
                end
            end
        end
        if Toggles.antilock.Value == true then 
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = 
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + 
            -game.Players.LocalPlayer.Character.Humanoid.MoveDirection * Options.antiaimspeed.Value
        end
        if Toggles.autoreload.Value == true then 
            if game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool") then
                if game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool"):FindFirstChild("Ammo") then
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool"):FindFirstChild("Ammo").Value <= 0 then
                        game:GetService("ReplicatedStorage").MainEvent:FireServer("Reload", game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool")) 
                        wait(1)
                    end
                end
            end
        end
        if Toggles.cashesp.Value == true then 
            for i,v in pairs(game.Workspace.Ignored.Drop:GetChildren()) do
                if v.Name == 'MoneyDrop' then
                    v.BillboardGui.AlwaysOnTop = true
                    v.BillboardGui.Size = UDim2.new(0,25,0,25)
                end
            end
        end
        if Toggles.hideuser.Value == true then 
            local WearingMask = game.Players.LocalPlayer.Character:FindFirstChild('In-gameMask')
            local Humanoid = game.Players.LocalPlayer.Character:FindFirstChildWhichIsA('Humanoid')
            if not WearingMask then
                local OwnsMask = game.Players.LocalPlayer.Character:FindFirstChild('Mask') or game.Players.LocalPlayer.Backpack:FindFirstChild('Mask')
                if OwnsMask then
                    local MaskInventory = game.Players.LocalPlayer.Backpack:FindFirstChild('Mask')
                    if MaskInventory then
                        Humanoid:EquipTool(MaskInventory)
                        wait(0.1)
                    end
                    OwnsMask:Activate()
                else
                    local ItemName = 'Mask'
                    local ItemCost = 60
                    local ClickDetector = game:GetService("Workspace").Ignored.Shop["[Paintball Mask] - $60"].ClickDetector
                    local Location = game:GetService("Workspace").Ignored.Shop["[Paintball Mask] - $60"].Head.Position
                    local function buy()
                        wait()
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Location)
                        fireclickdetector(ClickDetector)
                        if not game.Players.LocalPlayer.Character.LeftHand:FindFirstChild('LeftWrist') then
                            game.Players.LocalPlayer.Character.LeftHand.Position = game.Players.LocalPlayer.Character.LeftLowerArm.Position
                            game.Players.LocalPlayer.Character.RightHand.Position = game.Players.LocalPlayer.Character.RightLowerArm.Position
                        end
                    end
                    repeat buy() until game.Players.LocalPlayer.Backpack:FindFirstChild(ItemName) or game.Players.LocalPlayer.DataFolder.Currency.Value <= ItemCost or game.Players.LocalPlayer.Character:FindFirstChild(ItemName)
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = NamePos
                    if not game.Players.LocalPlayer.Character.LeftHand:FindFirstChild('LeftWrist') then
                        game.Players.LocalPlayer.Character.LeftHand.Position = game.Players.LocalPlayer.Character.LeftLowerArm.Position
                        game.Players.LocalPlayer.Character.RightHand.Position = game.Players.LocalPlayer.Character.RightLowerArm.Position
                    end
                end
            else
                local MaskVisible = game.Players.LocalPlayer.Character:FindFirstChild('In-gameMask'):FindFirstChild('Handle')
                if MaskVisible then
                    MaskVisible:Destroy()
                end
            end
        end
        if Toggles.discomode.Value == true then 
            game.Lighting.Ambient = rainbowcolor
        else
            game.Lighting.Ambient = Color3.fromRGB(0,0,0)
        end
        if Toggles.resp.Value == true then 
            EspLibrary.settings.namescolor = rainbowcolor
            EspLibrary.settings.distancecolor = rainbowcolor
            EspLibrary.settings.boxescolor = rainbowcolor
            EspLibrary.settings.boxesfillcolor = rainbowcolor
            EspLibrary.settings.tracerscolor = rainbowcolor
        end
        if Toggles.rfov.Value == true then 
            Aiming.FOVColour = rainbowcolor
        end
        if Toggles.autostomp.Value == true then 
            game:GetService('ReplicatedStorage').MainEvent:FireServer('Stomp')
        end
        if Toggles.antistomp.Value == true then 
            if game.Players.LocalPlayer.Character.BodyEffects['K.O'].Value == true then 
                if Options.antistompmode.Value == "Delete Character" then 
                    DeleteChar() 
                else
                    DeleteHum()
                end
            end
        end
        if Toggles.cframespeed.Value == true then 
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame +
            game.Players.LocalPlayer.Character.Humanoid.MoveDirection * Options.cframespeedvalue.Value
        end
        if Toggles.autopredict.Value == true then 
            if Options.autopredictmode.Value == "V2" then 
                local PingStats = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
                local Value = tostring(PingStats)
                local PingValue = Value:split(" ")
                local PingNumber = tonumber(PingValue[1])

                if PingNumber < 130 then
                    AimingSettings.Prediction = PingNumber / 1000 + 0.037
                else
                    AimingSettings.Prediction = PingNumber / 1000 + 0.033
                end
            elseif Options.autopredictmode.Value == "V1" then
                local pingvalue = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
                local split = string.split(pingvalue,'(')
                local ping = tonumber(split[1])
                if ping > 225 then
                    AimingSettings.Prediction = 0.166547
                elseif ping > 215 then
                    AimingSettings.Prediction = 0.15692
                elseif ping > 205 then
                    AimingSettings.Prediction = 0.165732
                elseif ping > 190 then
                    AimingSettings.Prediction = 0.1690
                elseif ping > 185 then
                    AimingSettings.Prediction = 0.1235666
                elseif ping > 180 then
                    AimingSettings.Prediction = 0.16779123
                elseif ping > 175 then
                    AimingSettings.Prediction = 0.165455312399999
                elseif ping > 170 then
                    AimingSettings.Prediction = 0.16
                elseif ping > 165 then
                    AimingSettings.Prediction = 0.15
                elseif ping > 160 then
                    AimingSettings.Prediction = 0.1223333
                elseif ping > 155 then
                    AimingSettings.Prediction = 0.125333
                elseif ping > 150 then
                    AimingSettings.Prediction = 0.1652131
                elseif ping > 145 then
                    AimingSettings.Prediction = 0.129934
                elseif ping > 140 then
                    AimingSettings.Prediction = 0.1659921
                elseif ping > 135 then
                    AimingSettings.Prediction = 0.1659921
                elseif ping > 130 then
                    AimingSettings.Prediction = 0.12399
                elseif ping > 125 then
                    AimingSettings.Prediction = 0.15465
                elseif ping > 110 then
                    AimingSettings.Prediction = 0.142199
                elseif ping > 105 then
                    AimingSettings.Prediction = 0.141199
                elseif ping > 100 then
                    AimingSettings.Prediction = 0.134143
                elseif ping > 90 then
                    AimingSettings.Prediction = 0.1433333333392
                elseif ping > 80 then
                    AimingSettings.Prediction = 0.1332241241231
                elseif ping > 70 then
                    AimingSettings.Prediction = 0.134123
                elseif ping > 60 then
                    AimingSettings.Prediction = 0.133
                elseif ping > 50 then
                    AimingSettings.Prediction = 0.12118333
                elseif ping > 40 then
                    AimingSettings.Prediction = 0.12588244444444
                elseif ping > 35 then
                    AimingSettings.Prediction = 0.12565
                elseif ping > 30 then
                    AimingSettings.Prediction = 0.1419283
                elseif ping > 25 then
                    AimingSettings.Prediction = 0.12948111
                elseif ping > 20 then
                    AimingSettings.Prediction = 0.1211928
                end
            end
        end
        if Toggles.spinbot.Value == true then 
            spin()
        end
        if Toggles.rgun.Value == true then 
            for _,v in pairs(game:GetService('Players').LocalPlayer.Character:GetChildren()) do
                if v.ClassName == 'Tool' then
                    if v:FindFirstChild("Default") then 
                        v.Default.Color = rainbowcolor
                    end
                end
            end
        end
        if Toggles.mgun.Value == true then 
            for _,v in pairs(game:GetService('Players').LocalPlayer.Character:GetChildren()) do
                if v.ClassName == 'Tool' then
                    if v:FindFirstChild("Default") then 
                    v.Default.Material = 'ForceField' --Options.mgunmat.Value
                    end
                    end
                end
            else
                for _,v in pairs(game:GetService('Players').LocalPlayer.Character:GetChildren()) do
                    if v.ClassName == 'Tool' then
                        if v:FindFirstChild("Default") then 
                        v.Default.Material = 'Plastic'
                        end
                        end
                    end
        end
        if Toggles.rchar.Value == true then 
            for _,v in pairs(game:GetService('Players').LocalPlayer.Character:GetChildren()) do
            if v.ClassName == 'MeshPart' then
                --v.Material = 'ForceField'
                v.Color = rainbowcolor
                end
            end
            
            for _,v in pairs(game:GetService('Players').LocalPlayer.Character:GetChildren()) do
            if v.ClassName == 'Accessory' then
                --v.Handle.Material = 'ForceField'
                v.Handle.Color = rainbowcolor
                end
            end
        end
        if Toggles.mchar.Value == true then 
            for _,v in pairs(game:GetService('Players').LocalPlayer.Character:GetChildren()) do
            if v.ClassName == 'MeshPart' then
                v.Material = 'ForceField'
                end
            end
            
            for _,v in pairs(game:GetService('Players').LocalPlayer.Character:GetChildren()) do
            if v.ClassName == 'Accessory' then
                v.Handle.Material = 'ForceField'
                end
            end
        else
            for _,v in pairs(game:GetService('Players').LocalPlayer.Character:GetChildren()) do
                if v.ClassName == 'MeshPart' then
                    v.Material = 'Plastic'
                    end
                end
                
                for _,v in pairs(game:GetService('Players').LocalPlayer.Character:GetChildren()) do
                if v.ClassName == 'Accessory' then
                    v.Handle.Material = 'Plastic'
                    end
                end
        end
    end)

    
    Toggles.wallcheck:OnChanged(function()
        Aiming.VisibleCheck = Toggles.wallcheck.Value
    end)
    
    Toggles.showfov:OnChanged(function()
        Aiming.ShowFOV = Toggles.showfov.Value
    end)

    Toggles.filledfov:OnChanged(function()
        Aiming.Filled = Toggles.filledfov.Value
    end)
    
    
    --//Settings
    
    Library:OnUnload(function()
        getgenv().fraudloaded = false
        Library.Unloaded = true
    end)
    
    -- UI Settings
    local MenuGroup = Tabs.Settings:AddLeftGroupbox('Menu')

    local MenuGroup2 = Tabs.Settings:AddRightGroupbox('More Settings')
    
    MenuGroup:AddButton('Unload', function() Library:Unload() end)
    
    MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'RightShift', NoUI = false, Text = 'Menu keybind' }) 
    
    MenuGroup2:AddToggle('togglewatermark', {
        Text = 'Watermark',
        Default = false,
        Tooltip = 'Toggles if Watermark is enabled', 
    })

    MenuGroup2:AddToggle('togglekeybindmenu', {
        Text = 'Keybind Menu',
        Default = false,
    })

    MenuGroup2:AddToggle('rainbowui', {
        Text = 'Rainbow Accent',
        Default = true,
    })

    Toggles.togglekeybindmenu:OnChanged(function()
        Library.KeybindFrame.Visible = Toggles.togglekeybindmenu.Value
    end)
    
    Library.ToggleKeybind = Options.MenuKeybind 
    
    ThemeManager:SetLibrary(Library)
    SaveManager:SetLibrary(Library)
    
    
    SaveManager:IgnoreThemeSettings() 
    
    SaveManager:SetIgnoreIndexes({ 'MenuKeybind' }) 
    
    --[[ThemeManager:SetFolder('fraudsaves')
    SaveManager:SetFolder('fraudsaves/specific-game')]]
    
    SaveManager:BuildConfigSection(Tabs.Settings) 
    
    ThemeManager:ApplyToTab(Tabs.Settings)
    
    local Credits = Tabs.Settings:AddRightGroupbox('Credits')

    extra1:AddLabel("uzi#3737 (owner)")
    extra1:AddLabel("tenaki#0710 (dev)")
    extra1:AddLabel("loul#0001  (dev)")
    extra1:AddLabel("loris#0001 (dev)")
    extra1:AddLabel("Slatti#0740 (dev)")
    extra1:AddLabel("linux#0002 (dev)")
    extra1:AddLabel("flash#0070 (dev)")
    extra1:AddLabel("dm uzi#3737 to make scripts")
    
    
    
   
    
    
    
    Toggles.togglewatermark:OnChanged(function()
        Library:SetWatermarkVisibility(Toggles.togglewatermark.Value)
    end)

    notify('uzisama.private '..tostring(tick() - load)..'ms')

   


spawn(function()
    while wait() do
        local r = (math.sin(workspace.DistributedGameTime/2)/2)+0.5
        local g = (math.sin(workspace.DistributedGameTime)/2)+0.5
        local b = (math.sin(workspace.DistributedGameTime*1.5)/2)+0.5
        local color = Color3.new(r, g, b)
        rainbowcolor = color
    end
end)

spawn(function()
    while wait(0.5) do 
        if Toggles.muteboombox.Value == true then 
            for i,v in pairs(game.Players:GetChildren()) do 
                --if v.Name ~= game.Players.LocalPlayer.Name then 
                    if game.Players:FindFirstChild(v.Name) then 
                        repeat wait() until v.Character
                        for i,x in pairs(v.Character:GetDescendants()) do
                            if x:IsA("Sound") and x.Playing == true then
                                x.Playing = false
                            end
                        end
                    end
                --end
            end
        end
    end
end)
    

    task.spawn(function()
        while game:GetService('RunService').RenderStepped:Wait() do
            pcall(function()
                if Toggles.rainbowui.Value then
                    local Registry = Window.Holder.Visible and Library.Registry or Library.HudRegistry;
    
                    for Idx, Object in next, Registry do
                        for Property, ColorIdx in next, Object.Properties do
                            if ColorIdx == 'AccentColor' or ColorIdx == 'AccentColorDark' then
                                local Instance = Object.Instance;
                                local yPos = Instance.AbsolutePosition.Y;
    
                                local Mapped = Library:MapValue(yPos, 0, 1080, 0, 0.5) * 1.5;
                                local Color = Color3.fromHSV((Library.CurrentRainbowHue - Mapped) % 1, 0.8, 1);
    
                                if ColorIdx == 'AccentColorDark' then
                                    Color = Library:GetDarkerColor(Color);
                                end;
    
                                Instance[Property] = Color;
                            end;
                        end;
                    end;
                end;
            end)
        end;
    end);
    
end
loadscript() 