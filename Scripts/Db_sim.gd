extends Reference

class_name DbSim

var _file := File.new()

func save_data (path, data) -> void:
	var error := _file.open(path,File.WRITE)
	if error != OK:
		printerr("Could notr open %s. Aborting. Error: %s" %[path, error])
		return
		
	var json_string := JSON.print(data)
	_file.store_string(json_string)
	_file.close()


func load_data(path):
	var error := _file.open(path, File.READ)
	if error != OK:
		printerr("Could not open %s. Aborting. Error: %s" %[path, error])
		return 
	
	var content := _file.get_as_text()
	_file.close()
	
	var data : Dictionary = JSON.parse(content).result
	
	return data
	
	
	
	
	
	
func get_task(task_id):
	for task in available_task:
		if (task['task_id'] == task_id):
			return task
	return null

var available_task: Dictionary = {
	"get_wood": {
		"base_reward":5,
		"reward_resource": "wood",
	},
	"steel": {
		"base_reward":2,
		"reward_resource": "steel",
	},
}
