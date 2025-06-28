pipeline {
    agent {
        label 'test'
    }

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
                sh 'mvn compile'
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
        stage('Docker run') 
        {
            steps
            {
                sh 'docker run -dt --name java-c1 -p 82:80 demo-java-app'
            }
        }
    }
}
