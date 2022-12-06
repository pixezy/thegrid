shader_type spatial;
#include "functions.gdshaderinc"
uniform int size: hint_range(1,10,1)=1; 

void fragment() {
	float s = float(size); 
	vec2 igrid = floor(UV * s)/s; 	
	float rand = random(igrid); 
	ALBEDO = vec3(rand); 
	
}
