# Use an official OpenJDK runtime as a parent image
FROM openjdk:17-jdk-slim

# Set the working directory inside the container
WORKDIR /app

# Copy all project files to leverage proper Maven build
COPY . .

# Grant execution permission to Maven wrapper
RUN chmod +x ./mvnw

# Build the application
RUN ./mvnw clean package -DskipTests

# List target directory to see what files were created
RUN ls -la target/

# Expose port 8080 to the outside world
EXPOSE 8080

# Use the jar command to examine the manifest
CMD ["sh", "-c", "java -jar target/salessavvy-0.0.1-SNAPSHOT.jar"]
