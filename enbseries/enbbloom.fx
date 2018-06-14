// THERE IS NOTHING TO EDIT BELOW THIS POINT ++++++++++++++++++++++++++++++++++++++++++++
// GUI ELEMENTS +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	string param01 = "Options & Settings";
	float QUALITYLEVEL <
		string UIName="Bloom Quality";
		string UIWidget="Quality";
		float UIMin=0;
		float UIMax=2;
		float UIStep=1;
	> = {0}; //0 best compromise between quality and performance
	string param02 = "Depth";
	float zfar <
		string UIName="Far Depth";
		string UIWidget="Spinner";
		float UIMin=0.0;
		float UIMax=100000.0;
		float UIStep=0.1;
	> = {50.0};
	float minDepthE <
		string UIName="Exterior: Min Depth";
		string UIWidget="Spinner";
		float UIMin=0;
		float UIMax=1;
		float UIStep=0.001;
	> = {0.67};
	float minDepthI <
		string UIName="Interior: Min Depth";
		string UIWidget="Spinner";
		float UIMin=0;
		float UIMax=1;
		float UIStep=0.001;
	> = {0.67};
	string param03 = " + Daytime Setting";
	float	BinBlackD <
		string UIName="Day Bloom: Black Level";
		string UIWidget="Spinner";
		float UIMin=0.0;
		float UIMax=1.0;
		float UIStep=0.001;
	> = {0.0};
	float	BinGammaD <
		string UIName="Day Bloom: Gamma Curve";
		string UIWidget="Spinner";
		float UIMin=0.0;
		float UIMax=5.0;
		float UIStep=0.001;
	> = {1.0};
	float	BinWhiteD <
		string UIName="Day Bloom: White Level";
		string UIWidget="Spinner";
		float UIMin=0.0;
		float UIMax=1.0;
		float UIStep=0.001;
	> = {1.0};
	float BoutBlackD <
		string UIName="Day Bloom: Black Cutoff";
		string UIWidget="Spinner";
		float UIMin=0.0;
		float UIMax=1.0;
		float UIStep=0.001;
	> = {0.0};
	float BoutWhiteD <
		string UIName="Day Bloom: White Cutoff";
		string UIWidget="Spinner";
		float UIMin=0.0;
		float UIMax=1.0;
		float UIStep=0.001;
	> = {1.0};
	float bsatD <
		string UIName="Day Bloom: Saturation";
		string UIWidget="Spinner";
		float UIMin=0.0;
		float UIMax=2.0;
		float UIStep=0.001;
	> = {1.0};
	float BloomSigmaD <
		string UIName="Day Bloom: Sigma (Blur width)";
		string UIWidget="Spinner";
		float UIMin=1.2;
		float UIMax=128.0;
		float UIStep=0.001;
	> = {6.0};
	float hIntensityD <
		string UIName="Day Bloom: X Intensity";
		string UIWidget="Spinner";
		float UIMin=1.0;
		float UIMax=10.0;
		float UIStep=0.001;
	> = {1.0};
	float vIntensityD <
		string UIName="Day Bloom: X+Y Intensity";
		string UIWidget="Spinner";
		float UIMin=1.0;
		float UIMax=10.0;
		float UIStep=0.001;
	> = {1.0};
	string param04 = " + Nighttime Setting";
	float	BinBlackN <
		string UIName="Night Bloom: Black Level";
		string UIWidget="Spinner";
		float UIMin=0.0;
		float UIMax=1.0;
		float UIStep=0.001;
	> = {0.0};
	float	BinGammaN <
		string UIName="Night Bloom: Gamma Curve";
		string UIWidget="Spinner";
		float UIMin=0.0;
		float UIMax=5.0;
		float UIStep=0.001;
	> = {1.0};
	float	BinWhiteN <
		string UIName="Night Bloom: White Level";
		string UIWidget="Spinner";
		float UIMin=0.0;
		float UIMax=1.0;
		float UIStep=0.001;
	> = {1.0};
	float BoutBlackN <
		string UIName="Night Bloom: Black Cutoff";
		string UIWidget="Spinner";
		float UIMin=0.0;
		float UIMax=1.0;
		float UIStep=0.001;
	> = {0.0};
	float BoutWhiteN <
		string UIName="Night Bloom: White Cutoff";
		string UIWidget="Spinner";
		float UIMin=0.0;
		float UIMax=1.0;
		float UIStep=0.001;
	> = {1.0};
	float bsatN <
		string UIName="Night Bloom: Saturation";
		string UIWidget="Spinner";
		float UIMin=0.0;
		float UIMax=2.0;
		float UIStep=0.001;
	> = {1.0};
	float BloomSigmaN <
		string UIName="Night Bloom: Sigma (Blur width)";
		string UIWidget="Spinner";
		float UIMin=1.2;
		float UIMax=128.0;
		float UIStep=0.001;
	> = {6.0};
	float hIntensityN <
		string UIName="Night Bloom: X Intensity";
		string UIWidget="Spinner";
		float UIMin=1.0;
		float UIMax=10.0;
		float UIStep=0.001;
	> = {1.0};
	float vIntensityN <
		string UIName="Night Bloom: X+Y Intensity";
		string UIWidget="Spinner";
		float UIMin=1.0;
		float UIMax=10.0;
		float UIStep=0.001;
	> = {1.0};
	
	string param05 = " + Interior Daytime Setting";
	float	BinBlackID <
		string UIName="Interior Day Bloom: Black Level";
		string UIWidget="Spinner";
		float UIMin=0.0;
		float UIMax=1.0;
		float UIStep=0.001;
	> = {0.0};
	float	BinGammaID <
		string UIName="Interior Day Bloom: Gamma Curve";
		string UIWidget="Spinner";
		float UIMin=0.0;
		float UIMax=5.0;
		float UIStep=0.001;
	> = {1.0};
	float	BinWhiteID <
		string UIName="Interior Day Bloom: White Level";
		string UIWidget="Spinner";
		float UIMin=0.0;
		float UIMax=1.0;
		float UIStep=0.001;
	> = {1.0};
	float BoutBlackID <
		string UIName="Interior Day Bloom: Black Cutoff";
		string UIWidget="Spinner";
		float UIMin=0.0;
		float UIMax=1.0;
		float UIStep=0.001;
	> = {0.0};
	float BoutWhiteID <
		string UIName="Interior Day Bloom: White Cutoff";
		string UIWidget="Spinner";
		float UIMin=0.0;
		float UIMax=1.0;
		float UIStep=0.001;
	> = {1.0};
	float bsatID <
		string UIName="Interior Day Bloom: Saturation";
		string UIWidget="Spinner";
		float UIMin=0.0;
		float UIMax=2.0;
		float UIStep=0.001;
	> = {1.0};
	float BloomSigmaID <
		string UIName="Interior Day Bloom: Sigma (Blur width)";
		string UIWidget="Spinner";
		float UIMin=1.2;
		float UIMax=128.0;
		float UIStep=0.001;
	> = {6.0};
	float hIntensityID <
		string UIName="Interior Day Bloom: X Intensity";
		string UIWidget="Spinner";
		float UIMin=1.0;
		float UIMax=10.0;
		float UIStep=0.001;
	> = {1.0};
	float vIntensityID <
		string UIName="Interior Day Bloom: X+Y Intensity";
		string UIWidget="Spinner";
		float UIMin=1.0;
		float UIMax=10.0;
		float UIStep=0.001;
	> = {1.0};
	string param06 = " + Interior Nighttime Setting";
	float	BinBlackIN <
		string UIName="Interior Night Bloom: Black Level";
		string UIWidget="Spinner";
		float UIMin=0.0;
		float UIMax=1.0;
		float UIStep=0.001;
	> = {0.0};
	float	BinGammaIN <
		string UIName="Interior Night Bloom: Gamma Curve";
		string UIWidget="Spinner";
		float UIMin=0.0;
		float UIMax=5.0;
		float UIStep=0.001;
	> = {1.0};
	float	BinWhiteIN <
		string UIName="Interior Night Bloom: White Level";
		string UIWidget="Spinner";
		float UIMin=0.0;
		float UIMax=1.0;
		float UIStep=0.001;
	> = {1.0};
	float BoutBlackIN <
		string UIName="Interior Night : Black Cutoff";
		string UIWidget="Spinner";
		float UIMin=0.0;
		float UIMax=1.0;
		float UIStep=0.001;
	> = {0.0};
	float BoutWhiteIN <
		string UIName="Interior Night Bloom: White Cutoff";
		string UIWidget="Spinner";
		float UIMin=0.0;
		float UIMax=1.0;
		float UIStep=0.001;
	> = {1.0};
	float bsatIN <
		string UIName="Interior Night Bloom: Saturation";
		string UIWidget="Spinner";
		float UIMin=0.0;
		float UIMax=2.0;
		float UIStep=0.001;
	> = {1.0};
	float BloomSigmaIN <
		string UIName="Interior Night Bloom: Sigma (Blur width)";
		string UIWidget="Spinner";
		float UIMin=1.2;
		float UIMax=128.0;
		float UIStep=0.001;
	> = {6.0};
	float hIntensityIN <
		string UIName="Interior Night Bloom: X Intensity";
		string UIWidget="Spinner";
		float UIMin=1.0;
		float UIMax=10.0;
		float UIStep=0.001;
	> = {1.0};
	float vIntensityIN <
		string UIName="Interior Night Bloom: X+Y Intensity";
		string UIWidget="Spinner";
		float UIMin=1.0;
		float UIMax=10.0;
		float UIStep=0.001;
	> = {1.0};

