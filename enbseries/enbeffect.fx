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
	string UIName="CC: Desaturate shadows";
	string UIWidget="Spinner";
	float UIMin=0.0;
	float UIMax=1.0;
> = {0.0};

string param01 = "Adaptation Control";
string param02 = "+Interior";
float	EAdaptationMinIntDay	<string UIName = "  IntDay- Min";	string UIWidget = "Spinner";	float UIMin = 0.01;	float UIMax = 1.00; > = { 0.04 };
float	EAdaptationIntDay		<string UIName = "  IntDay- Adapt";	string UIWidget = "Spinner";	float UIMin = 0.01;	float UIMax = 1.00; > = { 0.50 };
float	EAdaptationMaxIntDay	<string UIName = "  IntDay- Max";	string UIWidget = "Spinner";	float UIMin = 0.01;	float UIMax = 1.00; > = { 0.06 };

float	EAdaptationMinIntNgt	<string UIName = "  IntNgt- Min";	string UIWidget = "Spinner";	float UIMin = 0.01;	float UIMax = 1.00; > = { 0.09 };
float	EAdaptationIntNgt		<string UIName = "  IntNgt- Adapt";	string UIWidget = "Spinner";	float UIMin = 0.01;	float UIMax = 1.00; > = { 0.50 };
float	EAdaptationMaxIntNgt	<string UIName = "  IntNgt- Max";	string UIWidget = "Spinner";	float UIMin = 0.01;	float UIMax = 1.00; > = { 0.12 };

string param03 = "+Exterior";

float	EAdaptationMinDay	<string UIName = "  Day- Min";	string UIWidget = "Spinner";	float UIMin = 0.01;	float UIMax = 1.00; > = { 0.03 };
float	EAdaptationDay		<string UIName = "  Day- Adapt";	string UIWidget = "Spinner";	float UIMin = 0.01;	float UIMax = 1.00; > = { 0.45 };
float	EAdaptationMaxDay	<string UIName = "  Day- Max";	string UIWidget = "Spinner";	float UIMin = 0.01;	float UIMax = 1.00; > = { 0.07 };

float	EAdaptationMinMid	<string UIName = "  Mid- Min";	string UIWidget = "Spinner";	float UIMin = 0.01;	float UIMax = 1.00; > = { 0.03 };
float	EAdaptationMid		<string UIName = "  Mid- Adapt";	string UIWidget = "Spinner";	float UIMin = 0.01;	float UIMax = 1.00; > = { 0.45 };
float	EAdaptationMaxMid	<string UIName = "  Mid- Max";	string UIWidget = "Spinner";	float UIMin = 0.01;	float UIMax = 1.00; > = { 0.07 };

float	EAdaptationhMinDay	<string UIName = "  Day- hMin";	string UIWidget = "Spinner";	float UIMin = 0.01;	float UIMax = 1.00; > = { 0.03 };
float	EAdaptationhDay		<string UIName = "  Day- hAdapt";	string UIWidget = "Spinner";	float UIMin = 0.01;	float UIMax = 1.00; > = { 0.45 };
float	EAdaptationhMaxDay	<string UIName = "  Day- hMax";	string UIWidget = "Spinner";	float UIMin = 0.01;	float UIMax = 1.00; > = { 0.07 };

float	EAdaptationMinNgt	<string UIName = "  Ngt- Min";	string UIWidget = "Spinner";	float UIMin = 0.01;	float UIMax = 1.00; > = { 0.09 };
float	EAdaptationNgt		<string UIName = "  Ngt- Adapt";	string UIWidget = "Spinner";	float UIMin = 0.01;	float UIMax = 1.00; > = { 0.35 };
float	EAdaptationMaxNgt	<string UIName = "  Ngt- Max";	string UIWidget = "Spinner";	float UIMin = 0.01;	float UIMax = 1.00; > = { 0.12 };

string param04 = "+Dungeon";

