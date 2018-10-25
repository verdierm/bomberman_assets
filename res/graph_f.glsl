#version 330 core

out vec4		color;
in vec2			UV;

uniform float dataMin;
uniform float dataMax;
uniform sampler1D tex;

void	main()
{
	// if (texture(tex, UV).r == 0)
		// discard;
	float size = dataMax - dataMin;
	float mid = -dataMin / size;
	float val = (texture(tex, UV.x).x - dataMin) / size;

	if (UV.y <= mid + 0.01 && UV.y >= mid)
	{
		color = vec4(0.1, 0.1, 0.1, 1);
		return ;
	}
	if (UV.y > val)
		discard;
	color = vec4(0.2, 0.2, 0.2, 1);
}
