extends Node2D


func _on_main_modern_pressed() -> void:
	var _ganti = get_tree().change_scene("res://scene2D/game_hujan.tscn")


func _on_main_tradisional_pressed() -> void:
	var _ganti = get_tree().change_scene("res://scene2D/Lapangan.tscn")

