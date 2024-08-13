extends Node2D

var wave: int
var starting_nodes: int
var mob_count: int
var wave_ended: bool
var spawn_count: int

func _on_ready_pressed():
	$Ready.hide()
	$MobTimer.start()
	starting_nodes = get_tree().get_node_count()
	wave = 1
	spawn_count = wave * 1.5 + 2


func _on_mob_timer_timeout():
	spawn_mob()
	mob_count = get_tree().get_node_count() - starting_nodes
	if spawn_count > 0:
		wave_ended = false
		spawn_count = spawn_count - 1
		if (spawn_count == 0 && mob_count == 0):
			wave_ended = true
			await get_tree().create_timer(5, false, true, false).timeout
			wave_progress()
		print(spawn_count)

func wave_progress():
	if (wave_ended == true):
		wave = wave + 1
		spawn_count = floor (wave * 1.5) + 2

func spawn_mob():
	var enemy_basic = preload("res://Mobs/EnemyBase.tscn").instantiate()
	add_child(enemy_basic)
