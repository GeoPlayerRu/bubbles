shader_type canvas_item;

uniform vec3 first_shine_color : source_color = vec3(0.886275,0.360784,0.92549);
uniform vec3 second_shine_color : source_color = vec3(0.886275,0.360784,0.92549);
uniform float alpha : hint_range(0.0, 1.0, 0.01) = 1.0;
uniform float border : hint_range(0.0, 1.0, 0.01);

bool is_color(vec3 first, vec3 second, float tolerance)
{
	vec3 diff = first-second;
	return abs(diff.x) < tolerance && abs(diff.y) < tolerance && abs(diff.z) < tolerance;
}

void fragment() {
	COLOR = texture(TEXTURE,UV);
	if (COLOR.a > 0.0 && is_color(COLOR.rgb,vec3(0.95),0.5))
	{
		COLOR.a = 1.0;
	}
	if (distance(vec2(0.5),UV) < border && is_color(COLOR.rgb,vec3(0.95),0.5))
	{
	COLOR.rgb = mix(first_shine_color,COLOR.rgb,clamp(distance(vec2(sin(TIME/4.0)/2.0),UV-0.5)/alpha,0,1.0));
	COLOR.rgb = mix(second_shine_color,COLOR.rgb,clamp(distance(UV,0.5+vec2(sin(TIME),cos(TIME))*0.5)/alpha,0,1));
	}
}