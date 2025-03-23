# Use an official OpenJDK runtime as a parent image
FROM openjdk:17-jdk-slim

# Set the working directory inside the container
WORKDIR /app

# Copy all project files
COPY . .

# Grant execution permission to Maven wrapper
RUN chmod +x ./mvnw

# Build the application
RUN ./mvnw clean package -DskipTests

# Expose the port (this is documentation only)
EXPOSE 9090

# Run the application with proper port binding
CMD ["sh", "-c", "java -jar target/salessavvy-0.0.1-SNAPSHOT.jar --server.port=${PORT:-9090}"]
