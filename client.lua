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
    TriggerEvent("chat:addSuggestion", "/Set Coordinat Point For Return")
    coords = coord
    ShowAboveRadarMessage('~g~Spawnpoint set')
end, false)

RegisterCommand('r', function()
    local ped = PlayerPedId()
    TriggerEvent("chat:addSuggestion", "/Return To Coordinat Point You've Set")
    if coords ~= nil then 
        SetEntityCoords(ped, coords, false, false, false, false)
        ShowAboveRadarMessage('Returned To Coordinat Point')
    else
        ShowAboveRadarMessage('No Spawn Point Detected')
    end
end, false)

RegisterCommand('deletecoords', function()
    coords = nil
end, false)

RegisterKeyMapping('setspawn', 'Setspawn', 'keyboard', setspawn)
RegisterKeyMapping('r', 'Return Spawn', 'keyboard', r)