-- /car [model] - spawn vehicle
RegisterCommand('car', function(source, args)
    local model = args[1]
    if not model or model == '' then
        TriggerEvent('chat:addMessage', { args = { '^1[ERROR] ^7Usage: /car [model]' } })
        return
    end
    local hash = GetHashKey(model)
    if not IsModelInCdimage(hash) or not IsModelAVehicle(hash) then
        TriggerEvent('chat:addMessage', { args = { '^1[ERROR] ^7Vehicle not found: ' .. model } })
        return
    end
    RequestModel(hash)
    while not HasModelLoaded(hash) do Wait(10) end
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local heading = GetEntityHeading(ped)
    local veh = CreateVehicle(hash, coords.x + 2, coords.y, coords.z, heading, true, false)
    SetPedIntoVehicle(ped, veh, -1)
    SetVehicleNumberPlateText(veh, 'CAR')
    SetModelAsNoLongerNeeded(hash)
    TriggerEvent('chat:addMessage', { args = { '^2[OK] ^7Spawned: ' .. model } })
end, false)

-- /dv - delete current vehicle
RegisterCommand('dv', function()
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, false)
    if veh == 0 then
        TriggerEvent('chat:addMessage', { args = { '^1[ERROR] ^7You are not in a vehicle!' } })
        return
    end
    DeleteEntity(veh)
    TriggerEvent('chat:addMessage', { args = { '^2[OK] ^7Vehicle deleted.' } })
end, false)

-- /fix - repair vehicle
RegisterCommand('fix', function()
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, false)
    if veh == 0 then
        TriggerEvent('chat:addMessage', { args = { '^1[ERROR] ^7You are not in a vehicle!' } })
        return
    end
    SetVehicleFixed(veh)
    SetVehicleDeformationFixed(veh)
    SetVehicleEngineHealth(veh, 1000.0)
    TriggerEvent('chat:addMessage', { args = { '^2[OK] ^7Vehicle repaired.' } })
end, false)

-- /tpm - teleport to waypoint
RegisterCommand('tpm', function()
    local waypoint = GetFirstBlipInfoId(8)
    if not DoesBlipExist(waypoint) then
        TriggerEvent('chat:addMessage', { args = { '^1[ERROR] ^7No waypoint set on map!' } })
        return
    end
    local coords = GetBlipInfoIdCoord(waypoint)
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, false)
    local found, z = GetGroundZFor_3dCoord(coords.x, coords.y, 1000.0, false)
    if not found then z = coords.z end
    if veh ~= 0 then
        SetEntityCoords(veh, coords.x, coords.y, z + 1.0, false, false, false, false)
    else
        SetEntityCoords(ped, coords.x, coords.y, z + 1.0, false, false, false, false)
    end
    TriggerEvent('chat:addMessage', { args = { '^2[OK] ^7Teleported to waypoint.' } })
end, false)

TriggerEvent('chat:addSuggestion', '/car', 'Spawn a vehicle', {
    { name = 'model', help = 'e.g. adder, zentorno' }
})
TriggerEvent('chat:addSuggestion', '/dv', 'Delete current vehicle')
TriggerEvent('chat:addSuggestion', '/fix', 'Repair current vehicle')
TriggerEvent('chat:addSuggestion', '/tpm', 'Teleport to waypoint')