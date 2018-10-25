#version 330 core


layout(location = 0) in vec2 vertex_pos;

out vec2			UV;

uniform mat2 uni_cam_rot;
uniform vec2 uni_cam_pos;
uniform vec2 uni_cam_scale;

uniform mat2 uni_model_rot;
uniform vec2 uni_model_pos;

void main()
{
	vec2 pos = vertex_pos;
	pos = uni_model_rot * pos - uni_model_pos;
	pos = uni_cam_rot * (pos - uni_cam_pos);
	pos *= uni_cam_scale;
	gl_Position = vec4(pos, 0, 1.0);
	// gl_Position = vec4(vertex_pos, 0, 1.0);
	UV = vertex_pos.xy * 0.5 + vec2(0.5);
}
