local spawned = false
local defaultModel = 'mp_m_freemode_01'
local spawnPos = vector4(456.09, 6565.5, 27.0, 257.35)

AddEventHandler('playerSpawned', function()
    if not spawned then
        spawned = true
        Wait(500)
        local ped = PlayerPedId()
        local model = GetHashKey(defaultModel)
        RequestModel(model)
        while not HasModelLoaded(model) do Wait(10) end
        SetPlayerModel(PlayerId(), model)
        SetPedDefaultComponentVariation(ped)
        SetModelAsNoLongerNeeded(model)
        Wait(100)
        SetEntityCoords(ped, spawnPos.x, spawnPos.y, spawnPos.z, false, false, false, false)
        SetEntityHeading(ped, spawnPos.w)
        TriggerEvent('chat:addMessage', { args = { '^2[Spawn] ^7Chào mừng đến Samael City!' } })
    end
end)

-- Respawn at same location on death
AddEventHandler('onClientMapStart', function()
    -- allow respawn
end)