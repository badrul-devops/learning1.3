pipeline{
    agent any
    stages{
        stage('checkout'){
            steps{
                git 'https://github.com/badrul-devops/learning1.3.git'
                }
        }
        stage('build'){
            agent { dockerfile true }
            steps{
                sh 'mvn clean install'
            }
        }
        stage('create image'){
            steps{
                sh 'docker build -t learning1.3:latest .'
            }
        }
        stage('run image'){
            steps{
                sh 'docker run -d -p 8090:8080 learning1.3:latest'
            }
        }
    }
}
