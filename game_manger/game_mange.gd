extends Node

signal on_game_over
signal on_score_change

const Gruop_plane = "Plane"

var socre = 0
var hightscore = 0


var game_scene : PackedScene = preload("res://game/game.tscn")
var main_scene : PackedScene = preload("res://main/main.tscn")


func getscore():
	return {"socre":socre,"hightscore":hightscore}
	
func plusscore():
	if socre > hightscore:
		hightscore = socre
	socre += 1 
	on_score_change.emit()
	
func resetscore():
	socre = 0
	on_score_change.emit()

func  load_game_scene():
	get_tree().change_scene_to_packed(game_scene)

func load_main_scene():
	get_tree().change_scene_to_packed(main_scene)

