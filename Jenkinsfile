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
            }
        }
        stage('Test') {
            steps {
                echo 'Running unit tests...'
                // Add your testing commands here (e.g., sh 'mvn test' or sh 'npm test')
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying application...'
            }
        }
    }
}
