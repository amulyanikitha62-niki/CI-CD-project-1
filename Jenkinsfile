pipeline {
    agent any
    
    tools{
        jdk 'java-11'
        mvn 'maven'
    }
    
    stages{
        stage('git connect'){
            steps {
            git branch:'trial-1', url:'https://github.com/amulyanikitha62-niki/CI-CD-project-1.git'
        }
        }
        stage('compile'){ 
            steps {
            sh 'mvn compile'
        }
        }
        stage('build'){
            steps{
            sh 'mvn clean install'
        }
        }
        stage('docker image build'){
            steps{
            sh 'docker build -t amulyanikitha/continous-intergartion:1 . '
        }
        }
        stage('docker containerization'){
            steps{
                sh '''
                docker run -it -d --name c1 -p 9000:8080 amulyanikitha/continous-intergartion
                '''
                
            }
        }
        stage('docker login'){
            steps{
                script {
                    withcredential([usernamePassword(credentialsId: 'dockerhub-credentials',
                    passwordVariable:'DOCKER_PASSWORD',
                    usernameVariable:'DOCKER_USERNAME')])
                sh 'echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin'
                }
            }
            
        }
        stage('dockerpush'){
            steps{
                sh 'docker push amulyanikitha/continous-intergartion:1'
            }
        }
        
    }
}
