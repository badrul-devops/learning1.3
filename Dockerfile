# FROM Maven:3.6.3-jdk-11-slim AS builder
# WORKDIR /app
# COPY . .
# RUN mvn clean package


# FROM gcr.io/distroless/java11-debian11
# COPY --from=builder /app/target/ImageOpsMaven-1.0-SNAPSHOT.jar /app.jar

# ENTRYPOINT []
# CMD ["java", "-jar", "/app.jar"]
# EXPOSE 8080


# Stage 1: Build the application
FROM maven:3.8.4-jdk-11 AS builder
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline
COPY src/ /app/src/
RUN mvn package

# Stage 2: Create the final image
FROM openjdk:11-jre-slim
WORKDIR /app
COPY --from=builder /app/target/ImageOpsMaven-1.0-SNAPSHOT.jar /app/
EXPOSE 8080
CMD ["java", "-jar", "ImageOpsMaven-1.0-SNAPSHOT.jar"]
