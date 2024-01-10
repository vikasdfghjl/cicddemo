pipeline {
    agent any
    environment{
        HOME = "${env.WORKSPACE}"
        DOCKER_IMAGE_NAME = "vikasdfghjl/cicddemo"
    }

    stages{

        stage("checkout"){
            steps {
                script{
                    checkout scm
                }
            }
        }
        stage("build"){
            steps{
                script{
                    echo "Python building...."
                }
            }
        }

        stage("Building  and pushing Docker Image"){
            steps{
                script{
                    withCredentials([usernamePassword(credentialsId: 'DOCKERHUB_CREDS', passwordVariable: 'DOCKERHUB_PASSWORD', usernameVariable: 'DOCKERHUB_USERNAME')]) {
                        
                        sh 'echo "$DOCKERHUB_PASSWORD" | docker login -u "$DOCKERHUB_USERNAME" --password-stdin'

                        def app = docker.build("vikasdfghjl/cicddemo")
                        //sh "docker build -t ${DOCKER_IMAGE_NAME}:${BUILD_NUMBER} ."

                        
                        app.push("${BUILD_NUMBER}")
                }
            }
        }

        
    }
}
}