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

var itemyangtidakdipakai

func _ready():
	pass # Replace with function body.


func _on_but_main_pressed():
	Variable.playing = 1
	$menu_utama.visible = false

func _on_but_tentang_pressed() -> void:
	$tentang.visible = true


func _on_oranglain_body_entered(body):
	if body.name=="player":
		$percakapan.visible = true
		prolog()
		$Timer.start()

func prolog():
	$percakapan/teksnya.text = VariableSatu.prolog[no_teks]
	

func _on_but_lanjut_pressed() -> void:
	no_teks += 1
	if no_teks < VariableSatu.prolog.size():
		prolog()
	else :
		$percakapan.visible = false
		tampilkotak()
		no_teks = 0
		$UI.visible = true


func _on_kotak_1_body_entered(body):
	if body.name=="player":
		$UI/Panel.visible = true
		randomitem()
		$kotak_1.queue_free()
		
func randomitem():
	randomize()
	jenisbarang = randi()%3 #ganti jadi %3
	if jenisbarang==0:
		itemyangdipakai = randi()%VariableSatu.itemdipakai.size()
		$UI/Panel/teksnya.text = "Wah kamu menemukan " + VariableSatu.itemdipakai[itemyangdipakai]
		$UI/Panel/but_simpan.text = "Simpan"
	#if jenisbarang==1:
	#	itemyangtidakdipakai = randi()%VariableSatu.itemtidakdipakai.size()
	#	$UI/Panel/teksnya.text = "Waw kamu dapat " + VariableSatu.itemtidakdipakai[itemyangtidakdipakai]
	#	$UI/Panel/but_simpan.text = "Simpan"

	else :
		itemprivasinya = randi()%VariableSatu.itemprivasi.size()
		$UI/Panel/teksnya.text = "Menemukan item privasi " + VariableSatu.itemprivasi[itemprivasinya]
		if itemprivasinya==0:
			$UI/Panel/but_simpan.text = "Laporkan"
		elif itemprivasinya==1:
			$UI/Panel/but_simpan.text = "Ikut"
		elif itemprivasinya==1:
			$UI/Panel/but_simpan.text = "Beritahu"
		else :
			$UI/Panel/but_simpan.text = "Beritahu"


func _on_kotak_2_body_entered(body):
	if body.name=="player":
		$UI/Panel.visible = true
		randomitem()
		$kotak_2.queue_free()

func _on_kotak_3_body_entered(body):
	if body.name=="player":
		$UI/Panel.visible = true
		randomitem()
		$kotak_3.queue_free()

func _on_kotak_4_body_entered(body):
	if body.name=="player":
		$UI/Panel.visible = true
		randomitem()
		$kotak_4.queue_free()

func _on_kotak_5_body_entered(body):
	if body.name=="player":
		$UI/Panel.visible = true
		randomitem()
		$kotak_5.queue_free()

func _on_kotak_6_body_entered(body):
	if body.name=="player":
		$UI/Panel.visible = true
		randomitem()
		$kotak_6.queue_free()

func _on_kotak_7_body_entered(body):
	if body.name=="player":
		$UI/Panel.visible = true
		randomitem()
		$kotak_7.queue_free()

func _on_kotak_8_body_entered(body):
	if body.name=="player":
		$UI/Panel.visible = true
		randomitem()
		$kotak_8.queue_free()

func _on_kotak_9_body_entered(body):
	if body.name=="player":
		$UI/Panel.visible = true
		randomitem()
		$kotak_9.queue_free()

func _on_kotak_10_body_entered(body):
	if body.name=="player":
		$UI/Panel.visible = true
		randomitem()
		$kotak_10.queue_free()


func _on_BoxItem_body_entered(body):
	if body.name=="player":
		$UI/Panel.visible = true
		randomitem()
		$BoxItem.queue_free()

func _on_BoxItem2_body_entered(body: Node) -> void:
	if body.name=="player":
		$UI/Panel.visible = true
		randomitem()
		$BoxItem2.queue_free()

func _on_BoxItem3_body_entered(body: Node) -> void:
	if body.name=="player":
		$UI/Panel.visible = true
		randomitem()
		$BoxItem3.queue_free()

func _on_BoxItem4_body_entered(body: Node) -> void:
	if body.name=="player":
		$UI/Panel.visible = true
		randomitem()
		$BoxItem4.queue_free()

func _on_BoxItem5_body_entered(body: Node) -> void:
	if body.name=="player":
		$UI/Panel.visible = true
		randomitem()
		$BoxItem5.queue_free()

func _on_BoxItem6_body_entered(body: Node) -> void:
	if body.name=="player":
		$UI/Panel.visible = true
		randomitem()
		$BoxItem6.queue_free()

func _on_BoxItem7_body_entered(body: Node) -> void:
	if body.name=="player":
		$UI/Panel.visible = true
		randomitem()
		$BoxItem7.queue_free()

func _on_BoxItem8_body_entered(body: Node) -> void:
	if body.name=="player":
		$UI/Panel.visible = true
		randomitem()
		$BoxItem8.queue_free()

