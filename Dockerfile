FROM maven:3.6.3-jdk-11-slim as builder
WORKDIR /app
COPY . .
RUN mvn clean package 


CMD ["java", "-jar", "target/learning1.3-0.0.1-SNAPSHOT.jar"]

EXPOSE 80 