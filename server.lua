--ESX INIT--
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)ESX = obj end)

--EVENTS--
RegisterServerEvent('coursier:pourboire')--Paie a la livraison d'une pizza + pourboire eventuel
AddEventHandler('coursier:pourboire', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    
    pourboire = math.random(100, 200)
    
    xPlayer.addMoney(randomCash)
end)

RegisterServerEvent("coursier:paiefinale")--Paie "bonus" lors de la fin de service
AddEventHandler("coursier:paiefinale", function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    
    local flouzefin = math.random(50, 200)
    
    xPlayer.addMoney(flouzefin)
    
    TriggerClientEvent("pNotify:SendNotification", source, {
        text = "Voici votre petit bonus final : " .. flouzefin .. "$",
        type = "success",
        queue = "global",
        timeout = 4000,
        layout = "bottomRight"
    })
end)

RegisterServerEvent("coursier:itemadd")--Ajout temporaire de l'item "pizza"
AddEventHandler("coursier:itemadd", function(nbCours)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    
    xPlayer.addInventoryItem('colis', tonumber(nbCours))
end)

RegisterServerEvent("coursier:itemrm")--Rm de l'item "pizza"
AddEventHandler("coursier:itemrm", function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    
    xPlayer.removeInventoryItem('colis', 1)
end)

RegisterServerEvent("coursier:deleteAllCours")--Rm de l'item "pizza"
AddEventHandler("coursier:deleteAllCours", function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    
    local coursnbr = xPlayer.getInventoryItem('colis').count
    
    xPlayer.removeInventoryItem('colis', coursnbr)
end)