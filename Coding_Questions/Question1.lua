--Release the storage value for player
local function releaseStorage(player) 
	--Set storage value to -1 so as to release the storage
	player:setStorageValue(1000, -1)
end

--Event triggered when a player logsout
function onLogout(player)
	--Check if storage value is 1
	if player:getStorageValue(1000) == 1 then
		--If storage value is 1, schedule the releaseStorage function to be executed after 1s
		--Event scheduling is done in protected mode so as to catch any errors and handle them
		local success, error_message pcall(addEvent, releaseStorage, 1000, player) 
		if not success then
			print("Error scheduling releaseStorage function", error_message)
			return false
		end
	end
	return true
end