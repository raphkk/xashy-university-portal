pipeline {
  agent any

  parameters {
    string(name: 'CUSTOM_TAG', defaultValue: 'latest', description: 'Docker image tag')
  }

  environment {
    AWS_REGION = 'us-east-1'
    ECR_REPO = 'xashy-university-portal'
    ECR_REGISTRY = '183295449773.dkr.ecr.us-east-1.amazonaws.com'
    IMAGE_TAG = "${ECR_REGISTRY}/${ECR_REPO}:latest"
    ZAP_REPORT = 'zap-report.html'
  }

  stages {
    stage('Checkout Code') {
      steps {
        git url: 'https://github.com/raphkk/xashy-university-portal.git', branch: 'main'
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

    stage('Run DAST Scan with ZAP') {
      steps {
        // ZAP will scan the running app — ensure it's accessible
        sh '''
          docker run --rm -v $(pwd):/zap/wrk/:rw \
            ghcr.io/zaproxy/zaproxy:stable \
            zap-baseline.py -t http://localhost:8080 -r $ZAP_REPORT || true \
            zap.sh -cmd -quickurl "$TARGET_URL" -quickout /zap/wrk/zap-report.html
        '''
      }
    }

    stage('Archive ZAP Report') {
      steps {
        archiveArtifacts artifacts: "${ZAP_REPORT}", allowEmptyArchive: true
      }
    }
  }
}
