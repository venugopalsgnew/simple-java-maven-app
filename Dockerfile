# Use an official OpenJDK runtime as a parent image

FROM openjdk:11-jre-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the JAR file from the host to the container

COPY target/my-app-1.0-SNAPSHOT.jar /app/app.jar

# Expose the port the application will run on
EXPOSE 9090

# Command to run the application

ENTRYPOINT ["java", "-jar", "app.jar"]
