FROM eclipse-temurin:17-jdk-alpine
VOLUME /tmp
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} sgc.jar
ENTRYPOINT ["java", "-jar", "/sgc.jar"]