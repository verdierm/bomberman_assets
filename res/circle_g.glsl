#version 330 core

layout(points) in;
layout(triangle_strip, max_vertices = 4) out;

uniform vec2 uni_scale;
out vec2 pos;

void main()
{
	vec4 ori = vec4(
		gl_in[0].gl_Position.x,
		gl_in[0].gl_Position.y,
		0.0,
		1.0);

	gl_Position = ori + vec4(
		-uni_scale.x * gl_in[0].gl_Position.z,
		-uni_scale.y * gl_in[0].gl_Position.z,
		0.0,
		0.0);
	pos = vec2(-1, -1);
	EmitVertex();
	gl_Position = ori + vec4(
		uni_scale.x * gl_in[0].gl_Position.z,
		-uni_scale.y * gl_in[0].gl_Position.z,
		0.0,
		0.0);
	pos = vec2(1, -1);
	EmitVertex();
	gl_Position = ori + vec4(
		-uni_scale.x * gl_in[0].gl_Position.z,
		uni_scale.y * gl_in[0].gl_Position.z,
		0.0,
		0.0);
	pos = vec2(-1, 1);
	EmitVertex();
	gl_Position = ori + vec4(
		uni_scale.x * gl_in[0].gl_Position.z,
		uni_scale.y * gl_in[0].gl_Position.z,
		0.0,
		0.0);
	pos = vec2(1, 1);
	EmitVertex();
	EndPrimitive();
}
