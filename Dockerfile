FROM eclipse-temurin:11-jre-alpine

WORKDIR /repo

COPY bfg.jar /app/bfg.jar

ENTRYPOINT ["java", "-jar", "/app/bfg.jar"]