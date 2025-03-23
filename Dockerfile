# Use an official OpenJDK runtime as a parent image
FROM openjdk:17-jdk-slim

# Set the working directory inside the container
WORKDIR /app

# Copy Maven files first to leverage caching for dependency installation
COPY ./pom.xml ./pom.xml
COPY .mvn .mvn
COPY ./mvnw ./mvnw

# Grant execution permission to Maven wrapper
RUN chmod +x ./mvnw

# Build the application without caching to ensure JAR creation
RUN --no-cache ./mvnw clean package -DskipTests

# Copy the generated JAR file dynamically
COPY ./target/*.jar app.jar

# Expose port 8080 to the outside world
EXPOSE 8080

# Define the command to run the app
ENTRYPOINT ["java", "-jar", "app.jar"]
