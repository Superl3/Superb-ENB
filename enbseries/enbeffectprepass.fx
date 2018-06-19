//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// ENBSeries effect file
// visit http://enbdev.com for updates
// Copyright (c) 2007-2011 Boris Vorontsov
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//+++++++++++++++++++++++++++++
// External parameters, do not modify
//+++++++++++++++++++++++++++++
// Keyboard controlled temporary variables (in some versions exists in the config file). Press and hold key 1,2,3...8 together with PageUp or PageDown to modify.
// By default all set to 1.0
float4 tempF1; //0,1,2,3
float4 tempF2; //5,6,7,8
float4 tempF3; //9,0
// x=Width, y=1/Width, z=ScreenScaleY, w=1/ScreenScaleY
float4 ScreenSize;
// x=generic timer in range 0..1, period of 16777216 ms (4.6 hours), w=frame time elapsed (in seconds)
float4 Timer;
//changes in range 0..1, 0 means that night time, 1 - day time
float	ENightDayFactor;
//changes 0 or 1. 0 means that exterior, 1 - interior
float	EInteriorFactor;
// Adaptation delta time for focusing
float FadeFactor;

//+++++++++++++++++++++++++++++
//internal parameters, can be modified
//+++++++++++++++++++++++++++++
float EBlurSamplingRange=4.0;
float EApertureScale=4.0;

static float2 pixelsize = float2(ScreenSize.y,ScreenSize.y*ScreenSize.z);
static float2 pixelsize2 = float2(ScreenSize.y,ScreenSize.y*ScreenSize.z)*2;

#define CoefLuma float3(0.2126, 0.7152, 0.0722)      // BT.709 & sRBG luma coefficient (Monitors and HD Television)
//#define CoefLuma float3(0.299, 0.587, 0.114)       // BT.601 luma coefficient (SD Television)
//#define CoefLuma float3(1.0/3.0, 1.0/3.0, 1.0/3.0) // Equal weight coefficient

#define sharp_strength_luma CoefLuma*2
static float2 sharpenradius = pixelsize/2;

//#define MAX_BLUR_RADIUS 100
//#define LensDiameter 0.002
//#define FocalLength 0.022
//#define viewscreensize 0.022
//#define PPM sqrt(1920*1920+1080*1080)/viewscreensize
#define BlurCoefficient 5.43058008 //0.440581434 //LensDiameter*FocalLength*PPM/MAX_BLUR_RADIUS/2
//#define BlurOffset 1/MAX_BLUR_RADIUS/2
#define LinearlizeDepth(z) z/(1-z)

#define SampleRaidusMultiplier 1.5
static float2 TexelHorizontal = float2(ScreenSize.y*SampleRaidusMultiplier, 0);//float2(ScreenSize.y*ScreenSize.w*MAX_BLUR_RADIUS, 0);
static float2 TexelVertical = float2(0, ScreenSize.y*ScreenSize.z*SampleRaidusMultiplier);//float2(0, ScreenSize.y*ScreenSize.z*MAX_BLUR_RADIUS);

// Textures & samplers
texture2D texColor;
texture2D texDepth;
texture2D texNoise;
texture2D texPalette;
texture2D texFocus; //computed focusing depth
texture2D texCurr; //4*4 texture for focusing
texture2D texPrev; //4*4 texture for focusing

sampler2D SamplerColor = sampler_state
{
	Texture   = <texColor>;
	MinFilter = LINEAR;
	MagFilter = LINEAR;
	MipFilter = LINEAR;
	AddressU  = Mirror;
	AddressV  = Mirror;
	SRGBTexture = FALSE;
	MaxMipLevel = 9;
	MipMapLodBias = 0;
};

sampler2D SamplerDepth = sampler_state
{
	Texture   = <texDepth>;
	MinFilter = POINT;
	MagFilter = POINT;
	MipFilter = NONE;
	AddressU  = Clamp;
	AddressV  = Clamp;
	SRGBTexture = FALSE;
	MaxMipLevel = 0;
	MipMapLodBias = 0;
};

