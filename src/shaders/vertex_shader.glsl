#version 330 core
layout (location = 0) in vec3 aPos;
layout (location = 1) in vec2 aTexCoord;

uniform mat4 transform;
uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

out vec3 ourColor;
out vec3 ourPos;
out vec2 TexCoord;
void main()
{
  // gl_Position = transform * vec4(aPos.x, aPos.y, aPos.z, 1.0);
    gl_Position = projection * view * model * vec4(aPos, 1.0);
  ourColor = vec3(0);
  ourPos = aPos;
  TexCoord = aTexCoord;
};

