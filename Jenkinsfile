pipeline {
    agent any
    triggers {
        githubPush()
    }
    stages {
        
        stage('clone scm') {
            steps {
                echo 'cloning sc from git repo'
               git branch: 'main', url: 'https://github.com/Kalyanbathini3546/jenkins_files.git'
            }
        }
        
        stage('built artifact') {
            steps {
                echo 'budiling using maven'
                sh 'mvn clean install'
            }
        } 
        
        stage('deploy in tomcat') {
            steps {
                echo 'deplyoing .war in tomcat'
                deploy adapters: [tomcat9(alternativeDeploymentContext: '', credentialsId: 'tomcat', path: '', url: 'http://ec2-52-91-51-91.compute-1.amazonaws.com:8080/')], contextPath: 'kalyan', war: '**/*.war'
            }
        }        
    }
}
