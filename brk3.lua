repeat wait() until game:IsLoaded()

local function rpname(name)
	local args = {
		[1] = "RolePlayName",
		[2] = tostring(name)
	}

	game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1RPNam1eTex1t"):FireServer(unpack(args))
end

frames = {
	"[script by dev]",
	"[script by dev",
	"[script by de",
	"[script by d",
	"[script by ",
	"[script by",
	"[script b",
	"[script ",
	"[script",
	"[scrip",
	"[scri",
	"[scr",
	"[sc",
	"[s",
	"[",
	"",
	"[",
	"[s",
	"[sc",
	"[scr",
	"[scri",
	"[scrip",
	"[script",
	"[script ",
	"[script b",
	"[script by",
	"[script by d",
	"[script by de",
	"[script by dev",
	"[script by dev]",
}

while _G.s do
	for _,frame in pairs(frames) do
		rpname(frame)
		wait(0.2)
	end
	wait(0.01)
end