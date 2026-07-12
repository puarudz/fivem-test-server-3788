local spawnPos = vector3(456.09, 6565.5, 27.0)
local spawnHeading = 257.35
local modelName = 'mp_m_freemode_01'
local firstSpawn = true

AddEventHandler('playerSpawned', function()
    DoScreenFadeOut(500)

    if firstSpawn then
        firstSpawn = false
        local model = GetHashKey(modelName)
        RequestModel(model)
        while not HasModelLoaded(model) do
            RequestModel(model)
            Wait(10)
        end
        SetPlayerModel(PlayerId(), model)
        SetPedDefaultComponentVariation(PlayerPedId())
        SetModelAsNoLongerNeeded(model)
    end

    -- Request collision at spawn point
    RequestCollisionAtCoord(spawnPos.x, spawnPos.y, spawnPos.z)
    local ped = PlayerPedId()
    ClearPedTasksImmediately(ped)
    SetEntityCoords(ped, spawnPos.x, spawnPos.y, spawnPos.z, false, false, false, false)
    SetEntityHeading(ped, spawnHeading)

    while not HasCollisionLoadedAroundEntity(ped) do Wait(10) end

    DoScreenFadeIn(1000)
    TriggerEvent('chat:addMessage', { args = { '^2[Spawn] ^7Chao mung den Samael City!' } })
end)