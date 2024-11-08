pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                script {
                    // Use local Docker image directly
                    sh 'docker build -t my-java-app .'
                }
            }
        }
    }
}
