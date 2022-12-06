shader_type canvas_item;

void fragment() {
	vec2 uvresize = fract(UV * 5.0); 
	COLOR = vec4(uvresize,0.0,1.0); 
	COLOR = texture(TEXTURE, uvresize); 
}
