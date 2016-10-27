function update(event, player, msg, Type, lang)

    player_type = player:GetGMRank()
    
    if player_type == 3 then 
	
		if msg == "%push lua" then
    
			os.execute('./update_lua.sh')
			
		
		
		elseif msg == "%push log" then
		
			os.execute('./push_log.sh')
		
		
		
		elseif msg == "%push dbc" then
		
			os.execute('./update_dbc.sh')
		
		end
    
    end
	

end


RegisterPlayerEvent(18,update)
