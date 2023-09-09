resource "aws_security_group" "sg_us" {
  name_prefix = "example_security_group"
  vpc_id      = aws_vpc.vpc_us_east_1.id

  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
 }

} 		

resource "aws_security_group" "sg" {
  provider = aws.us_west_2
  name_prefix = "example_security_group"
  vpc_id      = aws_vpc.vpc_us_west_2.id

  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
