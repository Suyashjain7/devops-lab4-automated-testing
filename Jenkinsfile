pipeline {
    agent any

    options {
        timestamps()
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
                echo 'Source code checked out successfully.'
            }
        }

        stage('Build') {
            steps {
                sh 'test -f index.html'
                sh 'test -f test.sh'
                echo 'Build completed successfully.'
            }
        }

        stage('Automated Testing') {
            steps {
                sh 'bash test.sh'
            }
        }

        stage('Deploy') {
            steps {
                sh 'mkdir -p deploy'
                sh 'cp index.html deploy/index.html'
                echo 'Application deployed successfully.'
            }
        }
    }

    post {
        success {
            archiveArtifacts artifacts: 'deploy/**'
            echo 'CI/CD Pipeline completed successfully!'
        }

        failure {
            echo 'Pipeline failed. Check automated test results.'
        }
    }
}