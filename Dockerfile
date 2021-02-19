FROM openjdk:11.0.3-jre-slim-stretch
EXPOSE 8081
WORKDIR /app

COPY /var/jenkins_home/workspace/Testing Jenkinsfile/target/spring-petclinic-2.4.2.jar /app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
