# Commands & Tips
- ERROR: Error fetching remote repo 'origin' 
- Open a terminal or command prompt on your machine. Navigate to the directory of your local repository. In your case, it seems to be /home/vagrant/.jenkins/workspace/free-style.
- git fetch --prune 
- or
- 'git remote prune https://github.com/spring-petclinic/spring-framework-petclinic.git' to remove any old, conflicting branches

# Plugins to install
- Eclipse Temurin installerVersion
- openJDK-native-pluginVersion
- OWASP Dependency-CheckVersion
- DockerVersion
- Docker PipelineVersion
- docker-build-stepVersion
- CloudBees Docker Build and PublishVersion
- SonarQube Scanner
- 