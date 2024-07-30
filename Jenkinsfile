pipeline {
    agent any
    stages {
        stage('Clone Repository') {
            steps {
                git url:'https://github.com/02Poonam/CICDJavaAppDocker.git', branch: 'main'
            }
        }
        stage('Build Docker Image') {
            steps {
                // sh 'docker build -t yaksh0212/java-app .'
                script{
                    docker.withRegistry('poonam02',Docker_credentials){
                        def customImage = docker.build("poonam02/java-app-docker .")
                        customImage.push()
                    }
                }
           }
        }
        stage('Push Docker Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'Docker_credential')]) {
                    sh ' docker login'
                    sh ' docker push poonam02/java-app-docker'
                }
            }
        }
        stage('Deploy Container') {
            steps {
                sh 'docker run -d -p 8089:8080 poonam02/java-app-docker'
            }
        }
    }
}
