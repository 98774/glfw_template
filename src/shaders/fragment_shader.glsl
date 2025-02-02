#version 330 core
out vec4 FragColor;

in vec3 ourPos;
in vec3 ourColor;
in vec2 TexCoord;

uniform float mixValue;
uniform float scaleValue;
uniform sampler2D texture1;
uniform sampler2D texture2;

void main()
{
  //    FragColor = vec4(ourPos.x, ourPos.y, ourPos.z, 1.0f);
    FragColor = mix(texture(texture1, TexCoord), texture(texture2, vec2(TexCoord.x, TexCoord.y)), mixValue);
}
