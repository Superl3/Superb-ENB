//++++++++++++++++++++++++++++++++++++++++++++
// ENBSeries effect file
// visit http://enbdev.com for updates
// Copyright (c) 2007-2011 Boris Vorontsov
// Customized by Confidence-Man
//+++++++++++++++++++++++++++++++++++++++++++++//

//use original game processing first, then mine
//#define APPLYGAMECOLORCORRECTION

//use original game processing only, with vanilla bloom
//#define ENB_FLIPTECHNIQUE


//+++++++++++++++++++++++++++++
//internal parameters, can be modified
//+++++++++++++++++++++++++++++
//float3	EColorFilter=float3(1.0, 0.9, 0.9); 


//modify these values to tweak various color processing

// Interior controls

float	ECCDesaturateShadows
<
	string UIName = "CC: Desaturate shadows";
	string UIWidget = "Spinner";
	float UIMin = 0.0;
	float UIMax = 1.0;
> = { 0.0 };

string param01 = "Interior - Day";
float	PaletteIntDay = 1.0;
float	PaletteBrightnessIntDay = 1.5;
float	GammaIntDay = 1.35;
float	EBrightnessIntDay < string UIName = "IntDay- Brightness";	string UIWidget = "Spinner";	float UIMin = 0.00;	float UIMax = 5.00; > = { 0.15 };
float	EBrightnessCurveIntDay = 1.10;
float	EBrightnessMultiplierIntDay = 0.5;
float	EBrightnessToneMappingCurveIntDay = 0.35;
float	EAdaptationMinIntDay < string UIName = "IntDay- Adapt Min";	string UIWidget = "Spinner";	float UIMin = 0.01;	float UIMax = 1.00; > = { 0.05 };
float	EAdaptationIntDay < string UIName = "IntDay- Adapt";	string UIWidget = "Spinner";	float UIMin = 0.01;	float UIMax = 1.00; > = { 0.10 };
float	EAdaptationMaxIntDay < string UIName = "IntDay- Adapt Max";	string UIWidget = "Spinner";	float UIMin = 0.01;	float UIMax = 1.00; > = { 0.10 };
float	EToneMappingCurveIntDay = 5.0;
float	EIntensityContrastIntDay < string UIName = "IntDay- Contrast Intensity";	string UIWidget = "Spinner";	float UIMin = 0.00;	float UIMax = 10.00; > = { 1.15 };
float	EColorSaturationIntDay < string UIName = "IntDay- Saturation Intensity";	string UIWidget = "Spinner";	float UIMin = 0.00;	float UIMax = 10.00; > = { 1.1 };
float	EToneMappingOversaturationIntDay < string UIName = "IntDay- ToneMapping Oversaturation";	string UIWidget = "Spinner";	float UIMin = 0.0;	float UIMax = 500.0; > = { 1.0 };
string param02 = "Interior - Night";
float	PaletteIntNgt = 1.0;
float	PaletteBrightnessIntNgt = 1.5;
float	GammaIntNgt = 1.2;
float	EBrightnessIntNgt < string UIName = "IntNgt- Brightness";	string UIWidget = "Spinner";	float UIMin = 0.00;	float UIMax = 5.00; > = { 0.15 };
float	EBrightnessCurveIntNgt = 1.1;
float	EBrightnessMultiplierIntNgt = 0.6;
float	EBrightnessToneMappingCurveIntNgt = 0.5;
float	EAdaptationMinIntNgt < string UIName = "IntNgt- Adapt Min";	string UIWidget = "Spinner";	float UIMin = 0.01;	float UIMax = 1.00; > = { 0.05 };
float	EAdaptationIntNgt < string UIName = "IntNgt- Adapt";	string UIWidget = "Spinner";	float UIMin = 0.01;	float UIMax = 1.00; > = { 0.10 };
float	EAdaptationMaxIntNgt < string UIName = "IntNgt- Adapt Max";	string UIWidget = "Spinner";	float UIMin = 0.01;	float UIMax = 1.00; > = { 0.10 };
float	EToneMappingCurveIntNgt = 5.0;
float	EIntensityContrastIntNgt < string UIName = "IntNgt- Contrast Intensity";	string UIWidget = "Spinner";	float UIMin = 0.00;	float UIMax = 10.00; > = { 1.15 };
float	EColorSaturationIntNgt < string UIName = "IntNgt- Saturation Intensity";	string UIWidget = "Spinner";	float UIMin = 0.00;	float UIMax = 10.00; > = { 1.1 };
float	EToneMappingOversaturationIntNgt < string UIName = "IntNgt- ToneMapping Oversaturation";	string UIWidget = "Spinner";	float UIMin = 0.0;	float UIMax = 500.0; > = { 1.0 };

