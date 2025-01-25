shader_type canvas_item;

uniform vec3 shine_color : source_color = vec3(0.886275,0.360784,0.92549);
uniform float alpha : hint_range(0.0, 1.0, 0.1) = 1.0;

void fragment() {
	COLOR.rgb = mix(shine_color,texture(TEXTURE,UV).rgb,clamp(distance(vec2(sin(TIME/4.0)/2.0),UV-0.5)/alpha,0,1.0));
}