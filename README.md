Project 1: Scan and archive results of a nodejs repo. Automate build and configuration using various tools.

*I've taken a NodeJS project as an assumption.


# Task 1
I've an ansible yaml file 'master.yml' for setup of jenkins as a container. Ansible-playbook role has a 'main.yml' file that has further ansible yml script for setting up jenkins as a container. In that playbook I've build container through 'jenkins/jenkins:lts' image and mapped port '8080' for jenkins' access, port '80'for apache2 and port '3000' for NodeJS application.

# Task 2
The 'Jenkinsfile' in the repository achieves the 2nd task as follows:
- Stage (SCM): Forking a github NodeJS repository
- Stage (Build): Installing npm package and sonarqube.
- Stage (Install and Verify Apache): Installing, setting up and running apache2
- Stage (ExecuteSonarQubeReport): Executing SonarQube testing.
- Stage (RunNodeJsApp): Running npm project.
