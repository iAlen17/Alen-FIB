
local QBCore = exports['qb-core']:GetCoreObject()

discord = {
    ['webhook'] = 'webhook',
    ['name'] = 'FIB Heist Logs',
    ['image'] = 'https://cdn.discordapp.com/attachments/774536621802389544/899986988386623498/logo.png'
}


QBCore.Functions.CreateCallback('AlenFIB:MathCops', function(source, cb)
    local Players = QBCore.Functions.GetPlayers()
    local cops = 0
    for i = 1, #Players do
        local Player = QBCore.Functions.GetPlayer(Players[i])
        if Player.PlayerData.job.name == 'police' then
            cops = cops + 1
        end
    end
    cb(cops)
end)

RegisterServerEvent('Fib_SV:PlayOnSourceTest')
AddEventHandler('Fib_SV:PlayOnSourceTest', function(soundFile, soundVolume)
    TriggerClientEvent('Fib_CL:PlayOnOneTest', source, soundFile, soundVolume)
end)

RegisterServerEvent('AlenFIB:Done')
AddEventHandler('AlenFIB:Done', function(cash)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    sendtodiscordaslog(Player.PlayerData.name ..  ' - ' .. Player.PlayerData.license .. ' - ' .. Player.PlayerData.job.name, ' Is doing the FIB Heist')
    Player.Functions.AddItem('printedcash',Config['PrintedCash'])
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['printedcash'], 'add')
end)

RegisterServerEvent('AlenFIB:Reward')
AddEventHandler('AlenFIB:Reward', function(cash)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.GetItemByName('printedcash') ~= nil then
        Player.Functions.RemoveItem('printedcash',1)
        Player.Functions.AddMoney('cash',Config['Reward'])
        TriggerClientEvent('QBCore:Notify', src, 'You have successfully completed the Mission and you have earned your reward you can now go back to Los Santos', 'success')
        sendtodiscordaslog(Player.PlayerData.name ..  ' - ' .. Player.PlayerData.license .. ' - ' .. Player.PlayerData.job.name, ' Claimed his/her reward for the FIB Heist Mission')
    end
end)

RegisterServerEvent('AlenFIB:PoliceCall')
AddEventHandler('AlenFIB:PoliceCall', function()
    local Players = QBCore.Functions.GetPlayers()
    for i = 1, #Players do
        local Player = QBCore.Functions.GetPlayer(Players[i])
        if Player.PlayerData.job.name == 'police' then
            TriggerClientEvent('AlenFIB:Test', Players[i])
        end
    end
end)

QBCore.Functions.CreateCallback('AlenFIB:check', function(source, cb)
	cb(true)
end)

QBCore.Functions.CreateCallback('AlenFIB:JustLock', function(source, cb)
	cb(locked)
end)

RegisterServerEvent('AlenFIB:FreezeIt')
AddEventHandler('AlenFIB:FreezeIt', function(status)
	xd = status
	TriggerCleitnEvent('AlenFIB:OnDoorUpdate', -1, xd)
end)

RegisterServerEvent('AlenFIB:OpenDoor')
AddEventHandler('AlenFIB:OpenDoor', function()
	locked = false
	TriggerClientEvent('AlenFIB:LockStatus', -1, locked)
end)

RegisterServerEvent('AlenFIB:PoliceLock')
AddEventHandler('AlenFIB:PoliceLock', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	if Player.PlayerData.job.name == 'police' then
		locked = true
		TriggerClientEvent('AlenFIB:LockStatus', -1, locked)
	end
end)

QBCore.Commands.Add("lockfib", "Lock The FIB Door", {}, false, function(source, args)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player ~= nil then 
        if (Player.PlayerData.job.name == "police") then
  		locked = true
		TriggerClientEvent('AlenFIB:LockStatus', -1, locked)
        end
    end
end)

QBCore.Commands.Add("travelny", "Travel to North Yankton and get those criminals", {}, false, function(source, args)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player ~= nil then 
        if (Player.PlayerData.job.name == "police") then
          TriggerClientEvent('flypolice', source)
          sendtodiscordaslog(Player.PlayerData.name ..  ' - ' .. Player.PlayerData.license .. ' - ' .. Player.PlayerData.job.name, ' Officer Reached North Yankton')
        end
    end
end)

function sendtodiscordaslog(name, message)
    local data = {
        {
            ["color"] = '3553600',
            ["title"] = "**".. name .."**",
            ["description"] = message,
        }
    }
    PerformHttpRequest(discord['webhook'], function(err, text, headers) end, 'POST', json.encode({username = discord['name'], embeds = data, avatar_url = discord['image']}), { ['Content-Type'] = 'application/json' })
end
