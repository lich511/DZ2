function joinHandler()
	outputChatBox ( "Добро пожаловать " .. getPlayerName(source).."!" )
end
addEventHandler("onPlayerJoin", root, joinHandler)


function createVen ( playerSource, commandName, arg1 )
	if ( playerSource ) then
		local x, y, z = getElementPosition ( playerSource )
		x = x + 5
		local veh = getElementData(playerSource, "vehData")
		if(veh ~= false) then
			destroyElement(veh)
		end
		local mveh = createVehicle(tonumber(arg1),x,y,z)
		setVehicleOverrideLights ( mveh, 1 )
		setElementData(playerSource, "vehData", mveh)
	end
end
addCommandHandler ( "veh", createVen )


function switchEngineState ( player )
	local vehicle = getPedOccupiedVehicle ( player )
	setElementData(player, "vehEng", not getVehicleEngineState(vehicle))
	setVehicleEngineState(vehicle, not getVehicleEngineState(vehicle))
end
function switchLight(player)
	local vehicle = getPedOccupiedVehicle ( player )
	if(getVehicleOverrideLights ( vehicle ) == 1) then
		setVehicleOverrideLights ( vehicle, 2 )
	else
		setVehicleOverrideLights ( vehicle, 1 )
	end
end
function jumpVehical(player)
	local vehicle = getPedOccupiedVehicle ( player )
	local x, y, z = getElementPosition ( vehicle )
	setElementPosition(vehicle, x, y, z+1)
end

function testEnter(thePlayer, seat, jacked)
	local veh = getElementData(thePlayer, "vehData")
	if(veh == source and seat == 0) then
		bindKey ( thePlayer, "E", "down", switchEngineState )
		bindKey ( thePlayer, "L", "down", switchLight )
		bindKey ( thePlayer, "1", "down", jumpVehical )
		setVehicleEngineState(source, getElementData(thePlayer, "vehEng"))
	else
		outputChatBox("зачем? выди")
		removePedFromVehicle ( thePlayer )
	end
end
addEventHandler ( "onVehicleEnter", getRootElement(), testEnter)



addEventHandler ( "onVehicleExit", root,
	function ( player, seat )
		if ( seat == 0 ) then
			unbindKey ( player, "E", "down", switchEngineState )
			unbindKey ( player, "L", "down", switchLight )
			unbindKey ( thePlayer, "1", "down", jumpVehical )
		end
	end
)