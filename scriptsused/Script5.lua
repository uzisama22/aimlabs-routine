---Earth unleaked streamable
---Hitchances He used = 20 / 51
---FovSizes He used = 14 , 20 , and 25
---local earth coroutine 
-- // script made by earth
-- // script made by earth
-- // script made by earth
----\\       //\\      \\   
---- \\     //  \\     //  
----  \\   //    \\   // 
----   \\_//      \\_//
-- // EarthW  -- // EarthW -- // EarthW -- // EarthW -- // EarthW -- // EarthW
-- // EarthW -- // EarthW -- // EarthW -- // EarthW -- // EarthW -- // EarthW
-- // EarthW-- // EarthW--  // EarthW--  // EarthW--  // EarthW--  // EarthW
-- \\ EarthW-- \\ EarthW--  \\ EarthW--  \\ EarthW--  \\ EarthW--  \\ EarthW
-- // EarthW  -- // EarthW -- // EarthW -- // EarthW -- // EarthW -- // EarthW
-- // EarthW -- // EarthW -- // EarthW -- // EarthW -- // EarthW -- // EarthW
-- // EarthW-- // EarthW--  // EarthW--  // EarthW--  // EarthW--  // EarthW
-- \\ EarthW-- \\ EarthW--  \\ EarthW--  \\ EarthW--  \\ EarthW--  \\ EarthW
-- // EarthW  -- // EarthW -- // EarthW -- // EarthW -- // EarthW -- // EarthW
-- // EarthW -- // EarthW -- // EarthW -- // EarthW -- // EarthW -- // EarthW
-- // EarthW-- // EarthW--  // EarthW--  // EarthW--  // EarthW--  // EarthW
-- \\ EarthW-- \\ EarthW--  \\ EarthW--  \\ EarthW--  \\ EarthW--  \\ EarthW
-- // EarthW  -- // EarthW -- // EarthW -- // EarthW -- // EarthW -- // EarthW
-- // EarthW -- // EarthW -- // EarthW -- // EarthW -- // EarthW -- // EarthW
-- // EarthW-- // EarthW--  // EarthW--  // EarthW--  // EarthW--  // EarthW
-- \\ EarthW-- \\ EarthW--  \\ EarthW--  \\ EarthW--  \\ EarthW--  \\ EarthW
-- // EarthW  -- // EarthW -- // EarthW -- // EarthW -- // EarthW -- // EarthW
-- // EarthW -- // EarthW -- // EarthW -- // EarthW -- // EarthW -- // EarthW
-- // EarthW-- // EarthW--  // EarthW--  // EarthW--  // EarthW--  // EarthW
-- \\ EarthW-- \\ EarthW--  \\ EarthW--  \\ EarthW--  \\ EarthW--  \\ EarthW
-- // EarthW  -- // EarthW -- // EarthW -- // EarthW -- // EarthW -- // EarthW
-- // EarthW -- // EarthW -- // EarthW -- // EarthW -- // EarthW -- // EarthW
-- // EarthW-- // EarthW--  // EarthW--  // EarthW--  // EarthW--  // EarthW
-- \\ EarthW-- \\ EarthW--  \\ EarthW--  \\ EarthW--  \\ EarthW--  \\ EarthW
-- // EarthW  -- // EarthW -- // EarthW -- // EarthW -- // EarthW -- // EarthW
-- // EarthW -- // EarthW -- // EarthW -- // EarthW -- // EarthW -- // EarthW
-- // EarthW-- // EarthW--  // EarthW--  // EarthW--  // EarthW--  // EarthW
-- \\ EarthW-- \\ EarthW--  \\ EarthW--  \\ EarthW--  \\ EarthW--  \\ EarthW
-- // EarthW  -- // EarthW -- // EarthW -- // EarthW -- // EarthW -- // EarthW
-- // EarthW -- // EarthW -- // EarthW -- // EarthW -- // EarthW -- // EarthW
-- // EarthW-- // EarthW--  // EarthW--  // EarthW--  // EarthW--  // EarthW
-- \\ EarthW-- \\ EarthW--  \\ EarthW--  \\ EarthW--  \\ EarthW--  \\ EarthW
-- // EarthW  -- // EarthW -- // EarthW -- // EarthW -- // EarthW -- // EarthW
-- // EarthW -- // EarthW -- // EarthW -- // EarthW -- // EarthW -- // EarthW
-- // EarthW-- // EarthW--  // EarthW--  // EarthW--  // EarthW--  // EarthW
-- \\ EarthW-- \\ EarthW--  \\ EarthW--  \\ EarthW--  \\ EarthW--  \\ EarthW
-- // EarthW  -- // EarthW -- // EarthW -- // EarthW -- // EarthW -- // EarthW
-- // EarthW -- // EarthW -- // EarthW -- // EarthW -- // EarthW -- // EarthW
-- // EarthW-- // EarthW--  // EarthW--  // EarthW--  // EarthW--  // EarthW
-- \\ EarthW-- \\ EarthW--  \\ EarthW--  \\ EarthW--  \\ EarthW--  \\ EarthW
-- // EarthW  -- // EarthW -- // EarthW -- // EarthW -- // EarthW -- // EarthW
-- // EarthW -- // EarthW -- // EarthW -- // EarthW -- // EarthW -- // EarthW
-- // EarthW-- // EarthW--  // EarthW--  // EarthW--  // EarthW--  // EarthW
-- \\ EarthW-- \\ EarthW--  \\ EarthW--  \\ EarthW--  \\ EarthW--  \\ EarthW
--toggle button (v)
local hotkey = "v" -- toggle key
local mouse = game.Players.LocalPlayer:GetMouse()


mouse.KeyDown:Connect(function(key)
if key == hotkey then
if getgenv().DaHoodSettings.SilentAim == true then
 getgenv().DaHoodSettings.SilentAim = false
else
getgenv().DaHoodSettings.SilentAim = true
end
end
end)
loadstring(game:HttpGet("https://raw.githubusercontent.com/uzisama22/earthW/main/earthware"))()
DaHoodSettings.Prediction = 0.120
 --change parts if need
                EarthParts = true
EarthParts  = { 
"Head", 
"HumanoidRootPart",
"LeftLowerLeg",
"LeftFoot",
"LeftArm",
"RightArm",
"LowerTorso"
                    }   
FOVCircle = 25
HitChance = 51
ShowFOV = false
--dont show fov idoit

