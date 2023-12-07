extends ParallaxBackground

var scroll_speed = 120

# Called when the node enters the scene tree for the first time.
func _ready():
	GameMange.on_game_over.connect(on_game_over)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	scroll_offset.y = delta * scroll_speed * -1


func on_game_over():
	set_process(false)
