pipeline {
    agent any

    tools {
        maven 'Maven'
    }
    
    environment {
        SONAR_HOST_URL = 'http://3.81.159.100:9000' // Update with your SonarQube server URL
        SONAR_LOGIN = credentials('sonar_token') // Credentials ID for SonarQube access token
    }
    
    stages {
        stage('Git Checkout') {
            steps {
                // Checkout the Git repository
                checkout([
                    $class: 'GitSCM',
                    branches: [[name: '*/master']],
                    userRemoteConfigs: [[url: 'https://github.com/venugopalsgnew/simple-java-maven-app.git']]
                ])
            }
        }
        
        stage('Build') {
            steps {
                // Run Maven clean package
                sh 'ls'
                sh 'pwd'
                sh 'mvn clean package'
            }
        }
        
        stage('SonarQube Analysis') {
            steps {
                // Execute SonarQube scanner
                withSonarQubeEnv('SonarQube') {
                    sh "mvn sonar:sonar \
                        -Dsonar.host.url=${SONAR_HOST_URL} \
                        -Dsonar.login=${SONAR_LOGIN}"
                }
            }
        }
    }
}
