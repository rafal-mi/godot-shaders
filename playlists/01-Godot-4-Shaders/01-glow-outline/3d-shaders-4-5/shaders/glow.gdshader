shader_type spatial;

render_mode blend_add, unshaded;

uniform vec4 glow_color: source_color = vec4(0.3, 0.6, 1.0, 1.0);
uniform float glow_intensity: hint_range(0.0, 10.0, 0.01) = 2.0;
uniform float glow_sharpness: hint_range(0.1, 10.0, 0.01) = 2.0;
uniform float pulse_speed: hint_range(0.0, 10.0, 0.01) = 1.0;
uniform float pulse_strength: hint_range(0.0, 1.0, 0.01) = 0.3;


void fragment() {
	float fresnel = pow(1.0 - abs(dot(NORMAL, VIEW)), glow_sharpness);
	float pulse = 1.0 + pulse_strength * sin(TIME * pulse_speed * PI);
	float alpha = fresnel * glow_intensity * pulse;
	
	ALBEDO = glow_color.rgb;
	ALPHA = alpha;
	EMISSION = glow_color.rgb * alpha;
}

