#version 330 core

layout(points) in;
layout(triangle_strip, max_vertices = 4) out;

out vec2 UV;

void main()
{
	gl_Position = vec4(gl_in[0].gl_Position.xy, 0.0, 1.0);
	UV = vec2(0, 0);
	EmitVertex();
	gl_Position = vec4(
		gl_in[0].gl_Position.x + gl_in[0].gl_Position.z,
		gl_in[0].gl_Position.y,
		-0.05, 1.0);
	UV = vec2(1, 0);
	EmitVertex();
	gl_Position = vec4(
		gl_in[0].gl_Position.x,
		gl_in[0].gl_Position.y + gl_in[0].gl_Position.w,
		-0.05, 1.0);
	UV = vec2(0, 1);
	EmitVertex();
	gl_Position = vec4(
		gl_in[0].gl_Position.x + gl_in[0].gl_Position.z,
		gl_in[0].gl_Position.y + gl_in[0].gl_Position.w,
		-0.05, 1.0);
	UV = vec2(1, 1);
	EmitVertex();
	EndPrimitive();
}
