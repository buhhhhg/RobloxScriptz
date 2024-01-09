-- fire script (sets you on fire, brp game)

campfire = workspace["Campsite"]["Campfire"]
fire = campfire["FlameTouchPart"]

root = game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

function notif(title, desc, dur)
	game:GetService("StarterGui"):SetCore("SendNotification",{
		Title = title,
		Text = desc,
		Duration = dur,
	})
end

if firetouchinterest then
	firetouchinterest(fire, root, 1)
	wait(6)
	firetouchinterest(fire, root, 0)
else
	notif("Unsupported Game",'Set yourself on fire',5)
	notif("Unsupported Game",'Script by `k5utils` on discord',5)
	notif("Unsupported Game",' ',5)
	notif("Unsupported Game",'This game only works on:',5)
	notif("Unsupported Game",'Bullying: A Roleplay Story',5)
end

tempcframe = {}
table.insert(tempcframe, fire.CFrame)
fire.CFrame = root.CFrame
wait()
fire.CFrame = tempcframe[1]