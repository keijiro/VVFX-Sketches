#include "Packages/jp.keijiro.noiseshader/Shader/SimplexNoise3D.hlsl"

void AlphaPattern_float(float3 WPos, float3 Color, out float Output)
{
    const float pi = 3.141592;

    float y = WPos.y * 60 - _Time.y * 10;

    float v = saturate(sin(y * pi * 2));
    v = pow(v, 8) * 200;

    float l = Luminance(Color);
    l = pow(l, 2.2);

    float3 npos = WPos + float3(4.32, 10.13, 8.32) * _Time.y;
    float n = SimplexNoise(npos * 30);
    n = pow(saturate(n * 0.95), 10) * 40 + 1;

    Output = v * l * n;
}
