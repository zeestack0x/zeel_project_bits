pipeline {
    agent any

    environment {
        IMAGE_NAME = 'zeel_project:v2'
        CONTAINER_NAME = 'zeel_project'
    }

    stages {
        stage('Clean old code') {
            steps {
                sh 'rm -rf zeel_project_bits || true'
            }
        }

        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t ${IMAGE_NAME} .'
            }
        }

        stage('Stop & Remove Old Container') {
            steps {
                sh '''
                    docker stop ${CONTAINER_NAME} || true
                    docker rm ${CONTAINER_NAME} || true
                '''
            }
        }

        stage('Run New Container') {
            steps {
                sh "docker run -d --name ${CONTAINER_NAME} -p 80:80 ${IMAGE_NAME}"
            }
        }
    }
}
