local Folder = Instance.new('Folder', game:GetService("Workspace"))
	local AnimationPack = game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.AnimationPack
	local ScrollingFrame = AnimationPack.ScrollingFrame
	local CloseButton = AnimationPack.CloseButton

	AnimationPack.Visible = true

	local LeanAnimation = Instance.new("Animation", Folder)
	LeanAnimation.Name = "LeanAnimation"
	LeanAnimation.AnimationId = "rbxassetid://3152375249"
	local Lean = game:GetService("Players").LocalPlayer.Character.Humanoid:LoadAnimation(LeanAnimation)

	local LayAnimation = Instance.new("Animation", Folder)
	LayAnimation.Name = "LayAnimation"
	LayAnimation.AnimationId = "rbxassetid://3152378852"
	local Lay = game:GetService("Players").LocalPlayer.Character.Humanoid:LoadAnimation(LayAnimation)

	local Dance1Animation = Instance.new("Animation", Folder)
	Dance1Animation.Name = "Dance1Animation"
	Dance1Animation.AnimationId = "rbxassetid://3189773368"
	local Dance1 = game:GetService("Players").LocalPlayer.Character.Humanoid:LoadAnimation(Dance1Animation)

	local Dance2Animation = Instance.new("Animation", Folder)
	Dance2Animation.Name = "Dance2Animation"
	Dance2Animation.AnimationId = "rbxassetid://3189776546"
	local Dance2 = game:GetService("Players").LocalPlayer.Character.Humanoid:LoadAnimation(Dance2Animation)

	local GreetAnimation = Instance.new("Animation", Folder)
	GreetAnimation.Name = "GreetAnimation"
	GreetAnimation.AnimationId = "rbxassetid://3189777795"
	local Greet = game:GetService("Players").LocalPlayer.Character.Humanoid:LoadAnimation(GreetAnimation)

	local PrayingAnimation = Instance.new("Animation", Folder)
	PrayingAnimation.Name = "PrayingAnimation"
	PrayingAnimation.AnimationId = "rbxassetid://3487719500"
	local Praying = game:GetService("Players").LocalPlayer.Character.Humanoid:LoadAnimation(PrayingAnimation)

	for i,v in pairs(ScrollingFrame:GetChildren()) do
		if v.Name == "TextButton" then
			if v.Text == "Lean" then
				v.Name = "LeanButton"
			end
		end
	end

	for i,v in pairs(ScrollingFrame:GetChildren()) do
		if v.Name == "TextButton" then
			if v.Text == "Lay" then
				v.Name = "LayButton"
			end
		end
	end

	for i,v in pairs(ScrollingFrame:GetChildren()) do
		if v.Name == "TextButton" then
			if v.Text == "Dance1" then
				v.Name = "Dance1Button"
			end
		end
	end

	for i,v in pairs(ScrollingFrame:GetChildren()) do
		if v.Name == "TextButton" then
			if v.Text == "Dance2" then
				v.Name = "Dance2Button"
			end
		end
	end

	for i,v in pairs(ScrollingFrame:GetChildren()) do
		if v.Name == "TextButton" then
			if v.Text == "Greet" then
				v.Name = "GreetButton"
			end
		end
	end

	for i,v in pairs(ScrollingFrame:GetChildren()) do
		if v.Name == "TextButton" then
			if v.Text == "Praying" then
				v.Name = "PrayingButton"
			end
		end
	end

	function Stop()
		Lay:Stop()
		Lean:Stop()
		Dance1:Stop()
		Dance2:Stop()
		Greet:Stop()
		Praying:Stop()
	end

	local LeanTextButton = ScrollingFrame.LeanButton
	local LayTextButton = ScrollingFrame.LayButton
	local Dance1TextButton = ScrollingFrame.Dance1Button
	local Dance2TextButton = ScrollingFrame.Dance2Button
	local GreetTextButton = ScrollingFrame.GreetButton
	local PrayingTextButton = ScrollingFrame.PrayingButton

	AnimationPack.MouseButton1Click:Connect(function()
		if ScrollingFrame.Visible == false then
			ScrollingFrame.Visible = true
			CloseButton.Visible = true
		end
	end)
	CloseButton.MouseButton1Click:Connect(function()
		if ScrollingFrame.Visible == true then
			ScrollingFrame.Visible = false
			CloseButton.Visible = false
		end
	end)
	LeanTextButton.MouseButton1Click:Connect(function()
		Stop()
		Lean:Play()
	end)
	LayTextButton.MouseButton1Click:Connect(function()
		Stop()
		Lay:Play()
	end)
	Dance1TextButton.MouseButton1Click:Connect(function()
		Stop()
		Dance1:Play()
	end)
	Dance2TextButton.MouseButton1Click:Connect(function()
		Stop()
		Dance2:Play()
	end)
	GreetTextButton.MouseButton1Click:Connect(function()
		Stop()
		Greet:Play()
	end)
	PrayingTextButton.MouseButton1Click:Connect(function()
		Stop()
		Praying:Play()
	end)

	game:GetService("Players").LocalPlayer.Character.Humanoid.Running:Connect(function()
		Stop()
	end)
	game:GetService("Players").LocalPlayer.Character.Humanoid.Died:Connect(function()
		Stop()
		repeat
			wait()
		until game:GetService("Players").LocalPlayer.Character.Humanoid.Health == 100
		wait(1)
		local AnimationPack = game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.AnimationPack
		local ScrollingFrame = AnimationPack.ScrollingFrame
		local CloseButton = AnimationPack.CloseButton

		AnimationPack.Visible = true

		local LeanAnimation = Instance.new("Animation", Folder)
		LeanAnimation.Name = "LeanAnimation"
		LeanAnimation.AnimationId = "rbxassetid://3152375249"
		local Lean = game:GetService("Players").LocalPlayer.Character.Humanoid:LoadAnimation(LeanAnimation)

		local LayAnimation = Instance.new("Animation", Folder)
		LayAnimation.Name = "LayAnimation"
		LayAnimation.AnimationId = "rbxassetid://3152378852"
		local Lay = game:GetService("Players").LocalPlayer.Character.Humanoid:LoadAnimation(LayAnimation)

		local Dance1Animation = Instance.new("Animation", Folder)
		Dance1Animation.Name = "Dance1Animation"
		Dance1Animation.AnimationId = "rbxassetid://3189773368"
		local Dance1 = game:GetService("Players").LocalPlayer.Character.Humanoid:LoadAnimation(Dance1Animation)

		local Dance2Animation = Instance.new("Animation", Folder)
		Dance2Animation.Name = "Dance2Animation"
		Dance2Animation.AnimationId = "rbxassetid://3189776546"
		local Dance2 = game:GetService("Players").LocalPlayer.Character.Humanoid:LoadAnimation(Dance2Animation)

		local GreetAnimation = Instance.new("Animation", Folder)
		GreetAnimation.Name = "GreetAnimation"
		GreetAnimation.AnimationId = "rbxassetid://3189777795"
		local Greet = game:GetService("Players").LocalPlayer.Character.Humanoid:LoadAnimation(GreetAnimation)

		local PrayingAnimation = Instance.new("Animation", Folder)
		PrayingAnimation.Name = "PrayingAnimation"
		PrayingAnimation.AnimationId = "rbxassetid://3487719500"
		local Praying = game:GetService("Players").LocalPlayer.Character.Humanoid:LoadAnimation(PrayingAnimation)

		for i,v in pairs(ScrollingFrame:GetChildren()) do
			if v.Name == "TextButton" then
				if v.Text == "Lean" then
					v.Name = "LeanButton"
				end
			end
		end

		for i,v in pairs(ScrollingFrame:GetChildren()) do
			if v.Name == "TextButton" then
				if v.Text == "Lay" then
					v.Name = "LayButton"
				end
			end
		end

		for i,v in pairs(ScrollingFrame:GetChildren()) do
			if v.Name == "TextButton" then
				if v.Text == "Dance1" then
					v.Name = "Dance1Button"
				end
			end
		end

		for i,v in pairs(ScrollingFrame:GetChildren()) do
			if v.Name == "TextButton" then
				if v.Text == "Dance2" then
					v.Name = "Dance2Button"
				end
			end
		end

		for i,v in pairs(ScrollingFrame:GetChildren()) do
			if v.Name == "TextButton" then
				if v.Text == "Greet" then
					v.Name = "GreetButton"
				end
			end
		end

		for i,v in pairs(ScrollingFrame:GetChildren()) do
			if v.Name == "TextButton" then
				if v.Text == "Praying" then
					v.Name = "PrayingButton"
				end
			end
		end

		function Stop()
			Lay:Stop()
			Lean:Stop()
			Dance1:Stop()
			Dance2:Stop()
			Greet:Stop()
			Praying:Stop()
		end

		local LeanTextButton = ScrollingFrame.LeanButton
		local LayTextButton = ScrollingFrame.LayButton
		local Dance1TextButton = ScrollingFrame.Dance1Button
		local Dance2TextButton = ScrollingFrame.Dance2Button
		local GreetTextButton = ScrollingFrame.GreetButton
		local PrayingTextButton = ScrollingFrame.PrayingButton

		AnimationPack.MouseButton1Click:Connect(function()
			if ScrollingFrame.Visible == false then
				ScrollingFrame.Visible = true
				CloseButton.Visible = true
			end
		end)
		CloseButton.MouseButton1Click:Connect(function()
			if ScrollingFrame.Visible == true then
				ScrollingFrame.Visible = false
				CloseButton.Visible = false
			end
		end)
		LeanTextButton.MouseButton1Click:Connect(function()
			Stop()
			Lean:Play()
		end)
		LayTextButton.MouseButton1Click:Connect(function()
			Stop()
			Lay:Play()
		end)
		Dance1TextButton.MouseButton1Click:Connect(function()
			Stop()
			Dance1:Play()
		end)
		Dance2TextButton.MouseButton1Click:Connect(function()
			Stop()
			Dance2:Play()
		end)
		GreetTextButton.MouseButton1Click:Connect(function()
			Stop()
			Greet:Play()
		end)
		PrayingTextButton.MouseButton1Click:Connect(function()
			Stop()
			Praying:Play()
		end)
	end)