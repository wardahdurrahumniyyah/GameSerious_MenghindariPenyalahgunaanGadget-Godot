extends Node2D



func _on_game_utama_pressed() -> void:
	var _ganti = get_tree().change_scene("res://scene/gameutama.tscn")


func _on_keluar_pressed() -> void:
	get_tree().quit()


func _on_lanjut_pressed() -> void:
	var _ganti = get_tree().change_scene("res://scene2D/menu.tscn")


func _on_keluar_gameTradisional_pressed() -> void:
	get_tree().quit()


func _on_lanjut_gmModern_pressed() -> void:
	var _ganti = get_tree().change_scene("res://scene2D/menu.tscn")


func _on_keluar_gmModern_pressed() -> void:
	get_tree().quit()

func _on_kembali_pressed() -> void:
	var _ganti = get_tree().change_scene("res://scene2D/menu_pilih_game.tscn")
