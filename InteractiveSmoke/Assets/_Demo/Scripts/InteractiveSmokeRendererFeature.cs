using UnityEngine;
using UnityEngine.Rendering.Universal;

public class InteractiveSmokeRendererFeature : ScriptableRendererFeature
{
    private InteractiveSmokeRenderPass InteractiveSmokeRenderPass;

    public override void Create()
    {
        InteractiveSmokeRenderPass = new InteractiveSmokeRenderPass();
    }

    public override void AddRenderPasses(ScriptableRenderer renderer, ref RenderingData renderingData)
    {
        renderer.EnqueuePass(InteractiveSmokeRenderPass);
    }
}
