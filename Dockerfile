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

# Copy your source code
COPY ./src ./src

# Build the application
RUN ./mvnw clean package -DskipTests

# Expose port 8080 to the outside world
EXPOSE 8080

# Define the command to run the app
ENTRYPOINT ["java", "-jar", "target/salessavvy-0.0.1-SNAPSHOT.jar"]
