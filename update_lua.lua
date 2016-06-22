function update(event, player, msg, Type, lang)

    player_type = player:GetGMRank()
    
    if player_type == 3 then 
	
		if msg == "%lua_update" then
    
			os.execute('C:\\Users\\Administrator\\Desktop\\Awakening\\lua_scripts\\update_lua.bat')
			
		end
    
    end

end


RegisterPlayerEvent(18,update)