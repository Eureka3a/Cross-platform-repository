extends NodeState

@export var player: Player	#Player包含CharacterBody2D
@export var animated_spirte_2d: AnimatedSprite2D
@export var speed: int = 50
@export var speed_up: int = 1

func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	var direction: Vector2 = GameInputEvents.movement_input()
	
	if direction == Vector2.UP:
		animated_spirte_2d.play("walk_back")
	elif direction == Vector2.RIGHT:
		animated_spirte_2d.play("walk_right")
	elif direction == Vector2.DOWN:
		animated_spirte_2d.play("walk_front")
	elif direction == Vector2.LEFT:
		animated_spirte_2d.play("walk_left")
		
	if direction != Vector2.ZERO:
		player.player_direction = direction
		
	if Input.is_action_pressed("speed_up"):
		speed_up = 3
	else:
		speed_up = 1
		
	
	player.velocity = direction * speed * speed_up
	player.move_and_slide()
	

func _on_next_transitions() -> void:
	if !GameInputEvents.is_movement_input():
		transition.emit("Idle")
	   

func _on_enter() -> void:
	pass


func _on_exit() -> void:
	animated_spirte_2d.stop()
