shader_type spatial;
#include "functions.gdshaderinc"
uniform int gridsize: hint_range(1,50,1)=1; 

void fragment() {
	float s = float(gridsize); 
	vec2 igrid = floor(UV * s)/s; 	
	float tri = polygon(igrid,0.5,3);
	ALBEDO = vec3(tri); 
	
}
