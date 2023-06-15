extends Area

var _is_player_in_area = false
export(String) var player_node_name = "player"

func _ready():
	connect("body_entered", self, "_on_body_entered")
	
func _process(delta):
	if _is_player_in_area == true:
		get_tree().change_scene("res://scene/area_satu.tscn")
		print("has portal")

func _on_body_entered(other):
	if other.name == player_node_name:
		_is_player_in_area = true
