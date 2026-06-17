pipeline {
    agent any
    environment{
        EC2 = '13.127.144.84'
        IMAGE_NAME = 'e-flow-back'
        CONTAINER_NAME = 'e-flow'
    }
 
    stages {
        stage('build & deploy') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'Dockerhubcred', passwordVariable: 'DOCKER_PASS', usernameVariable: 'DOCKER_USER')]) {
    
                sshagent(['ec2_key']){
                     sh """
                     ssh -o StrictHostKeyChecking=no ubuntu@${EC2} " 
                     docker login -u ${DOCKER_USER} -p ${DOCKER_PASS}
                     rm -rf E-flow-Backend
                     git clone https://github.com/akshayshetty709/E-flow-Backend.git
                     cd  E-flow-Backend
                     docker stop ${CONTAINER_NAME} || true
                     docker rm ${CONTAINER_NAME} || true
                     docker rmi ${IMAGE_NAME} . || true
                     docker build -t ${IMAGE_NAME} .
                     docker run -d -p 3000:3000 --name ${CONTAINER_NAME} ${IMAGE_NAME}
                     "
                     """
                }
              }
            }
        }
    }
}
