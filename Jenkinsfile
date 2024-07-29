pipeline {
    agent any
    
    environment {
        DOCKER_CREDENTIALS_ID = 'poonam02' // Jenkins credentials ID for DockerHub
        DOCKER_IMAGE = 'poonam02/java-app-docker:latest'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git url:'https://github.com/02Poonam/CICDJavaAppDocker.git', branch: 'main'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t poonam02/java-app-docker .'
            }
        }
        stage('Push Docker Image') {
            steps {
                sh 'docker login'
                sh 'docker push poonam02/java-app-docker'
            }
        }
        stage('Deploy Container') {
            steps {
                sh 'docker run -d -p 8089:8080 poonam02/java-app-docker'
            }
        }
    }
}
