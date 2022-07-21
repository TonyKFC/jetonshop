 
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	
	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	ESX.PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)

exports.qtarget:AddBoxZone("jetonshop", vector3(1116.092285, 220.035172, -49.442505), 2.5, 2.5, {
	name="jetonshop",
	heading=263.622070,
	debugPoly=false,
	minZ=-100,
	maxZ=100,
	}, {
		options = {
			{
				event = "jetonshop:open",
				icon = "fas fa-coins",
				label = "Exchange Chips",
			},
 
		},
		distance = 1.5
})

 
RegisterNetEvent("jetonshop:open", function() 

     
    lib.registerContext({
        id = 'jetonshop',
        title = 'Casino shop',
        onExit = function()
            print('Hello there')
        end,
        options = {
    
 
            {
                title = '🛒Buy',
                description = 'buy chips!',
                event = 'jetonshop:buyChips'
                
            },
            {
                title = '💰Sell',
                description = 'sell chips',
                event = 'jetonshop:sell', 
            }
        }
    })
    lib.showContext('jetonshop')

end)

AddEventHandler('jetonshop:buyChips', function()
    local input = lib.inputDialog('Buy Chips / $100 each', {'Amount'})
    if input then
        local amount = math.floor(input[1])
        if amount > 0 then
            TriggerServerEvent('jeton:add', amount)
        else
            lib.notify({
                title = 'Invalid Amount',
                description = 'Please enter a valid amount',
                type = 'error'
            })
        end
    end
end)

 
AddEventHandler('jetonshop:sell', function()

    TriggerServerEvent('jeton:sellall')
            
end) 
