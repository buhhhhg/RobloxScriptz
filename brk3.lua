repeat wait() until game:IsLoaded()

local function rpname(name)
	local args = {
		[1] = "RolePlayName",
		[2] = tostring(name)
	}

	game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1RPNam1eTex1t"):FireServer(unpack(args))
end

function generateFrames(starting_string)
    local frames = {}
    local baseLength = #starting_string

    for i = baseLength, 1, -1 do
        table.insert(frames, starting_string:sub(1, i))
    end

    for i = 2, baseLength do
        table.insert(frames, frames[i])
    end

    for i = #frames, 1, -1 do
        table.insert(frames, frames[i])
    end

    return frames
end

frames = generateFrames("TTK on top!")

while _G.s do
	for _, frame in pairs(frames) do
		if _G.s == false then break end
		rpname(frame)
		wait(0.05)
	end
	wait(0.01)
end