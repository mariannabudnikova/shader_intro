Shader "Custom/SurfaceColor" {
	Properties{
		_Color ("Color", Color) = (1,0,0,1)
	}

	SubShader{
		Tags{
		"RenderType" = "Opaque" 
		}

		CGPROGRAM
		#pragma surface surf Lambert

		half4 _Color;

		struct Input {
			float4 color : COLOR;
		};
		void surf(Input IN, inout SurfaceOutput o) {
			o.Albedo = _Color; // 1 = (1,1,1,1) = white
		}
		ENDCG
	}
	Fallback "Diffuse"
}
