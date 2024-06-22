local players
local time

print('\x1b[31mDVN-SERVERNAME \x1b[37m-\x1b[32m Started successfully!')

Citizen.CreateThread(function()
    while true do
        Wait(2000)
        time = os.date("%H") .. ":" .. os.date("%M")
        players = GetPlayers()
        count = #players
        TriggerClientEvent('dvn-servername:cl:getPlayerCount', -1, count, time)
    end
end)