#version 330 core

out vec4		color;

uniform vec4 uni_color;

void	main()
{
    color = uni_color;
    // color = vec4(1.0, 1.0, 1.0, 1.0);
}
