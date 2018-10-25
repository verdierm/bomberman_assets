#version 330 core

out vec4		color;
in vec2			UV;

const float PI = 3.14159265;
uniform float uni_time;

float sphere(float t, float k)
{
    float d = 1.0+t*t-t*t*k*k;
    if (d <= 0.0)
        return -1.0;
    float x = (k - sqrt(d))/(1.0 + t*t);
    return asin(x*t);
}

void	main()
{
    float t = uni_time;
	vec2 uv = UV;
    // uv *= 2.0;
    float len = length(uv);
    float k = 1.0;
    float len2;

    len2 = sphere(len*k,sqrt(2.0))/sphere(1.0*k,sqrt(2.0));
    if (len2 < 0.0)
    	discard;
	uv = uv * len2 * 0.5 / len;

    vec2 pos = uv;
    float scale1 = 40.0;
    float scale2 = 20.0;
    float val = 0.0;
    
    val += sin((pos.x*scale1 + t));
    val += sin((pos.y*scale1 + t)/2.0);
    val += sin((pos.x*scale2 + pos.y*scale2 + sin(t))/2.0);
    val += sin((pos.x*scale2 - pos.y*scale2 + t)/2.0);
    val /= 2.0;


    float glow = 0.020 / (0.015 + distance(len, 1.0));
    
    val = (cos(PI*val) + 1.0) * 0.5;
    vec3 col2 = vec3(0.3, 0.7, 1.0);
    col2 = col2 * (step(len, 1.0) * 0.5 * val + glow);
    color = vec4(col2, 0.5);
}