float	EAdaptationMinDun	<string UIName = "  Dun- Min";	string UIWidget = "Spinner";	float UIMin = 0.00;	float UIMax = 1.00; > = { 0.09 };
float	EAdaptationDun		<string UIName = "  Dun- Adapt";	string UIWidget = "Spinner";	float UIMin = 0.00;	float UIMax = 1.00; > = { 0.3 };
float	EAdaptationMaxDun	<string UIName = "  Dun- Max";	string UIWidget = "Spinner";	float UIMin = 0.00;	float UIMax = 1.00; > = { 0.12 };


string param05 = "Palette / Gamma Control";

float	PaletteIntDay = 1.0;
float	PaletteBrightnessIntDay	<string UIName = "  IntDay- PaletteBrightness";	string UIWidget = "Spinner";	float UIMin = 0.0;	float UIMax = 10.0; > = { 1.5 };
float	GammaIntDay		<string UIName = "  IntDay- Gamma";		string UIWidget = "Spinner";	float UIMin = 0.0;	float UIMax = 10.0; > = { 1.0 };
float	PaletteIntNgt = 1.0;
float	PaletteBrightnessIntNgt = 1.5;
float	GammaIntNgt = 1.2;
float	PaletteDay = 1.0;
float	PaletteBrightnessDay = 1.0;
float	GammaDay		<string UIName = "  Day- Gamma";		string UIWidget = "Spinner";	float UIMin = 0.0;	float UIMax = 10.0; > = { 1.0 };
float	PaletteNgt		<string UIName = "  Ngt- Palette";		string UIWidget = "Spinner";	float UIMin = 0.0;	float UIMax = 10.0; > = { 1.0 };
float	PaletteBrightnessNgt	<string UIName = "  Ngt- PaletteBrightness";	string UIWidget = "Spinner";	float UIMin = 0.0;	float UIMax = 10.0; > = { 810 };
float	GammaNgt		<string UIName = "  Ngt- Gamma";		string UIWidget = "Spinner";	float UIMin = 0.0;	float UIMax = 10.0; > = { 1.0 };
float	PaletteDun		<string UIName = "  Dun- Palette";		string UIWidget = "Spinner";	float UIMin = 0.0;	float UIMax = 10.0; > = { 1.0 };
float	PaletteBrightnessDun	<string UIName = "  Dun- PaletteBrightness";	string UIWidget = "Spinner";	float UIMin = 0.0;	float UIMax = 10.0; > = { 1.0 };
float	GammaDun		<string UIName = "  Dun- Gamma";		string UIWidget = "Spinner";	float UIMin = 0.0;	float UIMax = 10.0; > = { 1.0 };

string param06 = "Interior / Exterior / Dungeon Controls";
string param07 = "+Interior";

//--------------------------------------------------

float	EIntensityContrastIntDay			<string UIName="  IntDay- Contrast";				string UIWidget="Spinner";	float UIMin=0.00;	float UIMax=10.00;> = {1.1};
float	EColorSaturationIntDay				<string UIName="  IntDay- Saturation";				string UIWidget="Spinner";	float UIMin=0.00;	float UIMax=10.00;> = {0.8};
float	EBrightnessIntDay					<string UIName="  IntDay- Brightness";				string UIWidget="Spinner";	float UIMin=0.00;	float UIMax=5.00;> = {0.09};
float	EBrightnessCurveIntDay				<string UIName="  IntDay- Bright Curve";			string UIWidget = "Spinner";	float UIMin = 0.00;	float UIMax = 10.00; > = { 1.10 };
float	EBrightnessMultiplierIntDay			<string UIName="  IntDay- Bright Multiplier";		string UIWidget = "Spinner";	float UIMin = 0.00;	float UIMax = 10.00; > = { 0.5 };
float	EBrightnessToneMappingCurveIntDay	<string UIName="  IntDay- Bright Tonemap Curve";	string UIWidget = "Spinner";	float UIMin = 0.00;	float UIMax = 10.00; > = { 0.35 };
float	EToneMappingCurveIntDay				<string UIName="  IntDay- Tonemap Curve";			string UIWidget = "Spinner";	float UIMin = 0.0;	float UIMax = 100.0; > = { 4.0 };
float	EToneMappingOversaturationIntDay	<string UIName="  IntDay- Tonemap Oversaturation";	string UIWidget="Spinner";	float UIMin=0.0;	float UIMax=500.0;> = {2.0};

