pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image
                    sh 'docker build -t imagename:tag .'
                }
            }
        }
		stage('Unit Tests') {
			steps {
				// Run unit tests
				sh 'npm test'  
			}
		}

		stage('Integration Tests') {
			steps {
				// Run integration tests
				sh 'npm run integration-test'  
			}
		}
		stage('Deploy Infrastructure') {
			steps {
				// Run Terraform for infrastructure changes
				sh 'terraform init && terraform apply -auto-approve'
			}
		}
		#stage('Configure Instances') {
		#	steps {
		#		// Run Ansible for configuration management
		#		sh 'ansible-playbook nginx.yml'  
		#	}
		#}
    }
   post {
    failure {
	    echo " build is failed"
    }
    success {
       echo "build is success"
    }
} 
}