//--------------------------------------------------

	string param07 = " + Dungeon Setting ";
	float	BinBlackDun <
		string UIName="Dungeon Bloom: Black Level";
		string UIWidget="Spinner";
		float UIMin=0.0;
		float UIMax=1.0;
		float UIStep=0.001;
	> = {0.0};
	float	BinGammaDun <
		string UIName="Dungeon Bloom: Gamma Curve";
		string UIWidget="Spinner";
		float UIMin=0.0;
		float UIMax=5.0;
		float UIStep=0.001;
	> = {1.0};
	float	BinWhiteDun <
		string UIName="Dungeon Bloom: White Level";
		string UIWidget="Spinner";
		float UIMin=0.0;
		float UIMax=1.0;
		float UIStep=0.001;
	> = {1.0};
	float BoutBlackDun <
		string UIName="Dungeon : Black Cutoff";
		string UIWidget="Spinner";
		float UIMin=0.0;
		float UIMax=1.0;
		float UIStep=0.001;
	> = {0.0};
	float BoutWhiteDun <
		string UIName="Dungeon Bloom: White Cutoff";
		string UIWidget="Spinner";
		float UIMin=0.0;
		float UIMax=1.0;
		float UIStep=0.001;
	> = {1.0};
	float bsatDun <
		string UIName="Dungeon Bloom: Saturation";
		string UIWidget="Spinner";
		float UIMin=0.0;
		float UIMax=2.0;
		float UIStep=0.001;
	> = {1.0};
	float BloomSigmaDun <
		string UIName="Dungeon Bloom: Sigma (Blur width)";
		string UIWidget="Spinner";
		float UIMin=1.2;
		float UIMax=128.0;
		float UIStep=0.001;
	> = {6.0};
	float hIntensityDun <
		string UIName="Dungeon Bloom: X Intensity";
		string UIWidget="Spinner";
		float UIMin=1.0;
		float UIMax=10.0;
		float UIStep=0.001;
	> = {1.0};
	float vIntensityDun <
		string UIName="Dungeon Bloom: X+Y Intensity";
		string UIWidget="Spinner";
		float UIMin=1.0;
		float UIMax=10.0;
		float UIStep=0.001;
	> = {1.0};

