-- setup vars
food = {
	workspace['SnackMachine']['Selection1']['ClickDetector'],
	workspace['SnackMachine']['Selection2']['ClickDetector'],
	workspace['SnackMachine']['Selection3']['ClickDetector'],
	workspace['SnackMachine']['Selection4']['ClickDetector'], 
	workspace['SnackMachine']['Selection5']['ClickDetector'],
	workspace['SnackMachine']['Selection6']['ClickDetector'],
	workspace['SnackMachine']['Selection7']['ClickDetector'],
	workspace['SnackMachine']['Selection8']['ClickDetector']
}

-- setup players
plrs = game:GetService("Players")
lp = plrs.LocalPlayer

char = lp.Character

humanoid = char.Humanoid
root = char:FindFirstChild("HumanoidRootPart")

function grabtools()
	for _, child in ipairs(workspace:GetChildren()) do
		if char and child:IsA("BackpackItem") and child:FindFirstChild("Handle") then
			humanoid:EquipTool(child)
		end
	end
end

function click(detector)
	if detector then
		fireclickdetector(detector)
	end
end

function run()
	for i,v in pairs(food) do
		click(v)
	end
end

function notif(title, desc, dur)
	game:GetService("StarterGui"):SetCore("SendNotification",{
		Title = title,
		Text = desc,
		Duration = dur,
	})
end

notif("Credits", "Script made by k5utils on discord", 3)

if game.PlaceId == 369152986 then
	for i=1,30 do
		run()
		wait(2)
	end

	grabtools()
	wait(2.1)
	humanoid:UnequipTools()
	notif("Success", "Finished generating food", 2.5)
else
	notif("Unsupported Game",'This game only works on:',4)
	notif("Unsupported Game",'Bullying: A Roleplay Story',4)
end