// Exterior controls
/*
float	PaletteDay = 1.2;
float	PaletteBrightnessDay<	string UIName = "Day- PaletteBrightness";	string UIWidget = "Spinner";	float UIMin = 0.0;	float UIMax = 10.0; > = { 1.0 };
float	GammaDay<	string UIName = "Day- Gamma";	string UIWidget = "Spinner";	float UIMin = 0.0;	float UIMax = 10.0; > = { 1.0 };
float	EAdaptationMinDay<	string UIName = "Day- Min Adapation";	string UIWidget = "Spinner";	float UIMin = 0.00;	float UIMax = 1.00; > = { 0.02 };
float	EAdaptationMaxDay<	string UIName = "Day- Max Adapation";	string UIWidget = "Spinner";	float UIMin = 0.00;	float UIMax = 1.00; > = { 0.02 };
float	EToneMappingCurveDay<	string UIName = "Day- ToneMapping Curve";	string UIWidget = "Spinner";	float UIMin = 0.0;	float UIMax = 100.0; > = { 2.0 };
float	EIntensityContrastDay<	string UIName = "Day- Contrast Intensity";	string UIWidget = "Spinner";	float UIMin = 0.00;	float UIMax = 10.00; > = { 1.4 };
float	EColorSaturationDay<	string UIName = "Day- Saturation Intensity";	string UIWidget = "Spinner";	float UIMin = 0.00;	float UIMax = 10.00; > = { 0.9 };
float	EToneMappingOversaturationDay<	string UIName = "Day- ToneMapping Oversaturation";	string UIWidget = "Spinner";	float UIMin = 0.0;	float UIMax = 500.0; > = { 1.0 };
float	EBrightnessDay<	string UIName = "Day- Brightness";	string UIWidget = "Spinner";	float UIMin = 0.00;	float UIMax = 1.00; > = { 0.15 };
float	EBrightnessCurveDay<	string UIName = "Day- Brightness Curve";	string UIWidget = "Spinner";	float UIMin = 0.00;	float UIMax = 10.00; > = { 1.28 };
float	EBrightnessMultiplierDay<	string UIName = "Day- Brightness Multiplier";	string UIWidget = "Spinner";	float UIMin = 0.00;	float UIMax = 10.00; > = { 1.28 };
float	EBrightnessToneMappingCurveDay<	string UIName = "Day- Brightness ToneMapping Curve";	string UIWidget = "Spinner";	float UIMin = 0.00;	float UIMax = 10.00; > = { 0.9 };

//--------------------------------------------------

float	PaletteNgt<	string UIName = "Ngt- Palette";	string UIWidget = "Spinner";	float UIMin = 0.0;	float UIMax = 10.0; > = { 1.0 };
float	PaletteBrightnessNgt<	string UIName = "Ngt- PaletteBrightness";	string UIWidget = "Spinner";	float UIMin = 0.0;	float UIMax = 10.0; > = { 1.0 };
float	GammaNgt<	string UIName = "Ngt- Gamma";	string UIWidget = "Spinner";	float UIMin = 0.0;	float UIMax = 10.0; > = { 1.0 };
float	EAdaptationMinNgt<	string UIName = "Ngt- Min Adapation";	string UIWidget = "Spinner";	float UIMin = 0.00;	float UIMax = 1.00; > = { 0.02 };
float	EAdaptationMaxNgt<	string UIName = "Ngt- Max Adapation";	string UIWidget = "Spinner";	float UIMin = 0.00;	float UIMax = 1.00; > = { 0.02 };
float	EToneMappingCurveNgt<	string UIName = "Ngt- ToneMapping Curve";	string UIWidget = "Spinner";	float UIMin = 0.0;	float UIMax = 100.0; > = { 2.0 };
float	EIntensityContrastNgt<	string UIName = "Ngt- Contrast Intensity";	string UIWidget = "Spinner";	float UIMin = 0.00;	float UIMax = 10.00; > = { 1.4 };
float	EColorSaturationNgt<	string UIName = "Ngt- Saturation Intensity";	string UIWidget = "Spinner";	float UIMin = 0.00;	float UIMax = 10.00; > = { 0.9 };
float	EToneMappingOversaturationNgt<	string UIName = "Ngt- ToneMapping Oversaturation";	string UIWidget = "Spinner";	float UIMin = 0.0;	float UIMax = 500.0; > = { 1.0 };
float	EBrightnessNgt<	string UIName = "Ngt- Brightness";	string UIWidget = "Spinner";	float UIMin = 0.00;	float UIMax = 1.00; > = { 0.15 };
float	EBrightnessCurveNgt<	string UIName = "Ngt- Brightness Curve";	string UIWidget = "Spinner";	float UIMin = 0.00;	float UIMax = 10.00; > = { 1.28 };
float	EBrightnessMultiplierNgt<	string UIName = "Ngt- Brightness Multiplier";	string UIWidget = "Spinner";	float UIMin = 0.00;	float UIMax = 10.00; > = { 1.28 };
float	EBrightnessToneMappingCurveNgt<	string UIName = "Ngt- Brightness ToneMapping Curve";	string UIWidget = "Spinner";	float UIMin = 0.00;	float UIMax = 10.00; > = { 0.9 };
*/
string param03 = "Exterior - Day";
float	PaletteDay = 1.2;
float	PaletteBrightnessDay = 1.0;
float	GammaDay = 1.4;
float	EAdaptationMinDay < string UIName = "Day- Adapt Min";	string UIWidget = "Spinner";	float UIMin = 0.01;	float UIMax = 1.00; > = { 0.01 };
float	EAdaptationDay < string UIName = "Day- Adapt";	string UIWidget = "Spinner";	float UIMin = 0.01;	float UIMax = 1.00; > = { 0.07 };
float	EAdaptationMaxDay < string UIName = "Day- Adapt Max";	string UIWidget = "Spinner";	float UIMin = 0.01;	float UIMax = 1.00; > = { 0.07 };
float	EToneMappingCurveDay = 8.0;
float	EIntensityContrastDay < string UIName = "Day- Contrast Intensity";	string UIWidget = "Spinner";	float UIMin = 0.00;	float UIMax = 10.00; > = { 1.4 };
float	EColorSaturationDay < string UIName = "Day- Saturation Intensity";	string UIWidget = "Spinner";	float UIMin = 0.00;	float UIMax = 10.00; > = { 0.9 };
float	EToneMappingOversaturationDay < string UIName = "Day- ToneMapping Oversaturation";	string UIWidget = "Spinner";	float UIMin = 0.0;	float UIMax = 500.0; > = { 1.0 };
float	EBrightnessDay < string UIName = "Day- Brightness";	string UIWidget = "Spinner";	float UIMin = 0.00;	float UIMax = 5.00; > = { 0.15 };
float	EBrightnessCurveDay = 0.98;
float	EBrightnessMultiplierDay = 1.0;
float	EBrightnessToneMappingCurveDay = 1.0;

