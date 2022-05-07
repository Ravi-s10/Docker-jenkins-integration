pipeline{
    
    
    environment{
        registry = "ravis10"
        registryCredential = "docker_cred"
        dockerImage = ""
    }
    
    agent any
    
    
    stages{
        stage('Cloning Git'){
            steps{
              
              
      git branch: 'main', url: 'https://github.com/Ravi-s10/Docker-jenkins-integration.git'
     
            }
        }
        
         stage('pwd'){
            steps{
              
              echo "$pwd"
     
            }
        }
        
        
        
        stage("Building Image"){
            steps{
                script {
                    dockerImage = docker.build registry + "/$BUILD_NUMBER"
                }
            }
        }
        
        stage("pushing image to registry"){
            steps{
                script{
                    docker.withRegistry('', registryCredential){
                        dockerImage.push()
                    }
                }
            }
        }
        
        
        //stage("Cleaning up"){
        //    steps{
            //    sh "docker rmi dockerImage"
       //     }
       // }
        
        
        stage("Deployig app to localhost"){
         
            steps{
             sh "docker run -d -p 85:80  $registry/$BUILD_NUMBER"
            }
        }
        
        
        
        
        
        
        
    }
}
