--Remove party member from specified player's party
function removePartyMember(playerId, memberName) 
	local player = Player(playerId)
	
	--Check if player exists
	if not player then
		print("Error: Player with ID ", playerId, " not found") --Error handling added
		return
	end
	
	local party = player:getParty() 
	
	--Check if player is in a party
	if not party then
		print("Error: Player with ID", playerId, "is not in a party.") --Error handling added
		return
	end
	
	local members = party:getMembers()
	
	--Iterate over party members
	for k, member in ipairs(members) do
		if member == Player(memberName) then
			party:removeMember(Player(memberName))
			print("Removed player", memberName, "from the party.")
			return
		end
	end

	--If the specified member is not found in the party
    print("Error: Player", memberName, "is not a member of the party.") --Error handling added
	
end