//--------------------------------------------------

	float SampleRange = 0.707;
	string param08 = "Noise";
	float GrainMotion <		
		string UIName="Noise Motion";
		string UIWidget="Spinner";
		float UIMin=0.0;
		float UIMax=50.0;
		float UIStep=0.001;
	> = {0.004};
	float GrainSaturation  <		
		string UIName="Noise Saturation";
		string UIWidget="Spinner";
		float UIMin=0.0;
		float UIMax=50.0;
		float UIStep=0.001;
	> = {1.0};
	float GrainIntensityE <		
		string UIName="Noise Intensity Exterior";
		string UIWidget="Spinner";
		float UIMin=0.0;
		float UIMax=50.0;
		float UIStep=0.001;
	> = {0.004};
	float GrainIntensityI <		
		string UIName="Noise Intensity Interior";
		string UIWidget="Spinner";
		float UIMin=0.0;
		float UIMax=50.0;
		float UIStep=0.001;
	> = {0.000};
	
// SOME STANDARD VARIABLES ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//float4	tempF1; 			// Not used //0,1,2,3
//float4	tempF2; 			// Not used //5,6,7,8
//float4	tempF3; 			// Not used //9,0
float4	ScreenSize; 			// x=Width, y=1/Width, z=ScreenScaleY (Width/Height), w=1/ScreenScaleY
float4	Timer;					// Used for Noise
float4	TempParameters; 		// Used to correct DIRECT3D half pixel offset correction in vertex (.xy), Screenfactor per pass 1/TextureSize (.z), Passnumber (.w)
//float4	LenzParameters;		// Not used
float4	BloomParameters;		// Not used: BloomRadius1 (GTA4) (.x), BloomRadius2(GTA4) (.y) //Used: BloomBlueShiftAmount (.z), BloomContrast (.w) 
float	ENightDayFactor;		// 0=Night, 1=Day
float	EInteriorFactor;		// 0=Exterior, 1=Interior
float4  WeatherAndTime; //.x - current weather index, .y - outgoing weather index, .z - weather transition, .w - time of the day in 24 standart hours.



// TEXTURES AND SAMPLERS ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

texture2D texDepth;
texture2D texBloom1;
texture2D texBloom2;
texture2D texBloom3;
texture2D texBloom4;
texture2D texBloom5;
texture2D texBloom6;
texture2D texBloom7;
texture2D texBloom8;
texture2D texBloom9;

sampler2D SamplerDepth = sampler_state
{
	Texture   = <texDepth>;
	MinFilter = POINT;
	MagFilter = POINT;
	MipFilter = NONE;
	AddressU  = Clamp;
	AddressV  = Clamp;
	SRGBTexture=FALSE;
	MaxMipLevel=0;
	MipMapLodBias=0;
};

sampler2D SamplerBloom1 = sampler_state
{
    Texture   = <texBloom1>;
	MinFilter = LINEAR;
	MagFilter = LINEAR;
	MipFilter = NONE;//NONE;
	AddressU  = Clamp;
	AddressV  = Clamp;
	SRGBTexture=FALSE;
	MaxMipLevel=0;
	MipMapLodBias=0;
};

sampler2D SamplerBloom2 = sampler_state
{
    Texture   = <texBloom2>;
	MinFilter = LINEAR;
	MagFilter = LINEAR;
	MipFilter = NONE;//NONE;
	AddressU  = Clamp;
	AddressV  = Clamp;
	SRGBTexture=FALSE;
	MaxMipLevel=0;
	MipMapLodBias=0;
};

sampler2D SamplerBloom3 = sampler_state
{
    Texture   = <texBloom3>;
	MinFilter = LINEAR;
	MagFilter = LINEAR;
	MipFilter = NONE;//NONE;
	AddressU  = Clamp;
	AddressV  = Clamp;
	SRGBTexture=FALSE;
	MaxMipLevel=0;
	MipMapLodBias=0;
};

sampler2D SamplerBloom4 = sampler_state
{
    Texture   = <texBloom4>;
	MinFilter = LINEAR;
	MagFilter = LINEAR;
	MipFilter = NONE;//NONE;
	AddressU  = Clamp;
	AddressV  = Clamp;
	SRGBTexture=FALSE;
	MaxMipLevel=0;
	MipMapLodBias=0;
};

