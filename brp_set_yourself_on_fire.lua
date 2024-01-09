-- fire script (sets you on fire, brp game)

campfire = workspace["Campsite"]["Campfire"]
fire = campfire["FlameTouchPart"]

root = game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

touchfire = fire["TouchInterest"] -- unused soon(??)

if firetouchinterest then
	firetouchinterest(fire, root, 1)
	wait()
	firetouchinterest(fire, root, 0)
end

tempcframe = {}
table.insert(tempcframe, fire.CFrame)
fire.CFrame = root.CFrame
wait()
fire.CFrame = tempcframe[1]