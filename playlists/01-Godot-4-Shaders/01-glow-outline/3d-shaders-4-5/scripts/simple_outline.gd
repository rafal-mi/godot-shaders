extends MeshInstance3D

@onready var mesh_instance_3d: MeshInstance3D = $MeshInstance3D

func _ready() -> void:
	mesh_instance_3d.visible = false

func _on_static_body_3d_mouse_entered() -> void:
	mesh_instance_3d.visible = true


func _on_static_body_3d_mouse_exited() -> void:
	mesh_instance_3d.visible = false
