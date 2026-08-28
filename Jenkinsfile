pipeline {
    agent any 

    tools {
        maven 'maven' // Matches the name configured in Manage Jenkins -> Tools
        jdk 'jdk17'
    }

    stages {
        stage('Checkout Code') {
            steps {
                echo 'Checking out source code...'
                 git branch: 'main', url: 'https://github.com/frabara/appointments-system.git'
            }
        }
        stage('Build') {
            steps {
                echo 'Building the application...'
                // Add your build commands here (e.g., sh 'mvn clean package' or sh 'npm run build')
                sh 'mvn clean package'
            }
        }
        stage('Test') {
            steps {
                echo 'Running unit tests...'
                // Add your testing commands here (e.g., sh 'mvn test' or sh 'npm test')
                // sh 'mvn test'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying application...'
            }
        }
    }

    post {
        success {
            sh '''
                curl -X POST "http://n8n-app:5678/webhook-test/781ed526-bf90-4035-bc20-5170532c8d45" \
                -H "Content-Type: application/json" \
                -d '{"job": "${env.JOB_NAME}", "build": "${env.BUILD_NUMBER}", "status": "SUCCESS"}'
            '''
        }
        failure {
            sh '''
                curl -X POST "http://n8n-app:5678/webhook-test/781ed526-bf90-4035-bc20-5170532c8d45" \
                -H "Content-Type: application/json" \
                -d '{"job": "${env.JOB_NAME}", "build": "${env.BUILD_NUMBER}", "status": "FAILURE"}'
            '''
        }
    }
}
