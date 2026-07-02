shader_type canvas_item;

uniform float speed: hint_range(0.0, 10.0, 0.01) = 1.0;

vec2 hash22(vec2 p) {
	vec3 a = fract(p.xyx * vec3(123.34, 234.34, 345.65));
	a += dot(a, a + 34.45);
	return fract(vec2(a.x * a.y, a.y * a.z));
}

void fragment() {
	
}
