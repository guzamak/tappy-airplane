extends Node2D

@export var pipe_secne : PackedScene #need initializer

@onready var pipe_holder = $PipeHolder
@onready var spawn_u = $SpawnU
@onready var spawn_l = $SpawnL
@onready var spawn_timer = $SpawnTimer
@onready var emg_ine_sound = $EmgIneSound
@onready var game_over_sound = $GameOverSound

# Called when the node enters the scene tree for the first time.
func _ready():
	GameMange.on_game_over.connect(on_game_over)
	spawpipes()
	GameMange.resetscore()
	emg_ine_sound.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func spawpipes():
	#random
	var random_y = randf_range(spawn_u.position.y,spawn_l.position.y)
	var new_pipe = pipe_secne.instantiate()
	
	new_pipe.position = Vector2(spawn_u.position.x,random_y)
	#คล้ายทำเว็บ add ก่อนค่อยมี
	pipe_holder.add_child(new_pipe)
	
	
func stop_spawpipes():
	#stop timeout
	spawn_timer.stop()
	for pipe in pipe_holder.get_children():
		# หยุด func _process ใน pipe
		pipe.set_process(false)

func _on_spawn_timer_timeout():
	spawpipes()


func on_game_over():
	stop_spawpipes()
	emg_ine_sound.stop()
	game_over_sound.play()
