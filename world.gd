extends Node2D

const SawBladeTelegraphScene = preload("res://saw_blade_telegraph.tscn")

@onready var timer: Timer = $Timer
@onready var spawn_zone: ColorRect = $SpawnZone
@onready var saw_count_label: Label = $SawCountLabel

var saw_count = 0
var high_score = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_zone.hide()
	timer.timeout.connect(_on_timer_timeout)
	Events.balloon_popped.connect(timer.stop)
	Events.saw_blade_added.connect(update_saw_count)
	high_score = load_highscore()  # Cargar el highscore al inicio del juego

func update_saw_count():
	saw_count += 1
	saw_count_label.text = "Blades\n" + str(saw_count)
	check_for_new_highscore()

func check_for_new_highscore():
	if saw_count > high_score:
		high_score = saw_count
		save_highscore()  # Guardar el highscore si hay un nuevo record

func save_highscore():
	var file = FileAccess.open("user://highscore.save", FileAccess.WRITE)
	file.store_string(str(high_score))
	file.close()

func load_highscore() -> int:
	if FileAccess.file_exists("user://highscore.save"):
		var file = FileAccess.open("user://highscore.save", FileAccess.READ)
		var score = int(file.get_as_text())
		file.close()
		return score
	return 0  # Si no existe el archivo, el highscore es 0

func _on_timer_timeout():
	var saw_blade_telegraph = SawBladeTelegraphScene.instantiate()
	var rect = spawn_zone.get_global_rect()
	var saw_x = randf_range(rect.position.x, rect.end.x)
	var saw_y = randf_range(rect.position.y, rect.end.y)
	saw_blade_telegraph.position = Vector2(saw_x, saw_y)
	add_child(saw_blade_telegraph)
