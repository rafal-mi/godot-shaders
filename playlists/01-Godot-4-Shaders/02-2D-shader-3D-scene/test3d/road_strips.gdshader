shader_type canvas_item;

const vec2 stripe_rect = vec2(0.05, 0.03);
const float margin = 0.05;

const float G = 0.35;

void fragment() {
	float f = 1.0;
	COLOR = vec4(G, G, G, 1.0);
	if(margin < UV.y && UV.y <= margin + stripe_rect.y
		|| 1.0 - margin - stripe_rect.y < UV.y && UV.y < 1.0 - margin) {
		COLOR = vec4(1.0, 1.0, 0.0, 1.0);
	}
	if(UV.x <= 0.5
		&& 0.5 - stripe_rect.y / 2.0 < UV.y
		&& UV.y <= 0.5 + stripe_rect.y / 2.0) {
		COLOR = vec4(1.0, 1.0, 0.0, 1.0);
	}

}
