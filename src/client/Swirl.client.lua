local UIS = game:GetService("UserInputService")
local TS = game:GetService("TweenService")
local RS = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
-- reference localplayer
local LocalPlayer = game.Players.LocalPlayer
local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local hum = character:WaitForChild("Humanoid")
print(hum)
local camera = workspace.CurrentCamera
-- reference instances
local colorCorrection = game.Lighting.ColorCorrection
local CONSTANTS = require(script.Parent.Constants)
local Killers = require(RS.Shared.Killers)
local killerData = Killers.Swirl.killerData
local actionData = Killers.Swirl.actionData
UIS.InputBegan:Connect(function(input: InputObject, a1: boolean)
	if input.UserInputType == Enum.UserInputType.Keyboard then
		if input.KeyCode == Enum.KeyCode.One then
			local currentTime = tick()
			local elapsedSinceActivation = (currentTime - actionData.one.lastInputTime)
			print(elapsedSinceActivation - 2)
			if actionData.one.isOneEnabled or elapsedSinceActivation < actionData.one.cooldown then
				return
			end
			actionData.one.isOneEnabled = true
			actionData.one.lastInputTime = currentTime

			local tween
			tween = TS:Create(
				camera,
				TweenInfo.new(1 / 3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false),
				{ FieldOfView = camera.FieldOfView * 1 / 2 }
			)
			tween:Play()
			if hum then
				hum.WalkSpeed = 75
			end
			TS:Create(colorCorrection, TweenInfo.new(1 / 3), { TintColor = Color3.fromRGB(185, 214, 194) }):Play()

			tween.Completed:Wait()
			-- go back to previous state, revert attrs
			task.wait(actionData.one.duration)
			tween = TS:Create(
				camera,
				TweenInfo.new(1 / 4, Enum.EasingStyle.Quad, Enum.EasingDirection.In, 0, false),
				{ FieldOfView = CONSTANTS.FIELD_OF_VIEW }
			)
			TS:Create(colorCorrection, TweenInfo.new(1 / 3), { TintColor = Color3.fromRGB(255, 255, 255) }):Play()
			if hum then
				hum.WalkSpeed = killerData.WalkSpeed
			end
			tween:Play()
			task.wait(actionData.one.cooldown)
			actionData.one.isOneEnabled = false
		end
	end
end)