//--------------------------------------------------

float	EIntensityContrastIntNgt			<string UIName="  IntNgt- Contrast";				string UIWidget="Spinner";	float UIMin=0.00;	float UIMax=10.00;> = {1.0};
float	EColorSaturationIntNgt				<string UIName="  IntNgt- Saturation";				string UIWidget="Spinner";	float UIMin=0.00;	float UIMax=10.00;> = {0.75};
float	EBrightnessIntNgt					<string UIName="  IntNgt- Brightness";				string UIWidget="Spinner";	float UIMin=0.00;	float UIMax=5.00;> = {0.25};
float	EBrightnessCurveIntNgt				<string UIName="  IntNgt- Bright Curve";			string UIWidget = "Spinner";	float UIMin = 0.00;	float UIMax = 5.00; > = { 1.1 };
float	EBrightnessMultiplierIntNgt			<string UIName="  IntNgt- Bright Multiplier";		string UIWidget = "Spinner";	float UIMin = 0.00;	float UIMax = 10.00; > = { 0.6 };
float	EBrightnessToneMappingCurveIntNgt	<string UIName="  IntNgt- Bright Tonemap Curve";	string UIWidget = "Spinner";	float UIMin = 0.00;	float UIMax = 10.00; > = { 0.5 };
float	EToneMappingCurveIntNgt				<string UIName="  IntNgt- Tonemap Curve";			string UIWidget = "Spinner";	float UIMin = 0.0;	float UIMax = 100.0; > = { 5.0 };
float	EToneMappingOversaturationIntNgt	<string UIName="  IntNgt- Tonemap Oversaturation";	string UIWidget="Spinner";	float UIMin=0.0;	float UIMax=500.0;> = {8.0};

//--------------------------------------------------
string param08 = "+Exterior";

float	EIntensityContrastDay		<string UIName = "  Day- Contrast";			string UIWidget = "Spinner";	float UIMin = 0.00;	float UIMax = 10.00; > = { 1.0 };
float	EColorSaturationDay		<string UIName = "  Day- Saturation";			string UIWidget = "Spinner";	float UIMin = 0.00;	float UIMax = 10.00; > = { 0.67 };
float	EBrightnessDay			<string UIName = "  Day- Brightness";			string UIWidget = "Spinner";	float UIMin = 0.00;	float UIMax = 5.00; > = { 0.2 };
float	EBrightnessCurveDay		<string UIName = "  Day- Bright Curve";		string UIWidget = "Spinner";	float UIMin = 0.00;	float UIMax = 10.00; > = { 1.10 };
float	EBrightnessMultiplierDay		<string UIName = "  Day- Bright Multiplier";		string UIWidget = "Spinner";	float UIMin = 0.00;	float UIMax = 10.00; > = { 0.50 };
float	EBrightnessToneMappingCurveDay	<string UIName = "  Day- Bright Tonemap Curve";	string UIWidget = "Spinner";	float UIMin = 0.00;	float UIMax = 10.00; > = { 0.35 };
float	EToneMappingCurveDay = 8.0;
float	EToneMappingOversaturationDay	<string UIName = "  Day- Tonemap Oversaturation";	string UIWidget = "Spinner";	float UIMin = 0.0;	float UIMax = 500.0; > = { 2.5 };

//--------------------------------------------------