sampler2D SamplerBloom5 = sampler_state
{
    Texture   = <texBloom5>;
	MinFilter = LINEAR;
	MagFilter = LINEAR;
	MipFilter = NONE;//NONE;
	AddressU  = Clamp;
	AddressV  = Clamp;
	SRGBTexture=FALSE;
	MaxMipLevel=0;
	MipMapLodBias=0;
};

sampler2D SamplerBloom6 = sampler_state
{
    Texture   = <texBloom6>;
	MinFilter = LINEAR;
	MagFilter = LINEAR;
	MipFilter = NONE;//NONE;
	AddressU  = Clamp;
	AddressV  = Clamp;
	SRGBTexture=FALSE;
	MaxMipLevel=0;
	MipMapLodBias=0;
};

sampler2D SamplerBloom7 = sampler_state
{
    Texture   = <texBloom7>;
	MinFilter = LINEAR;
	MagFilter = LINEAR;
	MipFilter = NONE;//NONE;
	AddressU  = Clamp;
	AddressV  = Clamp;
	SRGBTexture=FALSE;
	MaxMipLevel=0;
	MipMapLodBias=0;
};

sampler2D SamplerBloom8 = sampler_state
{
    Texture   = <texBloom8>;
	MinFilter = LINEAR;
	MagFilter = LINEAR;
	MipFilter = NONE;//NONE;
	AddressU  = Clamp;
	AddressV  = Clamp;
	SRGBTexture=FALSE;
	MaxMipLevel=0;
	MipMapLodBias=0;
};
sampler2D SamplerBloom9 = sampler_state
{
    Texture   = <texBloom9>;
	MinFilter = LINEAR;
	MagFilter = LINEAR;
	MipFilter = NONE;//NONE;
	AddressU  = Clamp;
	AddressV  = Clamp;
	SRGBTexture=FALSE;
	MaxMipLevel=0;
	MipMapLodBias=0;
};

// STRUCTURES +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

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

// VERTEX SHADER ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

VS_OUTPUT_POST VS_Bloom(VS_INPUT_POST IN)
{
	VS_OUTPUT_POST OUT;
	OUT.vpos = float4(IN.pos.x, IN.pos.y, IN.pos.z, 1.0);
	OUT.txcoord0.xy = IN.txcoord0.xy + TempParameters.xy;

	return OUT;
};

// HELPER FUNCTIONS AND CONSTANTS +++++++++++++++++++++++++++++++++++++++++++++++++++++++

//Set loopcount limit - DO NOT CHANGE, EVER.
#define LOOPCOUNT	150

// PI, required to calculate weight
#define PI			3.1415926535897932384626433832795

float linearDepth(float d, float n, float f)
{
	return (2.0 * n)/(f + n - d * (f - n));
}

// Pseudo Random Number generator. 
float random(in float2 uv)
{
	float2 noise = (frac(sin(dot(uv , float2(12.9898,78.233) * 2.0)) * 43758.5453));
	return abs(noise.x + noise.y) * 0.5;
}

// SHADERS ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

float4 PS_BloomPrePass(VS_OUTPUT_POST IN) : COLOR
{
	float4 bloomuv;
	float4 bloom		= 0.0;
	
	float2 invtexSize	= TempParameters.z;
	if( TempParameters.w == 0 ) invtexSize.y *= ScreenSize.z;
	float2 coord		= IN.txcoord0.xy;
	
	const float2 offset[4]=
	{
		float2(0.25, 0.25),
		float2(0.25, -0.25),
		float2(-0.25, 0.25),
		float2(-0.25, -0.25)
	};
	for( int i=0; i<4; i++ )
	{
		bloomuv.xy		= offset[i];
		bloomuv.xy		= ( bloomuv.xy * invtexSize.xy ) + coord.xy;
		bloom			+= tex2D( SamplerBloom1, bloomuv.xy );
	}
	bloom.xyz			*= 0.25;
	
	if( TempParameters.w == 1 )
	{
		float BinBlack		= lerp(	lerp(	BinBlackN,	BinBlackD,	ENightDayFactor	),	WeatherAndTime.x <= 13 ? BinBlackDun : lerp(BinBlackIN,	BinBlackID,		ENightDayFactor ),	EInteriorFactor ); 
		float BinGamma		= lerp(	lerp(	BinGammaN,	BinGammaD,	ENightDayFactor	),	WeatherAndTime.x <= 13 ? BinGammaDun : lerp(BinGammaIN,	BinGammaID,		ENightDayFactor ),	EInteriorFactor ); 
		float BinWhite		= lerp(	lerp(	BinWhiteN,	BinWhiteD,	ENightDayFactor	),	WeatherAndTime.x <= 13 ? BinWhiteDun : lerp(BinWhiteIN,	BinWhiteID,		ENightDayFactor ),	EInteriorFactor );
		float BoutWhite		= lerp( lerp(	BoutWhiteN,	BoutWhiteD,	ENightDayFactor ),	WeatherAndTime.x <= 13 ? BoutWhiteDun : lerp(BoutWhiteIN,	BoutWhiteID,	ENightDayFactor ),	EInteriorFactor );
		float BoutBlack		= lerp( lerp(	BoutBlackN,	BoutBlackD,	ENightDayFactor ),	WeatherAndTime.x <= 13 ? BoutBlackDun : lerp(BoutBlackIN,	BoutBlackID,	ENightDayFactor ),	EInteriorFactor );		
	bloom.xyz			= pow( max( bloom.xyz - BinBlack , 0.0f ) / max( BinWhite - BinBlack, 0.0001f ), BinGamma ) * max( BoutWhite - BoutBlack, 0.0001f ) + BoutBlack;
	}
	
	bloom.xyz			= min( bloom.xyz, 32768.0 );
	bloom.xyz			= max( bloom.xyz, 0.0 );
	bloom.w				= 1;
	return bloom;
}

