shader_type spatial;
#include "functions.gdshaderinc"
uniform int size: hint_range(1, 50, 1)=1;
uniform vec3 color : source_color; 
void fragment() {
	float s = float(size); 
	vec2 igrid = floor(UV * s)/s; 
	vec2 fgrid = fract(UV * s);
	igrid += vec2(sin(TIME)/2.0); 
	vec2 ri_grid = rotation(igrid, vec2(0.5),sin(TIME));  
	float t_mask = 1.0 -polygon(ri_grid,0.4,3); 
	float c_grid = 1.0 - circle(fgrid,0.4,0.02); 	
	vec3 gray = vec3(0.01,0.01,0.01); 
	vec3 output = mix(c_grid*gray,c_grid*color,t_mask); 
	ALBEDO = output; 
	EMISSION = t_mask*c_grid*color*5.0; 
}
