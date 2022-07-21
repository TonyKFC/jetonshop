 
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
				label = "购买筹码",
			},
 
		},
		distance = 1.5
})

 

--[[RegisterNetEvent("jetonshop:open", function()
    TriggerEvent("nh-context:createMenu", {
        {
            header = "商店",
        },
        {
            header = "筹码商店",
            context = "🛒购买筹码",
            event = "jetonshop:open2", 
       
        },
        {
            header = "筹码商店",
            context = "💰出售筹码",
            event = "jetonshop:sell", 
       
        }
    })
end)

 RegisterNetEvent('jetonshop:open2', function()
    TriggerEvent('nh-context:createMenu', {
        {
            header = "< 返回",
            event = "jetonshop:open"
        },
        {
            header = "筹码",
            context = "🛒10个",
            event = "jetonshop:jetonten", 
        },
        {
            header = "筹码",
            context = "🛒100个",
            event = "jetonshop:jetontenn", 
        },
        {
            header = "筹码",
            context = "🛒1000个",
            event = "jetonshop:jetontennn", 
        },
        {
            header = "筹码",
            context = "🛒10000个",
            event = "jetonshop:jetontennnn", 
        },
    })
end)]]

RegisterNetEvent("jetonshop:open", function() 

     
    lib.registerContext({
        id = 'jetonshop',
        title = '赌场商店',
        onExit = function()
            print('Hello there')
        end,
        options = {
    
 
            {
                title = '🛒购买',
                menu = 'jetonshopopen2',
                description = '购买筹码!',
                --metadata = {'购买筹码'},
                
            },
            {
                title = '💰出售',
                description = '出售筹码',
                event = 'jetonshop:sell',
              --  metadata = {'出售筹码'}
            }
        },
        {
            id = 'jetonshopopen2',
            title = '购买筹码',
            menu = 'jetonshop',
            options = {
                {
                    title = '🛒筹码',
                    description = '购买10筹码',
                    event = 'jetonshop:jetonten', 
                },
                {
                    title = '🛒筹码',
                    description = '购买100筹码',
                    event = 'jetonshop:jetontenn', 
                },
                {
                    title = '🛒筹码',
                    description = '购买1000筹码',
                    event = 'jetonshop:jetontennn', 
                },
                {
                    title = '筹码',
                    description = '购买10000筹码',
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