float4 Raymarch(Varyings IN)
{
    Ray ray;
    ray.origin = GetCameraPositionWS();
    ray.dir = normalize(IN.positionWS - ray.origin);
    
    AABB aabb;
    aabb.min = _AABBCenter - 0.5 * _AABBScale;
    aabb.max = _AABBCenter + 0.5 * _AABBScale;
    
    float2 screenUV = ComputeNormalizedDeviceCoordinates(IN.positionWS);
    float sceneDepth = SampleSceneDepth(screenUV);
    
    float tNear, tFar;
    if (!RayAABBTest(ray, aabb, sceneDepth, tNear, tFar))
        discard;
    
    float thickness = tFar - tNear;
    float stepLength = thickness * rcp(_MaxSteps);
    float rayLength = tNear * stepLength;
    
    float3 rayPositionWS;
    
    for (int i = 0; i < _MaxSteps; i++)
    {
        rayPositionWS = ray.origin + ray.dir * rayLength;
        
        rayLength += stepLength;
        if (rayLength > tFar)
            break;
    }
    return float4(1, 1, 1, 1);
}