 
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
				label = "Buy chips",
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
                menu = 'jetonshopopen2',
                description = 'buy chips!', 
                
            },
            {
                title = '💰Sell',
                description = 'sell chips',
                event = 'jetonshop:sell', 
            }
        },
        {
            id = 'jetonshopopen2',
            title = 'Buy chips',
            menu = 'jetonshop',
            options = {
                {
                    title = '🛒Chips',
                    description = 'Buy x10',
                    event = 'jetonshop:jetonten', 
                },
                {
                    title = '🛒Chips',
                    description = 'Buy x100',
                    event = 'jetonshop:jetontenn', 
                },
                {
                    title = '🛒Chips',
                    description = 'Buy x1000',
                    event = 'jetonshop:jetontennn', 
                },
                {
                    title = '🛒Chips',
                    description = 'Buy x10000',
                    event = 'jetonshop:jetontennnn', 
                },
            }
        }
    })
    lib.showContext('jetonshop')

end)

   


RegisterNetEvent('jetonshop:jetonten')
AddEventHandler('jetonshop:jetonten', function()

    TriggerServerEvent('jeton:add')
            
end) 

RegisterNetEvent('jetonshop:jetontenn')
AddEventHandler('jetonshop:jetontenn', function()

    TriggerServerEvent('jeton:addd')
            
end) 

RegisterNetEvent('jetonshop:jetontennn')
AddEventHandler('jetonshop:jetontennn', function()

    TriggerServerEvent('jeton:adddd')
            
end) 


RegisterNetEvent('jetonshop:jetontennnn')
AddEventHandler('jetonshop:jetontennnn', function()

    TriggerServerEvent('jeton:addddd')
            
end) 


RegisterNetEvent('jetonshop:sell')
AddEventHandler('jetonshop:sell', function()

    TriggerServerEvent('jeton:sellall')
            
end) 
