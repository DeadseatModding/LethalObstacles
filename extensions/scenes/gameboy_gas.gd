extends "res://scenes/gameboy_gas.gd"

@onready var CC = ModLoader.get_node("ZackeryRSmith-CustomChallenges")

func obstacle_hit() -> void:
	if CC.challenges.get("lethal_obstacles"):
		var audio_player := AudioStreamPlayer2D.new()
		audio_player.stream = load("res://sfx/2D_Car_HitObject.mp3")
		Engine.get_main_loop().root.add_child(audio_player)
		audio_player.play()

		Global.killed_by_monster()

		await audio_player.finished
		audio_player.queue_free()
	else:
		super()
