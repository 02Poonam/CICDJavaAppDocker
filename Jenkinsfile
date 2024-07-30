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
                withCredentials([usernamePassword(credentialsId: 'poonam02')]) {
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
