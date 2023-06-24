# OWASP Standalone Installation
- https://mvnrepository.com/
- https://central.sonatype.com/
- https://owasp.org/www-project-dependency-check/
- https://owasp.org/www-project-dependency-check/
- https://github.com/jeremylong/DependencyCheck

- By default, Vagrant will share your project directory (the directory with the Vagrantfile) to /vagrant .

- create new directory and get in it
- clone the source code in this case : `git clone https://github.com/jaiswaladi246/Petclinic.git`
- download latest version of dependecy check in this case: `wget https://github.com/jeremylong/DependencyCheck/releases/download/v8.3.1/dependency-check-8.3.1-release.zip`
- `unzip dependency-check-8.3.1-release.zip `
- `cd dependency-check/`
- ` ./bin/dependency-check.sh -h`
- build the app. go in the Petclinic folder. run `mvn clean package`
- go inside the folder `cd dependency-check/` then run the following commands
- `./bin/dependency-check.sh --out <path to Petclinic/> --scan <path to target .../target/> 
- report will be stands on this path:<path to Petclinic/>
