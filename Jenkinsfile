pipeline {
    agent any

    tools {
        jdk 'JDK 17'
        maven 'Maven 3'
    }

    stages {
        stage('Build') {
            steps {
                bat 'mvn clean package'
            }
        }

        stage('Docker Build') {
            steps {
                bat 'docker build -t weather-api-app .'
            }
        }

        stage('Docker Run') {
            steps {
                bat 'docker run -d -p 8080:8080 weather-api-app'
            }
        }
    }
}
