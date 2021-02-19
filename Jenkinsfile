node {

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
   
    stage('Integration tests') {
        steps {
            echo "-=- Execute integration tests -=-"
            sh "curl --retry 5 --retry-connrefused --connect-timeout 5 --max-time 5 http://54.78.194.231:8083/actuator/health"
            sh "./mvnw failsafe:integration-test failsafe:verify -DargLine=\"-Dtest.selenium.hub.url=http://selenium-hub:4444/wd/hub -Dtest.target.server.url=http://http://54.78.194.231:8083\""
        }
   }
}
