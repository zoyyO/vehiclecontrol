-- MOTEUR
AddEventHandler('chatMessage', function(s, n, m)
	local message = string.lower(m)
	if message == "/moteur off" then
		CancelEvent()
		TriggerClientEvent('moteuroff', s)

	elseif message == "/moteur on" then
		CancelEvent()
		TriggerClientEvent('moteuron', s)

	elseif message == "/moteur" then
		CancelEvent()
		TriggerClientEvent('moteur', s)
	end
end)

-- COFFRE
AddEventHandler('chatMessage', function(s, n, m)
	local message = string.lower(m)
	if message == "/cfr" then
		CancelEvent()
		TriggerClientEvent('coffre', s)
	end
end)

-- PORTES
AddEventHandler('chatMessage', function(s, n, m)
	local message = string.lower(m)
	if message == "/p1" then
		CancelEvent()
		TriggerClientEvent('p1', s)
	end
end)

AddEventHandler('chatMessage', function(s, n, m)
	local message = string.lower(m)
	if message == "/p2" then
		CancelEvent()
		TriggerClientEvent('p2', s)
	end
end)
AddEventHandler('chatMessage', function(s, n, m)
	local message = string.lower(m)
	if message == "/p3" then
		CancelEvent()
		TriggerClientEvent('p3', s)
	end
end)
AddEventHandler('chatMessage', function(s, n, m)
	local message = string.lower(m)
	if message == "/p4" then
		CancelEvent()
		TriggerClientEvent('p4', s)
	end
end)

-- CAPOT
AddEventHandler('chatMessage', function(s, n, m)
	local message = string.lower(m)
	if message == "/cpt" then
		CancelEvent()
		TriggerClientEvent('capot', s)
	end
end)
