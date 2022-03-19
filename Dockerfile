FROM maven:3.8.1-jdk-11


ARG JAR_FILE=target/*.jar
COPY pom.xml /build/
COPY src /build/src/
WORKDIR /build/
RUN mvn package
FROM openjdk:14
WORKDIR /app
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} api-gateway.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","api-gateway.jar"]