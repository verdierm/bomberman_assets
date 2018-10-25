#version 410

uniform sampler2D uni_tex;
in vec2 Vertex_UV;
in vec4 Vertex_Color;
out vec4 FragColor;

void main (void)
{
	vec2 uv = Vertex_UV.xy;
	// uv.y *= -1.0;
	// vec3 t = texture(uni_tex, uv).rgb;
	// FragColor = vec4(t, 1.0) * Vertex_Color;
	vec4 color = texture(uni_tex, uv) * Vertex_Color; 
	if (length(color.rgb) < 0.5)
		discard;
	FragColor = color.gbra;
}