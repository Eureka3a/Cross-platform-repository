class_name InteractableComponent
extends Area2D

signal interctable_activated
signal interctable_deactivated



func _on_body_entered(body: Node2D) -> void:
	interctable_activated.emit()


func _on_body_exited(body: Node2D) -> void:
	interctable_deactivated.emit()
