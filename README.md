Project 2: Infrastructure Orchestration and Automation in AWS


# Task 1: Infrastructure Deployment with Terraform

I've deployed all the given infrastructure using terraform. All the files with extention '.tf' specify the terraform file. Following are their description:

- alb.tf (Applicaiton Load Balancer): In this terraform file I've created resources - Load Balancer, Load Balancer Target Group, and listener for two regions. 

- asg.tf (Auto Scaling Group): In this terraform file I've created resources - Auto scaling Group and launch template for two regions.

- main.tf: This terraform file defines the providers used in the project i.e. aws provider.

- rds.tf (Relational Database): In this terraform file I've created database instance, security group for ingress, security group rule for engress parameter group, output endpoint and a replica of database to another region. Also, I've associated the database to a private subnet.

- security.tf (Security Groups): In this terraform file I've created security groups for both the VPCs in different regions.

- vars.tf (Variables): This is to save Secret Key and Access Key of the AWS account. Also, we can define other varriables as well we would like to use multiple times in other terraform file.

- vpc.tf (Virtual Private Cloud): This terraform file creates two VPCs in both the regions (us-east-1 and us-west-2). Within VPC it defines public subnets and private subnetes, internet gateways for public subnets, route tables for all four subnet


# Task 2: Configuration Management with Ansible

nginx.yml: In this task I've created nginx.yml file.
- Install the nginx server on all hosts.
- Copy the application code to root directory. Alternatively I could have specified root directory in the server block in config file.
- Start Nginx server
- Enable Nginx at boot.

I've been able to create dynamic inventory in file 'asg.tf'. And there only I've ran ansible-playbook command for every instance.


# Task 3: Continuous Integration and Continuous Deployment (CI/CD)

I've created a 'Jenkinsfile' in the repository for CI/CD. I've included stages - 'Checkout scm', 'Build Docker Image', 'Unit Test', 'Integration Test', 'Deploy Infrastructure' and 'Configure Instances'. I've also included "post" for alert of success and faliure of the pipeline.

# Task 4: High Availability and Disaster Recovery

- I've configured cross-region replication for the RDS database in 'rds.tf' file

- I could implement automated backups for instances and databases through a jenkins Job using cron-tab.

- I've implemented health checks and failover mechanisms for the load balancer in 'alb.tf' file.















