pipeline {
    agent any
    stages {
        stage("Iniciando proyecto") {
            steps{
                sh 'terraform init'
            }
        }

        stage("Planificando proyecto") {
            steps{
                sh 'terraform plan'
            }
        }

         stage("Aplicando proyecto") {
            steps{
                sh 'terraform apply'
            }
        }

    }
}