--[[inject the anti group first before injecting the script
when script kicked you out of the game to tell you to join their group, it wont kick you out if you inject anti group first
]]--

hookfunction(game.Players.LocalPlayer.IsInGroup, function() return true end)

