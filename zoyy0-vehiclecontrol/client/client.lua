-- Configure juste les distances de verrouillage...
interactionDistance = 3.5 --Le rayon dans lequel vous devez vous trouver pour interagir avec le véhicule.
lockDistance = 8 --Le rayon dans lequel vous devez vous trouver pour verrouiller votre véhicule.

engineoff = false
saved = false

local PlayerData              = {}
ESX                           = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
end)



-- ENGINE
IsEngineOn = true
RegisterNetEvent('moteur')
AddEventHandler('moteur',function() 
	local player = GetPlayerPed(-1)
	
	if (IsPedSittingInAnyVehicle(player)) then 
		local vehicle = GetVehiclePedIsIn(player,false)
		
		if IsEngineOn == true then
			IsEngineOn = false
			SetVehicleEngineOn(vehicle,false,false,false)
		else
			IsEngineOn = true
			SetVehicleUndriveable(vehicle,false)
			SetVehicleEngineOn(vehicle,true,false,false)
		end
		
		while (IsEngineOn == false) do
			SetVehicleUndriveable(vehicle,true)
			Citizen.Wait(0)
		end
	end
end)

RegisterNetEvent('moteuroff')
AddEventHandler('moteuroff',function() 
		local player = GetPlayerPed(-1)

        if (IsPedSittingInAnyVehicle(player)) then 
            local vehicle = GetVehiclePedIsIn(player,false)
			engineoff = true
			ShowNotification("Moteur ~r~éteint~s~.")
			while (engineoff) do
			SetVehicleEngineOn(vehicle,false,false,false)
			SetVehicleUndriveable(vehicle,true)
			Citizen.Wait(0)
			end
		end
end)
RegisterNetEvent('moteuron')
AddEventHandler('moteuron',function() 
    local player = GetPlayerPed(-1)

        if (IsPedSittingInAnyVehicle(player)) then 
            local vehicle = GetVehiclePedIsIn(player,false)
			engineoff = false
			SetVehicleUndriveable(vehicle,false)
			SetVehicleEngineOn(vehicle,true,false,false)
			ShowNotification("Moteur ~g~allumer~s~.")
	end
end)

-- BOOOT
RegisterNetEvent('coffre')
AddEventHandler('cofffre',function() 
	local player = GetPlayerPed(-1)
			if controlsave_bool == true then
			 	vehicle = saveVehicle
			else
			 	vehicle = GetVehiclePedIsIn(player,true)
			 end
			
			local isopen = GetVehicleDoorAngleRatio(vehicle,5)
			local distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(player), GetEntityCoords(vehicle), 1)
			
			if distanceToVeh <= interactionDistance then
				if (isopen == 0) then
				SetVehicleDoorOpen(vehicle,5,0,0)
				else
				SetVehicleDoorShut(vehicle,5,0)
				end
			else
				ShowNotification("~r~Vous devez être à côté du véhicule pour le faire.")
			end
end)

-- DOORS
RegisterNetEvent('p1')
AddEventHandler('p1',function() 
	local player = GetPlayerPed(-1)
    		if controlsave_bool == true then
				vehicle = saveVehicle
			else
				vehicle = GetVehiclePedIsIn(player,true)
			end
			local isopen = GetVehicleDoorAngleRatio(vehicle,0) 
			local distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(player), GetEntityCoords(vehicle), 1)
			
			if distanceToVeh <= interactionDistance then
				if (isopen == 0) then
				SetVehicleDoorOpen(vehicle,0,0,0)
				else
				SetVehicleDoorShut(vehicle,0,0)
				end
			else
				ShowNotification("~r~Vous devez être à côté du véhicule pour le faire.")
			end
end)
RegisterNetEvent('p2')
AddEventHandler('p2',function() 
	local player = GetPlayerPed(-1)
    		if controlsave_bool == true then
				vehicle = saveVehicle
			else
				vehicle = GetVehiclePedIsIn(player,true)
			end
			local isopen = GetVehicleDoorAngleRatio(vehicle,1) 
			local distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(player), GetEntityCoords(vehicle), 1)
			
			if distanceToVeh <= interactionDistance then
				if (isopen == 0) then
				SetVehicleDoorOpen(vehicle,1,0,0)
				else
				SetVehicleDoorShut(vehicle,1,0)
				end
			else
				ShowNotification("~r~Vous devez être à côté du véhicule pour le faire.")
			end
