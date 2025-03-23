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

# Debugging: List JAR contents to find the main class
RUN unzip -q -c target/salessavvy-0.0.1-SNAPSHOT.jar META-INF/MANIFEST.MF

# Expose port 8080 to the outside world
EXPOSE 8080

# Use the specific main class name from your project
ENTRYPOINT ["java", "-jar", "target/salessavvy-0.0.1-SNAPSHOT.jar"]
