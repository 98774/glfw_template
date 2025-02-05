#version 330 core
out vec4 FragColor;
  
uniform vec3 objectColor;
uniform vec3 lightColor;
uniform vec3 lightPos;  
uniform vec3 viewPos;

in vec3 Normal;  
in vec3 FragPos;  

void main()
{
  //Ambient color depending on light level
    float ambientStrength = 0.1;
    vec3 ambient = ambientStrength * lightColor;

  //Get normalized light direction
  //Don't calculate this on the a GPU, send it via uniform
  vec3 norm = normalize(Normal);
  vec3 lightDir = normalize(lightPos - FragPos);  

  //Make sure the diffuse light never becomes negative
  float diff = max(dot(norm, lightDir), 0.0);
  vec3 diffuse = diff * lightColor;
  

  //Specular component
float specularStrength = 0.5;
vec3 viewDir = normalize(viewPos - FragPos);
  //Negate lightDir to get the vector from light to point, not otherway round
vec3 reflectDir = reflect(-lightDir, norm);  

float spec = pow(max(dot(viewDir, reflectDir), 0.0), 64);
vec3 specular = specularStrength * spec * lightColor;  


vec3 result = (ambient + diffuse + specular) * objectColor;
FragColor = vec4(result, 1.0);
};
