#version 330 core


layout(location = 0) in vec2 vertex_pos;

out vec2			UV;

void main()
{
	gl_Position = vec4(vertex_pos.xy, 0.1, 1.0);
	UV = vertex_pos.xy * 0.5 + vec2(0.5);
}