end)
RegisterNetEvent('p3')
AddEventHandler('p3',function() 
	local player = GetPlayerPed(-1)
    		if controlsave_bool == true then
				vehicle = saveVehicle
			else
				vehicle = GetVehiclePedIsIn(player,true)
			end
			local isopen = GetVehicleDoorAngleRatio(vehicle,2) 
			local distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(player), GetEntityCoords(vehicle), 1)
			
			if distanceToVeh <= interactionDistance then
				if (isopen == 0) then
				SetVehicleDoorOpen(vehicle,2,0,0)
				else
				SetVehicleDoorShut(vehicle,2,0)
				end
			else
				ShowNotification("~r~Vous devez être à côté du véhicule pour le faire.")
			end
end)
RegisterNetEvent('p4')
AddEventHandler('p4',function() 
	local player = GetPlayerPed(-1)
    		if controlsave_bool == true then
				vehicle = saveVehicle
			else
				vehicle = GetVehiclePedIsIn(player,true)
			end
			local isopen = GetVehicleDoorAngleRatio(vehicle,3) 
			local distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(player), GetEntityCoords(vehicle), 1)
			
			if distanceToVeh <= interactionDistance then
				if (isopen == 0) then
				SetVehicleDoorOpen(vehicle,3,0,0)
				else
				SetVehicleDoorShut(vehicle,3,0)
				end
			else
				ShowNotification("~r~Vous devez être à côté du véhicule pour le faire.")
			end
end)	


-- HOOD 
RegisterNetEvent('capot')
AddEventHandler('capot',function() 
	local player = GetPlayerPed(-1)
    	if controlsave_bool == true then
			vehicle = saveVehicle
		else
			vehicle = GetVehiclePedIsIn(player,true)
		end
			
			local isopen = GetVehicleDoorAngleRatio(vehicle,4)
			local distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(player), GetEntityCoords(vehicle), 1)
			
			if distanceToVeh <= interactionDistance then
				if (isopen == 0) then
				SetVehicleDoorOpen(vehicle,4,0,0)
				else
				SetVehicleDoorShut(vehicle,4,0)
				end
			else
				ShowNotification("~r~Vous devez être à côté du véhicule pour le faire.")
			end
end)

-- LOCKDOORS
Citizen.CreateThread(function()
	local dict = "anim@mp_player_intmenu@key_fob@"
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(0)
	end
    while true do
	    Wait(0)
	    if IsControlJustReleased(0, 56) and PlayerData.job ~= nil and PlayerData.job.name == 'police' then
	        local player = GetPlayerPed(-1)
            local vehicle = GetVehiclePedIsIn(player,true)
	        local islocked = GetVehicleDoorLockStatus(vehicle)
	        local distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(player), GetEntityCoords(vehicle), 1)
		    if DoesEntityExist(vehicle) then
			    if distanceToVeh <= lockDistance then
				    if (islocked == 1)then
				    SetVehicleDoorsLocked(vehicle, 2)
					 ShowNotification("Vous avez fermé votre ~y~" .. GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))) .. "~w~.")
					if not IsPedInAnyVehicle(PlayerPedId(), true) then
						TaskPlayAnim(PlayerPedId(), dict, "fob_click_fp", 8.0, 8.0, -1, 48, 1, false, false, false)
						SetVehicleLights(vehicle, 5)
						Wait (200)
						SetVehicleLights(vehicle, 0)
						Wait (200)
						SetVehicleLights(vehicle, 2)
						Wait (400)
						SetVehicleLights(vehicle, 0)
					end
			    else
				    SetVehicleDoorsLocked(vehicle,1)
					ShowNotification("Vous avez ouvert votre ~y~" .. GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))) .. "~w~.")
					if not IsPedInAnyVehicle(PlayerPedId(), true) then
						TaskPlayAnim(PlayerPedId(), dict, "fob_click_fp", 8.0, 8.0, -1, 48, 1, false, false, false)
						SetVehicleLights(vehicle, 2)
						Wait (200)
						SetVehicleLights(vehicle, 0)
						Wait (200)
						SetVehicleLights(vehicle, 2)
						Wait (400)
						SetVehicleLights(vehicle, 0)
					end
			    end
			    else
				    ShowNotification("~r~Vous devez être à côté du véhicule pour le faire.")
			    end
		    else
			    ShowNotification("~r~Rentrer dans le véhicule pour sauvegarder.")
			end
		end
	end
end)

function ShowNotification( text )
    SetNotificationTextEntry( "STRING" )
    AddTextComponentString( text )
    DrawNotification( false, false )
end


