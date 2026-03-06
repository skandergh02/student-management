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

    // ÉTAPE AJOUTÉE : Création de l'image Docker
    stage('Docker Build') {
      steps {
        script {
          // On utilise ton nom d'utilisateur skanderghannem
          sh 'docker build -t skanderghannem/student-management:1.0 .'
        }
      }
    }

    // ÉTAPE AJOUTÉE : Push vers DockerHub
    stage('Docker Push') {
      steps {
        // 'docker-hub-creds' est l'ID que tu dois créer dans Jenkins
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
      // On déconnecte Docker par sécurité
      sh 'docker logout'
      cleanWs()
    }
  }
}