func _on_BoxItem9_body_entered(body: Node) -> void:
	if body.name=="player":
		$UI/Panel.visible = true
		randomitem()
		$BoxItem9.queue_free()

func _on_BoxItem10_body_entered(body: Node) -> void:
	if body.name=="player":
		$UI/Panel.visible = true
		randomitem()
		$BoxItem10.queue_free()



func _on_but_simpan_pressed():
	$UI/Panel.visible = false
	if jenisbarang == 0 :
		VariableSatu.iteminventori[itemyangdipakai] += 1
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
	$kotak_1.visible = true
	$kotak_2.visible = true
	$kotak_3.visible = true
	$kotak_4.visible = true
	$kotak_5.visible = true
	$kotak_6.visible = true
	$kotak_7.visible = true
	$kotak_8.visible = true
	$kotak_9.visible = true
	$kotak_10.visible = true
	$BoxItem.visible = true
	$BoxItem2.visible = true
	$BoxItem3.visible = true
	$BoxItem4.visible = true
	$BoxItem5.visible = true
	$BoxItem6.visible = true
	$BoxItem7.visible = true
	$BoxItem8.visible = true
	$BoxItem9.visible = true
	$BoxItem10.visible = true


func _on_but_inventory_pressed() -> void:
	$UI/pop_inventori.visible = true
	var Wortel = VariableSatu.iteminventori[0]
	var Brokoli = VariableSatu.iteminventori[1]
	var Bayam = VariableSatu.iteminventori[2]
	var Hp = VariableSatu.iteminventori[3]
	var PC = VariableSatu.iteminventori[4]
	$UI/pop_inventori/jumlah_item.text = str(Wortel) + "\n" + str(Brokoli) + "\n" + str(Bayam) + "\n" + str(Hp) + "\n" + str(PC)
	

func _on_but_close_pressed():
	$UI/pop_inventori.visible = false


func _on_Timer_timeout():
	$UI/energi.value -= 1


func _on_but_makan_pressed():
	var Wortel = VariableSatu.iteminventori[0]
	var Brokoli = VariableSatu.iteminventori[1]
	var Bayam = VariableSatu.iteminventori[2]
	if Wortel > 0 :
		$UI/energi.value = $UI/energi.value + (Wortel*1)
	if Brokoli > 0 :
		$UI/energi.value = $UI/energi.value + (Brokoli*5)
	if Bayam > 0 :
		$UI/energi.value = $UI/energi.value + (Bayam*3)
	VariableSatu.iteminventori[0] = 0
	VariableSatu.iteminventori[1] = 0
	VariableSatu.iteminventori[2] = 0


func _on_but_toko_pressed():
	$UI/pop_toko.visible = true
	jumlahitembeli()

func _on_but_close_toko_pressed() -> void:
	$UI/pop_toko.visible = false

func _on_but_close_tentang_pressed() -> void:
	$tentang.visible = false


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
	$UI/pop_toko/nama_item2.text = str(VariableSatu.iteminventori[3]) + " Hp" + "\n" + str(VariableSatu.iteminventori[4]) + " PC"
	hargahp = VariableSatu.iteminventori[3] * 10000
	hargapc = VariableSatu.iteminventori[4] * 7500
	$UI/pop_toko/jumlah_item3.text = str(hargahp) + "\n" + str(hargapc) 


func _on_but_jual_pressed() -> void:
	VariableSatu.uang += hargahp
	$UI/pop_toko/jumlahuang.text = "Uang : " + str(VariableSatu.uang)
	#$UI/jumlah_uang.text = "Rp. " + str(Variable.uang)
	VariableSatu.iteminventori[3] = 0
	jumlahitembeli() 


func _on_but_jual2_pressed() -> void:
	VariableSatu.uang += hargapc
	jumlahuangtersedia()
	VariableSatu.iteminventori[4] = 0
	jumlahitembeli() 

func jumlahuangtersedia():
	$UI/pop_toko/jumlahuang.text = "Uang : " + str(VariableSatu.uang)
	$UI/jumlah_uang.text = "Rp. " + str(VariableSatu.uang)

func _on_but_beli_pressed() -> void:
	VariableSatu.uang -= hargawortel
	VariableSatu.iteminventori[0] += beliwortel
	beliwortel = 0
	hargabeli()
	jumlahbarangyangdibeli()
	jumlahuangtersedia()


func _on_but_beli2_pressed() -> void:
	VariableSatu.uang -= hargabrokoli
	VariableSatu.iteminventori[1] += belibrokoli
	belibrokoli = 0
	hargabeli()
	jumlahbarangyangdibeli()
	jumlahuangtersedia()


func _on_but_beli3_pressed() -> void:
	VariableSatu.uang -= hargabayam
	VariableSatu.iteminventori[2] += belibayam
	belibayam = 0
	hargabeli()
	jumlahbarangyangdibeli()
	jumlahuangtersedia()



