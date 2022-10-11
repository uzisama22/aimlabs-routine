
IsFirstPerson = false
ShiftHeld = false
WHeld = false
SHeld = false
AHeld = false
DHeld = false -- LMFAO
local gcheck = true
urspeed = 0.05 -- The lower it is the faster. So don't worry about it being minus 1


function ChangeFaster(inputObject, gameProcessedEvent)
    if inputObject.KeyCode == Enum.KeyCode.N and gameProcessedEvent == false then        
urspeed = urspeed - 0.025
    end
end
 


function ChangeSlower(inputObject, gameProcessedEvent)
    if inputObject.KeyCode == Enum.KeyCode.M and gameProcessedEvent == false then        
urspeed = urspeed + 0.025
    end
end
 


function GChecker(inputObject, gameProcessedEvent)
    if inputObject.KeyCode == Enum.KeyCode.T and gameProcessedEvent == false then        
if gcheck == false then
gcheck = true
elseif gcheck == true then
gcheck = false
end

    end
end
 
game:GetService("UserInputService").InputBegan:connect(GChecker)



function PressShift(inputObject,gameProcessedEvent)
    if inputObject.KeyCode == Enum.KeyCode.LeftShift and gameProcessedEvent == false and gcheck == true then
        ShiftHeld = true
    end
end

function ReleaseShift(inputObject,gameProcessed)
    if inputObject.KeyCode == Enum.KeyCode.LeftShift then
        ShiftHeld = false
    end
end


function PressW(inputObject,gameProcessedEvent)
    if inputObject.KeyCode == Enum.KeyCode.W and gameProcessedEvent == false and gcheck == true then
        WHeld = true
    end
end

function ReleaseW(inputObject,gameProcessed)
    if inputObject.KeyCode == Enum.KeyCode.W then
        WHeld = false
    end
end

function PressS(inputObject,gameProcessedEvent)
    if inputObject.KeyCode == Enum.KeyCode.S and gameProcessedEvent == false and gcheck == true then
        SHeld = true
    end
end

function ReleaseS(inputObject,gameProcessed)
    if inputObject.KeyCode == Enum.KeyCode.S then
        SHeld = false
    end
end


function PressA(inputObject,gameProcessedEvent)
    if inputObject.KeyCode == Enum.KeyCode.A and gameProcessedEvent == false and gcheck == true then
        AHeld = true
    end
end

function ReleaseA(inputObject,gameProcessed)
    if inputObject.KeyCode == Enum.KeyCode.A then
        AHeld = false
    end
end


function PressD(inputObject,gameProcessedEvent)
    if inputObject.KeyCode == Enum.KeyCode.D and gameProcessedEvent == false and gcheck == true then
        DHeld = true
    end
end

function ReleaseD(inputObject,gameProcessed)
    if inputObject.KeyCode == Enum.KeyCode.D then
        DHeld = false
    end
end

function CheckFirst(inputObject,gameProcessed)
    if inputObject.KeyCode == Enum.UserInputType.MouseWheel then
        if (player.Character.Head.CFrame.p - workspace.CurrentCamera.CFrame.p).magnitude < 0.6 then
            IsFirstPerson = true
	elseif (player.Character.Head.CFrame.p - workspace.CurrentCamera.CFrame.p).magnitude > 0.6 then
	    IsFirstPerson = false
        end
    end
end

game:GetService("UserInputService").InputBegan:connect(PressShift)
game:GetService("UserInputService").InputEnded:connect(ReleaseShift)

game:GetService("UserInputService").InputBegan:connect(PressW)
game:GetService("UserInputService").InputEnded:connect(ReleaseW)

game:GetService("UserInputService").InputBegan:connect(PressS)
game:GetService("UserInputService").InputEnded:connect(ReleaseS)

game:GetService("UserInputService").InputBegan:connect(PressA)
game:GetService("UserInputService").InputEnded:connect(ReleaseA)

game:GetService("UserInputService").InputBegan:connect(PressD)
game:GetService("UserInputService").InputEnded:connect(ReleaseD)

game:GetService("UserInputService").InputChanged:connect(CheckFirst)

game:GetService("UserInputService").InputBegan:connect(ChangeFaster)
game:GetService("UserInputService").InputBegan:connect(ChangeSlower)


game:GetService('RunService').Stepped:connect(function()
if ShiftHeld == true then

if WHeld == true then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,-urspeed)
end

if SHeld == true then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,urspeed)
end

if DHeld == true then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(urspeed,0,0)
end

if AHeld == true then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(-urspeed,0,0)
end


end
end)

repeat
    wait()
until game:IsLoaded()
local gm = getrawmetatable(game)
setreadonly(gm, false)
local namecall = gm.__namecall
gm.__namecall =
    newcclosure(
    function(self, ...)
        local args = {...}
        if not checkcaller() and getnamecallmethod() == "FireServer" and tostring(self) == "MainEvent" then
            if tostring(getcallingscript()) ~= "Framework" then
                return
            end
        end
        if not checkcaller() and getnamecallmethod() == "Kick" then
            return
        end
        return namecall(self, unpack(args))
    end
)