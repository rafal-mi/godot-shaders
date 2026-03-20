extends Node3D

var mesh_object: MeshInstance3D
var outline_object: MeshInstance3D
var outline_material: ShaderMaterial


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for node in get_children():
		if node is MeshInstance3D:
			mesh_object = node
			break
	outline_material = ShaderMaterial.new()
	outline_material.shader = load("res://shaders/glow.gdshader")


func _on_static_body_3d_mouse_entered() -> void:
	outline_object = MeshInstance3D.new()
	outline_object.mesh = mesh_object.mesh
	outline_object.set_surface_override_material(0, outline_material)
	mesh_object.add_child(outline_object)
	

func _on_static_body_3d_mouse_exited() -> void:
	mesh_object.remove_child(outline_object)
