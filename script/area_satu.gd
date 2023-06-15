extends Spatial
var no_teks = 0
var jenisbarang
var itemyangdipakai
var itemprivasinya
var beliwortel = 0
var belibayam = 0
var belibrokoli = 0
var hargawortel = 0
var hargabrokoli = 0
var hargabayam = 0
var hargapc = 0
var hargahp = 0

var itemprivasinya2

func _ready():
	pass # Replace with function body.


func _on_but_main_pressed():
	Variable.playing = 1
	$menu_utama.visible = false


func _on_oranglain_body_entered(body):
	if body.name=="player":
		$percakapan.visible = true
		prolog2()
		$Timer.start()

func prolog2():
	$percakapan/teksnya.text = Variable.prolog2[no_teks]
	

func _on_but_lanjut_pressed() -> void:
	no_teks += 1
	if no_teks < Variable.prolog.size():
		prolog2()
	else :
		$percakapan.visible = false
		tampilkotak()
		no_teks = 0
		$UI.visible = true


func randomitem():
	randomize()
	jenisbarang = randi()%2 #ganti jadi %3
	if jenisbarang==0:
		itemyangdipakai = randi()%Variable.itemdipakai.size()
		$UI/Panel/teksnya.text = "Kamu menemukan kembali " + Variable.itemdipakai[itemyangdipakai]
		$UI/Panel/but_simpan.text = "Simpan"
	#gantiscene
	#elif jenisbarang==2:
	#	GantiScene.ganti_scenenya("res://scene/area_satu.tscn")
	else :
		itemprivasinya2 = randi()%Variable.itemprivasi2.size()
		$UI/Panel/teksnya.text = " " + Variable.itemprivasi2[itemprivasinya2]
		if itemprivasinya2==0:
			$UI/Panel/but_simpan.text = "Laporkan"
		elif itemprivasinya2==1:
			$UI/Panel/but_simpan.text = "Ikut"
		elif itemprivasinya2==1:
			$UI/Panel/but_simpan.text = "Beritahu"
		else :
			$UI/Panel/but_simpan.text = "Beritahu"
			
	if jenisbarang == 5 :
		$Timer.stop()


func _on_but_simpan_pressed():
	$UI/Panel.visible = false
	if jenisbarang == 0 :
		Variable.iteminventori[itemyangdipakai] += 1
	else :
		if itemprivasinya == 0 :
			$UI/privasi.value += 3
		else :
			$UI/privasi.value -= 10

func _on_but_abaikan_pressed():
	$UI/Panel.visible = false
	if itemprivasinya == 0 :
		$UI/privasi.value -= 10
	else :
		$UI/privasi.value += 3

func tampilkotak():
	$boxOpen.visible = true
	$boxOpen2.visible = true
	$boxOpen3.visible = true
	$boxOpen4.visible = true
	$boxOpen5.visible = true
	$boxOpen6.visible = true
	$boxOpen7.visible = true
	$boxOpen8.visible = true
	$boxOpen9.visible = true
	$boxOpen10.visible = true


func _on_but_inventory_pressed() -> void:
	$UI/pop_inventori.visible = true
	var Wortel = Variable.iteminventori[0]
	var Brokoli = Variable.iteminventori[1]
	var Bayam = Variable.iteminventori[2]
	var Hp = Variable.iteminventori[3]
	var PC = Variable.iteminventori[4]
	$UI/pop_inventori/jumlah_item.text = str(Wortel) + "\n" + str(Brokoli) + "\n" + str(Bayam) + "\n" + str(Hp) + "\n" + str(PC)
	

func _on_but_close_pressed():
	$UI/pop_inventori.visible = false


func _on_Timer_timeout():
	$UI/energi.value -= 1
	#$Musik.play()

func _on_but_makan_pressed():
	var Wortel = Variable.iteminventori[0]
	var Brokoli = Variable.iteminventori[1]
	var Bayam = Variable.iteminventori[2]
	if Wortel > 0 :
		$UI/energi.value = $UI/energi.value + (Wortel*1)
	if Brokoli > 0 :
		$UI/energi.value = $UI/energi.value + (Brokoli*5)
	if Bayam > 0 :
		$UI/energi.value = $UI/energi.value + (Bayam*3)
	Variable.iteminventori[0] = 0
	Variable.iteminventori[1] = 0
	Variable.iteminventori[2] = 0


func _on_but_toko_pressed():
	$UI/pop_toko.visible = true
	jumlahitembeli()

func _on_but_close_toko_pressed() -> void:
	$UI/pop_toko.visible = false

func jumlahbarangyangdibeli():
	$UI/pop_toko/jumlah_item.text = str(beliwortel) + "\n" + str(belibrokoli) + "\n" + str(belibayam)

func _on_but_tambah_pressed() -> void:
	beliwortel += 1
	jumlahbarangyangdibeli()
	hargabeli()

