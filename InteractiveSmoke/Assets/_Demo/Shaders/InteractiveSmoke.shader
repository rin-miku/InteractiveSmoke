Shader "Custom/InteractiveSmoke"
{
    Properties
    {

    }
    
    SubShader
    {
        Tags { "RenderType"="Transparent" "RenderPipeline"="UniversalPipeline" "Queue"="Transparent"}
        LOD 100
        Pass
        {
            Name "InteractiveSmoke"
            Tags {"LightMode" = "UniversalForward"}
            
            Cull Front
            ZWrite Off
            ZTest Always
            ZClip Off
            Blend SrcAlpha OneMinusSrcAlpha
            
            HLSLPROGRAM
            #include "./Includes.hlsl"

            #pragma multi_compile_instancing
            #pragma vertex Vert
            #pragma fragment Frag

            Varyings Vert(Attributes IN)
            {
                Varyings OUT;
                UNITY_SETUP_INSTANCE_ID(IN);
            	UNITY_TRANSFER_INSTANCE_ID(IN, OUT);
                
                OUT.positionWS = TransformObjectToWorld(IN.positionOS);
                
                return OUT;
            }

            float4 Frag(Varyings IN) : SV_Target
            {
                float4 color = Raymarch(IN);

                return color;
            }
            ENDHLSL
        }
    }
}
