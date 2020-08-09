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
varying vec2 varyingtexcoord;

uniform float rand;
uniform int range;

varying vec3 pos;

uniform int imgWidth,imgHeight;
uniform int flags;
uniform vec2 blur_vec;
int flgs;
float pix_w,pix_h;

void main (void)
{
    pix_w = 1.0;
    pix_h = 1.0;
    flgs = flags;
    
    vec2 texCoord = vec2(varyingtexcoord.x, varyingtexcoord.y);

    vec4 col = texture2D(tex0, texCoord);


    vec4 col_s[5],col_s2[5];
    for (int i = 0;i < 5;i++){
        col_s[i] = texture2D(tex0,texCoord +  vec2(-pix_w*float(i)*blur_vec.x ,-pix_h*float(i)*blur_vec.y));
        col_s2[i] = texture2D(tex0,texCoord + vec2( pix_w*float(i)*blur_vec.x , pix_h*float(i)*blur_vec.y));
    }
    col_s[0] = (col_s[0] + col_s[1] + col_s[2] + col_s[3] + col_s[4])/5.0;
    col_s2[0]= (col_s2[0]+ col_s2[1]+ col_s2[2]+ col_s2[3]+ col_s2[4])/5.0;
    col = (col_s[0] + col_s2[0]) / 2.0;
        
    gl_FragColor = col.rgba;
}
