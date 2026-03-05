pipeline {
  agent { label 'Agent-Linux' } // Ton agent WSL

  tools {
    // On change 'M3' par 'maven' pour correspondre à ta config Jenkins
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
        // C'est l'étape de création du livrable demandée
        sh 'mvn package -DskipTests'
      }
    }
  }

  post {
    always {
      cleanWs()
    }
  }
}