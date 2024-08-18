pipeline {
    agent { label 'Terraform' }
    environment {
        AWS_DEFAULT_REGION = 'us-east-1'
    }
    stages {
        stage('Checkout Code') {
            steps {
                git url : 'https://github.com/issuesaws/myterraformpractice.git'
            }
        }
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
    //post {
      //  always {
        //    cleanWs()
        //}
    //}
}
