#!/bin/bash

# Change directory to /opt
cd /opt

# Download Apache Tomcat
sudo wget https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.65/bin/apache-tomcat-9.0.65.tar.gz

# Extract the downloaded tar file
sudo tar -xvf apache-tomcat-9.0.65.tar.gz

# Change to the extracted Tomcat's conf directory
sudo su
cd /opt/apache-tomcat-9.0.65/conf

# Edit the tomcat-users.xml file
sudo tee -a tomcat-users.xml > /dev/null <<EOT
<user username="admin" password="admin1234" roles="admin-gui,manager-gui"/>
EOT

# Create symbolic links for starting and stopping Tomcat
sudo ln -s /opt/apache-tomcat-9.0.65/bin/startup.sh /usr/bin/startTomcat
sudo ln -s /opt/apache-tomcat-9.0.65/bin/shutdown.sh /usr/bin/stopTomcat

# Comment out the specified line in the manager context.xml file
sudo sed -i 's|<Valve className="org.apache.catalina.valves.RemoteAddrValve" allow="127\\.\d+\.\d+\.\d+|::1|0:0:0:0:0:0:0:1" />|<!-- <Valve className="org.apache.catalina.valves.RemoteAddrValve" allow="127\\.\d+\.\d+\.\d+|::1|0:0:0:0:0:0:0:1" /> -->|' /opt/apache-tomcat-9.0.65/webapps/manager/META-INF/context.xml

# Comment out the specified line in the host-manager context.xml file
sudo sed -i 's|<Valve className="org.apache.catalina.valves.RemoteAddrValve" allow="127\\.\d+\.\d+\.\d+|::1|0:0:0:0:0:0:0:1" />|<!-- <Valve className="org.apache.catalina.valves.RemoteAddrValve" allow="127\\.\d+\.\d+\.\d+|::1|0:0:0:0:0:0:0:1" /> -->|' /opt/apache-tomcat-9.0.65/webapps/host-manager/META-INF/context.xml

# Stop and Start Tomcat
sudo stopTomcat
sudo startTomcat

echo "Apache Tomcat installation and configuration completed."
