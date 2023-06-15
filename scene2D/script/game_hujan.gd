extends Node
var buku = preload ("res://scene2D/barang/buku.tscn")
var cermin = preload ("res://scene2D/barang/cermin.tscn")
var hartakarun = preload ("res://scene2D/barang/hartakarun.tscn")
var jumlah_item = 0

var teks_sekarang = "Selamat Datang, anda memasuki area bermain PS"
var no_dialog = 1
#var shadow = 1

func _ready():
	load_dialog(teks_sekarang)

func load_dialog(teks_tampil):
	$dialog.text = teks_tampil
	$Tween.interpolate_property(
		$dialog, "percent_visible", 0, 1, 2, Tween.TRANS_LINEAR,Tween.EASE_IN_OUT
	)
	$Tween.start()

func _on_Timer_timeout():
	randomize()
	var semua_item = [buku,cermin,hartakarun]
	var item_random = semua_item[randi()%semua_item.size()]
	var objeknya = item_random.instance()
	if jumlah_item%2 == 1:
		objeknya.position = Vector2(rand_range(200, 230), -60)
	else :
		objeknya.position = Vector2(rand_range(1500, 600), -60)
	add_child(objeknya)
	jumlah_item += 1
	
	if jumlah_item == 8 :
		$Timer.stop()

func _on_timer_skor_timeout():
	$skor.text = "Skor : " + str(DataSimpan.skor)
	if DataSimpan.skor == 8 :
		$over.visible = true
		$over/skor2.text =  "Selamat, skor kamu : " + str(DataSimpan.skor)


func _on_replay_pressed():
	DataSimpan.skor = 0
	get_tree().change_scene("res://scene2D/game_hujan.tscn")

func _on_gantiscene_pressed():
	get_tree().change_scene("res://scene2D/EndModern.tscn")

	
func _on_button_selanjutnya_pressed() -> void:
	no_dialog +=1
	if no_dialog == 2:
		teks_sekarang = "Klik Next Untuk Mencari Item yang digunakan untuk bermain gadget.."
	elif no_dialog == 3:
		teks_sekarang = "Anda harus mendapatkan item tersebut"
	elif no_dialog == 4:
		teks_sekarang = "Good Luckk!!!!"	
		menampilkan_gedungps()
		menyembunyikan_button()
	elif no_dialog == 5:
		get_tree().change_scene("res://scene2D/game_hujan.tscn")
	load_dialog(teks_sekarang)

func menampilkan_button():
	$button_selanjutnya.visible = true
	$Dialogteks.visible = true
	$dialog.visible = true
func menyembunyikan_button() :
	$button_selanjutnya.visible = false
	$Dialogteks.visible = false
	$dialog.visible = false

func menampilkan_gedungps() :
	$bg/Ps.visible = true
func menyembunyikan_gedungps() :
	$bg/Ps.visible = false
