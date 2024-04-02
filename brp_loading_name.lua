repeat wait() until game:IsLoaded()

local function setname(name)
	args = {
		[1] = tostring(name)
	}

	game:GetService("ReplicatedStorage"):WaitForChild("SetRoleplayName"):InvokeServer(unpack(args))
end

arrow_spinner = {
	"←",
	"↖",
	"↑",
	"↗",
	"→",
	"↘",
	"↓",
	"↙"
}

while _G.s do
	for arrow in arrow_spinner do
		setname(_G.name .. arrow)
	end
	wait(_G.delay)
end