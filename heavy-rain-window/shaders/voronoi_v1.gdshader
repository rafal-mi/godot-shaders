shader_type canvas_item;

uniform vec2 resolution = vec2(600.0, 400.0);

void fragment() {
	vec2 uv = UV - 0.5;
	uv.x *= resolution.x / resolution.y;
	uv *= 5.0;
	float min_dist = 100.0;
	for(float x = 0.0; x <= 1.0; x += 0.5) {
		vec2 n = vec2(x);
		float d = length(uv - n);
		if(d < min_dist) {
			min_dist = d;
		}
	}
	vec3 col = vec3(min_dist);
	COLOR = vec4(col, 1.0);
}