sampler2D SamplerNoise = sampler_state
{
	Texture   = <texNoise>;
	MinFilter = LINEAR;
	MagFilter = LINEAR;
	MipFilter = LINEAR;
	AddressU  = Wrap;
	AddressV  = Wrap;
	SRGBTexture = FALSE;
	MaxMipLevel = 0;
	MipMapLodBias = 0;
};

sampler2D SamplerPalette = sampler_state
{
	Texture   = <texPalette>;
	MinFilter = LINEAR;
	MagFilter = LINEAR;
	MipFilter = NONE;
	AddressU  = Clamp;
	AddressV  = Clamp;
	SRGBTexture = FALSE;
	MaxMipLevel = 0;
	MipMapLodBias = 0;
};

// for focus computation
sampler2D SamplerCurr = sampler_state
{
	Texture   = <texCurr>;
	MinFilter = LINEAR;
	MagFilter = LINEAR;
	MipFilter = LINEAR;
	AddressU  = Clamp;
	AddressV  = Clamp;
	SRGBTexture = FALSE;
	MaxMipLevel = 0;
	MipMapLodBias = 0;
};

// For focus computation
sampler2D SamplerPrev = sampler_state
{
	Texture   = <texPrev>;
	MinFilter = LINEAR;
	MagFilter = LINEAR;
	MipFilter = NONE;
	AddressU  = Clamp;
	AddressV  = Clamp;
	SRGBTexture = FALSE;
	MaxMipLevel = 0;
	MipMapLodBias = 0;
};

// For DoF only in PostProcess techniques
sampler2D SamplerFocus = sampler_state
{
	Texture   = <texFocus>;
	MinFilter = LINEAR;
	MagFilter = LINEAR;
	MipFilter = NONE;
	AddressU  = Clamp;
	AddressV  = Clamp;
	SRGBTexture = FALSE;
	MaxMipLevel = 0;
	MipMapLodBias = 0;
};

// Shaders input/output structures
struct VS_OUTPUT_POST
{
	float4 vpos  : POSITION;
	float2 txcoord : TEXCOORD0;
};

struct VS_INPUT_POST
{
	float3 pos  : POSITION;
	float2 txcoord : TEXCOORD0;
};

////////////////////////////////////////////////////////////////////
// Begin focusing (by Boris Vorontsov)
////////////////////////////////////////////////////////////////////
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
VS_OUTPUT_POST VS_Focus(VS_INPUT_POST IN)
{
	VS_OUTPUT_POST OUT;

	float4 pos = float4(IN.pos.x,IN.pos.y,IN.pos.z,1.0);

	OUT.vpos = pos;
	OUT.txcoord.xy = IN.txcoord.xy;

	return OUT;
}

//SRCpass1X=ScreenWidth;
//SRCpass1Y=ScreenHeight;
//DESTpass2X=4;
//DESTpass2Y=4;

//texCurr
float4 PS_ReadFocus(VS_OUTPUT_POST IN) : COLOR
{
	float res=tex2D(SamplerDepth, 0.5).x;
	return res;
}

//SRCpass1X=4;
//SRCpass1Y=4;
//DESTpass2X=4;
//DESTpass2Y=4;

//texFocus
float4 PS_WriteFocus(VS_OUTPUT_POST IN) : COLOR
{
	float res = 0.0;
	float curr = tex2D(SamplerCurr, 0.5).x;
	float prev = tex2D(SamplerPrev, 0.5).x;
	
	res = lerp(prev, curr, saturate(FadeFactor));	// Time elapsed factor (application of the smooth transition of DoF when changing the focus distance)
	res = max(res, 0.0);
	
	return res;
}

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
technique ReadFocus
{
	pass P0
	{
		VertexShader = compile vs_3_0 VS_Focus();
		PixelShader  = compile ps_3_0 PS_ReadFocus();

		ZEnable = FALSE;
		CullMode = NONE;
		ALPHATESTENABLE = FALSE;
		SEPARATEALPHABLENDENABLE = FALSE;
		AlphaBlendEnable = FALSE;
		FogEnable = FALSE;
		SRGBWRITEENABLE = FALSE;
	}
}



