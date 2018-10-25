#version 410

layout(location = 0) in vec3 pos;
layout(location = 1) in vec3 dir;
layout(location = 2) in float lifetime;


//in vec4 vertex_pos;
//in vec4 vertex_color;

uniform mat4 uni_modelView;
out float life;


out	Vertex
{
	vec4 color;
}	vertex;

void main()
{
	// gl_Position = uni_modelView * vertex_pos;
	gl_Position = uni_modelView * vec4(pos, 1);
	vertex.color = vec4(1, 1, 1, lifetime * 0.5f);
	life = lifetime;
}