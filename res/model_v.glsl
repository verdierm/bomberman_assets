#version 410 core
layout(location = 0) in vec3 vertexPosition;
layout(location = 1) in vec2 vertexTexture;
layout(location = 2) in vec3 vertexNormal;

uniform mat4 projection;
uniform mat4 modelPart;
uniform mat4 model;
uniform mat4 view;
uniform float time;

out vec2 UV;
out vec3 normal;
out vec3 cam_pos;
out	vec3 pos;


vec3 get_cam_pos(const mat4 a_modelView)
{
	mat4 modelViewT = transpose(a_modelView);
	vec3 n1 = modelViewT[0].xyz;
	vec3 n2 = modelViewT[1].xyz;
	vec3 n3 = modelViewT[2].xyz;
	float d1 = modelViewT[0].w;
	float d2 = modelViewT[1].w;
	float d3 = modelViewT[2].w;
	vec3 n2n3 = cross(n2, n3);
	float denom = dot(n1, n2n3);
	vec3 top = (n2n3 * d1) + cross(n1, (d3*n2) - (d2*n3));
	return (top / -denom);
}

void main()
{
	mat4 mvp = projection * view * model * modelPart;
	// mat4 mvp = projection * view * model;
	gl_Position = mvp * vec4(vertexPosition, 1);
	UV = vertexTexture;
	normal = vertexNormal;
	pos = vertexPosition;
	cam_pos = get_cam_pos(mvp);
	// gl_Position = vec4(vertexPosition.xy * 0.03, 0, 1);
	// vColor = vec4(0.5, 0.5, 0.5, 1);
}
