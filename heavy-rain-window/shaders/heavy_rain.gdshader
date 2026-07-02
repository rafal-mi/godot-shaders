shader_type canvas_item;

uniform float speed: hint_range(0.0, 10.0, 0.01) = 1.0;
uniform float zoom: hint_range(1.0, 50.0, 0.01) = 20.0;
uniform float blur: hint_range(1.0, 1.0, 0.01) = 0.5;
uniform float fluctuations: hint_range(1.0, 10.0, 0.01) = 5.0;
uniform float size: hint_range(0.1, 100.0, 0.01) = 10.0;
uniform float refraction: hint_range(0.1, 10.0, 0.01) = 10.0;
uniform float density: hint_range(1.0, 5.0, 1.0) = 3.0;

vec2 hash22(vec2 p) {
	vec3 a = fract(p.xyx * vec3(123.34, 234.34, 345.65));
	a += dot(a, a + 34.45);
	return fract(vec2(a.x * a.y, a.y * a.z));
}

float voronoi_noise(float time, vec2 uv) {
	vec2 grid_uv = fract(uv) - 0.5;
	vec2 grid_coords = floor(uv);
	float min_dist = 100.0;
	for(float y = -1.0; y <= 1.0; y++) {
		for (float x = -1.0; x <= 1.0; x++) {
			vec2 offset = vec2(x, y);
			vec2 pos = cos(hash22(grid_coords + offset) * time * fluctuations) * 0.5 + 0.5;
			min_dist = min(min_dist, length(pos + offset - grid_uv));
		}
	}	
	return min_dist;
}

float layers(vec2 uv, float time, float sharpness) {
	float result = 0.0;
	for(float i = 1.0; i < density; i++) {
		uv -= vec2(0.0, time * i / density);
		float drop = clamp(voronoi_noise(time, uv * i) * 2.0, 0.0, 1.0);
		result += pow(cos(drop * PI) * 0.5 + 0.5, sharpness);
		
	}
	result /= density;
	return result;
}

vec3 rainy_window(vec2 uv, float time, float sharpness) {
	float d = 1.0 / refraction;
	float x = layers(uv + vec2(d, 0.0), time, sharpness) - layers(uv + vec2(-d, 0.0), time, sharpness);
	float y = layers(uv + vec2(0.0, d), time, sharpness) - layers(uv + vec2(0.0, -d), time, sharpness);
	return normalize(vec3(x, y, d));
}

void fragment() {
	vec2 uv = UV - 0.5;
	vec2 resolution = 1.0 / TEXTURE_PIXEL_SIZE;
	uv.x *= resolution.x / resolution.y;
	float time = TIME * speed;
	vec3 rain = rainy_window(uv * zoom, time, 10.0 / size);
	COLOR = texture(TEXTURE, UV + blur * 0.1 * rain.xy);
}
