if(global.game_paused){
	count++
	if(count > max_count){
		count = 0
		global.game_paused = false;
	}
}