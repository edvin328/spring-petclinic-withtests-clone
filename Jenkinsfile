node {

   stage('Clone Repository') {
        // Get some code from a GitHub repository
        git branch: 'master',
        credentialsId: 'github-ssh-key',
        url: 'git@github.com:edvin328/spring-petclinic.git'
    
   }
   stage('Creating image using Dockerfile (Maven + OpenJDK) ') {
       
        //Remove old image if it exists
        sh " docker rmi -f maven-build"
        
        //Build image from the Dockerfile
        docker.build("maven-build", ".")
   }
   
   stage('Run container with PETCLINIC application') {
       
        //Remove maven-build-container if it exists
        sh " docker rm -f maven-build-container"
        
        //Deploy image in the container
        sh "docker run --rm --name maven-build-container -d -p 8081:8080 maven-build"
   }
   
}
