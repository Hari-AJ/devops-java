# Stage 1: Build the Java application using Maven
FROM maven:3.8.3-openjdk-11-slim AS build

# Set the working directory inside the container
WORKDIR /app

# Copy the pom.xml and source code into the container
COPY pom.xml .
COPY src ./src

# Build the application using Maven
RUN mvn clean install

# Stage 2: Create the final image to run the application
FROM openjdk:11-jre-slim

# Set the working directory for the final image
WORKDIR /app

# Copy the built .jar file from the build image to the final image
COPY --from=build /app/target/my-app.jar /app/my-app.jar

# Expose the port that the application will run on
EXPOSE 8080

# Run the Java application
CMD ["java", "-jar", "/app/my-app.jar"]
