local RS = game:GetService("ReplicatedStorage")
Instance.new("Folder", RS).Name = "Events"
for k, killer in script.Killers:GetChildren() do
    Instance.new("RemoteEvent", RS:WaitForChild("Events")).Name = killer.Name
end