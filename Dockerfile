# a. Utiliser une image de base légère
FROM eclipse-temurin:17-jdk-alpine
# b. Copier le livrable de l'application (le fichier .jar généré dans target)
# Remplace "app.jar" par le nom réel de ton fichier dans target/
COPY target/student-management-0.0.1-SNAPSHOT.jar app.jar
# c. Exposer le port pour accéder à l'application (8080 par défaut pour Spring)
EXPOSE 8080

# d. Ajouter la commande à exécuter lors du démarrage
CMD ["java", "-jar", "app.jar"]