Shader "Custom/FirstSurfaceShader"{

	Properties{
		_MainTex("My texture", 2D) = "white" {}
	}

	SubShader {
		CGPROGRAM
		// Uses the Lambertian lighting model
		#pragma surface surf Lambert

		sampler2D _MainTex; // The input texture

		struct Input {
			float2 uv_MainTex;
		};

		void surf(Input IN, inout SurfaceOutput o) {
			o.Albedo = tex2D(_MainTex, IN.uv_MainTex).rgb;
		}
		ENDCG
	}
	Fallback "Diffuse"
}