float4 PS_BloomTexture1(VS_OUTPUT_POST IN) : COLOR
{
	// --------------------------- //
	//    FIRST GAUSSIAN PASSES    //
	//   BLOOM TINT HAPPENS HERE   //
	// --------------------------- //

	float2 coord		= IN.txcoord0.xy;
	
	float Q				= 0.0f;
	if ( QUALITYLEVEL == 2 )
		Q = 0.6f;
	else if ( QUALITYLEVEL == 1 ) 
		Q = 0.8f;
	else if ( QUALITYLEVEL == 0 ) //best
		Q = 0.985f;

	float hIntensity	= lerp( lerp( hIntensityN, hIntensityD, ENightDayFactor ), WeatherAndTime.x <= 13 ? hIntensityDun : lerp( hIntensityIN, hIntensityID, ENightDayFactor ), EInteriorFactor );
	float BloomSigma	= lerp( lerp( BloomSigmaN, BloomSigmaD, ENightDayFactor ), WeatherAndTime.x <= 13 ? BloomSigmaDun : lerp( BloomSigmaIN, BloomSigmaID, ENightDayFactor ), EInteriorFactor );
	float minDepth		= lerp( minDepthE, minDepthI, EInteriorFactor );
	float px 			= TempParameters.z;
	float py 			= px;
	BloomSigma			= BloomSigma * (ScreenSize.y/TempParameters.z);
	
	// Get Depth info and apply to Sigma
	float Depth			= tex2D( SamplerDepth, float2( IN.txcoord0.xy )).x;
	float SigmaDepth	= min( max( linearDepth( Depth, 0.5f, zfar ), minDepth ), 1.0f );
	BloomSigma			= max( BloomSigma * SigmaDepth, 0.6f ); //limited to not give weird result
	
	// Declare all needed variables
	float SigmaSum;
	float3 Sigma;
	float sampleOffset;
	float4 bloom;
	float4 bloom1;
	float4 bloom2;
	float4 srcbloom;
	float d;
	float d1;
	float d2;
	float2 q;
	
	// Get bloom
	bloom				= tex2D( SamplerBloom1, float2( coord.xy ));
	srcbloom			= bloom;
	d					= linearDepth( Depth, 0.5f, 3500.0f );
	
	q = float2(1, 0); //horizontal, left switch for future use
	
	SigmaSum			= 0.0f;
	Sigma.x				= 1.0f / ( sqrt( 2.0f * PI ) * BloomSigma );
	Sigma.y				= exp( -0.5f / ( BloomSigma * BloomSigma ));
	Sigma.z				= Sigma.y * Sigma.y;
	
	sampleOffset		= 1.0f;
	bloom				*= Sigma.x;
	SigmaSum			+= Sigma.x;
	Sigma.xy			*= Sigma.yz;
	
	for(int i = 1; i < LOOPCOUNT && SigmaSum < Q; ++i) {

		bloom1 			= tex2Dlod( SamplerBloom1, float4( coord.xy + float2( sampleOffset*px*q.x, sampleOffset*py*q.y ), 0, 0 )) * Sigma.x;
		bloom2 			= tex2Dlod( SamplerBloom1, float4( coord.xy - float2( sampleOffset*px*q.x, sampleOffset*py*q.y ), 0, 0 )) * Sigma.x;
		
		d1				= tex2Dlod(SamplerDepth, float4( IN.txcoord0.xy + float2(sampleOffset*px*q.x, sampleOffset*py*q.y), 0, 0 )).x;
		d1				= linearDepth( d1, 0.5f, 3500.0f );
		d2				= tex2Dlod(SamplerDepth, float4( IN.txcoord0.xy - float2(sampleOffset*px*q.x, sampleOffset*py*q.y), 0, 0 )).x;
		d2				= linearDepth( d2, 0.5f, 3500.0f );

		bloom			+= lerp( srcbloom * Sigma.x, bloom1, smoothstep( d-d1, d, d1 ));		
		bloom			+= lerp( srcbloom * Sigma.x, bloom2, smoothstep( d-d2, d, d2 ));
		
		SigmaSum		+= ( 2.0f * Sigma.x );
		sampleOffset	+= 1.0f;
		Sigma.xy		*= Sigma.yz;
	}
	bloom.xyz			/= SigmaSum;
	bloom.xyz 			*= hIntensity;

	bloom.xyz			= saturate( bloom.xyz );
	bloom.w				= 1.0f;
	
	return bloom;
}

