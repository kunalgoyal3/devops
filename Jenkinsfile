pipeline {
    agent any

    stages {
        stage('Show Commit') {
            steps {
                sh 'git log -1 --oneline'
                sh 'ls -la'
            }
        }

        stage('Build Image') {
            steps {
                sh 'docker build -t order-service:${BUILD_NUMBER} app/order-service'
            }
        }
    }
}
