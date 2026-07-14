pipeline {
    agent any

    environment {
        CF_API   = 'https://api.cf.eu10.hana.ondemand.com'
        CF_ORG   = 'org-build-igen43-lab-inhouse-jv4r8a7p'
        CF_SPACE = 'bookshop-dev'
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Install') {
            steps {
                bat 'npm install'
            }
        }

        stage('Create Space') {
            steps {
                withCredentials([
                    usernamePassword(
                        credentialsId: 'cf-creds',
                        usernameVariable: 'CF_USER',
                        passwordVariable: 'CF_PASSWORD'
                    )
                ]) {

                    bat '''
                    cf login -a %CF_API% -u %CF_USER% -p %CF_PASSWORD% -o %CF_ORG%

                    cf spaces | findstr %CF_SPACE%

                    if errorlevel 1 (
                        cf create-space %CF_SPACE%
                    )
                    '''
                }
            }
        }

        stage('Deploy') {
            steps {

                withCredentials([
                    usernamePassword(
                        credentialsId: 'cf-creds',
                        usernameVariable: 'CF_USER',
                        passwordVariable: 'CF_PASSWORD'
                    )
                ]) {

                    bat '''
                    cf login -a %CF_API% -u %CF_USER% -p %CF_PASSWORD%
                    cf target -o %CF_ORG% -s %CF_SPACE%
                    cf push
                    '''
                }
            }
        }
    }
}
