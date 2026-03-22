extends Node3D

@export var scale_factor: float = 1.0
@export var glow_color: Color = Color(0.3, 0.6, 1.0)
@export var glow_intensity: float = 2.0
@export var glow_power: float = 2.0

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
	outline_material.set_shader_parameter("glow_color", glow_color)
	outline_material.set_shader_parameter("glow_intensity", glow_intensity)
	outline_material.set_shader_parameter("glow_power", glow_power)
	
func _process(delta: float) -> void:
	rotate_y(delta)


func _on_static_body_3d_mouse_entered() -> void:
	outline_object = MeshInstance3D.new()
	outline_object.mesh = mesh_object.mesh
	outline_object.set_surface_override_material(0, outline_material)
	outline_object.scale = Vector3(scale_factor, scale_factor, scale_factor)
	mesh_object.add_child(outline_object)
	

func _on_static_body_3d_mouse_exited() -> void:
	mesh_object.remove_child(outline_object)
