-- /car [model] - spawn xe
RegisterCommand('car', function(source, args)
    local model = args[1]
    if not model or model == '' then
        TriggerEvent('chat:addMessage', { args = { '^1[L?I] ^7Dùng: /car [tên xe]' } })
        return
    end
    local hash = GetHashKey(model)
    if not IsModelInCdimage(hash) or not IsModelAVehicle(hash) then
        TriggerEvent('chat:addMessage', { args = { '^1[L?I] ^7Không t?m th?y xe: ' .. model } })
        return
    end
    RequestModel(hash)
    while not HasModelLoaded(hash) do
        Wait(10)
    end
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local heading = GetEntityHeading(ped)
    local veh = CreateVehicle(hash, coords.x + 2, coords.y, coords.z, heading, true, false)
    SetPedIntoVehicle(ped, veh, -1)
    SetVehicleNumberPlateText(veh, 'CAR')
    SetModelAsNoLongerNeeded(hash)
    TriggerEvent('chat:addMessage', { args = { '^2[OK] ^7Ð? spawn: ' .. model } })
end, false)

-- /dv - xóa xe ðang ng?i
RegisterCommand('dv', function()
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, false)
    if veh == 0 then
        TriggerEvent('chat:addMessage', { args = { '^1[L?I] ^7B?n không ? trong xe nào!' } })
        return
    end
    DeleteEntity(veh)
    TriggerEvent('chat:addMessage', { args = { '^2[OK] ^7Ð? xóa xe.' } })
end, false)

-- /fix - s?a xe
RegisterCommand('fix', function()
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, false)
    if veh == 0 then
        TriggerEvent('chat:addMessage', { args = { '^1[L?I] ^7B?n không ? trong xe nào!' } })
        return
    end
    SetVehicleFixed(veh)
    SetVehicleDeformationFixed(veh)
    SetVehicleEngineHealth(veh, 1000.0)
    TriggerEvent('chat:addMessage', { args = { '^2[OK] ^7Ð? s?a xe.' } })
end, false)

-- /tpm - teleport t?i marker trên map
RegisterCommand('tpm', function()
    local waypoint = GetFirstBlipInfoId(8)
    if not DoesBlipExist(waypoint) then
        TriggerEvent('chat:addMessage', { args = { '^1[L?I] ^7Chýa ð?t marker trên map!' } })
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
    TriggerEvent('chat:addMessage', { args = { '^2[OK] ^7Ð? d?ch chuy?n t?i marker.' } })
end, false)

TriggerEvent('chat:addSuggestion', '/car', 'Spawn xe', {
    { name = 'tên xe', help = 'vd: adder, zentorno' }
})
TriggerEvent('chat:addSuggestion', '/dv', 'Xóa xe ðang ng?i')
TriggerEvent('chat:addSuggestion', '/fix', 'S?a xe ðang ng?i')
TriggerEvent('chat:addSuggestion', '/tpm', 'D?ch chuy?n t?i marker')