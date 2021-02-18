FROM maven:3.6.3-jdk-11-slim as BUILD
COPY . /src
WORKDIR /src
RUN mvn install -DskipTests

FROM openjdk:11.0.3-jre-slim-stretch
EXPOSE 8081
WORKDIR /app
ARG JAR=spring-petclinic-2.4.2.jar

COPY --from=BUILD /src/target/$JAR /app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
