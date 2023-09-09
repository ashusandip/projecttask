###### application load balancer us_east_1

resource "aws_lb" "application_lb_us" {
  name               = "application-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sg_us.id]
  subnets            = [aws_subnet.public_subnet_us_east_1.id, aws_subnet.public_subnet_us_east_1b.id]

  tags = {
    Name = "application-lb"
  }
}

resource "aws_lb_target_group" "application_tg_us" {
  name        = "application-tg"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.vpc_us_east_1.id
  target_type = "instance"

  health_check {
    path = "/"
  }
}

resource "aws_lb_listener" "application_listener_us" {
  load_balancer_arn = aws_lb.application_lb_us.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.application_tg_us.arn
    type             = "forward"
  }
}
                                                  
###### application load balancer us_west_2

resource "aws_lb" "application_lb" {
  provider = aws.us_west_2
  name               = "application-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sg.id]
  subnets            = [aws_subnet.public_subnet_us_west_2.id, aws_subnet.public_subnet_us_west_2c.id]

  tags = {
    Name = "application-lb"
  }
}

resource "aws_lb_target_group" "application_tg" {
  provider = aws.us_west_2
  name        = "application-tg"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.vpc_us_west_2.id
  target_type = "instance"

  health_check {
    path = "/"
  }
}

resource "aws_lb_listener" "application_listener" {
  provider = aws.us_west_2

  load_balancer_arn = aws_lb.application_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.application_tg.arn
    type             = "forward"
  }
}
                                                  