float4 PS_BloomTexture2(VS_OUTPUT_POST IN) : COLOR
{
	// --------------------------- //
	//   SECOND GAUSSIAN PASSES    //
	// --------------------------- //

	float2 coord		= IN.txcoord0.xy;
	
	float Q				= 0.0f;
	if ( QUALITYLEVEL == 2 )
		Q = 0.6f;
	else if ( QUALITYLEVEL == 1 ) 
		Q = 0.8f;
	else if ( QUALITYLEVEL == 0 ) //best
		Q = 0.985f;
	
	float vIntensity	= lerp( lerp( vIntensityN, vIntensityD, ENightDayFactor ), WeatherAndTime.x <= 13 ? vIntensityDun : lerp( vIntensityIN, vIntensityID, ENightDayFactor ), EInteriorFactor );
	float BloomSigma	= lerp( lerp( BloomSigmaN, BloomSigmaD, ENightDayFactor ), WeatherAndTime.x <= 13 ? BloomSigmaDun : lerp( BloomSigmaIN, BloomSigmaID, ENightDayFactor ), EInteriorFactor );
	float minDepth		= lerp( minDepthE, minDepthI, EInteriorFactor );
	float px 			= TempParameters.z;
	float py 			= px;
	BloomSigma			= BloomSigma * (ScreenSize.y/TempParameters.z) * ScreenSize.z;
	
	// Get Depth info and apply to Sigma
	float Depth			= tex2D( SamplerDepth, float2( IN.txcoord0.xy )).x;
	float SigmaDepth	= min( max( linearDepth( Depth, 0.5f, zfar ), minDepth ), 1.0f );
	BloomSigma			= max( BloomSigma * SigmaDepth, 0.6f ); //limited to not give weird result
	
	// Declare all needed variables
	float SigmaSum;
	float3 Sigma;
	float sampleOffset;
	float4 bloom;
	float4 bloom1;
	float4 bloom2;
	float4 srcbloom;
	float d;
	float d1;
	float d2;
	float2 q;
	
	// Get bloom
	bloom				= tex2D( SamplerBloom1, float2( coord.xy ));
	srcbloom			= bloom;
	d					= linearDepth( Depth, 0.5f, 3500.0f );
	
	q = float2(0, 1); //vertical, left switch for future use
	
	SigmaSum			= 0.0f;
	Sigma.x				= 1.0f / ( sqrt( 2.0f * PI ) * BloomSigma );
	Sigma.y				= exp( -0.5f / ( BloomSigma * BloomSigma ));
	Sigma.z				= Sigma.y * Sigma.y;
	
	sampleOffset		= 1.0f;
	bloom				*= Sigma.x;
	SigmaSum			+= Sigma.x;
	Sigma.xy			*= Sigma.yz;
	
	for(int i = 1; i < LOOPCOUNT && SigmaSum < Q; ++i) {

		bloom1 			= tex2Dlod( SamplerBloom1, float4( coord.xy + float2( sampleOffset*px*q.x, sampleOffset*py*q.y ), 0, 0 )) * Sigma.x;
		bloom2 			= tex2Dlod( SamplerBloom1, float4( coord.xy - float2( sampleOffset*px*q.x, sampleOffset*py*q.y ), 0, 0 )) * Sigma.x;
		
		d1				= tex2Dlod(SamplerDepth, float4( IN.txcoord0.xy + float2(sampleOffset*px*q.x, sampleOffset*py*q.y), 0, 0 )).x;
		d1				= linearDepth( d1, 0.5f, 3500.0f );
		d2				= tex2Dlod(SamplerDepth, float4( IN.txcoord0.xy - float2(sampleOffset*px*q.x, sampleOffset*py*q.y), 0, 0 )).x;
		d2				= linearDepth( d2, 0.5f, 3500.0f );

		bloom			+= lerp( srcbloom * Sigma.x, bloom1, smoothstep( d-d1, d, d1 ));		
		bloom			+= lerp( srcbloom * Sigma.x, bloom2, smoothstep( d-d2, d, d2 ));
		
		SigmaSum		+= ( 2.0f * Sigma.x );
		sampleOffset	+= 1.0f;
		Sigma.xy		*= Sigma.yz;
	}
	bloom.xyz			/= SigmaSum;
	bloom.xyz 			*= vIntensity;
	bloom.xyz			= saturate( bloom.xyz );
	bloom.w				= 1.0f;
	
	return bloom;
}

