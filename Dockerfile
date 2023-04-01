FROM maven:3.6.3-jdk-11-slim as builder
WORKDIR /app
COPY . .
RUN mvn clean package
CMD ["java", "-jar", "target/ImageOpsMaven-1.0-SNAPSHOT.jar"]


FROM gc
COPY --from=builder /app/target/ImageOpsMaven-1.0-SNAPSHOT.jar /app.jar

ENTRYPOINT ["/bin/bash"]
CMD ["-c", "java -jar /app.jar"]
EXPOSE 8080