//--------------------------------------------------
string param04 = "Exterior - Ngt";
float	PaletteNgt = 1.0;
float	PaletteBrightnessNgt = 8.0;
float	GammaNgt = 1.25;
float	EAdaptationMinNgt < string UIName = "Ngt- Adapt Min";	string UIWidget = "Spinner";	float UIMin = 0.01;	float UIMax = 1.00; > = { 0.09 };
float	EAdaptationNgt < string UIName = "Ngt- Adapt";	string UIWidget = "Spinner";	float UIMin = 0.01;	float UIMax = 1.00; > = { 0.11 };
float	EAdaptationMaxNgt < string UIName = "Ngt- Adapt Max";	string UIWidget = "Spinner";	float UIMin = 0.01;	float UIMax = 1.00; > = { 0.11 };
float	EToneMappingCurveNgt = 6.0;
float	EIntensityContrastNgt < string UIName = "Ngt- Contrast Intensity";	string UIWidget = "Spinner";	float UIMin = 0.00;	float UIMax = 10.00; > = { 1.4 };
float	EColorSaturationNgt < string UIName = "Ngt- Saturation Intensity";	string UIWidget = "Spinner";	float UIMin = 0.00;	float UIMax = 10.00; > = { 0.9 };
float	EToneMappingOversaturationNgt < string UIName = "Ngt- ToneMapping Oversaturation";	string UIWidget = "Spinner";	float UIMin = 0.0;	float UIMax = 500.0; > = { 1.0 };
float	EBrightnessNgt < string UIName = "Ngt- Brightness";	string UIWidget = "Spinner";	float UIMin = 0.00;	float UIMax = 5.00; > = { 0.15 };
float	EBrightnessCurveNgt = 1.1;
float	EBrightnessMultiplierNgt = 0.6;
float	EBrightnessToneMappingCurveNgt = 0.5;

