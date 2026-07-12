-- Auto shutdown loading screen
local shutdown = false
Citizen.CreateThread(function()
    while not shutdown do
        Wait(0)
        if NetworkIsSessionStarted() then
            ShutdownLoadingScreenNui()
            shutdown = true
        end
    end
end)