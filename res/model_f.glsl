#version 330 core

out vec4		color;

in vec2 UV;
in vec3 normal;
in vec3 cam_pos;
in vec3 pos;
#define M_PI 3.1415926535897932384626433832795

uniform sampler2D uni_tex;
uniform vec4 uni_color;


void	main()
{
	vec3 col = uni_color.w == 0.0f ? texture(uni_tex, UV).rgb * uni_color.rbg : uni_color.rgb;
	vec4 cc = vec4(0, 0, 0, 1);


	/* light rotation
	lig.pos[0] = cos(uni_time) * 10;
	lig.pos[2] = sin(uni_time) * 10;*/

	vec3	cam_dir = -normalize(pos - cam_pos);
	// vec3	light_dir = normalize(lig.pos - pos);
	vec3	light_dir = normalize(vec3(1, -1, -1));

	cc = vec4(vec3(0.1), 1);

	float	coef = cos(dot(light_dir, normal)) / (M_PI / 2) + 0.2;
	if (coef > 0)
	{
		float	dt = dot(cam_dir, light_dir - (normal * dot(light_dir, normal) * 2));
		if (dt > 0)
			coef += pow(dt, 50);
		cc += vec4(col * coef, 0);
	}
	color = clamp(cc, 0, texture(uni_tex, UV).w);
}

/* old

#version 330 core

out vec4		color;

in vec2 UV;
in vec3 normal;

uniform sampler2D uni_tex;
uniform vec4 uni_color;

void	main()
{
	if (uni_color.w == 0.0f)
    	color = vec4(texture(uni_tex, UV).rgb * uni_color.rbg, 1);
	else
		color = uni_color;
}*/