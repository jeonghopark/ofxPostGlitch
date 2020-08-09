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

uniform float rand;
uniform int range;

varying vec3 pos;


void main (void)
{
    // vec2 texCoord = vec2(pos.x , pos.y);
    vec2 texCoord = vec2(varyingtexcoord.x , varyingtexcoord.y);

    vec4 col = texture(tex0,texCoord);;
    col.r = 1.0 - col.r;
    col.g = 1.0 - col.g;
    col.b = 1.0 - col.b;
    
    gl_FragColor.rgba = col.rgba;
}