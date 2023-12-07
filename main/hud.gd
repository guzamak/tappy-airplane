extends Control

@onready var score_label = $MarginContainer/ScoreLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	GameMange.on_score_change.connect(on_score_change)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func on_score_change():
	score_label.text = str(GameMange.getscore()["socre"])
	
