pipeline {
  agent any

  parameters {
    string(name: 'CUSTOM_TAG', defaultValue: 'latest', description: 'Docker image tag')
  }

  environment {
    AWS_REGION = 'us-east-1'
    ECR_REPO = 'xashy-university-portal'
    ECR_REGISTRY = '183295449773.dkr.ecr.us-east-1.amazonaws.com'
    IMAGE_TAG = "${ECR_REGISTRY}/${ECR_REPO}:${CUSTOM_TAG}"
  }

  stages {
    stage('Checkout Code') {
      steps {
        git 'https://github.com/raphkk/xashy-university-portal.git'
      }
    }

    stage('Build WAR File') {
      steps {
        sh 'mvn clean package -DskipTests'
      }
    }

    stage('Build Docker Image') {
      steps {
        sh 'docker build -t $IMAGE_TAG .'
      }
    }

    stage('Login to Amazon ECR') {
      steps {
        withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws-ecr-creds']]) {
          sh 'aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $ECR_REGISTRY'
        }
      }
    }

    stage('Push Docker Image to ECR') {
      steps {
        sh 'docker push $IMAGE_TAG'
      }
    }
  }
}
