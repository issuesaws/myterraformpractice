pipeline {
    agent { label 'Terraform' }
    environment {
        AWS_DEFAULT_REGION = 'us-east-1'
    }
    stages {
        //  stage('Checkout Code') {
        //     steps {
        //         git url : 'https://github.com/issuesaws/myterraformpractice.git'
        //     }
        // }
        stage('Terraform Init') {
            steps {
                script {
                    sh 'terraform init'
                }
            }
        }
        stage('Terraform Fmt') {
            steps {
                script {
                    sh 'terraform fmt'
                }
            }
        }
        stage('Terraform Validate') {
            steps {
                script {
                    sh 'terraform validate'
                }
            }
        }
        stage('Terraform Plan') {
            steps {
                script {
                    sh 'terraform plan -out=tfplan'
                }
            }
        }
        stage('Approval') {
        steps {
            script {
                  def deploymentDelay = input id: 'Deploy', message: 'Deploy to production?', submitter: 'admin', parameters: [choice(choices: ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24'], description: 'Hours to delay deployment?', name: 'deploymentDelay')]
                  sleep time: deploymentDelay.toInteger(), unit: 'HOURS'
            }
        }
    }
        stage('Terraform Apply') {
            steps {
                script {
                    sh 'terraform apply -auto-approve tfplan'
                }
            }
        }
        // stage('Upload State to S3') {
        //     steps {
        //         script {
        //             sh 'aws s3 cp terraform.tfstate s3://your-bucket-name'
        //         }
        //     }
        // }
    }
    // post {
    //     always {
    //         cleanWs()
    //     }
    // }
}