float4 PS_BloomPostPass(VS_OUTPUT_POST IN) : COLOR
{
	// --------------------------- //
	//   POSTPASS TO COMBINE TEX   //
	// --------------------------- //

	// NOTES [prod80]
	// Filter, Mix and Match some textures

	float4 bloom		= 0;
	float4 temp			= 0;
	float2 invtexSize	= 0.000975609;  //(1/512)
	float2 bcoord		= 0;
	float2 steps		= 0;
	bcoord				= IN.txcoord0.xy * 1024;
	bcoord				= floor( bcoord.xy ) + 0.5;
	bcoord				*= invtexSize.xy; //snap to texel center on 1024px resolution
	
		//Bloom Sampler 6 - 1024x1024 texture, result from prepass blur
			steps		= 1; //(1024/1024)
			steps		*= invtexSize.xy;
			temp		= tex2D( SamplerBloom9, float2( -SampleRange, SampleRange ) * steps.xy + bcoord.xy );
			temp		+= tex2D( SamplerBloom9, float2( -SampleRange, -SampleRange ) * steps.xy + bcoord.xy );
			temp		+= tex2D( SamplerBloom9, float2( SampleRange, -SampleRange ) * steps.xy + bcoord.xy );
			temp		+= tex2D( SamplerBloom9, float2( SampleRange, SampleRange ) * steps.xy + bcoord.xy );
			bloom		+= 0.25 * temp;
	
	//Bloom Sampler 5 - 512x512 texture, result from prepass blur
			steps		= 2; //(512/512)
			steps		*= invtexSize.xy;
			temp		= tex2D( SamplerBloom5, float2( -SampleRange, SampleRange ) * steps.xy + bcoord.xy );
			temp		+= tex2D( SamplerBloom5, float2( -SampleRange, -SampleRange ) * steps.xy + bcoord.xy );
			temp		+= tex2D( SamplerBloom5, float2( SampleRange, -SampleRange ) * steps.xy + bcoord.xy );
			temp		+= tex2D( SamplerBloom5, float2( SampleRange, SampleRange ) * steps.xy + bcoord.xy );
			bloom		+= 0.25 * temp;
			
	//Bloom Sampler 1 - 256x256 texture
			steps		= 4; //(512/256)
			steps		*= invtexSize.xy;
			temp		= tex2D( SamplerBloom1, float2( -SampleRange, SampleRange ) * steps.xy + bcoord.xy );
			temp		+= tex2D( SamplerBloom1, float2( -SampleRange, -SampleRange ) * steps.xy + bcoord.xy );
			temp		+= tex2D( SamplerBloom1, float2( SampleRange, -SampleRange ) * steps.xy + bcoord.xy );
			temp		+= tex2D( SamplerBloom1, float2( SampleRange, SampleRange ) * steps.xy + bcoord.xy );
			bloom		+= 0.25 * temp;
			
	//Bloom Sampler 2 - 128x128 texture
			steps		= 8; //(512/128)
			steps		*= invtexSize.xy;
			temp		= tex2D( SamplerBloom2, float2( -SampleRange, SampleRange ) * steps.xy + bcoord.xy );
			temp		+= tex2D( SamplerBloom2, float2( -SampleRange, -SampleRange ) * steps.xy + bcoord.xy );
			temp		+= tex2D( SamplerBloom2, float2( SampleRange, -SampleRange ) * steps.xy + bcoord.xy );
			temp		+= tex2D( SamplerBloom2, float2( SampleRange, SampleRange ) * steps.xy + bcoord.xy );
			bloom		+= 0.25 * temp;
			
	//Bloom Sampler 3 - 64x64 texture
			steps		= 16; //(512/64)
			steps		*= invtexSize.xy;
			temp		= tex2D( SamplerBloom3, float2( -SampleRange, SampleRange ) * steps.xy + bcoord.xy );
			temp		+= tex2D( SamplerBloom3, float2( -SampleRange, -SampleRange ) * steps.xy + bcoord.xy );
			temp		+= tex2D( SamplerBloom3, float2( SampleRange, -SampleRange ) * steps.xy + bcoord.xy );
			temp		+= tex2D( SamplerBloom3, float2( SampleRange, SampleRange ) * steps.xy + bcoord.xy );
			bloom		+= 0.25 * temp;

	//Bloom Sampler 4 - 32x32 texture
			steps		= 32; //(512/32)
			steps		*= invtexSize.xy;
			temp		= tex2D( SamplerBloom4, float2( -SampleRange, SampleRange ) * steps.xy + bcoord.xy );
			temp		+= tex2D( SamplerBloom4, float2( -SampleRange, -SampleRange ) * steps.xy + bcoord.xy );
			temp		+= tex2D( SamplerBloom4, float2( SampleRange, -SampleRange ) * steps.xy + bcoord.xy );
			temp		+= tex2D( SamplerBloom4, float2( SampleRange, SampleRange ) * steps.xy + bcoord.xy );
			bloom		+= 0.25 * temp;
	
	//Not using Sampler 6 (Original input)
	
	//Bloom Sampler 7 - 16x16 texture
			steps		= 64; //(512/16)
			steps		*= invtexSize.xy;
			temp		= tex2D( SamplerBloom7, float2( -SampleRange, SampleRange ) * steps.xy + bcoord.xy );
			temp		+= tex2D( SamplerBloom7, float2( -SampleRange, -SampleRange ) * steps.xy + bcoord.xy );
			temp		+= tex2D( SamplerBloom7, float2( SampleRange, -SampleRange ) * steps.xy + bcoord.xy );
			temp		+= tex2D( SamplerBloom7, float2( SampleRange, SampleRange ) * steps.xy + bcoord.xy );
			bloom		+= 0.25 * temp;

	//Bloom Sampler 8 - 8x8 texture
			steps		= 128; //(512/8)
			steps		*= invtexSize.xy;
			temp		= tex2D( SamplerBloom8, float2( -SampleRange, SampleRange ) * steps.xy + bcoord.xy );
			temp		+= tex2D( SamplerBloom8, float2( -SampleRange, -SampleRange ) * steps.xy + bcoord.xy );
			temp		+= tex2D( SamplerBloom8, float2( SampleRange, -SampleRange ) * steps.xy + bcoord.xy );
			temp		+= tex2D( SamplerBloom8, float2( SampleRange, SampleRange ) * steps.xy + bcoord.xy );
			bloom		+= 0.25 * temp;
	
	//Final result
			bloom			/= 8 ; // count of bloom
	
	//Saturation

	float bloomsat		= lerp( lerp( bsatN, bsatD, ENightDayFactor ), WeatherAndTime.x <= 13 ? bsatDun : lerp( bsatIN, bsatID, ENightDayFactor ), EInteriorFactor );
	float4 saturation	= 0;
	saturation.xy		= float2( min( min( bloom.x, bloom.y ), bloom.z ), max( max( bloom.x, bloom.y ), bloom.z ));
	saturation.z		= saturation.y - saturation.x;
	saturation.w		= dot( bloom.xyz, float3( 0.2125, 0.7154, 0.0721 ));
	float3 min_sat		= lerp( saturation.w, bloom.xyz, bloomsat );	
	//Below math may produce negatives when color close to pure, ie 0.75, 0.01, 0.025 or 0.95, 0.75, 0.03 Compensating by giving correct return to add negative(s) to positive(s)
	float3 max_sat		= lerp( saturation.w, bloom.xyz, 1 + ( bloomsat - 1 ) * ( 1 - saturation.z ));
	float3 neg			= min( max_sat.xyz + 1, 1 );
	neg.xyz				= saturate( 1 - neg.xyz );
	float negsum		= dot( neg.xyz, 1 );
	max_sat.xyz			= max( max_sat.xyz, 0 );
	max_sat.xyz			= max_sat.xyz + saturate( sign( max_sat.xyz )) * negsum.xxx;
	bloom.xyz			= lerp( min_sat.xyz, max_sat.xyz, step( 1, bloomsat ));
	
	//Adding noice to fight off banding
	float GrainTimerSeed 		= Timer.x * GrainMotion;
	float2 GrainTexCoordSeed 	= IN.txcoord0.xy * 1.0;

	//Generate grain seeds
	float2 GrainSeed1 	= GrainTexCoordSeed + float2( 0.0, GrainTimerSeed );
	float2 GrainSeed2 	= GrainTexCoordSeed + float2( GrainTimerSeed, 0.0 );
	float2 GrainSeed3 	= GrainTexCoordSeed + float2( GrainTimerSeed, GrainTimerSeed );

	//Generate pseudo random noise
	float GrainNoise1 	= random( GrainSeed1 );
	float GrainNoise2 	= random( GrainSeed2 );
	float GrainNoise3 	= random( GrainSeed3 );
	float GrainNoise4 	= ( GrainNoise1 + GrainNoise2 + GrainNoise3 ) * 0.333333333;

	//Combine results
	float GrainIntensity= lerp( GrainIntensityE, GrainIntensityI, EInteriorFactor );
	float3 GrainNoise 	= float3( GrainNoise4, GrainNoise4, GrainNoise4 );
	float3 GrainColor 	= float3( GrainNoise1, GrainNoise2, GrainNoise3 );
	float3 Noise		= ( lerp( GrainNoise, GrainColor, GrainSaturation ) * GrainIntensity ) - ( GrainIntensity * 0.5);

	//Add noise to color
	bloom.xyz 			+= Noise.xyz;

	bloom.xyz			= saturate( bloom.xyz );
	bloom.w				= 1.0f;	

	//Final output of shader is 512x512 texture
	return bloom;
}

