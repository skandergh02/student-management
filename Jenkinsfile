pipeline {
  agent any // Permet de s'exécuter sur n'importe quel nœud disponible

  options {
    timestamps()
    ansiColor('xterm')
    disableConcurrentBuilds()
  }

  stages {
    stage('Checkout') {
      steps {
        // Récupère le code depuis ton dépôt GitHub [cite: 758]
        checkout scm
      }
    }

    stage('Clean') {
      steps {
        // Nettoie les anciens builds Maven [cite: 465, 467]
        sh 'mvn -B clean'
      }
    }

    stage('Compile') {
      steps {
        // Compile le code source (Spring Boot / Java) [cite: 458, 480]
        sh 'mvn -B -DskipTests=true compile'
      }
    }

    stage('Package') {
      steps {
        // Génère le fichier JAR ou WAR final [cite: 467, 472]
        sh 'mvn -B -DskipTests=true package'
      }
    }
  }

  post {
    always {
      // Nettoie l'espace de travail sur ton Ubuntu WSL après le build
      cleanWs()
    }
  }
}