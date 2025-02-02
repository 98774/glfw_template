#version 330 core
out vec4 FragColor;

in vec3 ourPos;
in vec3 ourColor;
in vec2 texCoord;

uniform sampler2D ourTexture;

void main()
{
  //    FragColor = vec4(ourPos.x, ourPos.y, ourPos.z, 1.0f);
  FragColor = texture(ourTexture, texCoord);
}
