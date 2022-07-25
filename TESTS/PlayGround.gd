extends Node

var DB = DbSim.new()
var current_task

func _on_Button_pressed() -> void:
	DB.save_data(Data.SAVE_GAME_PATH, Data.get_player_data())

func _on_Button2_pressed() -> void:
	print(Data.current_tasks)
	pass

func _on_Button3_pressed() -> void:
	print(Data.display_name)

func _on_Button4_pressed() -> void:
	Data.display_name = "Puto el que lo lea"

func start_tasks_test() -> void:
#	task_test = 
#	add_child(task_test)
	pass

func _on_Get_Wood_pressed() -> void:
	pass

	

