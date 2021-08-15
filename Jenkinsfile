pipeline {
  environment {
    registry = "https://hub.docker.com/"
    registryCredential = 'dockerhub'
    dockerImage = 'logstash-'
  }
  agent any
  stages {
      steps {
      stage('Clone repository') {               
      steps {       
            checkout scm    
      }
      } 
      }
    }
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage('Deploy Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }
    stage('Remove Unused docker image') {
      steps{
        sh "docker rmi $registry:$BUILD_NUMBER"
      }
    }
  }
}