technique WriteFocus
{
	pass P0
	{
		VertexShader = compile vs_3_0 VS_Focus();
		PixelShader  = compile ps_3_0 PS_WriteFocus();

		ZEnable = FALSE;
		CullMode = NONE;
		ALPHATESTENABLE = FALSE;
		SEPARATEALPHABLENDENABLE = FALSE;
		AlphaBlendEnable = FALSE;
		FogEnable = FALSE;
		SRGBWRITEENABLE = FALSE;
	}
}
////////////////////////////////////////////////////////////////////
// End focusing code
////////////////////////////////////////////////////////////////////



//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
VS_OUTPUT_POST VS_PostProcess(VS_INPUT_POST IN)
{
	VS_OUTPUT_POST OUT;

	float4 pos = float4(IN.pos.x, IN.pos.y, IN.pos.z, 1.0);

	OUT.vpos = pos;
	OUT.txcoord.xy = IN.txcoord.xy;

	return OUT;
}

float4 PS_ProcessPass_DOF_GetBlurAmount(VS_OUTPUT_POST IN, float2 vPos : VPOS) : COLOR
{
	float4 res=tex2D(SamplerColor, IN.txcoord);
	float d=LinearlizeDepth(tex2D(SamplerDepth, IN.txcoord).x);
	float FocusDistance=LinearlizeDepth(tex2D(SamplerFocus, 0.5).x);
	float LensDiameterMultiplier=lerp(4.0,1.0,ENightDayFactor);
	float DistanceFromFocus=abs(d-FocusDistance);
	res.w=LensDiameterMultiplier*BlurCoefficient*DistanceFromFocus/(d*FocusDistance);//LensDiameterMultiplier*BlurCoefficient*abs(d-FocusDistance)/(d*(FocusDistance-FocalLength));
	//res.w=max(res.w-BlurOffset,0);
	res.w=min(mul(res.w,res.w),1.0);
	return res;	
}

float4 PS_ProcessPass_DOF_BlurPrePass(VS_OUTPUT_POST IN, float2 vPos : VPOS) : COLOR
{
	float4 res=tex2D(SamplerColor, IN.txcoord);
	float frontplane=tex2D(SamplerColor, IN.txcoord+pixelsize2).w+tex2D(SamplerColor, IN.txcoord-pixelsize2).w;
	frontplane/=2;
	float minDepth = min(tex2D(SamplerDepth, IN.txcoord+pixelsize2).x,tex2D(SamplerDepth, IN.txcoord-pixelsize2).x);
	res.w=minDepth<tex2D(SamplerFocus, 0.5).x?frontplane:res.w;
	return res;
}

float4 PS_ProcessPass_DOF_HeatDiffusion(VS_OUTPUT_POST IN, float2 vPos : VPOS) : COLOR
{
	float4 res=tex2D(SamplerColor, IN.txcoord);
	float4 ColourWest=tex2D(SamplerColor, IN.txcoord - TexelHorizontal);
	float4 ColourSouth=tex2D(SamplerColor,IN.txcoord - TexelVertical);
	float3 ColourEast=tex2D(SamplerColor, IN.txcoord + TexelVertical).xyz;
	float3 ColourNorth=tex2D(SamplerColor, IN.txcoord + TexelHorizontal).xyz;
	// float4 IderiX=ddx(res);
	// float4 IderiY=ddy(res);
	// float3 IderiX2=ddx(ColourWest.xyz);
	// float3 IderiY2=ddy(ColourSouth.xyz);
	// res.xyz=res.xyz+0.25*(res.w*(IderiX-IderiX2+IderiY-IderiY2)+(IderiX.xyz*IderiX.w+IderiY.xyz*IderiY.w)); //unstable due to error
	res.xyz=res.xyz+0.25*(res.w*(ColourEast+ColourNorth-res.xyz-res.xyz)-ColourWest.w*(res.xyz-ColourWest.xyz)-ColourSouth.w*(res.xyz-ColourSouth.xyz));
	//res.xyz=res.xyz+0.25*float3(dot(float3(res.w,ColourWest.w,ColourSouth.w),float3(ColourEast.x+ColourNorth.x-res.x-res.x,ColourWest.x-res.x,ColourSouth.x-res.x)),dot(float3(res.w,ColourWest.w,ColourSouth.w),float3(ColourEast.y+ColourNorth.y-res.y-res.y,ColourWest.y-res.y,ColourSouth.y-res.y)),dot(float3(res.w,ColourWest.w,ColourSouth.w),float3(ColourEast.z+ColourNorth.z-res.z-res.z,ColourWest.z-res.z,ColourSouth.z-res.z)));
	return res;
}

