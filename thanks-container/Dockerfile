FROM maven:3.9.6-eclipse-temurin-21-alpine AS build
WORKDIR /app
COPY pom.xml ./
COPY src ./src
RUN mvn package -DskipTests

FROM eclipse-temurin:21-jre-alpine
WORKDIR /app
COPY --from=build /app/target/thanks-container-1.0-SNAPSHOT.jar ./app.jar
EXPOSE 3000
CMD ["java", "-jar", "app.jar"]
