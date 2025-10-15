pipeline {
    agent any

    environment {
        IMAGE_NAME = "auth-service"
        IMAGE_TAG = "${BUILD_NUMBER}"
        REGISTRY = "dhanushlm/devops"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'develop', url: 'https://github.com/dhanushlm/auth-service.git'
            }
        }

        stage('Build with Maven') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t ${REGISTRY}/${IMAGE_NAME}:${IMAGE_TAG} .'
            }
        }

        stage('Push to DockerHub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials',
                                          usernameVariable: 'DOCKER_USER',
                                          passwordVariable: 'DOCKER_PASS')]) {
                sh '''
                docker login -u $DOCKER_USER -p $DOCKER_PASS
                docker push ${REGISTRY}/${IMAGE_NAME}:${IMAGE_TAG}
                '''
        }
    }                        

        stage('Deploy to Kubernetes (Testing)') {
            steps {
                sh 'kubectl apply -f k8s/deployment.yaml'
                sh 'kubectl apply -f k8s/service.yaml'
            }
        }
    }

    post {
        success {
            echo '✅ Deployment to Kubernetes testing environment completed successfully.'
        }
        failure {
            echo '❌ Build or deployment failed. Please check logs.'
        }
    }
}
