pipeline {
    agent any
    
    tools{
        jdk 'jdk11'
        maven 'maven3'
    }
    
    environment{
        SCANNER_HOME=tool 'sonar-scanner'
    }

    stages {
        stage('Git Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/yusuf-inci/30.Days.of.DevOps.git'
            }
        }
        
        stage('Compile') {
            steps {
                sh "mvn clean compile"
            }
        }
        
        stage('Test Cases') {
            steps {
                sh "mvn test"
            }
        }
        
        stage('Sonarqube Analysis') {
            steps {
                withSonarQubeEnv('sonar-server') {
                    sh '''$SCANNER_HOME/bin/sonar-scanner -Dsonar.projectName=Petclinic \
                    -Dsonar.java.binaries=. \
                    -Dsonar.projectKey=Petclinic '''
                }
            }
        }
        
        stage('Build') {
            steps {
                sh "mvn clean package -DskipTests=true"
            }
        }
        
        stage('OWASP Dependency Check') {
            steps {
                dependencyCheck additionalArguments: '--scan target/', odcInstallation: 'owasp'
                dependencyCheckPublisher pattern: '**/dependency-check-report.xml'
            }
        }
        
        stage('Maven Deploy to Nexus') {
            steps {
                configFileProvider([configFile(fileId: '54935f84-a928-475e-90a7-fc79753e1d22', variable: 'mavensettings')]) {
            
                    sh "mvn -s $mavensettings clean deploy -DskipTests=true"    
                }
            }
        }
        
        stage('Tomcat Deploy') {
            steps {
                sh "sudo cp target/*.war /opt/apache-tomcat-9.0.65/webapps"
            }
        }
    }
}
