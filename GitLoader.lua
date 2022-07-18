-- K5's GitLoader
-- Credits to bloodball

local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/sol"))()

local win = Lib:New({
  Name = "K5 GitLoader",
  FolderToSave = "GitLoader"
})

local tab = win:Tab("Hubs")

local sec = tab:Section("Scripts")

sec:Button("Arctic Hub Remade", function()
	Lib:Notification("GitLoader", "Loaded Arctic Hub Remade.")
	loadstring(game:HttpGet("https://raw.githubusercontent.com/C5Hax/RobloxScriptz/main/GitLoader.lua"))()
end)

sec:Button("K5Hub", function()
	Lib:Notification("GitLoader", "Loaded K5Hub.")
	loadstring(game:HttpGet("https://raw.githubusercontent.com/C5Hax/RobloxScriptz/main/K5Hub.lua"))()
end)

sec:Button("C5Hub DH", function()
	Lib:Notification("GitLoader", "Loaded C5Hub DH.")
	loadstring(game:HttpGet("https://raw.githubusercontent.com/C5Hax/RobloxScriptz/main/C5Hub%20Da%20Hood"))()
end)

sec:Button("C5Hub Universal", function()
	Lib:Notification("GitLoader", "Loaded C5Hub Universal.")
	loadstring(game:HttpGet("https://raw.githubusercontent.com/C5Hax/RobloxScriptz/main/C5Hub%20Universal.lua"))()
end)
--
local tab2 = win:Tab("Other Scripts/Executors")

local sect2 = tab:Section("Scripts")

sect2:Button("Infinite Yield", function()
	Lib:Notification("GitLoader", "Loaded Inf Yield.")
end)

local sec2 = tab:Section("Executors")

sec2:Button("Moonify Executor", function()
  Lib:Notification("GitLoader", "Set your clipboard to download link.")
  setclipboard("https://moonify.lol/home")
end)
