ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
 
RegisterServerEvent('jeton:add')
AddEventHandler('jeton:add', function()
	local money = 1000
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	 
	if  xPlayer.getAccount('money').money >= money then
		xPlayer.removeAccountMoney('money', money)
		xPlayer.addInventoryItem('jeton', 10)
		TriggerEvent('esx_addonaccount:getSharedAccount', 'society_casino', function(account)  
			account.addMoney(money)
		end)

	else	
		 
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'you dont have enough money!', length = 2500})

	end
 	
end)
 


RegisterServerEvent('jeton:addd')
AddEventHandler('jeton:addd', function()
	local money = 10000
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	 
		if  xPlayer.getAccount('money').money >= money then
			xPlayer.removeAccountMoney('money', money)
			xPlayer.addInventoryItem('jeton', 100)
			TriggerEvent('esx_addonaccount:getSharedAccount', 'society_casino', function(account)  
			account.addMoney(money)
			end)
		else	
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'you dont have enough money!', length = 2500})
		end
 
end)

RegisterServerEvent('jeton:adddd')
AddEventHandler('jeton:adddd', function()
	local money = 100000
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
 
		if  xPlayer.getAccount('money').money >= money then
			xPlayer.removeAccountMoney('money', money)
			xPlayer.addInventoryItem('jeton', 1000)
 
			TriggerEvent('esx_addonaccount:getSharedAccount', 'society_casino', function(account)  
				account.addMoney(money)
		 
			end)
 
		else	
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'you dont have enough money!', length = 2500})
		end
	 
end)


RegisterServerEvent('jeton:addddd')
AddEventHandler('jeton:addddd', function()
	local money = 1000000
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
 
		if  xPlayer.getAccount('money').money >= money then
			xPlayer.removeAccountMoney('money', money)
			xPlayer.addInventoryItem('jeton', 10000)
 
		TriggerEvent('esx_addonaccount:getSharedAccount', 'society_casino', function(account)  
			account.addMoney(money)	 
		end)
		else	
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'you dont have enough money!', length = 2500})
		end
	 
end)

  
RegisterServerEvent('jeton:sellall')
AddEventHandler('jeton:sellall', function()
	
    local xPlayer = ESX.GetPlayerFromId(source)
    local jeton_aPrice = 100 
    local meat_jeton = xPlayer.getInventoryItem('jeton').count 
	
 
    if meat_jeton > 0  then
		xPlayer.removeInventoryItem('jeton', meat_jeton)
        xPlayer.addMoney(meat_jeton * jeton_aPrice) 
		TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'success', text = 'you have sold the chips and got $'..  jeton_aPrice * meat_jeton..'', length = 2500})
		TriggerEvent('esx_addonaccount:getSharedAccount', 'society_casino', function(account) 
		account.removeMoney(meat_jeton * jeton_aPrice)
		end)
    else
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'you dont have enough money!', length = 2500})
    end
 
 
end)
