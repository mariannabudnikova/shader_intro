Shader "Custom/SimpleLambertShader" {
	Properties{
		_MainTex("Texture", 2D) = "white" {}
	}
		SubShader{
			Tags{ "RenderType" = "Opaque" }
			CGPROGRAM

		//make the shader look for a function called LightingSimpleLambert
		#pragma surface surf SimpleLambert

		struct Input {
			float2 uv_MainTex;
		};

		sampler2D _MainTex;
		void surf(Input IN, inout SurfaceOutput o) {
			o.Albedo = tex2D(_MainTex, IN.uv_MainTex).rgb;
		}

		half4 LightingSimpleLambert(SurfaceOutput s, half3 lightDir, half atten) {
			half NdotL = dot(s.Normal, lightDir);
			half4 c;
			//atten is used to modulate the intensity of the light, _LightColor0 is the color of the current light
			c.rgb = s.Albedo * _LightColor0.rgb * (NdotL * atten * 2);
			c.a = s.Alpha;
			return c;
		}

		ENDCG
	}
	Fallback "Diffuse"
}