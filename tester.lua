function notif(title, desc)
    game:GetService("StarterGui"):SetCore("SendNotification",{
        Title = title,
        Text = desc,
    })
end

function ran(title, desc)
    notif(title, "✔ "..desc)
end

function err(title, desc)
    notif(title, "❌ "..desc)
end

if setclipboard then
    ran("clipboard","Test ran successfully!")
else
    err("clipboard","Test ran successfully!")
end

-- more coming later
