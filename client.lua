local coords 
local setspawn, r = 'j', 'k' -- Change The Key Here

function ShowAboveRadarMessage(message)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(message)
	DrawNotification(0,1)
end
-- Credit Go To jamesbron, For Notification

RegisterCommand('setspawn', function()
    local ped = PlayerPedId()
    local coord = GetEntityCoords(ped)
    TriggerEvent('chat:addSuggestion', '/setspawn', 'Setspawn Point', {})
    coords = coord
    ShowAboveRadarMessage('~g~~bold~Spawnpoint~s~ set')
end, false)

RegisterCommand('r', function()
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)
    local seat = 
    TriggerEvent('chat:addSuggestion', '/r', 'Return To Spawn Point', {})
    if coords ~= nil then 
        if IsPedInAnyVehicle(ped, true) then
            if GetPedInVehicleSeat(vehicle, -1) then
                SetEntityCoords(ped, coords, false, false, false, false)
                SetEntityCoordsNoOffset(vehicle, coords, 0, 0, 1)
                SetPedIntoVehicle(ped, vehicle, -1)
                ShowAboveRadarMessage('~g~~bold~Returned~s~ To Coordinat Point')
            elseif not GetPedInVehicleSeat(vehicle, -1) then
                ShowAboveRadarMessage('You Not In Driver Seat')
            end
        else
            SetEntityCoords(ped, coords, false, false, false, false)
            ShowAboveRadarMessage('~g~~bold~Returned~s~ To Coordinat Point')
        end
    else
        ShowAboveRadarMessage('~r~~bold~No Spawn Point Detected')
    end
end, false)

RegisterCommand('deletecoords', function()
    if coords ~= nil then
        coords = nil
        ShowAboveRadarMessage('Spawn Point ~r~~bold~Deleted')
    else 
        ShowAboveRadarMessage('~r~~bold~No Spawn Point Detected')
    end
end, false)

RegisterKeyMapping('setspawn', 'Setspawn', 'keyboard', setspawn)
RegisterKeyMapping('r', 'Return Spawn', 'keyboard', r)