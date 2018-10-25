#version 330 core

out vec4		color;
in vec2			UV;

uniform sampler2D tex;

void	main()
{
	if (texture(tex, UV).r == 0)
		discard;
	color = vec4(1,1, 1,texture(tex, UV).r);
}
