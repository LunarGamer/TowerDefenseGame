extends CharacterBody2D

@onready var navigation_agent = $NavigationAgent2D
@export var target_to_chase: CharacterBody2D

const SPEED = 800

func _ready() -> void:
	set_physics_process(false)
	call_deferred("wait_for_physics")
	
func wait_for_physics():
	await get_tree().physics_frame
	set_physics_process(true)


func _physics_process(delta: float) -> void:
	await get_tree().process_frame
	navigation_agent.target_position = target_to_chase.global_position
	velocity = global_position.direction_to(navigation_agent.get_next_path_position()) * SPEED
	move_and_slide()
