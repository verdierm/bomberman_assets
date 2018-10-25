#version 330 core

layout(points) in;
layout(triangle_strip, max_vertices = 7) out;

uniform vec2 uni_scale;

void main()
{
	vec4 ori = vec4(
		clamp(gl_in[0].gl_Position.x, -1.0 ,1.0),
		clamp(gl_in[0].gl_Position.y, -1.0, 1.0),
		gl_in[0].gl_Position.z,
		gl_in[0].gl_Position.w);
	vec2 dir = normalize(gl_in[0].gl_Position.xy);
	vec2 left = vec2(-dir.y, dir.x);
	dir *= uni_scale;
	left *= uni_scale;

	gl_Position = ori;
	EmitVertex();
	gl_Position = ori + vec4( + left - dir, 0.0, 0.0);
	EmitVertex();
	gl_Position = ori + vec4( - left - dir, 0.0, 0.0);
	EmitVertex();
	EndPrimitive();
	left = left * 0.5;
	gl_Position = ori + vec4( - dir + left, 0.0, 0.0);
	EmitVertex();
	gl_Position = ori + vec4( - dir - left, 0.0, 0.0);
	EmitVertex();
	gl_Position = ori + vec4( - dir - dir + left, 0.0, 0.0);
	EmitVertex();
	gl_Position = ori + vec4( - dir - dir - left, 0.0, 0.0);
	EmitVertex();
	EndPrimitive();
}
