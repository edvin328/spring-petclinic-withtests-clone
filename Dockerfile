FROM openjdk:11.0.3-jre-slim-stretch
WORKDIR /

COPY /var/jenkins_home/workspace/Testing Jenkinsfile/target/spring-petclinic-2.4.2.jar /
ENTRYPOINT ["java","-jar"]
