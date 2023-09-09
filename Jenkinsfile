pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from the Git repository
                checkout scm
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    // Build your Docker image
                    sh 'docker build -t your-image-name:tag .'
                }
            }
        }
		stage('Unit Tests') {
			steps {
				// Run unit tests
				sh 'npm test'  // Replace with your test command
			}
		}

		stage('Integration Tests') {
			steps {
				// Run integration tests
				sh 'npm run integration-test'  // Replace with your integration test command
			}
		}
		stage('Deploy Infrastructure') {
			steps {
				// Run Terraform for infrastructure changes
				sh 'terraform init && terraform apply -auto-approve'
			}
		}
		stage('Configure Instances') {
			steps {
				// Run Ansible for configuration management
				sh 'ansible-playbook -i inventory.ini playbook.yml'  // Replace with your Ansible playbook and inventory file
			}
		}


    }
}
