extends Control


@onready var highscore_label: Label = $HighscoreLabel

func _ready() -> void:
	var high_score = load_highscore()
	highscore_label.text = "HIGHSCORE: " + str(high_score)

func load_highscore() -> int:
	if FileAccess.file_exists("user://highscore.save"):
		var file = FileAccess.open("user://highscore.save", FileAccess.READ)
		var score = int(file.get_as_text())
		file.close()
		return score
	return 0  # Si no existe el archivo, el highscore es 0



func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://world.tscn")


func _on_exit_pressed() -> void:
	get_tree().quit()
