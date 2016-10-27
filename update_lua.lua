function update(event, player, msg, Type, lang)

    player_type = player:GetGMRank()
    
    if player_type == 3 then 
	
		if msg == "%push lua" then
		
			os.execute('./update_lua.sh')
			player:SendBroadcastMessage("Successfully pushed Lua Scripts. Some Modules require restarts or .reload eluna")
			
		
		
		elseif msg == "%push log" then
		
			os.execute('./push_log.sh')
			player:SendBroadcastMessage("Successfully pushed Lua Log")
		
		
		
		elseif msg == "%push dbc" then
		
			os.execute('./update_dbc.sh')
			player:SendBroadcastMessage("Successfully pushed DBC Files. This requires a restart")
		
		end
    
    end
	

end


RegisterPlayerEvent(18,update)
