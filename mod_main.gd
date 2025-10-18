extends Node

@onready var CC = ModLoader.get_node("ZackeryRSmith-CustomChallenges")

const ZACKERYRSMITH_LO_DIR := "ZackeryRSmith-LethalObstacles"
const ZACKERYRSMITH_LO_LOG_NAME := "ZackeryRSmith-LethalObstacles:Main"

var mod_dir_path := ModLoaderMod.get_unpacked_dir().path_join(
	ZACKERYRSMITH_LO_DIR
)

func _init() -> void:
	var extensions_dir_path = mod_dir_path.path_join("extensions")
	ModLoaderMod.install_script_extension(
		extensions_dir_path.path_join("scenes/gameboy_gas.gd")
	)

func _ready() -> void:
	var challenge = CC.CustomChallenge.new()
	challenge.name = "lethal_obstacles"
	challenge.description = "Obstacles can now just kill you"
	challenge.icon_default = CC.atlas(mod_dir_path.path_join("content/icon.png"), Rect2(0, 0, 32, 32))
	challenge.icon_selected = CC.atlas(mod_dir_path.path_join("content/icon.png"), Rect2(32, 0, 32, 32))
	CC.add_challenge(challenge)
