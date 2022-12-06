shader_type spatial;
uniform int size: hint_range(1,10,1)=1; 

void fragment() {
	float s = float(size); 
	vec2 igrid = floor(UV * s)/s; 	
	ALBEDO = vec3(igrid.x * igrid.y); 
	
}
