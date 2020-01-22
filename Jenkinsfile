#!groovy
node{
    def app
    stage('Clone Repository'){
        git url: 'https://github.com/supreetraut/jenkins-project.git'
    }
    stage('Build Image'){
        app = docker.build('localhost:5000/jenkins_role_strategy:latest')
    }
    stage('Test Image'){
        app.inside{
            sh 'cd /usr/share/jenkins/ ; goss validate'
        }
    }
    stage('Push Image'){
        docker.withRegistry('http://localhost:5000') {
            app.push("${env.BUILD_NUMBER}")
            app.push('latest')
        }
    }
}
