gameevent.Listen( "player_say" )
hook.Add( "player_say", "player_say_example", function( data ) 
	local priority = CLIENT 	// Priority ??
	local id = data.userid				// Same as Player:UserID() for the speaker
	local text = data.text        // The written text.

	// Called when a player writes text ( Called by the SERVER on the client AFTER the PlayerSay hook )

end 
