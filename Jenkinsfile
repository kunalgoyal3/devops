
pipeline {
    agent any

    environment {
        AWS_REGION = 'ap-south-1'
        ECR_REPO = 'order_service'
    }

    stages {

        stage('Get AWS Account ID') {
            steps {
                script {
                    env.ACCOUNT_ID = sh(
                        script: 'aws sts get-caller-identity --query Account --output text',
                        returnStdout: true
                    ).trim()

                    env.REGISTRY = "${env.ACCOUNT_ID}.dkr.ecr.${env.AWS_REGION}.amazonaws.com"

                    env.IMAGE = "${env.REGISTRY}/${env.ECR_REPO}:${env.BUILD_NUMBER}"

                    echo "Docker Image: ${env.IMAGE}"
                }
            }
        }

        stage('BUILD IMAGE') {
            steps {
                sh 'docker build -t $IMAGE app/order-service'
            }
        }

        stage('ECR LOGIN') {
            steps {
                sh '''
                    aws ecr get-login-password --region $AWS_REGION |
                    docker login --username AWS --password-stdin $REGISTRY
                '''
            }
        }

        stage('PUSH TO ECR') {
            steps {
                sh 'docker push $IMAGE'
            }
        }
    }
}
