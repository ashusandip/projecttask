

resource "aws_db_instance" "projectrds" {
  allocated_storage    = 20
  storage_type        = "gp2"
  engine              = "mysql"
  engine_version      = "5.7"
  instance_class      = "db.t2.micro"
  identifier          = "project-db"
  username            = "dbuser"
  password            = "Mypassword"
  parameter_group_name = "default.mysql5.7"
 
 
  db_subnet_group_name   = aws_db_subnet_group.private_subnet.name
  vpc_security_group_ids = [aws_security_group.db.id]
  skip_final_snapshot = true

}
resource "aws_db_subnet_group" "private_subnet" {
  name       = "private-subnet-group"
  subnet_ids = [aws_subnet.private_subnet_us_east_1.id,aws_subnet.private_subnet_us_east_1d.id]
}
resource "aws_security_group" "db" {
   vpc_id     = aws_vpc.vpc_us_east_1.id
   name_prefix = "db-"

  # Define your security group rules here
  # Example for MySQL: Allow inbound traffic on port 3306
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create a parameter group 
resource "aws_db_parameter_group" "example" {
  name   = "example"
  family = "mysql5.7"

  parameter {
    name         = "max_connections"
    value        = "100"
    apply_method = "pending-reboot"
  }

}

# Associate the security group with the RDS instance
resource "aws_security_group_rule" "db_egress" {
  type        = "egress"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.db.id

}
resource "aws_db_instance" "replica" {
  provider = aws.us_west_2
  availability_zone = "us-west-2a"
  source_db_instance_identifier = aws_db_instance.project-db.id
  #replicate_source_db = "project-db"
  instance_class      = "db.t2.micro"
  publicly_accessible = true
  skip_final_snapshot = true
}
# Output the RDS instance endpoint
output "rds_endpoint" {
  value = aws_db_instance.projectrds.endpoint
}
