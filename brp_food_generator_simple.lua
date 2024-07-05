function notify(title, description, duration)
	game:GetService("StarterGui"):SetCore("SendNotification",{
		Title = title or '.',
		Text = description or '',
		Duration = duration or 3,
	})
end

if not game:IsLoaded() then
	notify("Food Generator", "Waiting for the game to load..", 3)
	game.Loaded:Wait()
	notify("Game loaded!")
end

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
Players = game:GetService("Players")
LocalPlayer = Players.LocalPlayer

Character = LocalPlayer.Character

Humanoid = Character.Humanoid
HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")

function grabtools()
	for _, child in ipairs(workspace:GetChildren()) do
		if Character and child:IsA("BackpackItem") and child:FindFirstChild("Handle") then
			Humanoid:EquipTool(child)
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

_G.s = not _G.s

notify("Toggle", tostring(_G.s), 3,)
notify("Credits", "Script made by k5utils on discord", 3)

if game.PlaceId == 369152986 then
	if fireclickdetector then
		if _G.s then
			for i=1,30 do
				if _G.s == false then break end
				run()
				task.wait(2)
			end
			notify("Success", "Finished generating food", 2.5)

			grabtools()
			task.wait(1.1)
			Humanoid:UnequipTools()
		end
	else
		notify("Unsupported Executor", "fireclickdetector is not supported on your executor!", 4)
	end
else
	notify("Unsupported Game",'This game only works on:',4)
	notify("Unsupported Game",'Bullying: A Roleplay Story',4)
end
