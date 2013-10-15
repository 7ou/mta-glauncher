function reloadWeapon(player)
	if isPedInVehicle(player) then return end
	reloadPedWeapon(player)
	triggerClientEvent("onClientPlayerStartReload", player)
	setTimer(function(pl) triggerClientEvent("onClientPlayerFinishReload", pl) end, 1500, 1, player)
end
addCommandHandler("reload",reloadWeapon)
addEventHandler("onPlayerJoin",root,function() bindKey(source,"r","down",reloadWeapon) end)

function startBind()
	for k, v in ipairs(getElementsByType("player")) do
		bindKey(v,"r","down",reloadWeapon)
	end
end
addEventHandler("onResourceStart",resourceRoot,startBind)