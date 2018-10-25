#version 330 core


layout(location = 0) in vec3 vertex_pos;

out float	car;

void main()
{
	gl_Position = vec4(vertex_pos.xy, -0.1, 1.0);
	car = vertex_pos.z;
}
