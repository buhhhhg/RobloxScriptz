-- fixes FigureCamPos glitch when using -

-- - FigureCamPos account.

repeat wait() until game:IsLoaded()
local StarterGui = game:GetService("StarterGui")

function notif(title, desc, dur)
	StarterGui:SetCore("SendNotification",{
		Title = title,
		Text = desc,
		Duration = dur,
	})
end

local figurecamposplayer = game:GetService("Players")["FigureCamPos"]
local figurecamposchar = figurecamposplayer.Character

notif('creds', 'shit script made by k5utils', 10)

notif('bruh', 'note that this is very useless ngl', 2)
if figurecamposplayer then
	notif('how?', 'patching glitch', 2.6)
	figurecamposchar:Destroy()
	wait()
	notif('bruh?', 'patched glitch', 2.6)
else
	notif('noob', 'FigureCamPos player not found', 3.5)
end
