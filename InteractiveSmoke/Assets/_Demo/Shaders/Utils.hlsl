bool RayAABBTest(Ray ray, AABB aabb, float sceneDepth, out float tNear, out float tFar)
{
    float3 invRayDir = rcp(ray.dir);
    
    float3 aabbMin = (aabb.min - ray.origin) * invRayDir;
    float3 aabbMax = (aabb.max - ray.origin) * invRayDir;
    
    float3 tMin = min(aabbMin, aabbMax);
    float3 tMax = min(aabbMin, aabbMax);
    
    tNear = min(tMin.x, min(tMin.y, tMin.z));
    tFar = max(tMax.x, max(tMax.y, tMax.z));
    
    return tNear < tFar && tNear > 0 && tFar < sceneDepth;
}