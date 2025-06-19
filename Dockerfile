# Use base image
FROM openjdk:17-jdk-slim

# Set work directory
WORKDIR /app

# Copy the JAR into the container
COPY target/*.jar app.jar

# Run the JAR
ENTRYPOINT ["java", "-jar", "app.jar"]
