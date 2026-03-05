pipeline {
  // Utilise ton agent Ubuntu sur WSL
  agent { label 'Agent-Linux' }

  tools {
    // On utilise 'maven' en minuscules comme suggéré par ton erreur
    maven 'maven'
  }

  options {
    timestamps()
    disableConcurrentBuilds()
  }

  stages {
    stage('Checkout') {
      steps {
        // Récupération du code source depuis GitHub
        checkout scm
      }
    }

    stage('Clean') {
      steps {
        // Suppression du contenu du dossier target
        sh 'mvn clean'
      }
    }

    stage('Compile & Package') {
      steps {
        // Compilation et création du livrable (.jar)
        sh 'mvn package -DskipTests'
      }
    }
  }

  post {
    always {
      // Nettoyage de l'espace de travail sur l'agent
      cleanWs()
    }
  }
}