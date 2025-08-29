extends NodeState

@export var player: Player
@export var animated_sprite_2d: AnimatedSprite2D

#var direction: Vector2 不再需要局部变量，直接从Player中获取玩家方向

func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	#if Input.is_action_pressed("walk_left"):
		#direction = Vector2.LEFT
	#elif Input.is_action_pressed("walk_right"):
		#direction = Vector2.RIGHT
	#elif Input.is_action_pressed("walk_up"):
		#direction = Vector2.UP
	#elif Input.is_action_pressed("walk_down"):
		#direction = Vector2.DOWN
	#else:
		#direction = Vector2.ZERO
		
	#direction = GameInputEvents.movement_input()直接不要了，然后用Player的变量替代下面的direction
		#
	#if direction == Vector2.UP:
		#animated_sprite_2d.play("idle_back")
	#elif direction == Vector2.RIGHT:
		#animated_sprite_2d.play("idle_right")
	#elif direction == Vector2.DOWN:
		#animated_sprite_2d.play("idle_front")
	#elif direction == Vector2.LEFT:
		#animated_sprite_2d.play("idle_left")
	#else:
		#animated_sprite_2d.play("idle_front")
	
		
	if player.player_direction == Vector2.UP:
		animated_sprite_2d.play("idle_back")
	elif player.player_direction == Vector2.RIGHT:
		animated_sprite_2d.play("idle_right")
	elif player.player_direction == Vector2.DOWN:
		animated_sprite_2d.play("idle_front")
	elif player.player_direction == Vector2.LEFT:
		animated_sprite_2d.play("idle_left")
	else:
		animated_sprite_2d.play("idle_front")
	

func _on_next_transitions() -> void:
	GameInputEvents.movement_input()
	
	if GameInputEvents.movement_input():
		transition.emit("Walk")
		
	if player.current_tool == DataTypes.Tools.AxeWood && GameInputEvents.use_tool():
		transition.emit("Chopping")
	
	if player.current_tool == DataTypes.Tools.TillGround && GameInputEvents.use_tool():
		transition.emit("Tilling")
		
	if player.current_tool == DataTypes.Tools.WaterCrops && GameInputEvents.use_tool():
		transition.emit("Watering")
	   

func _on_enter() -> void:
	pass


func _on_exit() -> void:
	animated_sprite_2d.stop()
