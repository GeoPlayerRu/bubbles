shader_type canvas_item;

uniform float amount;

void fragment() {
	COLOR.rgb = mix(COLOR.rgb,vec3(1.0),amount);
}