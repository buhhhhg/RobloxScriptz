function notif(title, description, duration)
	game:GetService("StarterGui"):SetCore("SendNotification",{
		Title = title or 'Food Generator',
		Text = description or '',
		Duration = duration or 2,
	})
end

if not game:IsLoaded() then
	notif(nil, "Waiting for the game to load..", 2.5)
	start_time = os.time()
	game.Loaded:Wait()
	end_time = os.time()
	notif(nil, "Game loaded in "..tostring(end_time-start_time).."seconds", 1.9)
end

SelectionList = {}
for i=1, 8 do
	-- part = workspace['SnackMachine']['Selection'..tostring(i)]['ClickDetector']
	part = workspace['SnackMachine']['Selection'..tostring(i)]

	if part then
		table.insert(SelectionList, part)
	else
		notif(nil, "Selection Part #"..tostring(i).." not found!", 2)
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
	if detector and fireclickdetector then
		fireclickdetector(detector)
	end
end

function run()
	for _, SelectionPart in ipairs(SelectionList) do
		click(SelectionPart)
	end
end

_G.s = not _G.s

notif("Toggle", tostring(_G.s), 3)
notif("Credits", "Script made by k5utils on discord", 3)

function main()
	if not game.PlaceId == 369152986 then
		notif("Unsupported Game", "This game only works on:", 4)
		notif("Unsupported Game", "Bullying: A Roleplay Story", 4)
		return
	end

	if not fireclickdetector then
		notif("Unsupported Executor", "fireclickdetector is not supported on your executor!", 4)
		return
	end

	if #SelectionList < 8 then
		notif("Error", "how are the click parts below 8?? rejoin i guess", 4)
		return
	end

	for i = 1, 30 do -- 30 * 8 = total amount of tools (240)
		if _G.s == false then break end
		run()
		task.wait(1.55)
	end
	notif("Success", "Finished generating food", 2.5)

	grabtools()
	task.wait(1.1)
	Humanoid:UnequipTools()
end

if _G.s then
	main()
end

if not _G.s then
	Humanoid:UnequipTools()
end
