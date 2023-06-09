# MAVEN 

## Creating Test Server with Vagrant

### Prerequisites

Before running this Vagrantfile, you need to install the 
following tools on your machine:

- [VirtualBox](https://www.virtualbox.org/)
- [Vagrant](https://www.vagrantup.com/)
- install vagrant plugins:
 $ vagrant plugin install vagrant-hostmanager
 $ vagrant plugin install vagrant-vbguest

### Usage

1. Clone the repository: `git clone https://github.com/yusuf-inci/ci-env-vagrant.git`
2. Navigate to the project directory: `cd ci-env-vagrant`
3. Start the Vagrant virtual machine: `vagrant up` 
- This will create the virtual machines for Test Server

4. Connect to the virtual machines:
- To connect to the Test server: `vagrant ssh Test`

### Configuration

The Vagrantfile contains the following configuration:

- config.hostmanager.enabled = true: Enables the vagrant-hostmanager plugin, which automatically updates the 
hosts file on the host machine with the private network IP addresses of the virtual machines.
- config.hostmanager.manage_host = true: Automatically adds the virtual machine hostnames and IP addresses to the /etc/hosts file on the virtual machines themselves.
- config.vm.define: Defines each virtual machine with its own settings, such as the box, hostname, private IP address, memory, CPU, and provisioning script.

### Customizing the Vagrantfile

You can customize the Vagrantfile to your needs by modifying 
the following parameters:

- vb.memory: The amount of memory allocated to each virtual 
machine.
- vb.cpus: The number of CPUs allocated to each virtual 
machine.
- config.vm.network: The IP address and network settings for 
each virtual machine.
- create a custom script file and modify the `config.vm.
provision` lines in the Vagrantfile.

## Configuring Test Server

- `vagrant ssh Test`
- `sudo su`
- `sudo apt update`
- `sudo apt install openjdk-11-jre -y`
- `sudo apt install maven -y`

## Maven Commands

- `git clone https://github.com/jaiswaladi246/springboot-java-poject.git`
- `cd springboot-java-poject/`
- `mvn validate`
- `mvn compile`
- `ls` check the target folder
- `mvn test`
- `mvn package`
- `ls ./target` check the artifact named spring-boot-web.jar
- `mvn install` after complete check the artifact it shoul be created on local repo (/root/.m2/repository ....)
- `mvn clean` delete the target folder
- `mvn clean package` delete the target folder than run the package command
- `java -jar target/spring-boot-web.jar` execute the jar file 
- `http://<ip address>:8080` access the app
- `ctrl + c` to stop the app

































