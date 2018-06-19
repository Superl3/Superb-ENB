#ifndef _ENBEFFECT_CC_FXH_
#define _ENBEFFECT_CC_FXH_

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//  enbeffect colorcurrection header file by kingeric1992
//
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

// RGB to HSV conversion
float3 RGB_to_HSV(float3 color)
{
    float3 HSV   = 0.0;
    float  M     = max(color.r, max(color.g, color.b));
    float  C     = M - min(color.r, min(color.g, color.b));
           HSV.z = M;
    if (C != 0.0)
    {
        float3 Delta  = (color.brg - color.rgb) / C + float3(2.0, 4.0, 6.0);
               Delta *= step(M, color.gbr); //if max = rgb
        HSV.x = frac(max(Delta.r, max(Delta.g, Delta.b)) / 6.0);
        HSV.y = C / M;
    }
    return HSV;
}

float3 RGB_to_HSL(float3 color)
{
    float3 HSL   = 0.0;
    float  M     = max(color.r, max(color.g, color.b));
    float  C     = M - min(color.r, min(color.g, color.b));
           HSL.z = M - 0.5 * C;
    if (C != 0.0)
    {
        float3 Delta  = (color.brg - color.rgb) / C + float3(2.0, 4.0, 6.0);
               Delta *= step(M, color.gbr); //if max = rgb
        HSL.x = frac(max(Delta.r, max(Delta.g, Delta.b)) / 6.0);
        HSL.y = (HSL.z == 1)? 0.0: C/ (1 - abs( 2 * HSL.z - 1));
    }
    return HSL;
}

float3 Hue_to_RGB( float h)
{
    return saturate(float3( abs(h * 6.0f - 3.0f) - 1.0f, 
                            2.0f - abs(h * 6.0f - 2.0f),
                            2.0f - abs(h * 6.0f - 4.0f)));
}

float3 HSL_to_RGB( float3 HSL )
{
    return (Hue_to_RGB(HSL.x) - 0.5) * (1.0 - abs(2.0 * HSL.z - 1)) * HSL.y + HSL.z;
}

float3 HSV_to_RGB(float3 HSV)
{
    return HSV.z * (HSV.y * Hue_to_RGB(HSV.x) + 1.0 - HSV.y);
}

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//
//
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
struct GameCCStruct
{
    bool   State;
    float  Weight;
    float4 Cinematic; // {Saturation, middlegray, Contrast, Brightness}
    float4 Tint;      // {Tint.rgb, Tint weight}
    float4 Fade;      // {Fade.rgb, Fade weight}
};

static GameCCStruct DefaultGameCC = 
{
    true, 1.0, 
    _c3,// + float4(0.0, tex2D(_s2, 0.5).x * _c1.y),
    _c4,
    _c5
};

float3 GameCC( float3 color, GameCCStruct i )
{
    float lum = dot( color, LUM_COEFF);
    color = lerp(lum, color, i.Cinematic.x);
    color = lerp(color, lum * i.Tint.rgb, i.Tint.a);
    color = lerp(i.Cinematic.y, color * i.Cinematic.w, i.Cinematic.z);
    color = lerp(color, i.Fade.rgb, i.Fade.a);
    return color;
}

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//
//
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++



/*

struct LutStruct
{
    bool        State;
    float       Weight;
    sampler2D   TextureIN;
};

float3 Lut( float3 color, LutStruct IN)
{
    float2 CLut_pSize = 1.0 / float2(256.0, 16.0);
    color.b   *= 15;
    float4 CLut_UV = 0;
    CLut_UV.w  = floor(color.b);
    CLut_UV.xy = color.rg * 15 * CLut_pSize + 0.5 * CLut_pSize ;
    CLut_UV.x += CLut_UV.w * CLut_pSize.y;
    CLut_UV.z  = CLut_UV.x + CLut_pSize.y;
    return lerp( tex2Dlod(IN.TextureIN, CLut_UV.xyzw).rgb, 
                 tex2Dlod(IN.TextureIN, CLut_UV.zyxw).rgb, color.b - CLut_UV.w);
}
*/

struct LutAtlasStruct
{
    bool        State;
    float       Weight;
    float2      stack, index;
};

