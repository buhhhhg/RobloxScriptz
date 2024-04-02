repeat wait() until game:IsLoaded()

function setname(name)
	args = {
		[1] = tostring(name)
	}

	game:GetService("ReplicatedStorage"):WaitForChild("SetRoleplayName"):InvokeServer(unpack(args))
end

function notif(title, desc, dur)
	game:GetService("StarterGui"):SetCore("SendNotification",{
		Title = title,
		Text = desc,
		Duration = dur,
	})
end

arrow_spinner = {
	"⠋",
	"⠙",
	"⠹",
	"⠸",
	"⠼",
	"⠴",
	"⠦",
	"⠧",
	"⠇",
	"⠏"
}

if _G.s == true then
	notif("Arrow Spin", "Turned on", 1.5)
elseif _G.s == false then
	notif("Arrow Spin", "Turned off", 1.5)
end

while _G.s do
	for arrow in arrow_spinner do
		setname(_G.name .. arrow)
	end
	wait(_G.delay)
end