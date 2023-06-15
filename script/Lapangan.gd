extends Node2D

onready var musik_kalah = preload("res://musik/LurkingSloth-320bit.mp3")
onready var musik_menang = preload("res://musik/mixkit-unlock-game-notification-253.wav")
var mulai = false

func _ready():
	$Ketangkap.hide()
	$POPUP.hide()
	$Menang.hide()
	$ulang.hide()
	$Judul/Tween.interpolate_property($Judul,"xxxxx", Vector2.ZERO, Vector2(1,1), 4, Tween.TRANS_BOUNCE, Tween.EASE_OUT)
	$Judul/Tween.start()

func _process(delta):
	if $Pemain.position.y < 155 && $Pemain.tangkap == false && $Pemain.menang == 0:
		$Menang.show()
		$POPUP.show()
		$Pemain.hide()
		$Musik.stream = musik_menang
		$Musik.play()
		$SuaraMenang.play()
		$Pemain.menang = 1
		
	if $Pemain.tangkap == true :
		$Musik.stream = musik_kalah
		$Musik.play()
		$Pemain.tangkap = false

func _on_ulang_pressed() -> void:
	var _ulang = get_tree().reload_current_scene() #mengulangi permainan

func _on_Tween_tween_all_completed() -> void:
	mulai = true
	$Judul.queue_free()

func _on_menu_pressed() -> void:
	var _ganti = get_tree().change_scene("res://scene2D/EndTradisional.tscn")


func _on_ulangi_button_up() -> void:
	var _ulang = get_tree().reload_current_scene() #mengulangi permainan


func _on_ulangi_pressed() -> void:
	var _ulang = get_tree().reload_current_scene()
