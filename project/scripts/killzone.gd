extends Area2D
@onready var timer: Timer = $Timer
@onready var sound: AudioStreamPlayer2D = $sound


func _on_body_entered(body: Node2D) -> void:
	print("You Died")
	Engine.time_scale = .5
	body.get_node("CollisionShape2D").queue_free()
	body.get_node("AnimatedSprite2D").play("died")
	sound.play()
	timer.start()
	

func _on_timer_timeout() -> void:
	Engine.time_scale = 1
	get_tree().reload_current_scene()
	
