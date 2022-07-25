extends Timer

class_name Task

var id: int = 0
var started_at: int = 0
var finished_at: int = 0
var is_finished: bool = false
var display_name: String = ''
var duration: int = 0
var elapsed_time = 0 setget ,get_elapsed_time
var timer_curr_time = 0 setget ,get_timer_time
var target_node
var timer_callback

var reward: Dictionary = {
	"id": '',
	"display_name": '',
	"quantity": ''
}

func _init(task_type, task_duration, task_started_at, t_node, t_callback) -> void:
	print('%s started at %s for %s seconds'%[task_type, task_started_at,task_duration])
	target_node = t_node
	timer_callback = t_callback
	name = task_type
	duration = task_duration
	started_at = task_started_at
	
	if(self.timer_curr_time <= 0):
		finish_task()
	else:
		set_timer()
	
func set_timer() -> void:
	set_wait_time(self.timer_curr_time + 1)
	# warning-ignore:return_value_discarded
	connect("timeout", self, 'finish_task')
	set_one_shot(true)
	set_autostart(true)
	
func finish_task():
	is_finished = true
	target_node.call(timer_callback)
	
func kill_task():
	queue_free()
	
func resume_task() -> void:
	if(self.timer_curr_time <= 0):
		finish_task()
	else:
		set_wait_time(self.timer_curr_time)
		start()

func restart_task():
	is_finished = false
	elapsed_time = 0
	started_at = OS.get_unix_time()
	set_wait_time(self.timer_curr_time + 1)
	start()
	
func stop_task() -> void:
	stop()
	
func get_elapsed_time():
	return OS.get_unix_time() - started_at 
	
func get_timer_time():
	return duration - self.elapsed_time
	
