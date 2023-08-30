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
	notif('how?', 'patching glitch - figurecampos ...', 2.6)
	notif('how?', '... player found.', 2.6)
	figurecamposchar:Destroy()
	wait()
	notif('bruh?', 'patched glitch, you can ...', 2.6)
	notif('bruh?', '... pass door 50 now!', 2.6)
else
	notif('noob', 'FigureCamPos player not found', 3.5)
end