// TECHNIQUES +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

technique BloomPrePass
{
    pass p0
    {
		VertexShader = compile vs_3_0 VS_Bloom();
		PixelShader  = compile ps_3_0 PS_BloomPrePass();

		ColorWriteEnable = ALPHA|RED|GREEN|BLUE;
		CullMode = NONE;
		AlphaBlendEnable = FALSE;
		AlphaTestEnable = FALSE;
		SEPARATEALPHABLENDENABLE = FALSE;
		FogEnable = FALSE;
		SRGBWRITEENABLE = FALSE;
	}
}

technique BloomTexture1
{
    pass p0
    {
		VertexShader = compile vs_3_0 VS_Bloom();
		PixelShader  = compile ps_3_0 PS_BloomTexture1();

		ColorWriteEnable = ALPHA|RED|GREEN|BLUE;
		CullMode = NONE;
		AlphaBlendEnable = FALSE;
		AlphaTestEnable = FALSE;
		SEPARATEALPHABLENDENABLE = FALSE;
		FogEnable = FALSE;
		SRGBWRITEENABLE = FALSE;
	}
}

technique BloomTexture2
{
    pass p0
    {
		VertexShader = compile vs_3_0 VS_Bloom();
		PixelShader  = compile ps_3_0 PS_BloomTexture2();

		ColorWriteEnable = ALPHA|RED|GREEN|BLUE;
		CullMode = NONE;
		AlphaBlendEnable = FALSE;
		AlphaTestEnable = FALSE;
		SEPARATEALPHABLENDENABLE = FALSE;
		FogEnable = FALSE;
		SRGBWRITEENABLE = FALSE;
	}
}

technique BloomPostPass
{
    pass p0
    {
		VertexShader = compile vs_3_0 VS_Bloom();
		PixelShader  = compile ps_3_0 PS_BloomPostPass();

		ColorWriteEnable = ALPHA|RED|GREEN|BLUE;
		CullMode = NONE;
		AlphaBlendEnable = FALSE;
		AlphaTestEnable = FALSE;
		SEPARATEALPHABLENDENABLE = FALSE;
		FogEnable = FALSE;
		SRGBWRITEENABLE = FALSE;
	}
}
