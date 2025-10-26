parameters {
    booleanParam(name: 'APPLY_INFRA', defaultValue: false, description: 'Appliquer terraform apply ?')
}

pipeline {
    agent any

    environment {
        PATH = "/usr/local/bin:$PATH"
        AWS_DEFAULT_REGION = 'us-west-2'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scmGit(
                    branches: [[name: '*/main']],
                    userRemoteConfigs: [[
                        credentialsId: 'credential-git',
                        url: 'https://github.com/Thiarinho/terraform.git'
                    ]]
                )
            }
        }

        stage('Terraform Plan') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws-credentials']]) {
                    dir('terraform') {
                        sh '''
                            terraform init
                            terraform plan -var-file=terraform.tfvars
                        '''
                    }
                }
            }
        }

        stage('Terraform Apply') {
            when {
                expression { params.APPLY_INFRA == true }
            }
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws-credentials']]) {
                    dir('terraform') {
                        sh '''
                            terraform apply -auto-approve -var-file=terraform.tfvars
                        '''
                    }
                }
            }
        }
    }
}
