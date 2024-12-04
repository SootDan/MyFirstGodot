extends Control

var game := "res://main.tscn"
var status: int
var percent := [0.0]
var timer_not_started := true


func _ready():
	ResourceLoader.load_threaded_request(game)


func _process(_delta):
	status = ResourceLoader.load_threaded_get_status(game, percent)
	
	if status == ResourceLoader.THREAD_LOAD_IN_PROGRESS:
		$ProgressBar.value = percent[0] * 100.0
	elif status == ResourceLoader.THREAD_LOAD_LOADED and timer_not_started:
		$Timer.start()
		$ProgressBar.value = 100
		timer_not_started = !timer_not_started


func _on_timer_timeout():
	var scene := ResourceLoader.load_threaded_get(game)
	get_tree().change_scene_to_packed(scene)
