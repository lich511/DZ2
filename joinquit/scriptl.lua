function createVehicleForPlayer(thePlayer, arg1, arg2, arg3, textt)

	if tonumber(arg1) and tonumber(arg1) > -1 and tonumber(arg1) < 256 then	
		if tonumber(arg2) and tonumber(arg2) > -1 and tonumber(arg2) < 256 then
			if tonumber(arg3) and tonumber(arg3) > -1 and tonumber(arg3) < 256 then
				outputChatBox (textt, arg1, arg2, arg3)
			end
		end
	end

end
addCommandHandler("test1", createVehicleForPlayer)