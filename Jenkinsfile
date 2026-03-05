pipeline {
  // Utilise ton agent WSL
  agent { label 'Agent-Linux' }

  // Utilise le nom du Maven que tu as configuré (ex: 'M3')
  tools {
    maven 'M3'
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
        // Cette étape génère le fichier .jar final
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