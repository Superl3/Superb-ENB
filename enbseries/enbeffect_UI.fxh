//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//  enbeffect UI overload header file by kingeric1992
//
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#define NAMMING_SUFFIX(a) STITCH(a, suffix)

#ifndef suffix
#define STITCH( a, b ) a
#else
#define STITCH( a, b ) a##b
#endif

string  NAMMING_SUFFIX(TM_)           ="\xA7+++++ Tonemap +++++\xA7";
float   NAMMING_SUFFIX(Adapt_Min_)    <string UIName=TOSTRING(|--- suffix : Min Adapt Level);        > = {0.0};
float   NAMMING_SUFFIX(Adapt_Max_)    <string UIName=TOSTRING(|--- suffix : Max Adapt Level);        > = {1.0};
float   NAMMING_SUFFIX(EV_)           <string UIName=TOSTRING(|--- suffix : Exposure Value);         > = {0.0};
float   NAMMING_SUFFIX(Lwhite_)       <string UIName=TOSTRING(|--- suffix : Lwhite);                 > = {1.0};
float   NAMMING_SUFFIX(Curve_)        <string UIName=TOSTRING(|--- suffix : Curve);                  > = {1.0};
string  NAMMING_SUFFIX(space0_)       ="|";
string  NAMMING_SUFFIX(Lut_)          ="\xA7++++++ 3D Lut +++++\xA7";
bool    NAMMING_SUFFIX(Lut_State_)    <string UIName=TOSTRING(|--- suffix : 3D Lut Enabled);         > = {true};
float   NAMMING_SUFFIX(Lut_Weight_)   <string UIName=TOSTRING(|--- suffix : 3D Lut Weight);          > = {1.0};
string  NAMMING_SUFFIX(space1_)       ="|";
string  NAMMING_SUFFIX(GCC_)          ="\xA7++++++ GameCC +++++\xA7";
bool    NAMMING_SUFFIX(GCC_State_)    <string UIName=TOSTRING(|--- suffix : Game CC Enabled);        > = {true};
float   NAMMING_SUFFIX(GCC_Weight_)   <string UIName=TOSTRING(|--- suffix : Game CC Weight);         > = {1.0};
string  NAMMING_SUFFIX(space2_)       ="|";
string  NAMMING_SUFFIX(CW_)           ="\xA7+++++ ColorWheel +++\xA7";
bool    NAMMING_SUFFIX(CW_State_)     <string UIName=TOSTRING(|--- suffix : ColorWheel Enabled);     > = {true};
float   NAMMING_SUFFIX(CW_Weight_)    <string UIName=TOSTRING(|--- suffix : ColorWheel Weight);      > = {1.0};
float3  NAMMING_SUFFIX(CW_Offset_)    <string UIName=TOSTRING(|--- suffix : ColorWheel Offset);      > = {0.0, 0.0, 0.0};
string  NAMMING_SUFFIX(space3_)       ="|";
string  NAMMING_SUFFIX(CM_)           ="\xA7+++ Channel Mix +++\xA7";
bool    NAMMING_SUFFIX(CM_State_)     <string UIName=TOSTRING(|--- suffix : Channel mixer Enabled);  > = {true};
float   NAMMING_SUFFIX(CM_Weight_)    <string UIName=TOSTRING(|--- suffix : Channel mixer Weight);   > = {1.0};
float3  NAMMING_SUFFIX(CM_R_)         <string UIName=TOSTRING(|--- suffix : Channel mixer R); string UIWidget="Color"; > = {1.0, 0.0, 0.0};
float3  NAMMING_SUFFIX(CM_G_)         <string UIName=TOSTRING(|--- suffix : Channel mixer G); string UIWidget="Color"; > = {0.0, 1.0, 0.0};
float3  NAMMING_SUFFIX(CM_B_)         <string UIName=TOSTRING(|--- suffix : Channel mixer B); string UIWidget="Color"; > = {0.0, 0.0, 1.0};
string  NAMMING_SUFFIX(space4_)       ="|";
string  NAMMING_SUFFIX(ST_)           ="\xA7++++ SplitTone ++++\xA7";
bool    NAMMING_SUFFIX(ST_State_)     <string UIName=TOSTRING(|--- suffix : SplitTone Enabled);   > = {true};
float   NAMMING_SUFFIX(ST_Weight_)    <string UIName=TOSTRING(|--- suffix : SplitTone Weight);    > = {1.0};
float3  NAMMING_SUFFIX(ST_lift_)      <string UIName=TOSTRING(|--- suffix : SplitTone Lift);      > = {0.0, 0.0, 0.0};
float3  NAMMING_SUFFIX(ST_gamma_)     <string UIName=TOSTRING(|--- suffix : SplitTone Gamma);     > = {0.0, 0.0, 0.0};
float3  NAMMING_SUFFIX(ST_gain_)      <string UIName=TOSTRING(|--- suffix : SplitTone Gain);      > = {0.0, 0.0, 0.0};
float3  NAMMING_SUFFIX(ST_shadow_)    <string UIName=TOSTRING(|--- suffix : SplitTone Shadow);    > = {0.0, 0.0, 0.0};
float3  NAMMING_SUFFIX(ST_midtone_)   <string UIName=TOSTRING(|--- suffix : SplitTone Midtone);   > = {0.0, 0.0, 0.0};
float3  NAMMING_SUFFIX(ST_highlight_) <string UIName=TOSTRING(|--- suffix : SplitTone Highlight); > = {0.0, 0.0, 0.0};
string  NAMMING_SUFFIX(space5_)       =" ";

