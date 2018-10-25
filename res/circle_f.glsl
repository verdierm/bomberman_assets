#version 330 core

out vec4		color;

uniform vec4 uni_color;
in vec2 pos;

void	main()
{
    if (pos.x * pos.x + pos.y * pos.y > 1.0)
        discard;
    color = uni_color;
    // color = vec4(1.0, 1.0, 1.0, 1.0);
}
