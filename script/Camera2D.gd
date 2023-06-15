extends Camera2D

func _process(delta):
	position.y = $"../Pemain".position.y - 80
