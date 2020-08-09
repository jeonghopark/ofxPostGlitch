#ifdef GL_ES
// define default precision for float, vec, mat.
precision highp float;
#endif

uniform sampler2D tex0;
uniform float useTexture;
uniform float useColors;
uniform vec4 globalColor;

varying float depth;
varying vec4 colorVarying;
varying vec2 texCoordVarying;

uniform int range;

varying vec3 pos;

uniform int imgWidth,imgHeight;
uniform float rand;
uniform int flags;
uniform vec2 blur_vec;
uniform float timer;
int flgs;
float pix_w,pix_h;


void main (void)
{
    pix_w = 1.0;
    pix_h = 1.0;
    flgs = flags;
    
    vec2 texCoord = vec2(texCoordVarying.x,texCoordVarying.y);
    vec4 col = texture2D(tex0,texCoord);
    vec4 col_s = texture2D(tex0,texCoord + vec2(sin(texCoordVarying.y*0.03+timer*20.0)*(6.0+12.0*rand),0));
    
    col = col_s;
    col.r = col.r * sin(rand);
    col.g = col.g * sin(rand*1.34+texCoordVarying.y);
    // col.b = col.b * cos(rand*1.56+texCoordVarying.x*texCoordVarying.y);

    gl_FragColor.rgba = vec4(col.r, col.g, 0, 1.0);
}
