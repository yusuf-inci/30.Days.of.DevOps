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
- OWASP Dependency-TrackVersion
- Config File Provider

# To make Jenkins listen on port 8082, follow these steps:
Change the Environment="JENKINS_PORT=8080" to Environment="JENKINS_PORT=8082" in /usr/lib/systemd/system/jenkins.service

`sudo sed -i -e 's/Environment="JENKINS_PORT=[0-9]\+"/Environment="JENKINS_PORT=8082"/' /usr/lib/systemd/system/jenkins.service`

`sudo sed -i -e 's/^\s*#\s*AmbientCapabilities=CAP_NET_BIND_SERVICE/AmbientCapabilities=CAP_NET_BIND_SERVICE/' /usr/lib/systemd/system/jenkins.service`

- Reload the systemctl daemon
`sudo systemctl daemon-reload`
- Restart Jenkins
`sudo systemctl restart jenkins`
- Verify that Jenkins is listening on port 8082
`sudo lsof -i -n -P | grep jenkins` or
`netstat -tuln | grep 8082`