float	EIntensityContrastNgt		<string UIName = "  Ngt- Contrast";			string UIWidget = "Spinner";	float UIMin = 0.00;	float UIMax = 10.00; > = { 1.05 };
float	EColorSaturationNgt		<string UIName = "  Ngt- Saturation";			string UIWidget = "Spinner";	float UIMin = 0.00;	float UIMax = 10.00; > = { 0.8 };
float	EBrightnessNgt			<string UIName = "  Ngt- Brightness";			string UIWidget = "Spinner";	float UIMin = 0.00;	float UIMax = 5.00; > = { 0.3 };
float	EBrightnessCurveNgt		<string UIName = "  Ngt- Bright Curve";		string UIWidget = "Spinner";	float UIMin = 0.00;	float UIMax = 10.00; > = { 1.1 };
float	EBrightnessMultiplierNgt		<string UIName = "  Ngt- Bright Multiplier";		string UIWidget = "Spinner";	float UIMin = 0.00;	float UIMax = 10.00; > = { 0.63 };
float	EBrightnessToneMappingCurveNgt	<string UIName = "  Ngt- Bright Tonemap Curve";	string UIWidget = "Spinner";	float UIMin = 0.00;	float UIMax = 10.00; > = { 0.5 };
float	EToneMappingCurveNgt		<string UIName = "  Ngt- Tonemap Curve";		string UIWidget = "Spinner";	float UIMin = 0.0;	float UIMax = 100.0; > = { 5.0 };
float	EToneMappingOversaturationNgt	<string UIName = "  Ngt- Tonemap Oversaturation";	string UIWidget = "Spinner";	float UIMin = 0.0;	float UIMax = 500.0; > = { 1.8 };

//--------------------------------------------------
string param09 = "+Dungeon";
float	EIntensityContrastDun		<string UIName = "  Dun- Contrast";			string UIWidget = "Spinner";	float UIMin = 0.00;	float UIMax = 10.00; > = { 1.08 };
float	EColorSaturationDun		<string UIName = "  Dun- Saturation";			string UIWidget = "Spinner";	float UIMin = 0.00;	float UIMax = 10.00; > = { 0.80 };
float	EBrightnessDun			<string UIName = "  Dun- Brightness";			string UIWidget = "Spinner";	float UIMin = 0.00;	float UIMax = 5.00; > = { 0.3 };
float	EBrightnessCurveDun		<string UIName = "  Dun- Bright Curve";		string UIWidget = "Spinner";	float UIMin = 0.00;	float UIMax = 10.00; > = { 1.1 };
float	EBrightnessMultiplierDun		<string UIName = "  Dun- Bright Multiplier";		string UIWidget = "Spinner";	float UIMin = 0.00;	float UIMax = 10.00; > = { 0.63 };
float	EBrightnessToneMappingCurveDun	<string UIName = "  Dun- Bright Tonemap Curve";	string UIWidget = "Spinner";	float UIMin = 0.00;	float UIMax = 10.00; > = { 0.50 };
float	EToneMappingCurveDun		<string UIName = "  Dun- Tonemap Curve";		string UIWidget = "Spinner";	float UIMin = 0.0;	float UIMax = 100.0; > = { 5.0 };
float	EToneMappingOversaturationDun	<string UIName = "  Dun- Tonemap Oversaturation";	string UIWidget = "Spinner";	float UIMin = 0.0;	float UIMax = 500.0; > = { 1.8 };


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
	Texture   = <texs0>;
	MinFilter = POINT;//
	MagFilter = POINT;//
	MipFilter = NONE;//LINEAR;
	AddressU  = Clamp;
	AddressV  = Clamp;
	SRGBTexture=FALSE;
	MaxMipLevel=0;
	MipMapLodBias=0;
};

sampler2D _s1 = sampler_state
{
	Texture   = <texs1>;
	MinFilter = LINEAR;//
	MagFilter = LINEAR;//
	MipFilter = NONE;//LINEAR;
	AddressU  = Clamp;
	AddressV  = Clamp;
	SRGBTexture=FALSE;
	MaxMipLevel=0;
	MipMapLodBias=0;
};

