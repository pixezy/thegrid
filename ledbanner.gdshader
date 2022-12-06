shader_type spatial;
#include "functions.gdshaderinc"
uniform int gridsize: hint_range(1,50,1)=1; 
uniform vec3 ledcolor : source_color; 
uniform vec3 bannercolor : source_color; 

void fragment() {
	float s = float(gridsize); 
	vec2 igrid = floor(UV * s)/s; 	
	vec2 fgrid = fract(UV * s); 
	igrid.x += sin(TIME); 
	float t_mask = 1.0 - polygon(igrid,0.3,3); 
	float c_grid = 1.0 - circle(fgrid,0.4,0.02); 
	vec3 output = mix(c_grid*bannercolor, c_grid * ledcolor, t_mask); 
	

	ALBEDO = output; 
	EMISSION = t_mask * c_grid * ledcolor*5.0; 
	
}
