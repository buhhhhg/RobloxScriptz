function notify(title, description, duration)
	game:GetService("StarterGui"):SetCore("SendNotification",{
		Title = title or 'Food Generator',
		Text = description or '',
		Duration = duration or 2,
	})
end

if not game:IsLoaded() then
	notify("Food Generator", "Waiting for the game to load..", 2.5)
	start_time = os.time()
	game.Loaded:Wait()
	end_time = os.time()
	notify("Food Generator", "Game loaded in "..tostring(end_time-start_time).."seconds", 1.9)
end

food = {}
for i=1,8 do
	-- part = workspace['SnackMachine']['Selection'..tostring(i)]['ClickDetector']
	part = workspace['SnackMachine']['Selection'..tostring(i)]
	if part then
		table.insert(food, part)
	else
		notify(nil, "Selection #"..tostring(i).." not found!", 2)
	end
end

Players = game:GetService("Players")
LocalPlayer = Players.LocalPlayer

Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

Humanoid = Character.Humanoid
HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")

function grabtools()
	for _, Tool in ipairs(workspace:GetChildren()) do
		if Character and Tool:IsA("BackpackItem") and Tool:FindFirstChild("Handle") then
			Humanoid:EquipTool(Tool)
		end
	end
end

function click(detector)
	if detector then
		fireclickdetector(detector)
	end
end

function run()
	for _, SelectionPart in ipairs(food) do
		click(SelectionPart)
	end
end

_G.s = not _G.s

notify("Toggle", tostring(_G.s), 3,)
notify("Credits", "Script made by k5utils on discord", 3)

if game.PlaceId == 369152986 then
	if fireclickdetector then
		if _G.s then
			if #food == 8 then
				for i=1,30 do
					if _G.s == false then break end
					run()
					task.wait(2)
				end
				notify("Success", "Finished generating food", 2.5)

				grabtools()
				task.wait(1.1)
				Humanoid:UnequipTools()
			else
				notify("Food Generator - Error", "Not enough vending machine parts found", 4)
			end
		end
	else
		notify("Unsupported Executor", "fireclickdetector is not supported on your executor!", 4)
	end
else
	notify("Unsupported Game",'This game only works on:',4)
	notify("Unsupported Game",'Bullying: A Roleplay Story',4)
end
