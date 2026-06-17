pipeline {
    agent any
    environment{
        EC2 = '3.109.132.134'
        IMAGE_NAME = 'E-FLOW-BACKEND'
        CONTAINER_NAME = 'E-FLOW'
    }
 
    stages {
        stage('build & deploy') {
            steps {
                sshagent(['ec2_key']){
                     sh """
                     ssh -o StrictHostKeyChecking=no ubuntu@${EC2}
                     git clone 
                     cd  testapp
                     docker stop ${CONTAINER_NAME} || true
                     docker rm ${CONTAINER_NAME} || true
                     docker rmi ${IMAGE_NAME} .
                     docker build -t ${IMAGE_NAME} .
                     docker run -d -p 3000:3000 --name ${IMAGE_NAME} ${CONTAINER_NAME}
                     """
                }
            }
        }
    }
}
