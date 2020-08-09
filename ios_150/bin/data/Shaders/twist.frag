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
uniform int trueWidth,trueHeight;
uniform float rand;
uniform int flags;
uniform vec2 blur_vec;
uniform float val1,val2,val3,val4;
uniform float timer;
uniform float mouseX;
int flgs;
float pix_w,pix_h;


void main (void)
{
    pix_w = 1.0 / float(imgWidth);
    pix_h = 1.0 / float(imgHeight);
	
    vec2 texCoordA = vec2(max(3.0,min(float(trueWidth),pos.x+sin(pos.y/(153.25*rand*rand)*rand+rand*val2+timer*3.0)*val3)),
						max(3.0,min(float(trueHeight),pos.y+cos(pos.x/(251.57*rand*rand)*rand+rand*val2+timer*2.4)*val3)-3.));


    vec4 col = texture2D(tex0, texCoordA);

    gl_FragColor.rgba = col.rgba;
}