float3 LutAtlas( float3 color, LutAtlasStruct IN, sampler2D Lin)
{
    float2 CLut_pSize = 1.0 / float2(256.0, 16.0);
    color.b   *= 15;
    float4 CLut_UV = 0;
    CLut_UV.w  = floor(color.b);
    CLut_UV.xy = color.rg * 15 * CLut_pSize + 0.5 * CLut_pSize ;
    CLut_UV.x += CLut_UV.w * CLut_pSize.y;
    CLut_UV.z  = CLut_UV.x + CLut_pSize.y;
    CLut_UV.xz =(CLut_UV.xz+ IN.index.x) / IN.stack.x; //TODIE
    CLut_UV.y  =(CLut_UV.y + IN.index.y) / IN.stack.y;
    return lerp( tex2Dlod(Lin, CLut_UV.xyzw).rgb, 
                 tex2Dlod(Lin, CLut_UV.zyxw).rgb, color.b - CLut_UV.w);
}

struct PaletteStruct
{
    bool        State;
    float       Weight;
    float       Level;
    sampler2D   TextureIN;
};

float3 Palette( float3 color, PaletteStruct IN)
{
    float gray = IN.Level / (IN.Level + 1.0);//new version
    return float3( tex2Dlod(IN.TextureIN, float2(color.r, gray).xyyy).r,
                   tex2Dlod(IN.TextureIN, float2(color.g, gray).xyyy).g,
                   tex2Dlod(IN.TextureIN, float2(color.b, gray).xyyy).b );
}

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//  Split Tone by kingeric1992
//
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

struct SplitWeightStruct
{
    float highlight, midtone, shadow, gain, gamma, lift;
};

struct SplitToneStruct
{
    bool   State;
    float  Weight, lowrange, highrange, overlap;
    float3 shadow, midtone, highlight, lift, gamma, gain;
};

//return 1 if within target range, otherwise return 0
SplitWeightStruct SplitToneWeight( float3 color, float low, float high, float overlap)
{
    SplitWeightStruct o;
    float2 t;
    float  lum = dot(color, 0.33333);

    t.x = 1 - lum/(low + overlap);
    o.shadow = step(lum, low + overlap) * log2(t.x * t.x + 1.0);

    t  = float2(lum - low, high - lum) + overlap;
    t  = float2(t.x * t.y, 2.0 / ((high - low) + 2.0 * overlap));
    t *= t; 
    o.midtone = step(lum, high + overlap) * step(low - overlap, lum) * log2(t.x * t.y * t.y + 1.0);

    t    = float2(lum, 1.0) - high + overlap;
    t.x /= t.y;
    o.highlight = step(high - overlap, lum) * log2(t.x * t.x + 1.0);

    o.gain  = saturate(lum);
    o.lift  = saturate(1.0 - lum);
    o.gamma = o.gain * o.lift * 4.0;
    
    return o;
}

float3 SplitTone(float3 color, SplitToneStruct i)
{
    SplitWeightStruct s = SplitToneWeight(saturate(color), i.lowrange, i.highrange, i.overlap);

    color += HSV_to_RGB(i.shadow    + float3(0.0, 0.0, 1.0)) * s.shadow    - s.shadow;
    color += HSV_to_RGB(i.midtone   + float3(0.0, 0.0, 1.0)) * s.midtone   - s.midtone;
    color += HSV_to_RGB(i.highlight + float3(0.0, 0.0, 1.0)) * s.highlight - s.highlight;
    
    color += HSV_to_RGB(i.lift  + float3(0.0, 0.0, 1.0)) * s.lift  - s.lift;
    color += HSV_to_RGB(i.gamma + float3(0.0, 0.0, 1.0)) * s.gamma - s.gamma;
    color += HSV_to_RGB(i.gain  + float3(0.0, 0.0, 1.0)) * s.gain  - s.gain;
    
    return color;
}
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//
//
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

struct ColorWheelStruct
{
    bool   State;
    float  Weight;
    float3 offset;
};

// frac is defined as v - floor(v)
float3 ColorWheel(float3 color, ColorWheelStruct IN)
{
    float3 HSL = RGB_to_HSL(color);
    HSL.x = frac(    HSL.x + IN.offset.x); //hue shift
    HSL.y = saturate(HSL.y + IN.offset.y); //Saturation shift
    HSL.z = saturate(HSL.z + IN.offset.z); //Brightness shift
    return HSL_to_RGB(HSL);
}

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//
//
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

struct ChannelMixerStruct
{
    bool State; float Weight;
    float3x3 Matrix;
};

float3 ChannelMixer( float3 color, ChannelMixerStruct IN) { return mul(IN.Matrix, color);}

#endif //_ENBEFFECT_CC_FXH_
