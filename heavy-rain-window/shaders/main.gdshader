shader_type canvas_item;

const vec2 center = vec2(0.5, 0.5);
const vec2 points[2] = vec2[](vec2(0.3, 0.5), vec2(0.7, 0.5));

void vertex() {
	// Called for every vertex the material is visible on.
}

vec4 uv_cordinates_color(vec2 _UV) {
	return vec4(_UV, 0.0, 1.0);
}

vec4 distance_from_center_color(vec2 _UV) {
	float d = length(_UV - center);
	vec3 color = vec3(d);
	return vec4(color, 1.0);
}

vec4 min_distance_color(vec2 _UV) {
	float min_dist = 1000.0;
	for(int i = 0; i < 2; i++) {
		float d = length(_UV - points[i]);
		if(d < min_dist) {
			min_dist = d;
		}
	}
	vec3 color = vec3(min_dist * 4.0);
	return vec4(color, 1.0);
}

void fragment() {
	COLOR = min_distance_color(UV);
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
