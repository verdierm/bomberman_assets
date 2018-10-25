#version 330 core

layout(points) in;
layout(triangle_strip, max_vertices = 4) out;

in float		car[1];
out vec2		UV;

uniform	vec2	font;



void main()
{
	const float		prt = (1.0f / 16.0f);
	vec2			uv_pos;

	uv_pos[1] = floor(car[0] / 16);
	uv_pos[0] = car[0] - uv_pos[1] * 16;
	uv_pos *= vec2(prt, -prt);
	gl_Position = gl_in[0].gl_Position;
	UV = uv_pos;
	EmitVertex();
	gl_Position = gl_in[0].gl_Position + vec4(0.0, -font[1], 0.0, 0.0);
	UV = uv_pos + vec2(0, -prt);
	EmitVertex();
	gl_Position = gl_in[0].gl_Position + vec4(font[0], 0.0, 0.0, 0.0);
	UV = uv_pos + vec2(prt, 0);
	EmitVertex();
	gl_Position = gl_in[0].gl_Position + vec4(font[0], -font[1], 0.0, 0.0);
	UV = uv_pos + vec2(prt, -prt);
	EmitVertex();

	EndPrimitive();
}
