shader_type spatial;
uniform sampler2D tex: repeat_disable; 

void fragment() {
	vec2 resuv = fract(UV * 5.0); 
	ALBEDO = vec3(resuv, 0.0); 
//	ALBEDO = texture(tex, resuv).rgb; 
}
