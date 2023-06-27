pipeline{
    agent any

    tools{
        jdk 'jdk11'
        maven 'maven3'
    }

    stages{
        stage('Git Checkout') {
            steps{
                git branch: 'main', url: 'https://github.com/yusuf-inci/30.Days.of.DevOps.git'

            }
        }

        stage('Compile') {
            steps{
                sh "mvn clean compile"
            }
        }

        stage('Build') {
            steps {
                sh "mvn clean package -DskipTests=true"
            }
        }
    }
}
