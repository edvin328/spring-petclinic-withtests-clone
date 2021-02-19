FROM openjdk:11.0.3-jre-slim-stretch


COPY ./target/spring-petclinic-2.4.2.jar /
ENTRYPOINT ["java","-jar","/spring-petclinic-2.4.2.jar"]
EXPOSE 8080
