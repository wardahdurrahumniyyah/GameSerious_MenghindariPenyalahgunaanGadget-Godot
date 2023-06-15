extends Node2D



func _on_Timer_timeout():
	$TextureProgress.value += 2
	if $TextureProgress.value == 100 :
		get_tree().change_scene("res://scene2D/menu_pilih_game.tscn")
	
