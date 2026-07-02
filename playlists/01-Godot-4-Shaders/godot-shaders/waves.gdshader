shader_type canvas_item;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec2 coords = UV / 4.0;
	COLOR = vec4(mod(coords.x, 1.0) + mod(coords.y, 1.0), mod(coords.x, 1.0) - mod(coords.y, 1.0), mod(coords.x, 1.0) * mod(coords.y, 1.0), 1.0);
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
