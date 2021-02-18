node {

   stage('Clone Repository') {
        // Get some code from a GitHub repository
        git 'https://github.com/edvin328/spring-petclinic.git'
    
   }
   stage('Creating image using Dockerfile (Maven + OpenJDK) ') {
        docker.build("maven-build", ".")
   }
   
   stage('Run container with PETCLINIC application') {
       
        //Remove maven-build-container if it exisits
        sh " docker rm -f maven-build-container"
        
        //Run maven + deploy image
        sh "docker run --name maven-build-container -d -p 8081:8080 maven-build"
   }
   
}
