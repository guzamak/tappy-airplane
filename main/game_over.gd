extends Control

@onready var press_space_text = $PressSpaceText
@onready var game_over_text = $GameOverText
@onready var timer = $Timer

var _can_press_space = false
# Called when the node enters the scene tree for the first time.
func _ready():
	GameMange.on_game_over.connect(on_game_over)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if _can_press_space == true and Input.is_action_just_pressed("fly") :
		GameMange.load_main_scene()
		

func on_game_over():
	#show hide item all
	game_over_text.show()
	timer.start()
	
	
func run_sequence():
	game_over_text.hide()
	press_space_text.show()
	_can_press_space = true
	

func _on_timer_timeout():
	run_sequence()
