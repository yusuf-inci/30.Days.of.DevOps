# Apache Tomcat Hands-On

## Prerequisite
- Ubuntu Focal 64 VM
- Install Java & Maven

## Tomcat Installation
- Connect VM with SSH
- Run following commands 
`cd /opt`
`sudo wget https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.65/bin/apache-tomcat-9.0.65.tar.gz`
`sudo tar -xvf apache-tomcat-9.0.65.tar.gz`
`sudo su`
`cd /opt/apache-tomcat-9.0.65/conf`
`vi tomcat-users.xml`
- ---add-below-line at the end (2nd-last line)----
`<user username="admin" password="admin1234" roles="admin-gui, manager-gui"/>`
- Creating symbolic links (symlinks) for starting and stopping Apache Tomcat.
`ln -s /opt/apache-tomcat-9.0.65/bin/startup.sh /usr/bin/startTomcat`
`ln -s /opt/apache-tomcat-9.0.65/bin/shutdown.sh /usr/bin/stopTomcat`

- To comment out the specified line: Add `<!--` at the beginning of the line to comment it out. To
complete the comment add `-->` to the end of the line 
`vi /opt/apache-tomcat-9.0.65/webapps/manager/META-INF/context.xml`
```
<!-- Valve className="org.apache.catalina.valves.RemoteAddrValve"
  allow="127\.\d+\.\d+\.\d+|::1|0:0:0:0:0:0:0:1" /> -->
```

`vi /opt/apache-tomcat-9.0.65/webapps/host-manager/META-INF/context.xml`

- comment out
```
<!-- Valve className="org.apache.catalina.valves.RemoteAddrValve"
  allow="127\.\d+\.\d+\.\d+|::1|0:0:0:0:0:0:0:1" /> -->
```

`sudo stopTomcat`
`sudo startTomcat`

## Create & Copy Artifact
1. 
`git clone https://github.com/jaiswaladi246/Petclinic.git`
`cd Petclinic`
`mvn clean package`
`cp <artifact path> <wepapps path>`
`sudo cp target/*.war /opt/apache-tomcat-9.0.65/webapps/`

- After copying the Artifact in webapps folder we can see the deployed application
`http://<ip adress>:8080/petclinic/`

2. Alternatively
`git clone https://github.com/spring-petclinic/spring-framework-petclinic.git`
`cd spring-framework-petclinic`
`sudo apt install openjdk-17-jdk`
`sudo stopTomcat`
`./mvnw jetty:run-war`
`http://<ip adress>:8080/`
- also you can find the artifact in target folder

## Change Ownership of folder
- if you run the commands as a user basicially change the owner ship
`sudo chown -R <user name> <folder name>`
`sudo chown -R ubuntu /opt/apache-tomcat-9.0.65`


## Install java 17
- The easiest and quickest way is installation OpenJDK 17 on Ubuntu 22.04|20.04|18.04 from OS upstream repositories.
`sudo apt update`
`sudo apt install openjdk-17-jdk`

- For JRE run the following commands to install
`sudo apt install openjdk-17-jre`

- Check Java version to validate a successful installation:
`java --version`


- add jenkins user to sudoers
`sudo visudo`
- Locate the line that starts with %sudo or %admin. These lines define user groups with sudo privileges. Add the following line below the %sudo or %admin line:
`jenkins ALL=(ALL) NOPASSWD: ALL`
24:00
