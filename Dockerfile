FROM openjdk:11.0.3-jre-slim-stretch


COPY /srv/www/jenkins/workspace/PIPELINE_V2/target/spring-petclinic-2.4.2.jar /
ENTRYPOINT ["java","-jar"]