static float NAMMING_SUFFIX(Exposure_)= pow( 2.0, NAMMING_SUFFIX(EV_))/ clamp( max(max(Adapt.r, Adapt.g), Adapt.b), NAMMING_SUFFIX(Adapt_Min_), NAMMING_SUFFIX(Adapt_Max_));

#ifndef PASSWEIGHT
#define PASSWEIGHT 1.0
#endif

#ifndef LUTSTACK_XY
#define LUTSTACK_XY float2( 12.0 , WEATHERCOUNT )
#endif

#ifndef LUTINDEX_XY
#define LUTINDEX_XY float2((TODINDEX + 1) % 6 + 6.0 * EInteriorFactor, 0.0) 
#endif

static InputStruct NAMMING_SUFFIX(UI_) = {
    PASSWEIGHT, NAMMING_SUFFIX(Exposure_),  NAMMING_SUFFIX(Lwhite_), NAMMING_SUFFIX(Curve_),
    {   NAMMING_SUFFIX(GCC_State_), NAMMING_SUFFIX(GCC_Weight_), float4(_c3.x, tex2D(_s2, 0.5).x * NAMMING_SUFFIX(Exposure_), _c3.zw), _c4, _c5},
    {   NAMMING_SUFFIX(CM_State_),  NAMMING_SUFFIX(CM_Weight_), { NAMMING_SUFFIX(CM_R_), NAMMING_SUFFIX(CM_G_), NAMMING_SUFFIX(CM_B_)} },
    {   NAMMING_SUFFIX(Lut_State_), NAMMING_SUFFIX(Lut_Weight_), LUTSTACK_XY , LUTINDEX_XY },
    {   NAMMING_SUFFIX(CW_State_),  NAMMING_SUFFIX(CW_Weight_),  NAMMING_SUFFIX(CW_Offset_) },
    {   NAMMING_SUFFIX(ST_State_),  NAMMING_SUFFIX(ST_Weight_),  ST_LowRange, ST_HighRange, 0.005,
        NAMMING_SUFFIX(ST_shadow_), NAMMING_SUFFIX(ST_midtone_), NAMMING_SUFFIX(ST_highlight_),
        NAMMING_SUFFIX(ST_lift_),   NAMMING_SUFFIX(ST_gamma_),   NAMMING_SUFFIX(ST_gain_) }
};

#undef  STITCH
#undef  NAMMING_SUFFIX
#undef  suffix
#undef  PASSWEIGHT
#undef  LUTSTACK_XY
#undef  LUTINDEX_XY
