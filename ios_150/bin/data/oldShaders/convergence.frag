// fragment shader
// #version 150

#ifdef GL_ES
// define default precision for float, vec, mat.
precision highp float;
#endif


uniform float rand;

// this is how we receive the texture
uniform sampler2D tex0;
varying vec2 varyingtexcoord;
varying vec4 outputColor;

void main()
{
    vec4 color = texture2D(tex0, varyingtexcoord);
    vec4 col_r = texture2D(tex0, varyingtexcoord + vec2(-35.0*rand,0));
    vec4 col_l = texture2D(tex0, varyingtexcoord + vec2(35.0*rand,0));
    vec4 col_g = texture2D(tex0, varyingtexcoord + vec2( -7.5*rand,0));
    color.b = color.b + col_r.b*max(1.0,sin(varyingtexcoord.y*1.2)*2.5)*rand;
    color.r = color.r + col_l.r*max(1.0,sin(varyingtexcoord.y*1.2)*2.5)*rand;
    color.g = color.g + col_g.g*max(1.0,sin(varyingtexcoord.y*1.2)*2.5)*rand;
    
    gl_FragColor = color;
}


