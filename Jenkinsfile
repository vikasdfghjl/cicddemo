pipeline {
    agent any
    environment{
        HOME = "${env.WORKSPACE}"
        DOCKER_IMAGE_NAME = "vikasdfghjl/python-weather-app"
        PORT="4000"
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

                        def app = docker.build("vikasdfghjl/python-weather-app")
                        //sh "docker build -t ${DOCKER_IMAGE_NAME}:${BUILD_NUMBER} ."

                        
                        app.push("${BUILD_NUMBER}")
                }
            }
        }
    }

        stage("Deploy"){
            steps{
                script{                    
                        sh 'exit'

                        withCredentials([usernamePassword(credentialsId: 'DOCKERHUB_CREDS', passwordVariable: 'DOCKERHUB_PASSWORD', usernameVariable: 'DOCKERHUB_USERNAME')]) {
                        
                        sh 'echo "$DOCKERHUB_PASSWORD" | docker login -u "$DOCKERHUB_USERNAME" --password-stdin'

                        sh 'docker run -d -p ${PORT}:${PORT} ${DOCKER_IMAGE_NAME}:${BUILD_NUMBER}'
                    }
                }
            }
        }
    }

    post{
        always{
            // Send notification  on always
        }
        success{
            // Send notification on success
            successNotifier(subject: 'Flask App Build Successful', 
                            body: 'Your Flask app build was successful!')

        }
        failure{
            // Send notification on failure
            failureNotifier(subject: 'Flask App Build Failed', 
                            body: 'Your Flask app build failed! Check the logs for details.')

        }
    }
}