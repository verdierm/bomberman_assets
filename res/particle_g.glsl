#version 410

layout(points) in;
layout(triangle_strip) out;
layout(max_vertices = 4) out;    
   
uniform mat4 uni_projection;

float particle_size = 1.0;
in float life[];

in	Vertex
{
	vec4 color;
}	vertex[];


out vec2 Vertex_UV;
out vec4 Vertex_Color;
   
void main (void)
{
	if (life[0] > 0)
	{
		vec4 P = gl_in[0].gl_Position;

		// a: left-bottom 
		vec2 va = P.xy + vec2(-0.5, -0.5) * particle_size;
		gl_Position = uni_projection * vec4(va, P.zw);
		Vertex_UV = vec2(0.0, 0.0);
		Vertex_Color = vertex[0].color;
		EmitVertex();

		// d: right-bottom
		vec2 vd = P.xy + vec2(0.5, -0.5) * particle_size;
		gl_Position = uni_projection * vec4(vd, P.zw);
		Vertex_UV = vec2(1.0, 0.0);
		Vertex_Color = vertex[0].color;
		EmitVertex();

		// b: left-top
		vec2 vb = P.xy + vec2(-0.5, 0.5) * particle_size;
		gl_Position = uni_projection * vec4(vb, P.zw);
		Vertex_UV = vec2(0.0, 1.0);
		Vertex_Color = vertex[0].color;
		EmitVertex();

		// c: right-top
		vec2 vc = P.xy + vec2(0.5, 0.5) * particle_size;
		gl_Position = uni_projection * vec4(vc, P.zw);
		Vertex_UV = vec2(1.0, 1.0);
		Vertex_Color = vertex[0].color;
		EmitVertex();

		EndPrimitive();  
	}
}  