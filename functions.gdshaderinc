float random (vec2 uv) {
    return fract(sin(dot(uv.xy,
        vec2(12.9898,78.233))) * 43758.5453123);
}
vec2 rotation ( vec2 uv, vec2 center, float angle){
    mat2 rotation = mat2(
                    vec2(cos(angle), -sin(angle)), 
                    vec2(sin(angle), cos(angle))
                    );
    uv -= center; 
    uv *= rotation; 
    uv += center; 
    return uv;               
}
float circle(vec2 position, float radius, float feather)
{
	return smoothstep(radius, radius + feather, length(position - vec2(0.5)));
}
float rectangle (vec2 uv, float width, float height,float feather){
    vec2 uv_cartesian = uv * 2.0 - 1.0; 
    vec2 uv_reflected = abs(uv_cartesian); 
    float dfx = smoothstep(width,width + feather,uv_reflected.x);
    float dfy = smoothstep(height,height + feather, uv_reflected.y); 
    return max(dfx,dfy); 
}
float polygon(vec2 uv, float width, int sides)
{
    uv = uv * 2.0 - 1.0;
    float angle = atan(uv.x, uv.y);
    float radius = TAU / float(sides);  
    float dist = cos(floor(0.5 + angle / radius) * radius - angle)* length(uv) ;
    float poly = step(width, dist);
    return poly; 
}
