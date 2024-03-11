local RS = game:GetService("ReplicatedStorage")
local remote: RemoteEvent = RS:WaitForChild("Events"):WaitForChild(script.Name)
local Killers = require(RS.Shared.Killers)
local killerData = Killers.Swirl.killerData
local actionData = Killers.Swirl.actionData
--[[ remote.OnServerEvent:Connect(function(player, event)
	local character = player.Character or player.CharacterAdded:Wait()
	local hum = character:FindFirstChildOfClass("Humanoid")
	print("Server fired from Swirl")
	if event == "walkspeed" then
		hum.WalkSpeed = 24
		task.wait(actionData.one.cooldown)
		hum.WalkSpeed = 16
	end
end)
 ]]
