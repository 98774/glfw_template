#version 330 core
out vec4 FragColor;

in vec3 ourPos;
in vec3 ourColor;

void main()
{
    FragColor = vec4(ourPos.x, ourPos.y, ourPos.z, 1.0f);
}
