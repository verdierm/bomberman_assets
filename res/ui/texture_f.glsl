#version 330 core

out vec4		color;

in vec2 UV;
in vec3 normal;

uniform sampler2D uni_tex;
uniform vec4 uni_color;

void	main()
{
    color = texture(uni_tex, UV) * uni_color;
}
