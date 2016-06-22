function update(event, player, msg, Type, lang)

    player_type = player:GetGMRank()
    
    if player_type == 3 or player_type == 2 then 
	
		if msg == "%lua_update" then
    
			os.execute('C:\Users\Administrator\Desktop\Awakening\lua_scripts')
			
		end
    
    end

end


RegisterPlayerEvent(18,update)