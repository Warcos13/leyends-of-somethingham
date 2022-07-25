extends Node2D

onready var task_text = $Result
onready var claim_button = $Claim
onready var button = $Button

export var task_type: String = ""
export var base_reward: int = 0
export var reward_resource: String = ""

var current_task

func _ready() -> void:
	# warning-ignore:return_value_discarded
	button.connect("pressed", self, "start_task")
	claim_button.connect("pressed", self, "claim_pressed")

func start_task() -> void:
	current_task = Task.new(task_type, 3, OS.get_unix_time(), self, 'task_finished')
	button.disabled = true
	add_child(current_task)
	
func _process(_delta: float) -> void:
	if(current_task!=null):
		update_text()

func update_text():
	var time_left = current_task.get_time_left()
	var seconds = fmod(time_left,60)
	var minutes = fmod(time_left,3600) / 60
	if(time_left > 0):
		task_text.set_text('%02d:%02d' % [minutes, seconds])

func task_finished() -> void:
	current_task = null
	task_text.set_text('Finished!!!')
	
	claim_button.show()
	

func claim_pressed() -> void:
	claim_button.hide()
	button.disabled = false
	Data[reward_resource] += base_reward
