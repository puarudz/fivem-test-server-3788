local defaultModel = 'mp_m_freemode_01'
local spawnPos = vector4(456.09, 6565.5, 27.0, 257.35)
local firstSpawn = true

-- Pre-load model
local modelHash = GetHashKey(defaultModel)
RequestModel(modelHash)
while not HasModelLoaded(modelHash) do Wait(10) end

AddEventHandler('playerSpawned', function()
    -- Freeze to prevent running in place
    local ped = PlayerPedId()
    FreezeEntityPosition(ped, true)

    if firstSpawn then
        firstSpawn = false
        if GetEntityModel(ped) ~= modelHash then
            SetPlayerModel(PlayerId(), modelHash)
            -- re-get ped after model change
            ped = PlayerPedId()
            SetPedDefaultComponentVariation(ped)
        end
    end

    -- Get ground Z and teleport
    local found, groundZ = GetGroundZFor_3dCoord(spawnPos.x, spawnPos.y, 1000.0, false)
    if not found then groundZ = spawnPos.z end
    local finalZ = math.max(groundZ, spawnPos.z) + 0.5

    SetEntityCoords(ped, spawnPos.x, spawnPos.y, finalZ, false, false, false, false)
    SetEntityHeading(ped, spawnPos.w)

    Wait(200)
    FreezeEntityPosition(ped, false)
    TriggerEvent('chat:addMessage', { args = { '^2[Spawn] ^7Chao mung den Samael City!' } })
end)