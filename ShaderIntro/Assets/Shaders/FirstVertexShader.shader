Shader "Custom/FirstVertexShader" {
	SubShader{
		Pass{
			CGPROGRAM

			//defing vertex and fragment shader function names
			#pragma vertex vert             
			#pragma fragment frag

			struct vertInput {
				float4 pos : POSITION;
			};

			struct vertOutput {
				float4 pos : SV_POSITION;
			};

			vertOutput vert(vertInput input) {
				vertOutput o;
				//convert 3D vertices to 2D final screen position
				o.pos = mul(UNITY_MATRIX_MVP, input.pos);
				return o;
			}

			half4 frag(vertOutput output) : COLOR{
				//color each vertex as red
				return half4(1.0, 0.0, 0.0, 1.0);
			}
			ENDCG
		}
	}
	Fallback "Diffuse"
}