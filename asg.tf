locals {
  key_name         = "ec2-nvir"
  private_key_path = "/home/ec2-user/terraformproject/ec2-nvir.pem"
}



#### Create the autoscaling launch template us_east_1
resource "aws_launch_template" "application_launch_template_us" {
  name_prefix = "application_launch_template"
  image_id = "ami-0f409bae3775dc8e5"
  instance_type = "t2.micro"
  key_name = "ec2-nvir"
  vpc_security_group_ids = [aws_security_group.sg_us.id]
  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "terraform1"
    }
  }
}


#resource "null_resource" "provisioner" {
 # Define dependencies on the autoscaling group
 # depends_on = [aws_autoscaling_group.application_asg_us]
 # triggers = {
  #  id = aws_launch_template.application_launch_template_us.id

  #}

  #connection {
   # type        = "ssh"
    #user        = "ec2-user"
    #private_key = file("/home/ec2-user/terraformproject/ec2-nvir.pem")
 #   host        = aws_launch_template.application_launch_template_us.public_ip  # Use the first instance's public IP
 # }
 #provisioner "remote-exec" {
  #  inline = ["echo 'Wait until SSH is ready'"]
  #}
#}
 # provisioner "local-exec" {
  #  command = "ansible-playbook -i ${self.public_ip}, --private-key ${local.private_key_path} nginx.yml"
  #}



### Create the Auto Scaling Groups for the application us_east_1
resource "aws_autoscaling_group" "application_asg_us" {
  name_prefix = "application_asg"
  launch_template {
    id = aws_launch_template.application_launch_template_us.id
    version = "$Latest"
  }
  vpc_zone_identifier = [aws_subnet.public_subnet_us_east_1.id]
  desired_capacity = 2
  min_size = 1
  max_size = 4
  target_group_arns = [aws_lb_target_group.application_tg_us.arn]
  health_check_type = "ELB"
}

####Create the autoscaling launch template us_west_2
resource "aws_launch_template" "application_launch_template" {
  provider = aws.us_west_2
  name_prefix = "application_launch_template"
  image_id = "ami-002829755fa238bfa"
  instance_type = "t2.micro"
  key_name = "oregon_key"
  vpc_security_group_ids = [aws_security_group.sg.id]
  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "terraform1"
    }
  }
}
#### Create the Auto Scaling Groups for the application us_west_2
resource "aws_autoscaling_group" "application_asg" {
  provider = aws.us_west_2
  name_prefix = "application_asg"
  launch_template {
    id = aws_launch_template.application_launch_template.id
    version = "$Latest"
  }
  vpc_zone_identifier = [aws_subnet.public_subnet_us_west_2.id]
  desired_capacity = 2
  min_size = 1
  max_size = 4
  target_group_arns = [aws_lb_target_group.application_tg.arn]
  health_check_type = "ELB"
}





