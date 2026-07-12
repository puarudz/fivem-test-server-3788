local defaultModel = 'mp_m_freemode_01'
local spawnPos = vector4(456.09, 6565.5, 27.0, 257.35)
local firstSpawn = true

AddEventHandler('playerSpawned', function()
    Wait(100)
    local ped = PlayerPedId()

    -- Set model on first spawn only
    if firstSpawn then
        firstSpawn = false
        local model = GetHashKey(defaultModel)
        if GetEntityModel(ped) ~= model then
            RequestModel(model)
            while not HasModelLoaded(model) do Wait(10) end
            SetPlayerModel(PlayerId(), model)
            SetPedDefaultComponentVariation(ped)
            SetModelAsNoLongerNeeded(model)
        end
    end

    Wait(500)
    SetEntityCoords(ped, spawnPos.x, spawnPos.y, spawnPos.z, false, false, false, false)
    SetEntityHeading(ped, spawnPos.w)
    TriggerEvent('chat:addMessage', { args = { '^2[Spawn] ^7Chào mừng đến Samael City!' } })
end)