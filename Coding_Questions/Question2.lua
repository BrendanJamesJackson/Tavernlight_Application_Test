function printSmallGuildNames(memberCount)
-- This function prints the names of all guilds that have less than memberCount max members

	-- Prepares the SQL query string with a placeholder for memberCount
	local selectGuildQuery = "SELECT name FROM guilds WHERE max_members < %d;" 
	local query = string.format(selectGuildQuery, memberCount) -- The query is created with memberCount replacing the placeholder
	
	--Perform the query and store the result of it
	local result = db.storeQuery(query)
	
	--Error handling to check if the query was a success
	if not result then
		print("Error: Unable to fetch guild names")
	end
	
	--Loops throuh the results of the query and prints the guildName for each data set in the result
	repeat
		local guildName = result.getString("name")
		if guildName then
			print(guildName)
		end
	until not result.next() --Condition to end the repeat, when there are no more values in the result
	
	--Frees the result object from the query so as to ensure proper resource management and avoid memory leaks
	result.free()
	
end