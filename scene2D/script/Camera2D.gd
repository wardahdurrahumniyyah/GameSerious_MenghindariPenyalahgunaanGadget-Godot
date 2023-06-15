extends Camera2D

func _process(delta):
	position.y = $"../musuh".position.y - 80
	position.x = $"../musuh".position.x - 50
	
