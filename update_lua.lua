function update(event, player, msg, Type, lang)

    player_type = player:GetGMRank()
    
    if player_type == 3 then 
	
		if msg == "%push lua sargeras" then
		
			os.execute ('bash /home/develop/awake/main/bin/lua_scripts/update_lua.sh')
			player:SendBroadcastMessage("Successfully pushed Lua Scripts. Some Modules require restarts or .reload eluna")
		
		elseif msg == "%push log sargeras" then
		
			os.execute ('bash /home/develop/awake/main/bin/lua_scripts/push_log.sh')
			player:SendBroadcastMessage("Successfully pushed Lua Log")
		
		elseif msg == "%push dbc sargeras" then
		
			os.execute ('bash /home/develop/awake/main/bin/lua_scripts/update_dbc.sh')
			player:SendBroadcastMessage("Successfully pushed DBC Files. This requires a restart")
		
		elseif msg == "%push sargeras" then
		
			os.execute ('bash /home/develop/compile.sh')
			player:SendBroadcastMessage("Successfully started compiling core. This requires a restart but please wait a few minutes for compiling to finish.")

		elseif msg == "%push lua proudmoore" then
		
			os.execute ('bash /home/develop/awake/proudmoore/bin/lua_scripts/update_lua.sh')
			player:SendBroadcastMessage("Successfully pushed Lua Scripts. Some Modules require restarts or .reload eluna")
		
		elseif msg == "%push log proudmoore" then
		
			os.execute ('bash /home/develop/awake/proudmoore/bin/lua_scripts/push_log.sh')
			player:SendBroadcastMessage("Successfully pushed Lua Log")
		
		elseif msg == "%push dbc proudmoore" then
		
			os.execute ('bash /home/develop/awake/proudmoore/bin/lua_scripts/update_dbc.sh')
			player:SendBroadcastMessage("Successfully pushed DBC Files. This requires a restart")
			
		elseif msg == "%push proudmoore" then
		
			os.execute ('bash /home/develop/develop.sh')
			player:SendBroadcastMessage("Successfully started compiling core. This requires a restart but please wait a few minutes for compiling to finish.")

		end
    end
end


RegisterPlayerEvent(18,update)
