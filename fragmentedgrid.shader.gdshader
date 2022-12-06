shader_type spatial;
uniform sampler2D tex: repeat_disable; 

void fragment() {
	vec2 igrid = floor(UV * 5.0)/5.0; 
	ALBEDO = vec3(igrid, 0.0); 
//	ALBEDO = texture(tex, resuv).rgb; 
}
