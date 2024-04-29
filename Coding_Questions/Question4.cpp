void Game::addItemToPlayer(const std::string& recipient, uint16_t itemId)
{
	//Try to find the player by name
	Player* player = g_game.getPlayerByName(recipient);
	if (!player)
	{
		//If the player does not exist, create a new player object
		player = new Player(nullptr);
		if (!IOLoginData::loadPlayerByName(player, recipient))
		{
			//If loading the new player fails, delete new player object to prevent memory leak
			delete player;
			return;
		}
	}
	
	//Create item to be added to player
	Item* item = Item::CreateItem(itemId);
	if (!item)
	{
		//If creating item fails, delete player object if it was newly created to prevent memory leak
		if (!g_game.getPlayerByName(recipient))
		{
			delete player; 
		}
		return;
	}
	
	//Add item to player inbox
	g_game.internalAddItem(player->getInbox(), item, INDEX_WHEREEVER, FLAG_NOLIMIT);

	//If the player is offline, save player data
	if (player->isOffline())
	{
		IOLoginData::savePlayer(player);
	}
	
	// Delete the player object if it was newly created to prevent memory leak
	if (!g_game.getPlayerByName(recipient))
	{
		delete player;
	}
}