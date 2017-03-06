Shader "BattleCityShader/TextureAnimation" 
{
	Properties 
	{
		_diffuseTex ("Base Texture", 2D) = "white" {}
		//_colorBias ("Color Bias", Color) = (1.0, 1.0, 1.0, 1.0)
	}
	
	SubShader 
	{
		Tags {"RenderType"="Opaque"}
		//Cull Off
		//Blend SrcAlpha OneMinusSrcAlpha
		//ZWrite On
		Pass{
			CGPROGRAM
			#pragma vertex	vert
			#pragma fragment frag
			#include "UnityCG.cginc"
	
			sampler2D 	_diffuseTex;
			//float4 		_colorBias;			
	
			struct VSOUPUT
			{
				float4 pos:SV_POSITION;
				float2 uv:TEXCOORD0;
			};
			
			VSOUPUT vert(appdata_full v)
			{
				VSOUPUT o;
				o.pos	=	mul(UNITY_MATRIX_MVP, v.vertex);
				o.uv	=	(v.texcoord + _Time*0.6f);//TRANSFORM_TEX(v.texcoord,_MainTex);
				return o;
			};
		
			half4 frag(VSOUPUT IN) :COLOR
			{
				half4 c 	= tex2D(_diffuseTex, IN.uv);
				return c;
			}
			ENDCG
		}
	}
		
	FallBack "Diffuse"
}
