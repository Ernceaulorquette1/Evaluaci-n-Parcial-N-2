FROM eclipse-temurin:21-jdk

WORKDIR /app

COPY target/*.jar app.jar

EXPOSE 8080
CMD ["java", "-cp", "app.jar", "com.devops.App"]