function update(event, player, msg, Type, lang)

    player_type = player:GetGMRank()
    
    if player_type == 3 then 
	
		if msg == "%push lua" then
    
			os.execute('C:\\Users\\Administrator\\Desktop\\Awakening\\lua_scripts\\update_lua.bat')
			
		
		
		elseif msg == "%push log" then
		
			os.execute('C:\\Users\\Administrator\\Desktop\\Awakening\\lua_scripts\\push_log.bat')
		
		
		
		elseif msg == "%push dbc" then
		
			os.execute('C:\\Users\\Administrator\\Desktop\\Awakening\\lua_scripts\\update_dbc.bat')
		
		end
    
    end
	

end


RegisterPlayerEvent(18,update)
