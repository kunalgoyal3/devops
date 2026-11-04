pipeline {
    agent any

    environments{
      AWS_REGION = 'ap-south-1'
      ECR_REPO = 'order-service
      ACCOUNT_ID = sh(script: 'aws sts get-caller-identity --query Account --output text', returnStdout: true).trim()
      REGISTRY = "${ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com"
      IMAGE = "${REGISTRY}/${ECR_REPO}:${BUILD_NUMBER}"

    }


    stages {
        stage('BUILD IMAGE') {
            steps {
                sh 'docker build -t $IMAGE app/order-service'
            }
        }

        stage('Build Image') {
            steps {
              sh 'aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $REGISTRY'
	    }
        }
	stage('Push to ECR'){
          steps{
	  sh 'docker push $IMAGE'
	}
    }
}
