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
                sh 'mvn clean package'
            }
        }
        stage('create image'){
            steps{
                sh 'docker build -t myapp:latest . '
            }
        }
        stage('run image'){
            steps{
                 script {
                        docker.image(imageName).withRun("-p 8080:8080 -d -t --name=${containerName} tail -f /dev/null") { c ->
                        def containerID = c.id
                        sh "docker inspect -f . ${containerID}"}
                        }
                
                 }
            } 
    }
}
