extends KinematicBody2D

var gerak = Vector2()
var laju = Vector2()
const KECEPATAN_MAKS = 200
const PERCEPATAN = 900
const REDAMAN = 800

func _ready():
	gerak = Vector2.ZERO
	
	
func _physics_process(delta):
	gerak.x = $"../Pemain".position.x - position.x
	gerak.y = 0
	var gerakan = gerak.normalized()
	if gerak.x < -20 || gerak.x > 20 :
		laju +=gerakan*PERCEPATAN*delta
		laju = laju.clamped(KECEPATAN_MAKS)
	else:
		laju = laju.move_toward(Vector2.ZERO, REDAMAN*delta)
		if $"../Pemain".position.y < position.y :
			$AnimationPlayer.play("d_blk")
		else:
			$AnimationPlayer.play("diam")
	var _bergerak = move_and_slide(laju)
	#print(gerak.x)
	anim()
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		if collision.collider.name == "Pemain" :
			queue_free()
			$"../Pemain".hide()
			$"../Pemain".tangkap == true
			$"../Ketangkap".show()
			$"../Ketangkap".position = $"../Pemain".position
			$"../ulang".show()
			$"../ulang".rect_position = $"../Pemain".position 
			$"../SuaraTangkap".play()


func anim():
	if gerak.x > 20 :
		$AnimationPlayer.play("kanan")
		#$AnimationSprite.flip_h = false
	if gerak.x < -20 :
		$AnimationPlayer.play("kiri")
		#$AnimationSprite.flip_h = true
