FROM openjdk:11.0.3-jre-slim-stretch


COPY /var/jenkins_home/workspace/Testing Jenkinsfile/target/spring-petclinic-2.4.2.jar /
ENTRYPOINT ["java","-jar"]
