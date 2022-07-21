ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('jeton:add')
AddEventHandler('jeton:add', function(amount)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xMoney = xPlayer.getAccount('money').money
	local price = math.floor(amount * 100)
	if xMoney >= price then
		xPlayer.removeAccountMoney('money', price)
		xPlayer.addInventoryItem('jeton', amount)
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
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'you dont have enough jeton!', length = 2500})
    end
 
 
end)
