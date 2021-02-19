node {

    environment {
        ORG_NAME = "deors"
        APP_NAME = "deors-demos-petclinic"
        APP_VERSION = "1.0-SNAPSHOT"
        APP_CONTEXT_ROOT = "petclinic"
        APP_LISTENING_PORT = "8080"
        TEST_CONTAINER_NAME = "ci-${APP_NAME}-${BUILD_NUMBER}"
        DOCKER_HUB = credentials("${ORG_NAME}-docker-hub")
    }

    stage('Clone Repository') {
        // Get some code from a GitHub repository
        git branch: 'master',
        credentialsId: 'github-ssh-key',
        url: 'git@github.com:edvin328/spring-petclinic.git'
    }
    
    stage('Compile') {
        echo "-=- compiling project -=-"
        sh "./mvnw clean compile"
    }

    stage('Unit tests') {
        echo "-=- execute unit tests -=-"
        sh "./mvnw test"
        // junit 'target/surefire-reports/*.xml'
        // jacoco execPattern: 'target/jacoco.exec'
    }

//    stage('Mutation tests') {
//       echo "-=- execute mutation tests -=-"
//        sh "./mvnw org.pitest:pitest-maven:mutationCoverage"
//    }

    stage('Package') {
        echo "-=- packaging project -=-"
        sh "./mvnw package -DskipTests"
    }
    
   
   stage('Creating image using Dockerfile ') {
       
        //Remove old image if it exists
        sh " docker rmi -f deploy"
        
        //Build image from the Dockerfile
        docker.build("deploy", ".")
   }
   
   stage('Run container with PETCLINIC application') {
       
        //Remove maven-build-container if it exists
        sh " docker rm -f deploy-container"
        
        //Deploy image in the container
        sh "docker run --rm --name deploy-container -d -p 8083:8080 deploy"
   }
   
}
