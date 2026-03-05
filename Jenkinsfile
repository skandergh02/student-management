pipeline {
    // Utilise l'agent que tu as configuré dans l'Atelier 3
    agent { label 'Agent-Linux' }

    stages {
        stage('Nettoyage Workspace') {
            steps {
                // Nettoie le dossier avant de cloner pour éviter les conflits
                cleanWs()
            }
        }

        stage('Clone du Projet') {
            steps {
                script {
                    // Remplace par l'URL de ton dépôt et l'ID de tes credentials Jenkins
                    checkout scm: [
                        $class: 'GitSCM',
                        branches: [[name: '*/main']],
                        userRemoteConfigs: [[
                            url: 'https://github.com/ton-pseudo/ton-repo.git',
                            credentialsId: 'github-auth' // ID configuré dans Jenkins
                        ]]
                    ]
                }
            }
        }
    }
}