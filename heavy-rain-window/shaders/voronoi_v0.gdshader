shader_type canvas_item;

uniform vec2 resolution = vec2(600.0, 400.0);

void fragment() {
	vec2 uv = UV - 0.5;
	uv.x *= resolution.x / resolution.y;
	vec2 n = vec2(0.0);
	float d = length(uv - n);
	vec3 col = vec3(d);
	COLOR = vec4(col, 1.0);
}
