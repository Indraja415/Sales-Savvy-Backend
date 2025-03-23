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
RUN ./mvnw clean package -DskipTests
ls
pwd
# Copy the generated JAR file dynamically
#COPY ./target/*.jar app.jar
COPY /app/target/salessavvy-0.0.1-SNAPSHOT.jar app.jar
ls
pwd
# Expose port 8080 to the outside world
EXPOSE 8080

# Define the command to run the app
ENTRYPOINT ["java", "-jar", "app.jar"]
