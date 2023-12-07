extends Control

@onready var label_2 = $MarginContainer/HBoxContainer/Label2

# Called when the node enters the scene tree for the first time.
func _ready():
	label_2.text = str(GameMange.getscore()["hightscore"])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("fly"):
		GameMange.load_game_scene()
