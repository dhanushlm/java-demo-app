pipeline {
    agent any

    stages 
    {
        stage('Clone') 
        {
            steps
            {
                git changelog: false, poll: false, url: 'https://github.com/dhanushlm/java-demo-app.git'
            }
        }
        stage('Compile') 
        {
            steps
            {
                sh '/opt/maven/bin/mvn compile'
            }
        }
        stage('Package') 
        {
            steps
            {
                sh '/opt/maven/bin/mvn package'
            }
        }
        stage('Build Image') 
        {
            steps
            {
                sh 'docker build -t demo-java-app .'
            }
        }
        
    }
}
