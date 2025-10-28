struct Attributes
{
    float4 positionOS : POSITION;
    UNITY_VERTEX_INPUT_INSTANCE_ID
};
                        
struct Varyings
{
    float3 positionWS : TEXCOORD0;
    UNITY_VERTEX_INPUT_INSTANCE_ID
};

struct Ray
{
    float3 origin;
    float3 dir;
};

struct AABB
{
    float3 min;
    float3 max;
};