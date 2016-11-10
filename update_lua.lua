function update(event, player, msg, Type, lang)

    player_type = player:GetGMRank()
    
    if player_type == 3 then 
	
		if msg == "%push lua" then
		
			os.execute ('bash update_lua.sh')
			player:SendBroadcastMessage("Successfully pushed Lua Scripts. Some Modules require restarts or .reload eluna")
		
		elseif msg == "%push log" then
		
			os.execute ('bash push_log.sh')
			player:SendBroadcastMessage("Successfully pushed Lua Log")
		
		elseif msg == "%push dbc" then
		
			os.execute ('bash update_dbc.sh')
			player:SendBroadcastMessage("Successfully pushed DBC Files. This requires a restart")
		
		elseif msg == "%push live" then
		
			os.execute ('bash /home/develop/compile.sh &')
			player:SendBroadcastMessage("Successfully started compiling core. This requires a restart but please wait a few minutes for compiling to finish.")
			
		elseif msg == "%push dev" then
		
			os.execute ('bash /home/develop/develop.sh &')
			player:SendBroadcastMessage("Successfully started compiling core. This requires a restart but please wait a few minutes for compiling to finish.")

		end
    
    end
	

end


RegisterPlayerEvent(18,update)