sampler2D _s2 = sampler_state
{
	Texture   = <texs2>;
	MinFilter = LINEAR;//
	MagFilter = LINEAR;//
	MipFilter = NONE;//LINEAR;
	AddressU  = Clamp;
	AddressV  = Clamp;
	SRGBTexture=FALSE;
	MaxMipLevel=0;
	MipMapLodBias=0;
};

sampler2D _s3 = sampler_state
{
	Texture   = <texs3>;
	MinFilter = LINEAR;//
	MagFilter = LINEAR;//
	MipFilter = NONE;//LINEAR;
	AddressU  = Clamp;
	AddressV  = Clamp;
	SRGBTexture=FALSE;
	MaxMipLevel=0;
	MipMapLodBias=0;
};

sampler2D _s4 = sampler_state
{
	Texture   = <texs4>;
	MinFilter = LINEAR;//
	MagFilter = LINEAR;//
	MipFilter = NONE;//LINEAR;
	AddressU  = Clamp;
	AddressV  = Clamp;
	SRGBTexture=FALSE;
	MaxMipLevel=0;
	MipMapLodBias=0;
};

sampler2D _s7 = sampler_state
{
	Texture   = <texs7>;
	MinFilter = LINEAR;
	MagFilter = LINEAR;
	MipFilter = NONE;
	AddressU  = Clamp;
	AddressV  = Clamp;
	SRGBTexture=FALSE;
	MaxMipLevel=0;
	MipMapLodBias=0;
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

float getState(float dun, float iday, float inight, float eday, float enight) {
	if (WeatherAndTime.x == 0 || (WeatherAndTime.x >= 25 && WeatherAndTime.x <= 39))
		return dun;
	float exterior = lerp(enight, eday, ENightDayFactor);
	float interior = lerp(inight, iday, ENightDayFactor);
	float res = lerp(exterior, interior, EInteriorFactor);
	return res;
}

float WthrTransition(float WTHRINDEX_START, float WTHRINDEX_ENDS)
{
    float2 wthrlvl;
    if(WeatherAndTime.x > (WTHRINDEX_START - 0.2) && WeatherAndTime.x < (WTHRINDEX_ENDS + 0.2))
        wthrlvl.x = WeatherAndTime.z;       // Affects transition In
    else
        wthrlvl.x = 1 - WeatherAndTime.z;   // Affects transition Out

    if(WeatherAndTime.y > (WTHRINDEX_START - 0.2) && WeatherAndTime.y < (WTHRINDEX_ENDS + 0.2))
        wthrlvl.y = 1 - WeatherAndTime.z;   // Affects transition Out, 1 = effect applies during specified weather index
    else
        wthrlvl.y = 0 + WeatherAndTime.z;   // Affects transition In, 0 = effect applies during unspecified weather index

  return lerp(wthrlvl.x, wthrlvl.y, step(WeatherAndTime.z, 0.5));
}

//////////////////////////////////////////////////////////////////////////////////////////////
// Functions to calculate day/night/sunrise/sunset separation factors by kingeric1992/Phinix.
// NOTE: If you change values in enbseries.ini [TIMEOFDAY] change them here to match.

#define TOD_SRD 2		// DawnDuration
#define TOD_SRT 7.5		// SunriseTime
#define TOD_DAT 13		// DayTime
#define TOD_SST 18.5	// SunsetTime
#define TOD_SSD 2		// DuskDuration
#define TOD_NIT 1		// NightTime

#define TOD(parm)    getState2( TODfactors(),parm##Dun, parm##IntDay, parm##IntNgt, parm##Day, parm##Ngt, parm##Mid)
#define TOD2(parm)	getState(parm##Dun, parm##IntDay, parm##IntNgt, parm##Day, parm##Ngt)

//returns (TOD factor sunrise, TOD factor day, TOD factor sunset, TOD factor night)
float4 TODfactors()
{
	float4 weight = WeatherAndTime.w;
	weight.xy -= TOD_SRT;
	weight.zw -= TOD_SST;
	weight /= float4(-TOD_SRD, TOD_DAT - TOD_SRT, TOD_DAT - TOD_SST, TOD_SSD);
	weight = saturate(weight);
	weight.yz = sin(weight.yz * 1.57);// pi/2
	weight.xw = 1 - weight.xw;
	return float4(weight.x*(1 - weight.y), weight.y*weight.z, (1 - weight.z)*weight.w, 1 - weight.w*weight.x);
}
float getState2(float4 factors, float Dungeon, float D_I, float N_I, float D_E, float N_E, float MID_E)
{
	if (WeatherAndTime.x == 0 || (WeatherAndTime.x >= 25 && WeatherAndTime.x <= 39))
		return Dungeon;
	return lerp(dot(factors, float4(MID_E, D_E, MID_E, N_E)), lerp(N_I, D_I, ENightDayFactor), EInteriorFactor);
}
//
//////////////////////////////////////////////////////////////////////////////////////////////


//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
VS_OUTPUT_POST VS_Quad(VS_INPUT_POST IN)
{
	VS_OUTPUT_POST OUT;

	OUT.vpos=float4(IN.pos.x,IN.pos.y,IN.pos.z,1.0);

	OUT.txcoord0.xy=IN.txcoord0.xy;

	return OUT;
}


float4 PS_D6EC7DD1(VS_OUTPUT_POST IN, float2 vPos : VPOS) : COLOR
{
	float4 _oC0=0.0; //output

	float4 _c6=float4(0, 0, 0, 0);
	float4 _c7=float4(0.212500006, 0.715399981, 0.0720999986, 1.0);

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
	

	float4 _v0=0.0;
	_v0.xy=IN.txcoord0.xy;
	r1=tex2D(_s0, _v0.xy); //color

// prod80 bloom method
	float4 xcolorbloom = tex2D(_s3, _v0.xy);
	r1.xyz+=xcolorbloom*EBloomAmount;

//	r11=r1; //my bypass
	_oC0.xyz=r1.xyz; //for future use without game color corrections

	float4 color=_oC0;
	
	float Gamma = TOD2(Gamma);

	float Adapt = TOD(EAdaptation);
	float AdaptMin = TOD(EAdaptationMin);
	float AdaptMax = TOD(EAdaptationMax);

	if (WeatherAndTime.x >= 6 && WeatherAndTime.x <= 9 && EInteriorFactor == 0) {
		AdaptMin = lerp(AdaptMin, lerp(EAdaptationMinNgt, EAdaptationhMinDay, ENightDayFactor), WthrTransition(6,9));
		Adapt = lerp(Adapt, lerp(EAdaptationNgt, EAdaptationhDay, ENightDayFactor), WthrTransition(6,9));
		AdaptMax = lerp(AdaptMax, lerp(EAdaptationMaxNgt, EAdaptationhMaxDay, ENightDayFactor), WthrTransition(6,9));
	}

	float Brightness = TOD2(EBrightness);
	float BrightnessCurve = TOD2(EBrightnessCurve);
	float BrightnessMultiplier = TOD2(EBrightnessMultiplier);
	float BrightnessToneMappingCurve = TOD2(EBrightnessToneMappingCurve);
	float ColorSaturation = TOD2(EColorSaturation);
	float IntensityContrast = TOD2(EIntensityContrast);
	float ToneMappingCurve = TOD2(EToneMappingCurve);
	float ToneMappingOversaturation = TOD2(EToneMappingOversaturation);

	//adaptation in time
	float4	Adaptation=tex2D(_s4, 0.5);
	float	grayadaptation=max(max(Adaptation.x, Adaptation.y), Adaptation.z);
    		grayadaptation=min(max(grayadaptation, 0.0), 50.0); //50.0

	color = pow(color, Gamma);	
	color.xyz=color.xyz/(max(min(grayadaptation*Adapt,AdaptMax), AdaptMin));//*tempF1.x
	color.xyz= color.xyz * Brightness +0.000001;
	float3 xncol=normalize(color.xyz);
	float3 scl=color.xyz/xncol.xyz;
	scl=pow(scl, IntensityContrast);
	xncol.xyz=pow(xncol.xyz, ColorSaturation);
	color.xyz=scl*xncol.xyz;

	float	lumamax=ToneMappingOversaturation;
	color.xyz=(color.xyz * (1.0 + color.xyz/lumamax))/(color.xyz + ToneMappingCurve);
	
	float Y = dot(color.xyz, float3(0.299, 0.587, 0.114)); //0.299 * R + 0.587 * G + 0.114 * B;
	float U = dot(color.xyz, float3(-0.14713, -0.28886, 0.436)); //-0.14713 * R - 0.28886 * G + 0.436 * B;
	float V = dot(color.xyz, float3(0.615, -0.51499, -0.10001)); //0.615 * R - 0.51499 * G - 0.10001 * B;	
	
	Y=pow(Y, BrightnessCurve);
	Y=Y*BrightnessMultiplier;
	Y=Y/(Y+BrightnessToneMappingCurve);
	float	desaturatefact=saturate(Y*Y*Y*1.7);
	U=lerp(U, 0.0, desaturatefact);
	V=lerp(V, 0.0, desaturatefact);
	color.xyz=V * float3(1.13983, -0.58060, 0.0) + U * float3(0.0, -0.39465, 2.03211) + Y;



	//pallete texture (0.082+ version feature)
	float newpalette = TOD2(Palette);
	float newpalettebrightness = TOD2(PaletteBrightness);

	color.rgb=saturate(color.rgb);
	float3	brightness=Adaptation.xyz;//tex2D(_s4, 0.5);//adaptation luminance
	brightness=(brightness/(brightness*newpalettebrightness));//new version
	brightness=max(brightness.x, max(brightness.y, brightness.z));//new version
	float3	palette;
	float4	uvsrc=0.0;
	uvsrc.y=brightness.r;
	uvsrc.x=color.r;
	palette.r=tex2Dlod(_s7, uvsrc).r;
	uvsrc.x=color.g;
	uvsrc.y=brightness.g;
	palette.g=tex2Dlod(_s7, uvsrc).g;
	uvsrc.x=color.b;
	uvsrc.y=brightness.b;
	palette.b=tex2Dlod(_s7, uvsrc).b;
	color.rgb=palette.rgb * newpalette;

	float4 tempvar;
	float tempgray;
	tempgray=dot(color, 0.3333);
	tempvar.x=saturate(1.0-tempgray);
	tempvar.x*=tempvar.x;
	tempvar.x*=tempvar.x;
	tempvar=lerp(color, tempgray, ECCDesaturateShadows*tempvar.x);
	_oC0.w=1.0;
	_oC0.xyz=color.xyz;
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
		VertexShader  = compile vs_3_0 VS_Quad();
		PixelShader  = compile ps_3_0 PS_D6EC7DD1();

		ColorWriteEnable=ALPHA|RED|GREEN|BLUE;
		ZEnable=FALSE;
		ZWriteEnable=FALSE;
		CullMode=NONE;
		AlphaTestEnable=FALSE;
		AlphaBlendEnable=FALSE;
		SRGBWRITEENABLE=FALSE;
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
		VertexShader  = compile vs_3_0 VS_Quad();
		PixelShader=
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
		ColorWriteEnable=ALPHA|RED|GREEN|BLUE;
		ZEnable=FALSE;
		ZWriteEnable=FALSE;
		CullMode=NONE;
		AlphaTestEnable=FALSE;
		AlphaBlendEnable=FALSE;
		SRGBWRITEENABLE=FALSE;
    }
}