float4 PS_ProcessPass_VisualizeDepth(VS_OUTPUT_POST IN, float2 vPos : VPOS) : COLOR
{
    float4 res = tex2D(SamplerColor, IN.txcoord).x;
	//float gderiX=ddx(res);
	//float gderiY=ddy(res);
	//res=(gderiX+gderiY)*30;
	return res;
}

float4 PS_ProcessPass_LumaSharpen(VS_OUTPUT_POST IN, float2 vPos : VPOS) : COLOR
{
	float4 res = tex2D(SamplerColor, IN.txcoord.xy);

	float3 blur_ori = tex2D(SamplerColor, IN.txcoord.xy + float2(sharpenradius.x,-sharpenradius.y)).rgb; // South East
	blur_ori += tex2D(SamplerColor, IN.txcoord.xy + float2(-sharpenradius.x,-sharpenradius.y)).rgb;  // South West    
	blur_ori += tex2D(SamplerColor, IN.txcoord.xy + float2(sharpenradius.x,sharpenradius.y)).rgb; // North East
	blur_ori += tex2D(SamplerColor, IN.txcoord.xy + float2(-sharpenradius.x,sharpenradius.y)).rgb; // North West

    blur_ori *= 0.25;

	// -- Calculate the sharpening --  
	float3 sharp = res.rgb - blur_ori;  //Subtracting the blurred image from the original image
  
	// -- Adjust strength of the sharpening --
	float sharp_luma = dot(sharp, sharp_strength_luma); //Calculate the luma and adjust the strength

	// -- Clamping the maximum amount of sharpening to prevent halo artifacts --
	sharp_luma = clamp(sharp_luma, -0.1, 0.1);  //TODO Try a curve function instead of a clamp

	// -- Combining the values to get the final sharpened pixel	--
	
	res.rgb+=sharp_luma;// Add the sharpening to the input color.
	
	res.w=1;
	
	return res;
}

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

technique PostProcess
{
	pass P0
	{
		VertexShader = compile vs_3_0 VS_PostProcess();
		PixelShader  = compile ps_3_0 PS_ProcessPass_DOF_GetBlurAmount();

		DitherEnable=FALSE;
		ZEnable=FALSE;
		CullMode=NONE;
		ALPHATESTENABLE=FALSE;
		SEPARATEALPHABLENDENABLE=FALSE;
		AlphaBlendEnable=FALSE;
		StencilEnable=FALSE;
		FogEnable=FALSE;
		SRGBWRITEENABLE=FALSE;
	}
	/*
	pass P1
	{
		AlphaBlendEnable = true;
		SrcBlend = One;
		DestBlend = One;
		
		PixelShader = compile ps_3_0 PS_ProcessPass_LumaSharpen();
	}
	*/
}

technique PostProcess2
{
	pass P0
	{
		VertexShader = compile vs_3_0 VS_PostProcess();
		PixelShader  = compile ps_3_0 PS_ProcessPass_DOF_BlurPrePass();//PS_ProcessPass_DOF_Pass1()

		DitherEnable=FALSE;
		ZEnable=FALSE;
		CullMode=NONE;
		ALPHATESTENABLE=FALSE;
		SEPARATEALPHABLENDENABLE=FALSE;
		AlphaBlendEnable=FALSE;
		StencilEnable=FALSE;
		FogEnable=FALSE;
		SRGBWRITEENABLE=FALSE;
	}
}

