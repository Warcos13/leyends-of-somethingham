extends Node

const SAVE_GAME_PATH = "C:/Users/warco/Desktop/SaveData/player_data.json"

var display_name: String = ""
var current_tasks: Array = [] 

#################################RESOURCES#######################################

var wood: int = 0
var steel: int = 2


func get_player_data() -> Dictionary:
	
	var data:={
		"display_name": display_name,
		"wood": wood,
		"steel": steel,
		"current_tasks": current_tasks
	}
	
	return data

func _ready() -> void:
	var DB = DbSim.new()
	var data : Dictionary = DB.load_data(SAVE_GAME_PATH)
	
	display_name = data.display_name
	wood = data.wood
	steel = data.steel
	current_tasks = data.current_tasks
	
	
	
	
	
	
	
