extends KinematicBody
export var  kecepatan_maks = 5
var velocity = Vector3.ZERO
onready var spatial = $Spatial

func _physics_process(delta):
	if Variable.playing >0 :
		var input_vector = get_input_vector()
		gerakan(input_vector)
		velocity = move_and_slide(velocity, Vector3.UP)

func get_input_vector():
	var input_vector = Vector3.ZERO
	input_vector.x = Input.get_action_strength("ui_left")-Input.get_action_strength("ui_right")
	input_vector.z = Input.get_action_strength("ui_up")-Input.get_action_strength("ui_down")
	return input_vector.normalized()

	
func gerakan(input_vector):
	velocity.x = input_vector.x * kecepatan_maks
	velocity.z = input_vector.z * kecepatan_maks
	if input_vector != Vector3.ZERO :
		$AnimationPlayer.play("jalan")
		spatial.look_at(translation+input_vector, Vector3.UP)

func gravitas_karakter():
	pass
