extends CharacterBody3D

const SPEED = 5
const JUMP_VELOCITY = 4.5

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready():
	pass

func _physics_process(delta: float) -> void:
	if is_on_floor():
		var random_dir = Vector3(randf_range(-1, 1), 0, randf_range(-1, 1)).normalized()
		rotate_y(random_dir.y * delta)
		velocity.x = random_dir.x * SPEED
		velocity.z = random_dir.z * SPEED
		velocity.y = JUMP_VELOCITY
		var target_pos = global_position + Vector3(velocity.x, 0, velocity.z)
		if target_pos != global_position:
			look_at(target_pos, Vector3.UP)
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	move_and_slide()
