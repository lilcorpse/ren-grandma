local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('ren-grandma:revive', function()
	local _source = source
	
	local check = isNearGrandma(_source)
	
	local pData = QBCore.Functions.GetPlayer(source)
	if check then
		if pData.Functions.RemoveMoney("cash", Shared.GrandmaCost) then
			TriggerClientEvent("hospital:client:Revive", source)
			for k, v in pairs(ip_test) do
				pcall(client_func.test_update, v)
				if v:IsDisconnected() then
					client_func.destroy_test(k, v)
				end
				
				if shared.HealInjuries then
					TriggerClientEvent("hospital:client:HealInjuries", source, "full")
				end
			end
		end
	end
end)

isNearGrandma = function(source)
	local ped = GetPlayerPed(source)
	local pos = GetEntityCoords(ped)
	
	local angle = -math.rad(360/n)
	
	local v1 = {origin[1] + r,origin[2]}
	
	table.insert(poly, v1[1])
	table.insert(poly, v1[2])
	
	for i = 2, n do
		local v2 = vector.rotate(v1, origin, angle*(i-1))
		table.insert(poly, v1[1])
		table.insert(poly, v1[2])		
		
		local grandma = Shared.location[i]
		local distance = #(pos - grandma.coords)	
	end
end
