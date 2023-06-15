extends KinematicBody2D

func _ready():
	hujan()

func hujan():
	randomize()
	var posisi_y = rand_range(600, 700)
	$Tween.interpolate_property(
		$Area2D, "position", Vector2($Area2D.position.x, $Area2D.position.y), Vector2 ($Area2D.position.x, posisi_y), 3, 
		Tween.TRANS_LINEAR,Tween.EASE_IN_OUT
	)
	$Tween.start()


func _on_Area2D_body_entered(body):
	if body.name == "musuh":
		DataSimpan.skor += 1
		queue_free()
		

