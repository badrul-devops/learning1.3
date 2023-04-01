FROM maven:3.6.3-jdk-11-slim as builder
WORKDIR /app
COPY . .
RUN mvn clean package
CMD ["java", "-jar", "target/ImageOpsMaven-1.0-SNAPSHOT.jar"]


# FROM gcr.io/distroless/java11-debian11
# COPY --from=builder /app/target/ImageOpsMaven-1.0-SNAPSHOT.jar /app.jar

# CMD ["java", "-jar", "/app.jar"]
EXPOSE 8080