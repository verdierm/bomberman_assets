#version 330 core

out vec4		color;
in vec2			UV;

uniform sampler2D uni_tex;

void	main()
{
	vec3 col = texture(uni_tex, UV).xyz;
	// if (col.r == 0)
		// discard;
	color = vec4(col, 1);
}