func _on_but_tambah2_pressed() -> void:
	belibrokoli += 1
	jumlahbarangyangdibeli()
	hargabeli()

func _on_but_tambah3_pressed() -> void:
	belibayam += 1
	jumlahbarangyangdibeli()
	hargabeli()

func _on_but_kurang_pressed() -> void:
	beliwortel -= 1
	if beliwortel <= 0 :
		beliwortel = 0
	jumlahbarangyangdibeli()
	hargabeli()

func _on_but_kurang2_pressed() -> void:
	belibrokoli -= 1
	if belibrokoli <= 0 :
		belibrokoli = 0
	jumlahbarangyangdibeli()
	hargabeli()

func _on_but_kurang3_pressed() -> void:
	belibayam -= 1
	if belibayam <= 0 :
		belibayam = 0
	jumlahbarangyangdibeli()
	hargabeli()

func hargabeli():
	hargawortel = beliwortel * 2000
	hargabayam = belibayam * 3000
	hargabrokoli = belibrokoli * 5000
	$UI/pop_toko/jumlah_item2.text = str(hargawortel) + "\n" + str(hargabrokoli) + "\n" + str(hargabayam)

func jumlahitembeli():
	$UI/pop_toko/nama_item2.text = str(Variable.iteminventori[3]) + " Hp" + "\n" + str(Variable.iteminventori[4]) + " PC"
	hargahp = Variable.iteminventori[3] * 10000
	hargapc = Variable.iteminventori[4] * 7500
	$UI/pop_toko/jumlah_item3.text = str(hargahp) + "\n" + str(hargapc) 


func _on_but_jual_pressed() -> void:
	Variable.uang += hargahp
	$UI/pop_toko/jumlahuang.text = "Uang : " + str(Variable.uang)
	Variable.iteminventori[3] = 0
	jumlahitembeli() 

func _on_but_jual2_pressed() -> void:
	Variable.uang += hargapc
	jumlahuangtersedia()
	Variable.iteminventori[4] = 0
	jumlahitembeli() 

func jumlahuangtersedia():
	$UI/pop_toko/jumlahuang.text = "Uang : " + str(Variable.uang)
	$UI/jumlah_uang.text = "Rp. " + str(Variable.uang)

func _on_but_beli_pressed() -> void:
	Variable.uang -= hargawortel
	Variable.iteminventori[0] += beliwortel
	beliwortel = 0
	hargabeli()
	jumlahbarangyangdibeli()
	jumlahuangtersedia()


func _on_but_beli2_pressed() -> void:
	Variable.uang -= hargabrokoli
	Variable.iteminventori[1] += belibrokoli
	belibrokoli = 0
	hargabeli()
	jumlahbarangyangdibeli()
	jumlahuangtersedia()


func _on_but_beli3_pressed() -> void:
	Variable.uang -= hargabayam
	Variable.iteminventori[2] += belibayam
	belibayam = 0
	hargabeli()
	jumlahbarangyangdibeli()
	jumlahuangtersedia()


func _on_boxOpen_body_entered(body: Node) -> void:
	if body.name=="player":
		$UI/Panel.visible = true
		randomitem()
		$boxOpen.queue_free()

func _on_boxOpen2_body_entered(body: Node) -> void:
	if body.name=="player":
		$UI/Panel.visible = true
		randomitem()
		$boxOpen2.queue_free()

func _on_boxOpen3_body_entered(body: Node) -> void:
	if body.name=="player":
		$UI/Panel.visible = true
		randomitem()
		$boxOpen3.queue_free()

func _on_boxOpen4_body_entered(body: Node) -> void:
	if body.name=="player":
		$UI/Panel.visible = true
		randomitem()
		$boxOpen4.queue_free()

func _on_boxOpen5_body_exited(body: Node) -> void:
	if body.name=="player":
		$UI/Panel.visible = true
		randomitem()
		$boxOpen5.queue_free()

func _on_boxOpen6_body_entered(body: Node) -> void:
	if body.name=="player":
		$UI/Panel.visible = true
		randomitem()
		$boxOpen6.queue_free()

func _on_boxOpen7_body_entered(body: Node) -> void:
	if body.name=="player":
		$UI/Panel.visible = true
		randomitem()
		$boxOpen7.queue_free()

func _on_boxOpen8_body_entered(body: Node) -> void:
	if body.name=="player":
		$UI/Panel.visible = true
		randomitem()
		$boxOpen8.queue_free()

func _on_boxOpen9_body_entered(body: Node) -> void:
	if body.name=="player":
		$UI/Panel.visible = true
		randomitem()
		$boxOpen9.queue_free()

func _on_boxOpen10_body_entered(body: Node) -> void:
	if body.name=="player":
		$UI/Panel.visible = true
		randomitem()
		$boxOpen10.queue_free()
