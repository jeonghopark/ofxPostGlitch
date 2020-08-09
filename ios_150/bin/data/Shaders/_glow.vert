attribute vec4 position;
attribute vec4 color;
attribute vec4 normal;
attribute vec2 texcoord;

uniform mat4 modelViewMatrix;
uniform mat4 projectionMatrix;

varying vec4 colorVarying;
varying vec2 varyingtexcoord;

uniform float timeValX;
uniform float timeValY;
uniform vec2 mouse;


varying vec3 pos;
void main(void)
{
    vec4 _pos = projectionMatrix * modelViewMatrix * position;
    pos = _pos.xyz;
        gl_Position = projectionMatrix * modelViewMatrix * position;

    colorVarying = color;
    varyingtexcoord = texcoord;

}