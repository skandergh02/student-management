pipeline {
  agent { label 'Agent-Linux' }

  tools {
    maven 'maven'
  }

  options {
    timestamps()
    disableConcurrentBuilds()
  }

  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }

    stage('Clean') {
      steps {
        sh 'mvn clean'
      }
    }

    stage('Compile & Package') {
      steps {
        sh 'mvn package -DskipTests'
      }
    }

    // NOUVELLE ÉTAPE : Analyse de la qualité du code
    stage('SonarQube Analysis') {
      steps {
        // Utilisation du token 'sonar-token' créé dans Jenkins
        withCredentials([string(credentialsId: 'sonar-token', variable: 'SONAR_TOKEN')]) {
          // Commande Maven pour envoyer le rapport au serveur SonarQube
          sh "mvn sonar:sonar -Dsonar.login=${SONAR_TOKEN} -Dsonar.host.url=http://localhost:9000"
        }
      }
    }

    stage('Docker Build') {
      steps {
        script {
          sh 'docker build -t skanderghannem/student-management:1.0 .'
        }
      }
    }

    stage('Docker Push') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'docker-hub-creds',
                         passwordVariable: 'DOCKER_PASSWORD',
                         usernameVariable: 'DOCKER_USER')]) {
          sh "echo \$DOCKER_PASSWORD | docker login -u \$DOCKER_USER --password-stdin"
          sh 'docker push skanderghannem/student-management:1.0'
        }
      }
    }
  }

  post {
    always {
      sh 'docker logout'
      cleanWs()
    }
  }
}