technique PostProcess3
{
	pass P0
	{
		VertexShader = compile vs_3_0 VS_PostProcess();
		PixelShader  = compile ps_3_0 PS_ProcessPass_DOF_HeatDiffusion();//PS_ProcessPass_DOF_Pass2()

		DitherEnable=FALSE;
		ZEnable=FALSE;
		CullMode=NONE;
		ALPHATESTENABLE=FALSE;
		SEPARATEALPHABLENDENABLE=FALSE;
		AlphaBlendEnable=FALSE;
		StencilEnable=FALSE;
		FogEnable=FALSE;
		SRGBWRITEENABLE=FALSE;
	}
}

technique PostProcess4
{
	pass P0
	{
		VertexShader = compile vs_3_0 VS_PostProcess();
		PixelShader  = compile ps_3_0 PS_ProcessPass_DOF_HeatDiffusion();

		DitherEnable=FALSE;
		ZEnable=FALSE;
		CullMode=NONE;
		ALPHATESTENABLE=FALSE;
		SEPARATEALPHABLENDENABLE=FALSE;
		AlphaBlendEnable=FALSE;
		StencilEnable=FALSE;
		FogEnable=FALSE;
		SRGBWRITEENABLE=FALSE;
	}
}

technique PostProcess5
{
	pass P0
	{
		VertexShader = compile vs_3_0 VS_PostProcess();
		PixelShader  = compile ps_3_0 PS_ProcessPass_DOF_HeatDiffusion();

		DitherEnable=FALSE;
		ZEnable=FALSE;
		CullMode=NONE;
		ALPHATESTENABLE=FALSE;
		SEPARATEALPHABLENDENABLE=FALSE;
		AlphaBlendEnable=FALSE;
		StencilEnable=FALSE;
		FogEnable=FALSE;
		SRGBWRITEENABLE=FALSE;
	}
}
technique PostProcess6
{
	pass P0
	{
		VertexShader = compile vs_3_0 VS_PostProcess();
		PixelShader  = compile ps_3_0 PS_ProcessPass_DOF_HeatDiffusion();

		DitherEnable=FALSE;
		ZEnable=FALSE;
		CullMode=NONE;
		ALPHATESTENABLE=FALSE;
		SEPARATEALPHABLENDENABLE=FALSE;
		AlphaBlendEnable=FALSE;
		StencilEnable=FALSE;
		FogEnable=FALSE;
		SRGBWRITEENABLE=FALSE;
	}
}
technique PostProcess7
{
	pass P0
	{
		VertexShader = compile vs_3_0 VS_PostProcess();
		PixelShader  = compile ps_3_0 PS_ProcessPass_DOF_HeatDiffusion();

		DitherEnable=FALSE;
		ZEnable=FALSE;
		CullMode=NONE;
		ALPHATESTENABLE=FALSE;
		SEPARATEALPHABLENDENABLE=FALSE;
		AlphaBlendEnable=FALSE;
		StencilEnable=FALSE;
		FogEnable=FALSE;
		SRGBWRITEENABLE=FALSE;
	}
}
technique PostProcess8
{
	pass P0
	{
		VertexShader = compile vs_3_0 VS_PostProcess();
		//PixelShader  = compile ps_3_0 PS_ProcessPass_VisualizeDepth();
		PixelShader  = compile ps_3_0 PS_ProcessPass_LumaSharpen();

		DitherEnable=FALSE;
		ZEnable=FALSE;
		CullMode=NONE;
		ALPHATESTENABLE=FALSE;
		SEPARATEALPHABLENDENABLE=FALSE;
		AlphaBlendEnable=FALSE;
		StencilEnable=FALSE;
		FogEnable=FALSE;
		SRGBWRITEENABLE=FALSE;
	}
}