string param05 = "Dungeon";
// Dungeon controls
float	PaletteDun < string UIName = "Dun- Palette";	string UIWidget = "Spinner";	float UIMin = 0.0;	float UIMax = 10.0; > = { 1.0 };
float	PaletteBrightnessDun < string UIName = "Dun- PaletteBrightness";	string UIWidget = "Spinner";	float UIMin = 0.0;	float UIMax = 10.0; > = { 1.0 };
float	GammaDun < string UIName = "Dun- Gamma";	string UIWidget = "Spinner";	float UIMin = 0.0;	float UIMax = 10.0; > = { 1.0 };
float	EAdaptationMinDun < string UIName = "Dun- Min Adapation";	string UIWidget = "Spinner";	float UIMin = 0.00;	float UIMax = 1.00; > = { 0.02 };
float	EAdaptationDun < string UIName = "Dun- Adapation";	string UIWidget = "Spinner";	float UIMin = 0.00;	float UIMax = 1.00; > = { 0.02 };
float	EAdaptationMaxDun < string UIName = "Dun- Max Adapation";	string UIWidget = "Spinner";	float UIMin = 0.00;	float UIMax = 1.00; > = { 0.02 };
float	EToneMappingCurveDun < string UIName = "Dun- ToneMapping Curve";	string UIWidget = "Spinner";	float UIMin = 0.0;	float UIMax = 100.0; > = { 2.0 };
float	EIntensityContrastDun < string UIName = "Dun- Contrast Intensity";	string UIWidget = "Spinner";	float UIMin = 0.00;	float UIMax = 10.00; > = { 1.4 };
float	EColorSaturationDun < string UIName = "Dun- Saturation Intensity";	string UIWidget = "Spinner";	float UIMin = 0.00;	float UIMax = 10.00; > = { 0.9 };
float	EToneMappingOversaturationDun < string UIName = "Dun- ToneMapping Oversaturation";	string UIWidget = "Spinner";	float UIMin = 0.0;	float UIMax = 500.0; > = { 1.0 };
float	EBrightnessDun < string UIName = "Dun- Brightness";	string UIWidget = "Spinner";	float UIMin = 0.00;	float UIMax = 5.00; > = { 0.15 };
float	EBrightnessCurveDun < string UIName = "Dun- Brightness Curve";	string UIWidget = "Spinner";	float UIMin = 0.00;	float UIMax = 10.00; > = { 1.28 };
float	EBrightnessMultiplierDun < string UIName = "Dun- Brightness Multiplier";	string UIWidget = "Spinner";	float UIMin = 0.00;	float UIMax = 10.00; > = { 1.28 };
float	EBrightnessToneMappingCurveDun < string UIName = "Dun- Brightness ToneMapping Curve";	string UIWidget = "Spinner";	float UIMin = 0.00;	float UIMax = 10.00; > = { 0.9 };


//+++++++++++++++++++++++++++++
//external parameters, do not modify
//+++++++++++++++++++++++++++++

