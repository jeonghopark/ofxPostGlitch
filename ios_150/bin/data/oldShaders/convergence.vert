// #version 150

// these are for the programmable pipeline system and are passed in
// by default from OpenFrameworks
uniform mat4 modelViewMatrix;
uniform mat4 projectionMatrix;
uniform mat4 textureMatrix;
uniform mat4 modelViewProjectionMatrix;

varying vec4 position;
varying vec4 color;
varying vec4 normal;
varying vec2 texcoord;
// this is the end of the default functionality

// this is something we're creating for this shader
varying vec2 varyingtexcoord;

// this is coming from our C++ code

void main()
{
    // here we move the texture coordinates
    varyingtexcoord = vec2(texcoord.x, texcoord.y);
    
    // send the vertices to the fragment shader
    gl_Position = modelViewProjectionMatrix * position;
}

