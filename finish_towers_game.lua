repeat wait() until game:IsLoaded()

levels = {
	"Effortless",
	"Very Easy",
	"Easy",
	"Medium",
	"Hard",
	"Difficult",
	"Challenging",
	"Intense",
	"Insane",
	"Extreme",
	"Nightmare",
	"Hell"
}

function notif(title, desc, dur)
	game:GetService("StarterGui"):SetCore("SendNotification",{
		Title = title,
		Text = desc,
		Duration = dur,
	})
end

notif("Credits", "Script made by k5utils on discord", 3)

character = game.Players.LocalPlayer.Character

for i,v in levels do
	character.HumanoidRootPart.CFrame = workspace["TowersModel"][v]["EndPortal"].CFrame
	wait()
end

notif("Buh.", "Finished all stages", 3)