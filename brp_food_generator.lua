repeat wait() until game:IsLoaded()

function main()
	local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Consistt/Ui/main/UnLeaked"))()

	local Wm = library:Watermark("BRP Food Generator | Library Version " .. library.version ..  " | " .. library:GetUsername())

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

	_G.s = false
	_G.filter = 0
	_G.amount = 0

	-- setup players
	local plrs = game:GetService("Players")
	local lp = plrs.LocalPlayer

	local char = lp.Character

	local humanoid = char.Humanoid
	local root = char:FindFirstChild("HumanoidRootPart")

	local function eqtools()
		for i,v in pairs(lp:FindFirstChildOfClass("Backpack"):GetChildren()) do
			if v:IsA("Tool") or v:IsA("HopperBin") then
				v.Parent = lp.Character
			end
		end
	end

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
		if _G.filter ~= 0 then
			click(food[_G.filter])
		else
			for i,v in pairs(food) do
				click(v)
			end
		end

		grabtools()
		wait()
		grabtools()
		wait()
		humanoid:UnequipTools()
		wait()
		humanoid:UnequipTools()
	end

	function run2()
		if _G.filter ~= 0 then
			click(food[_G.filter])
		else
			for i,v in pairs(food) do
				click(v)
			end
		end
	end

	function realrun()
		while _G.s == true do
			if _G.filter ~= 0 then
				click(food[_G.filter])
			else
				for i,v in pairs(food) do
					click(v)
				end
			end

			grabtools()
			wait()
			grabtools()
			wait()
			humanoid:UnequipTools()
			wait()
			humanoid:UnequipTools()
			wait(3)
		end
	end

	local Notif = library:InitNotifications()

	task.wait(0.05)
	local LoadingXSX = Notif:Notify("Loading xsx lib v"..library.version..", please be patient.", 3, "information") -- notification, alert, error, success, information

	library.title = "Script"

	library:Introduction()
	wait(1)
	local Init = library:Init()

	local fs = Init:NewTab("BRP Food Generator - Script by `k5utils`")

	local Section1 = fs:NewSection("Script by `k5utils` on discord!")

	local start = fs:NewToggle("Start/Stop script", false, function(value)
		local vers = value and true or false
		_G.s = vers

		if _G.s == true then
			text = "Started script!"
		elseif _G.s == false then
			text = "Stopped script!"
		end
		Notif:Notify(text, 2, "information") -- (information, notification, alert, error, success)
	end)

	local realstart = fs:NewButton("Generate food", function()
		run()
		wait()
		Notif:Notify("Generated!", 3, 'success')
	end)

	local realstart2 = fs:NewButton("Generate food (no pickup)", function()
		run2()
		wait()
		Notif:Notify("Generated!", 3, 'success')
	end)

	local finalstart = fs:NewButton("Start generating food", function()
		Notif:Notify("Started generating", 3, 'information')
		wait()
		realrun()
	end)

	local selectfilter = fs:NewSelector("Filters", "filter here..", {
		"Soda",
		"Soda (2)",
		"Soda (3)",
		"Burger",
		"Coffee",
		"Sandwich",
		"Cake",
		"Waffle",
		"All food"
	}, function(d)

		if d == "Soda" then
			_G.filter = 1
			Notif:Notify("Only generating "..d.." only", 2, "information")
		elseif d == "Soda (2)" then
			_G.filter = 2
			Notif:Notify("Only generating "..d.." only", 2, "information")
		elseif d == "Soda (3)" then
			_G.filter = 3
			Notif:Notify("Only generating "..d.." only", 2, "information")
		elseif d == "Burger" then
			_G.filter = 4
			Notif:Notify("Only generating "..d.." only", 2, "information")
		elseif d == "Coffee" then
			_G.filter = 5
			Notif:Notify("Only generating "..d.." only", 2, "information")
		elseif d == "Sandwich" then
			_G.filter = 6
			Notif:Notify("Only generating "..d.." only", 2, "information")
		elseif d == "Cake" then
			_G.filter = 7
			Notif:Notify("Only generating "..d.." only", 2, "information")
		elseif d == "Waffle" then
			_G.filter = 8
			Notif:Notify("Only generating "..d.." only", 2, "information")
		elseif d == "All food" then
			_G.filter = 0
			Notif:Notify("Generating every food", 2, "information")
		end
	end)

	local amnt = fs:NewSlider("Food Amount", "", true, "/", {min = 0, max = 100, default = 0}, function(value)
		_G.amount = value
		wait()
		if _G.amount ~= 0 then
			Notif:Notify("Set food generating amount to "..value, 2, 'information')
		elseif _G.amount == 0 then
			Notif:Notify("Generating food for an infinite amount of time", 2, 'information')
		end
	end)

	local rj = fs:NewButton("Rejoin", function()
		Notif:Notify("Rejoining..", 2, "alert")
		wait(0.8)
		if #plrs:GetPlayers() <= 1 then
			game:GetService("TeleportService"):Teleport(game.PlaceId, lp)
		else
			game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, lp)
		end
	end)

	local Button2 = fs:NewButton("Destroy GUI", function()
		library:Remove()
	end)

	local gtool = fs:NewButton("Grab food", function()
		grabtools()
		humanoid:UnequipTools()
		wait()
		Notif:Notify("Grabbed all food", 2, "information")
	end)

	local iy = fs:NewButton("Load Infinite Yield", function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
		wait()
		Notif:Notify("Loaded IY successfully!", 2, "success")
	end)

	local hide = fs:NewKeybind("Show/Hide GUI", Enum.KeyCode.R, function(key)
		Init:UpdateKeybind(Enum.KeyCode[key])
	end)

	local FinishedLoading = Notif:Notify("Loaded - Script by `k5utils` on discord!", 4, "success")
end

function notif(title, desc, dur)
	game:GetService("StarterGui"):SetCore("SendNotification",{
		Title = title,
		Text = desc,
		Duration = dur,
	})
end

if game.PlaceId == 369152986 then
	main()
else
	notif("you stupid",'script by `k5utils` on discord',6)
	notif("you stupid",'this game only works on:',4)
	notif("you stupid",'Bullying: A Roleplay Story',4)
end