//+++++++++++++++++++++++++++++
//Boris code
//+++++++++++++++++++++++++++++
//keyboard controlled temporary variables (in some versions exists in the config file). Press and hold key 1,2,3...8 together with PageUp or PageDown to modify. By default all set to 1.0
float4	tempF1; //0,1,2,3
float4	tempF2; //5,6,7,8
float4	tempF3; //9,0
//x=generic timer in range 0..1, period of 16777216 ms (4.6 hours), w=frame time elapsed (in seconds)
float4	Timer;
//x=Width, y=1/Width, z=ScreenScaleY, w=1/ScreenScaleY
float4	ScreenSize;
//changes in range 0..1, 0 means that night time, 1 - day time
float	ENightDayFactor;
//changes 0 or 1. 0 means that exterior, 1 - interior
float	EInteriorFactor;
//enb version of bloom applied, ignored if original post processing used
float	EBloomAmount;
float4  WeatherAndTime; //.x - current weather index, .y - outgoing weather index, .z - weather transition, .w - time of the day in 24 standart hours.

//skyrim shader specific externals, do not modify
float4 _c1 : register(c1);  /// .xy   = ColorRange
float4 _c2 : register(c2);  /// .xy   = Imagespace HDR       - Target Lum1/Receive Bloom Threshold, Target Lum2/White
float4 _c3 : register(c3);  /// .xyzw = Imagespace Cinematic - Saturation, 0.0 at all times?, Contrast, Brightness
float4 _c4 : register(c4);  /// .xyzw = Imagespace2 Cinematic - Tint R, G, B, A
float4 _c5 : register(c5);  /// .xyzw = Imagespace Modifier  - Fade R, G, B, A

texture2D texs0;//color
texture2D texs1;//bloom skyrim
texture2D texs2;//adaptation skyrim
texture2D texs3;//bloom enb
texture2D texs4;//adaptation enb
texture2D texs7;//palette enb

sampler2D _s0 = sampler_state
{
	Texture = <texs0>;
	MinFilter = POINT;//
	MagFilter = POINT;//
	MipFilter = NONE;//LINEAR;
	AddressU = Clamp;
	AddressV = Clamp;
	SRGBTexture = FALSE;
	MaxMipLevel = 0;
	MipMapLodBias = 0;
};

sampler2D _s1 = sampler_state
{
	Texture = <texs1>;
	MinFilter = LINEAR;//
	MagFilter = LINEAR;//
	MipFilter = NONE;//LINEAR;
	AddressU = Clamp;
	AddressV = Clamp;
	SRGBTexture = FALSE;
	MaxMipLevel = 0;
	MipMapLodBias = 0;
};

sampler2D _s2 = sampler_state
{
	Texture = <texs2>;
	MinFilter = LINEAR;//
	MagFilter = LINEAR;//
	MipFilter = NONE;//LINEAR;
	AddressU = Clamp;
	AddressV = Clamp;
	SRGBTexture = FALSE;
	MaxMipLevel = 0;
	MipMapLodBias = 0;
};

sampler2D _s3 = sampler_state
{
	Texture = <texs3>;
	MinFilter = LINEAR;//
	MagFilter = LINEAR;//
	MipFilter = NONE;//LINEAR;
	AddressU = Clamp;
	AddressV = Clamp;
	SRGBTexture = FALSE;
	MaxMipLevel = 0;
	MipMapLodBias = 0;
};

sampler2D _s4 = sampler_state
{
	Texture = <texs4>;
	MinFilter = LINEAR;//
	MagFilter = LINEAR;//
	MipFilter = NONE;//LINEAR;
	AddressU = Clamp;
	AddressV = Clamp;
	SRGBTexture = FALSE;
	MaxMipLevel = 0;
	MipMapLodBias = 0;
};

sampler2D _s7 = sampler_state
{
	Texture = <texs7>;
	MinFilter = LINEAR;
	MagFilter = LINEAR;
	MipFilter = NONE;
	AddressU = Clamp;
	AddressV = Clamp;
	SRGBTexture = FALSE;
	MaxMipLevel = 0;
	MipMapLodBias = 0;
};

struct VS_OUTPUT_POST
{
	float4 vpos  : POSITION;
	float2 txcoord0 : TEXCOORD0;
};
struct VS_INPUT_POST
{
	float3 pos  : POSITION;
	float2 txcoord0 : TEXCOORD0;
};



//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
VS_OUTPUT_POST VS_Quad(VS_INPUT_POST IN)
{
	VS_OUTPUT_POST OUT;

	OUT.vpos = float4(IN.pos.x, IN.pos.y, IN.pos.z, 1.0);

	OUT.txcoord0.xy = IN.txcoord0.xy;

	return OUT;
}


