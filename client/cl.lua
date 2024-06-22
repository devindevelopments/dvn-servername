local players
local clock
local loaded = false

function DrawTxt(text, x, y, r, g, b)
	SetTextColour(r, g, b,200)
	SetTextFont(4)
	SetTextScale(0, 0.5)
	SetTextWrap(0.0, 1.0)
	SetTextOutline()
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x, y)
end

RegisterNetEvent('dvn-servername:cl:getPlayerCount', function(count, time)
	players = count
	clock = time
end)

-- Check Framework
if Config.Framework == 'QBCore' or framework == 'QBCore' then
	RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
		loaded = true
	end)
elseif Config.Framework == 'ESX' or framework == 'ESX' then
	RegisterNetEvent('esx:playerLoaded', function()
		loaded = true
	end)
else
	loaded = true
end

Citizen.CreateThread(function()
	while true do
		Wait(1)
		if loaded then
			DrawTxt(Config.Text1 .. " - ", Config.Offset.x, Config.Offset.y, Config.Color.r, Config.Color.g, Config.Color.b)
			DrawTxt(Config.Text2, Config.Offset2.x, Config.Offset2.y, Config.Color2.r, Config.Color2.g, Config.Color2.b)
			DrawTxt(" - " .. tostring(players) .. "/" .. Config.PlayerCount, Config.Offset3.x, Config.Offset3.y, Config.Color.r, Config.Color.g, Config.Color.b)
			if Config.Time then
				DrawTxt(" - " .. tostring(clock), Config.Offset4.x, Config.Offset4.y, Config.Color.r, Config.Color.g, Config.Color.b)
			end
		end
	end
end)
