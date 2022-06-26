local prefix = K5!!
local premOwner = "KudaGamer278"

local premUser2 = {
	"KudaGamer278",
	""	
}
--

local premUser = {
	"2261300976",
	""
}
--

-- Premium Users
-- credit to maxbrh1 / MastersMZ | the site i got the code from is https://controlc.com/5a7a6fe2
premUser2.Chatted:Connect(function(msg)
	msg = msg:lower()
	if string.sub(msg,1,3) == "/e " then
		msg = string.sub(msg,4)
	end
	if string.sub(msg,1,1) == prefix then
		local cmd
		local space = string.find(msg," ")
		if space then
			cmd = string.sub(msg,2,space-1)
		else
			cmd = string.sub(msg,2)
		end
--