float4 PS_D6EC7DD1(VS_OUTPUT_POST IN, float2 vPos : VPOS) : COLOR
{
	float4 _oC0 = 0.0; //output

	float4 _c6 = float4(0, 0, 0, 0);
	float4 _c7 = float4(0.212500006, 0.715399981, 0.0720999986, 1.0);

	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	float4 r5;
	float4 r6;
	float4 r7;
	float4 r8;
	float4 r9;
	float4 r10;
	float4 r11;


	float4 _v0 = 0.0;

	_v0.xy = IN.txcoord0.xy;
	r1 = tex2D(_s0, _v0.xy); //color

// prod80 bloom method
	float4 xcolorbloom = tex2D(_s3, _v0.xy);
	r1.xyz += xcolorbloom * EBloomAmount;
	//	r11=r1; //my bypass
		_oC0.xyz = r1.xyz; //for future use without game color corrections

		float4 color = _oC0;

		bool EDungeonFactor = !(WeatherAndTime.x == 0 || (WeatherAndTime.x >= 25 && WeatherAndTime.x <= 39));

		float Gamma = lerp(GammaDun, lerp(lerp(GammaNgt, GammaDay, ENightDayFactor), lerp(GammaIntNgt, GammaIntDay, ENightDayFactor), EInteriorFactor), EDungeonFactor);
		float EBrightness = lerp(EBrightnessDun, lerp(lerp(EBrightnessNgt, EBrightnessDay, ENightDayFactor), lerp(EBrightnessIntNgt, EBrightnessIntDay, ENightDayFactor), EInteriorFactor), EDungeonFactor);
		float EBrightnessCurve = lerp(EBrightnessCurveDun, lerp(lerp(EBrightnessCurveNgt, EBrightnessCurveDay, ENightDayFactor), lerp(EBrightnessCurveIntNgt, EBrightnessCurveIntDay, ENightDayFactor), EInteriorFactor), EDungeonFactor);
		float EBrightnessMultiplier = lerp(EBrightnessMultiplierDun, lerp(lerp(EBrightnessMultiplierNgt, EBrightnessMultiplierDay, ENightDayFactor), lerp(EBrightnessMultiplierIntNgt, EBrightnessMultiplierIntDay, ENightDayFactor), EInteriorFactor), EDungeonFactor);
		float EBrightnessToneMappingCurve = lerp(EBrightnessToneMappingCurveDun, lerp(lerp(EBrightnessToneMappingCurveNgt, EBrightnessToneMappingCurveDay, ENightDayFactor), lerp(EBrightnessToneMappingCurveIntNgt, EBrightnessToneMappingCurveIntDay, ENightDayFactor), EInteriorFactor), EDungeonFactor);
		float EAdaptationMin = lerp(EAdaptationMinDun, lerp(lerp(EAdaptationMinNgt, EAdaptationMinDay, ENightDayFactor), lerp(EAdaptationMinIntNgt, EAdaptationMinIntDay, ENightDayFactor), EInteriorFactor), EDungeonFactor);
		float EAdaptation = lerp(EAdaptationDun, lerp(lerp(EAdaptationNgt, EAdaptationDay, ENightDayFactor), lerp(EAdaptationIntNgt, EAdaptationIntDay, ENightDayFactor), EInteriorFactor), EDungeonFactor);
		float EAdaptationMax = lerp(EAdaptationMaxDun, lerp(lerp(EAdaptationMaxNgt, EAdaptationMaxDay, ENightDayFactor), lerp(EAdaptationMaxIntNgt, EAdaptationMaxIntDay, ENightDayFactor), EInteriorFactor), EDungeonFactor);
		float EColorSaturation = lerp(EColorSaturationDun, lerp(lerp(EColorSaturationNgt, EColorSaturationDay, ENightDayFactor), lerp(EColorSaturationIntNgt, EColorSaturationIntDay, ENightDayFactor), EInteriorFactor), EDungeonFactor);
		float EToneMappingCurve = lerp(EToneMappingCurveDun, lerp(lerp(EToneMappingCurveNgt, EToneMappingCurveDay, ENightDayFactor), lerp(EToneMappingCurveIntNgt, EToneMappingCurveIntDay, ENightDayFactor), EInteriorFactor), EDungeonFactor);
		float EIntensityContrast = lerp(EIntensityContrastDun, lerp(lerp(EIntensityContrastNgt, EIntensityContrastDay, ENightDayFactor), lerp(EIntensityContrastIntNgt, EIntensityContrastIntDay, ENightDayFactor), EInteriorFactor), EDungeonFactor);
		float EToneMappingOversaturation = lerp(EToneMappingOversaturationDun, lerp(lerp(EToneMappingOversaturationNgt, EToneMappingOversaturationDay, ENightDayFactor), lerp(EToneMappingOversaturationIntNgt, EToneMappingOversaturationIntDay, ENightDayFactor), EInteriorFactor), EDungeonFactor);

		float greyscale = dot(color.xyz, float3(0.3, 0.59, 0.11));

		color = pow(color, Gamma);

		//adaptation in time
		float4	Adaptation = tex2D(_s4, 0.5);
		float	grayadaptation = max(max(Adaptation.x, Adaptation.y), Adaptation.z);

		grayadaptation = min(max(grayadaptation, 0.0), 50.0); //50.0
		color.xyz = color.xyz / (max(min(grayadaptation*EAdaptation,EAdaptationMax), EAdaptationMin));//*tempF1.x

		color.xyz *= EBrightness;
		color.xyz += 0.000001;
		float3 xncol = normalize(color.xyz);
		float3 scl = color.xyz / xncol.xyz;
		scl = pow(scl, EIntensityContrast);
		xncol.xyz = pow(xncol.xyz, EColorSaturation);
		color.xyz = scl * xncol.xyz;

		float	lumamax = max(EToneMappingOversaturation * SigmaDepth, 1.0);
		color.xyz = (color.xyz * (1.0 + color.xyz / lumamax)) / (color.xyz + EToneMappingCurve);

		float Y = dot(color.xyz, float3(0.299, 0.587, 0.114)); //0.299 * R + 0.587 * G + 0.114 * B;
		float U = dot(color.xyz, float3(-0.14713, -0.28886, 0.436)); //-0.14713 * R - 0.28886 * G + 0.436 * B;
		float V = dot(color.xyz, float3(0.615, -0.51499, -0.10001)); //0.615 * R - 0.51499 * G - 0.10001 * B;	

		Y = pow(Y, EBrightnessCurve) * EBrightnessMultiplier;
		Y = Y / (Y + EBrightnessToneMappingCurve);
		float	desaturatefact = saturate(Y*Y*Y*1.7);
		U = lerp(U, 0.0, desaturatefact);
		V = lerp(V, 0.0, desaturatefact);
		color.xyz = V * float3(1.13983, -0.58060, 0.0) + U * float3(0.0, -0.39465, 2.03211) + Y;

		//pallete texture (0.082+ version feature)
		float Palette = lerp(PaletteDun, lerp(lerp(PaletteNgt, PaletteDay, ENightDayFactor), lerp(PaletteIntNgt, PaletteIntDay, ENightDayFactor), EInteriorFactor), EDungeonFactor);
		float PaletteBrightness = lerp(PaletteBrightnessDun, lerp(lerp(PaletteBrightnessNgt, PaletteBrightnessDay, ENightDayFactor), lerp(PaletteBrightnessIntNgt, PaletteBrightnessIntDay, ENightDayFactor), EInteriorFactor), EDungeonFactor);

		color.rgb = saturate(color.rgb);
		float3	brightness = Adaptation.xyz;//tex2D(_s4, 0.5);//adaptation luminance
		brightness = (brightness / (brightness*PaletteBrightness));//new version
		brightness = max(brightness.x, max(brightness.y, brightness.z));//new version
		float3	palette;
		float4	uvsrc = 0.0;

		uvsrc.y = brightness.r;
		uvsrc.x = color.r;

		palette.r = tex2Dlod(_s7, uvsrc).r;

		uvsrc.x = color.g;
		uvsrc.y = brightness.g;

		palette.g = tex2Dlod(_s7, uvsrc).g;

		uvsrc.x = color.b;
		uvsrc.y = brightness.b;

		palette.b = tex2Dlod(_s7, uvsrc).b;

		color.rgb = palette.rgb * Palette;

		 float dither_amp = 1.0;
		 float3 magic = { 0.06711056, 0.00583715, 52.9829189 };
		 float noise = lerp(-0.5, 0.5, frac(magic.z * frac(dot(vPos, magic.xy)))) * dither_amp; //or other noise method

		color.xyz = pow(color.xyz, 1.0 / 2.2);
		color.xyz = color.xyz + noise * min(color.xyz + 0.5 * pow(1.0 / 255.0, 2.2), 0.75 * (pow(256.0 / 255.0, 2.2) - 1.0));
		color.xyz = pow(color.xyz, 2.2);

		_oC0.w = 1.0;
		_oC0.xyz = color.xyz;
		return _oC0;
}


//switch between vanilla and mine post processing
#ifndef ENB_FLIPTECHNIQUE
technique Shader_D6EC7DD1
#else
technique Shader_ORIGINALPOSTPROCESS
#endif
{
	pass p0
	{
		VertexShader = compile vs_3_0 VS_Quad();
		PixelShader = compile ps_3_0 PS_D6EC7DD1();

		ColorWriteEnable = ALPHA | RED | GREEN | BLUE;
		ZEnable = FALSE;
		ZWriteEnable = FALSE;
		CullMode = NONE;
		AlphaTestEnable = FALSE;
		AlphaBlendEnable = FALSE;
		SRGBWRITEENABLE = FALSE;
	}
}



//original shader of post processing
#ifndef ENB_FLIPTECHNIQUE
technique Shader_ORIGINALPOSTPROCESS
#else
technique Shader_D6EC7DD1
#endif
{
	pass p0
	{
		VertexShader = compile vs_3_0 VS_Quad();
		PixelShader =
			asm
		{
			// Parameters:
			//   sampler2D Avg;
			//   sampler2D Blend;
			//   float4 Cinematic;
			//   float4 ColorRange;
			//   float4 Fade;
			//   sampler2D Image;
			//   float4 Param;
			//   float4 Tint;
			// Registers:
			//   Name         Reg   Size
			//   ------------ ----- ----
			//   ColorRange   c1       1
			//   Param        c2       1
			//   Cinematic    c3       1
			//   Tint         c4       1
			//   Fade         c5       1
			//   Image        s0       1
			//   Blend        s1       1
			//   Avg          s2       1
			//s0 bloom result
			//s1 color
			//s2 is average color

			ps_3_0
			def c6, 0, 0, 0, 0
			//was c0 originally
			def c7, 0.212500006, 0.715399981, 0.0720999986, 1
			dcl_texcoord v0.xy
			dcl_2d s0
			dcl_2d s1
			dcl_2d s2
			rcp r0.x, c2.y
			texld r1, v0, s2
			mul r0.yz, r1.xxyw, c1.y
			rcp r0.w, r0.y
			mul r0.z, r0.w, r0.z
			texld r1, v0, s1
			mul r1.xyz, r1, c1.y
			dp3 r0.w, c7, r1
			mul r1.w, r0.w, r0.z
			mad r0.z, r0.z, r0.w, c7.w
			rcp r0.z, r0.z
			mad r0.x, r1.w, r0.x, c7.w
			mul r0.x, r0.x, r1.w
			mul r0.x, r0.z, r0.x
			cmp r0.x, -r0.w, c6.x, r0.x
			rcp r0.z, r0.w
			mul r0.z, r0.z, r0.x
			add_sat r0.x, -r0.x, c2.x
			texld r2, v0, s0
			mul r2.xyz, r2, c1.y
			mul r2.xyz, r0.x, r2
			mad r1.xyz, r1, r0.z, r2
			dp3 r0.x, r1, c7
			mov r1.w, c7.w
			lrp r2, c3.x, r1, r0.x
			mad r1, r0.x, c4, -r2
			mad r1, c4.w, r1, r2
			mad r1, c3.w, r1, -r0.y
			mad r0, c3.z, r1, r0.y
			add r1, -r0, c5
			mad oC0, c5.w, r1, r0
		};
		ColorWriteEnable = ALPHA | RED | GREEN | BLUE;
		ZEnable = FALSE;
		ZWriteEnable = FALSE;
		CullMode = NONE;
		AlphaTestEnable = FALSE;
		AlphaBlendEnable = FALSE;
		SRGBWRITEENABLE = FALSE;
	}
}

